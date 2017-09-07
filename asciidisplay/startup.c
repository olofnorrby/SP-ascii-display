/*
 * 	startup.c
 *
 */
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}


/********** Definitioner **********/
#define STK_CTRL ((volatile unsigned int *)(0xE000E010))
#define STK_LOAD ((volatile unsigned int *)(0xE000E014))
#define STK_VAL ((volatile unsigned int *)(0xE000E018))

#define GPIO_E 0x40021000
/* Adress Initieringar */
#define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
#define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
#define GPIO_OSPEEDR ((volatile unsigned int *) (GPIO_E+0x8))
#define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
/* Adress Styrregister */
#define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
#define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))
/* Def.bitar styrregister */
#define B_E 0x40
#define B_SELECT 4
#define	B_RW 2
#define	B_RS 1



/********* Initiering av IN och UT portar *********/
void appInit(void){
	*((unsigned long*) GPIO_MODER) = 0x55555555;
}



/********** ASCII Styr-Funktioner **********/
//Adressera ASCII-display och ettställ de bitar som är 1 i x
void ascii_ctrl_bit_set(unsigned char x){
	unsigned char c = *GPIO_ODR_LOW;
	c |= (B_SELECT | x);
	*GPIO_ODR_LOW = c; 
}

//Adressera ASCII-display och nottställ de bitar som är 1 i x
void ascii_ctrl_bit_clear(unsigned char x){
	unsigned char c = *GPIO_ODR_LOW;
	c = B_SELECT | (c & ~x);
	*GPIO_ODR_LOW = c; 
}

//Skriver *KOMMANDO* till ASCII-minnet
void ascii_write_cmd(unsigned char command){
	ascii_ctrl_bit_clear(B_RS | B_RW);
	ascii_write_controller(command);
}

//Skriver *DATA* till ASCII-minnet
void ascii_write_data(unsigned char data){
	ascii_ctrl_bit_set(B_RS);
	ascii_ctrl_bit_clear(B_RW);
	ascii_write_controller(data);
}

//Tidsdiskret *SKRIV*
void ascii_write_controller(unsigned char bit){
	ascii_ctrl_bit_set( B_E );
	*GPIO_ODR_HIGH = bit;
	delay_250ns();
	ascii_ctrl_bit_clear( B_E );
}


//Tidsdiskret *LÄS*
unsigned char ascii_read_controller(void){
	unsigned char rv;
	ascii_ctrl_bit_set( B_E );
	delay_250ns();
	delay_250ns();
	rv = *GPIO_IDR_HIGH;
	ascii_ctrl_bit_clear( B_E );
	return rv;
}

//Läser *STATUS* från ASCII-display
unsigned char ascii_read_status(void){
	*((unsigned long*) (GPIO_MODER)) = 0x00005555;
	ascii_ctrl_bit_set(B_RW);
	ascii_ctrl_bit_clear(B_RS);
	unsigned char rv;
	rv = ascii_read_controller();
	*((unsigned long*) (GPIO_MODER)) = 0x55555555;
	return rv;
}

//Läser *DATA* från ASCII-display
unsigned char ascii_read_data(void){
	*((unsigned long*) (GPIO_MODER)) = 0x00005555;
	ascii_ctrl_bit_set(B_RW | B_RS);
	unsigned char rv = ascii_read_controller();
	*((unsigned long*) (GPIO_MODER)) = 0x55555555;
	return rv;
}





/********** Tids funktioner **********/
void delay_250ns( void ){
/* SystemCoreClock = 168000000 */
		*STK_CTRL = 0;
		*STK_LOAD = ( (168/4) -1 );
		*STK_VAL = 0;
		*STK_CTRL = 5;
		while( (*STK_CTRL & 0x10000 )== 0 )
		{}
		*STK_CTRL = 0;
}

void delay_micro(unsigned int us){
	while(us--) {
		delay_250ns();
		delay_250ns();
		delay_250ns();
		delay_250ns();
	}
}

void delay_milli(unsigned int ms){
	#ifdef SIMULATOR
		while( ms-- )
			delay_micro(1);
	#else
		while( ms-- )
			delay_micro(1000);
	#endif
}

/*void delay_milli(int ms){
	int i;
	while(ms--){
		for( i = 0; i < 1000; i++ ){
			delay_250ns();
			delay_250ns();
			delay_250ns();
			delay_250ns();
		}
	}
}*/
/***** Initierar ASCII-Display *****/
void ascii_init(void){
	ascii_ctrl_bit_clear(B_RS | B_RW);
	/* Funktion Set */
	while((ascii_read_status() & 0x80) == 0x80){} 				///Väntar tills display är klar att ta emot kommando
	delay_micro(8);												///Latenstid för kommando
	ascii_write_cmd(0x38);										///Funktion Set 
	delay_micro(39);											///Specifik delay för funktionen
	//00 00111000
	
	/* Display control */
	while((ascii_read_status() & 0x80) == 0x80){}
	delay_micro(8);
	ascii_write_cmd(0x0E);										///Display control 
	delay_micro(39);											///Specifik delay för funktionen
	//00 00001110
	
	/* Clear Display */	
	while((ascii_read_status() & 0x80) == 0x80){} 
		delay_micro(8); 
		ascii_write_cmd(1);										///"Clear display"
		delay_milli(2);											///2ms istället för 1,53ms
		
	/* Entry mode Set */
	while((ascii_read_status() & 0x80) == 0x80){}
	delay_micro(8);
	ascii_write_cmd(4);											///Entry mode Set
	delay_micro(39);											///Specifik delay för funktionen
	//00 00000100
}


/********** ASCII Skriv-Funktioner **********/
void ascii_write_char(unsigned char c){
	while((ascii_read_status() & 0x80) == 0x80){}
	delay_micro(8);
	ascii_write_data(c);
	delay_micro(39);
}

void ascii_gotoxy(int row, int column){
	int adress = row -1;
	if (column == 2){
		adress += 0x40;				/** ?????????????????????????????????????? */
	}
	while((ascii_read_status() & 0x80) == 0x80){}
	delay_micro(8);
	ascii_write_cmd(0x80 | adress);  ///Behövs det en "inväntnings WHILE sats" här???????
	delay_micro(39);
}


/********** MAIN **********/

void main(void)
{
	char *s;
	char test1[] = "Alfanumerisk ";
	char test2[] = "Display - test";
	
	appInit();
	ascii_init();
	ascii_gotoxy(1,1);
	s = test1;
	while(*s)
		ascii_write_char(*s++);
	ascii_gotoxy(1,2);
	s = test2;
	while(*s)
		ascii_write_char(*s++);
	return 0;
}

