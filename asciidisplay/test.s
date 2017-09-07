   1              		.syntax unified
   2              		.arch armv6-m
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 0
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.syntax unified
  15              		.file	"startup.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.section	.start_section,"ax",%progbits
  20              		.align	2
  21              		.global	startup
  22              		.code	16
  23              		.thumb_func
  25              	startup:
  26              	.LFB0:
  27              		.file 1 "C:/Users/Olof/Documents/C_rymdskepp/asciidisplay/startup.c"
   1:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** /*
   2:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c ****  * 	startup.c
   3:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c ****  *
   4:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c ****  */
   5:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
   7:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** void startup ( void )
   8:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** {
  28              		.loc 1 8 0
  29              		.cfi_startproc
   9:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** asm volatile(
  30              		.loc 1 9 0
  31              		.syntax divided
  32              	@ 9 "C:/Users/Olof/Documents/C_rymdskepp/asciidisplay/startup.c" 1
  33 0000 0248     		 LDR R0,=0x2001C000
  34 0002 8546     	 MOV SP,R0
  35 0004 FFF7FEFF 	 BL main
  36 0008 FEE7     	.L1: B .L1
  37              	
  38              	@ 0 "" 2
  10:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	" MOV SP,R0\n"
  12:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	" BL main\n"				/* call main */
  13:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	".L1: B .L1\n"				/* never return */
  14:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	) ;
  15:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** }
  39              		.loc 1 15 0
  40              		.thumb
  41              		.syntax unified
  42 000a C046     		nop
  43              		.cfi_endproc
  44              	.LFE0:
  46              		.text
  47              		.align	2
  48              		.global	appInit
  49              		.code	16
  50              		.thumb_func
  52              	appInit:
  53              	.LFB1:
  16:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
  17:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
  18:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** /********** Definitioner **********/
  19:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** #define STK_CTRL ((volatile unsigned int *)(0xE000E010))
  20:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** #define STK_LOAD ((volatile unsigned int *)(0xE000E014))
  21:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** #define STK_VAL ((volatile unsigned int *)(0xE000E018))
  22:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
  23:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** #define GPIO_E 0x40021000
  24:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** /* Adress Initieringar */
  25:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
  26:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
  27:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** #define GPIO_OSPEEDR ((volatile unsigned int *) (GPIO_E+0x8))
  28:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
  29:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** /* Adress Styrregister */
  30:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
  31:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
  32:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
  33:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))
  34:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** /* Def.bitar styrregister */
  35:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** #define B_E 0x40
  36:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** #define B_SELECT 4
  37:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** #define	B_RW 2
  38:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** #define	B_RS 1
  39:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
  40:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
  41:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
  42:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** /********* Initiering av IN och UT portar *********/
  43:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** void appInit(void){
  54              		.loc 1 43 0
  55              		.cfi_startproc
  56 0000 80B5     		push	{r7, lr}
  57              		.cfi_def_cfa_offset 8
  58              		.cfi_offset 7, -8
  59              		.cfi_offset 14, -4
  60 0002 00AF     		add	r7, sp, #0
  61              		.cfi_def_cfa_register 7
  44:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	*((unsigned long*) GPIO_MODER) = 0x55555555;
  62              		.loc 1 44 0
  63 0004 024B     		ldr	r3, .L3
  64 0006 034A     		ldr	r2, .L3+4
  65 0008 1A60     		str	r2, [r3]
  45:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** }
  66              		.loc 1 45 0
  67 000a C046     		nop
  68 000c BD46     		mov	sp, r7
  69              		@ sp needed
  70 000e 80BD     		pop	{r7, pc}
  71              	.L4:
  72              		.align	2
  73              	.L3:
  74 0010 00100240 		.word	1073876992
  75 0014 55555555 		.word	1431655765
  76              		.cfi_endproc
  77              	.LFE1:
  79              		.align	2
  80              		.global	ascii_ctrl_bit_set
  81              		.code	16
  82              		.thumb_func
  84              	ascii_ctrl_bit_set:
  85              	.LFB2:
  46:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
  47:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
  48:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
  49:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** /********** ASCII Styr-Funktioner **********/
  50:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** //Adressera ASCII-display och ettställ de bitar som är 1 i x
  51:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** void ascii_ctrl_bit_set(unsigned char x){
  86              		.loc 1 51 0
  87              		.cfi_startproc
  88 0018 80B5     		push	{r7, lr}
  89              		.cfi_def_cfa_offset 8
  90              		.cfi_offset 7, -8
  91              		.cfi_offset 14, -4
  92 001a 84B0     		sub	sp, sp, #16
  93              		.cfi_def_cfa_offset 24
  94 001c 00AF     		add	r7, sp, #0
  95              		.cfi_def_cfa_register 7
  96 001e 0200     		movs	r2, r0
  97 0020 FB1D     		adds	r3, r7, #7
  98 0022 1A70     		strb	r2, [r3]
  52:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	unsigned char c = *GPIO_ODR_LOW;
  99              		.loc 1 52 0
 100 0024 0C4A     		ldr	r2, .L6
 101 0026 0F23     		movs	r3, #15
 102 0028 FB18     		adds	r3, r7, r3
 103 002a 1278     		ldrb	r2, [r2]
 104 002c 1A70     		strb	r2, [r3]
  53:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	c |= (B_SELECT | x);
 105              		.loc 1 53 0
 106 002e FA1D     		adds	r2, r7, #7
 107 0030 0F23     		movs	r3, #15
 108 0032 FB18     		adds	r3, r7, r3
 109 0034 1278     		ldrb	r2, [r2]
 110 0036 1B78     		ldrb	r3, [r3]
 111 0038 1343     		orrs	r3, r2
 112 003a DAB2     		uxtb	r2, r3
 113 003c 0F23     		movs	r3, #15
 114 003e FB18     		adds	r3, r7, r3
 115 0040 0421     		movs	r1, #4
 116 0042 0A43     		orrs	r2, r1
 117 0044 1A70     		strb	r2, [r3]
  54:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	*GPIO_ODR_LOW = c; 
 118              		.loc 1 54 0
 119 0046 044A     		ldr	r2, .L6
 120 0048 0F23     		movs	r3, #15
 121 004a FB18     		adds	r3, r7, r3
 122 004c 1B78     		ldrb	r3, [r3]
 123 004e 1370     		strb	r3, [r2]
  55:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** }
 124              		.loc 1 55 0
 125 0050 C046     		nop
 126 0052 BD46     		mov	sp, r7
 127 0054 04B0     		add	sp, sp, #16
 128              		@ sp needed
 129 0056 80BD     		pop	{r7, pc}
 130              	.L7:
 131              		.align	2
 132              	.L6:
 133 0058 14100240 		.word	1073877012
 134              		.cfi_endproc
 135              	.LFE2:
 137              		.align	2
 138              		.global	ascii_ctrl_bit_clear
 139              		.code	16
 140              		.thumb_func
 142              	ascii_ctrl_bit_clear:
 143              	.LFB3:
  56:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
  57:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** //Adressera ASCII-display och nottställ de bitar som är 1 i x
  58:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** void ascii_ctrl_bit_clear(unsigned char x){
 144              		.loc 1 58 0
 145              		.cfi_startproc
 146 005c 80B5     		push	{r7, lr}
 147              		.cfi_def_cfa_offset 8
 148              		.cfi_offset 7, -8
 149              		.cfi_offset 14, -4
 150 005e 84B0     		sub	sp, sp, #16
 151              		.cfi_def_cfa_offset 24
 152 0060 00AF     		add	r7, sp, #0
 153              		.cfi_def_cfa_register 7
 154 0062 0200     		movs	r2, r0
 155 0064 FB1D     		adds	r3, r7, #7
 156 0066 1A70     		strb	r2, [r3]
  59:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	unsigned char c = *GPIO_ODR_LOW;
 157              		.loc 1 59 0
 158 0068 0F4A     		ldr	r2, .L9
 159 006a 0F23     		movs	r3, #15
 160 006c FB18     		adds	r3, r7, r3
 161 006e 1278     		ldrb	r2, [r2]
 162 0070 1A70     		strb	r2, [r3]
  60:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	c = B_SELECT | (c & ~x);
 163              		.loc 1 60 0
 164 0072 FB1D     		adds	r3, r7, #7
 165 0074 1B78     		ldrb	r3, [r3]
 166 0076 DB43     		mvns	r3, r3
 167 0078 D9B2     		uxtb	r1, r3
 168 007a 0F23     		movs	r3, #15
 169 007c FB18     		adds	r3, r7, r3
 170 007e 1A78     		ldrb	r2, [r3]
 171 0080 0B1C     		adds	r3, r1, #0
 172 0082 1340     		ands	r3, r2
 173 0084 DBB2     		uxtb	r3, r3
 174 0086 1A1C     		adds	r2, r3, #0
 175 0088 0423     		movs	r3, #4
 176 008a 1343     		orrs	r3, r2
 177 008c DAB2     		uxtb	r2, r3
 178 008e 0F23     		movs	r3, #15
 179 0090 FB18     		adds	r3, r7, r3
 180 0092 1A70     		strb	r2, [r3]
  61:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	*GPIO_ODR_LOW = c; 
 181              		.loc 1 61 0
 182 0094 044A     		ldr	r2, .L9
 183 0096 0F23     		movs	r3, #15
 184 0098 FB18     		adds	r3, r7, r3
 185 009a 1B78     		ldrb	r3, [r3]
 186 009c 1370     		strb	r3, [r2]
  62:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** }
 187              		.loc 1 62 0
 188 009e C046     		nop
 189 00a0 BD46     		mov	sp, r7
 190 00a2 04B0     		add	sp, sp, #16
 191              		@ sp needed
 192 00a4 80BD     		pop	{r7, pc}
 193              	.L10:
 194 00a6 C046     		.align	2
 195              	.L9:
 196 00a8 14100240 		.word	1073877012
 197              		.cfi_endproc
 198              	.LFE3:
 200              		.align	2
 201              		.global	ascii_write_cmd
 202              		.code	16
 203              		.thumb_func
 205              	ascii_write_cmd:
 206              	.LFB4:
  63:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
  64:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** //Skriver *KOMMANDO* till ASCII-minnet
  65:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** void ascii_write_cmd(unsigned char command){
 207              		.loc 1 65 0
 208              		.cfi_startproc
 209 00ac 80B5     		push	{r7, lr}
 210              		.cfi_def_cfa_offset 8
 211              		.cfi_offset 7, -8
 212              		.cfi_offset 14, -4
 213 00ae 82B0     		sub	sp, sp, #8
 214              		.cfi_def_cfa_offset 16
 215 00b0 00AF     		add	r7, sp, #0
 216              		.cfi_def_cfa_register 7
 217 00b2 0200     		movs	r2, r0
 218 00b4 FB1D     		adds	r3, r7, #7
 219 00b6 1A70     		strb	r2, [r3]
  66:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_RS | B_RW);
 220              		.loc 1 66 0
 221 00b8 0320     		movs	r0, #3
 222 00ba FFF7FEFF 		bl	ascii_ctrl_bit_clear
  67:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_write_controller(command);
 223              		.loc 1 67 0
 224 00be FB1D     		adds	r3, r7, #7
 225 00c0 1B78     		ldrb	r3, [r3]
 226 00c2 1800     		movs	r0, r3
 227 00c4 FFF7FEFF 		bl	ascii_write_controller
  68:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** }
 228              		.loc 1 68 0
 229 00c8 C046     		nop
 230 00ca BD46     		mov	sp, r7
 231 00cc 02B0     		add	sp, sp, #8
 232              		@ sp needed
 233 00ce 80BD     		pop	{r7, pc}
 234              		.cfi_endproc
 235              	.LFE4:
 237              		.align	2
 238              		.global	ascii_write_data
 239              		.code	16
 240              		.thumb_func
 242              	ascii_write_data:
 243              	.LFB5:
  69:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
  70:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** //Skriver *DATA* till ASCII-minnet
  71:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** void ascii_write_data(unsigned char data){
 244              		.loc 1 71 0
 245              		.cfi_startproc
 246 00d0 80B5     		push	{r7, lr}
 247              		.cfi_def_cfa_offset 8
 248              		.cfi_offset 7, -8
 249              		.cfi_offset 14, -4
 250 00d2 82B0     		sub	sp, sp, #8
 251              		.cfi_def_cfa_offset 16
 252 00d4 00AF     		add	r7, sp, #0
 253              		.cfi_def_cfa_register 7
 254 00d6 0200     		movs	r2, r0
 255 00d8 FB1D     		adds	r3, r7, #7
 256 00da 1A70     		strb	r2, [r3]
  72:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 257              		.loc 1 72 0
 258 00dc 0120     		movs	r0, #1
 259 00de FFF7FEFF 		bl	ascii_ctrl_bit_set
  73:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 260              		.loc 1 73 0
 261 00e2 0220     		movs	r0, #2
 262 00e4 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  74:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_write_controller(data);
 263              		.loc 1 74 0
 264 00e8 FB1D     		adds	r3, r7, #7
 265 00ea 1B78     		ldrb	r3, [r3]
 266 00ec 1800     		movs	r0, r3
 267 00ee FFF7FEFF 		bl	ascii_write_controller
  75:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** }
 268              		.loc 1 75 0
 269 00f2 C046     		nop
 270 00f4 BD46     		mov	sp, r7
 271 00f6 02B0     		add	sp, sp, #8
 272              		@ sp needed
 273 00f8 80BD     		pop	{r7, pc}
 274              		.cfi_endproc
 275              	.LFE5:
 277 00fa C046     		.align	2
 278              		.global	ascii_write_controller
 279              		.code	16
 280              		.thumb_func
 282              	ascii_write_controller:
 283              	.LFB6:
  76:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
  77:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** //Tidsdiskret *SKRIV*
  78:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** void ascii_write_controller(unsigned char bit){
 284              		.loc 1 78 0
 285              		.cfi_startproc
 286 00fc 80B5     		push	{r7, lr}
 287              		.cfi_def_cfa_offset 8
 288              		.cfi_offset 7, -8
 289              		.cfi_offset 14, -4
 290 00fe 82B0     		sub	sp, sp, #8
 291              		.cfi_def_cfa_offset 16
 292 0100 00AF     		add	r7, sp, #0
 293              		.cfi_def_cfa_register 7
 294 0102 0200     		movs	r2, r0
 295 0104 FB1D     		adds	r3, r7, #7
 296 0106 1A70     		strb	r2, [r3]
  79:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_ctrl_bit_set( B_E );
 297              		.loc 1 79 0
 298 0108 4020     		movs	r0, #64
 299 010a FFF7FEFF 		bl	ascii_ctrl_bit_set
  80:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	*GPIO_ODR_HIGH = bit;
 300              		.loc 1 80 0
 301 010e 064A     		ldr	r2, .L14
 302 0110 FB1D     		adds	r3, r7, #7
 303 0112 1B78     		ldrb	r3, [r3]
 304 0114 1370     		strb	r3, [r2]
  81:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	delay_250ns();
 305              		.loc 1 81 0
 306 0116 FFF7FEFF 		bl	delay_250ns
  82:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear( B_E );
 307              		.loc 1 82 0
 308 011a 4020     		movs	r0, #64
 309 011c FFF7FEFF 		bl	ascii_ctrl_bit_clear
  83:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** }
 310              		.loc 1 83 0
 311 0120 C046     		nop
 312 0122 BD46     		mov	sp, r7
 313 0124 02B0     		add	sp, sp, #8
 314              		@ sp needed
 315 0126 80BD     		pop	{r7, pc}
 316              	.L15:
 317              		.align	2
 318              	.L14:
 319 0128 15100240 		.word	1073877013
 320              		.cfi_endproc
 321              	.LFE6:
 323              		.align	2
 324              		.global	ascii_read_controller
 325              		.code	16
 326              		.thumb_func
 328              	ascii_read_controller:
 329              	.LFB7:
  84:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
  85:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
  86:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** //Tidsdiskret *LÄS*
  87:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** unsigned char ascii_read_controller(void){
 330              		.loc 1 87 0
 331              		.cfi_startproc
 332 012c 80B5     		push	{r7, lr}
 333              		.cfi_def_cfa_offset 8
 334              		.cfi_offset 7, -8
 335              		.cfi_offset 14, -4
 336 012e 82B0     		sub	sp, sp, #8
 337              		.cfi_def_cfa_offset 16
 338 0130 00AF     		add	r7, sp, #0
 339              		.cfi_def_cfa_register 7
  88:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	unsigned char rv;
  89:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_ctrl_bit_set( B_E );
 340              		.loc 1 89 0
 341 0132 4020     		movs	r0, #64
 342 0134 FFF7FEFF 		bl	ascii_ctrl_bit_set
  90:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	delay_250ns();
 343              		.loc 1 90 0
 344 0138 FFF7FEFF 		bl	delay_250ns
  91:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	delay_250ns();
 345              		.loc 1 91 0
 346 013c FFF7FEFF 		bl	delay_250ns
  92:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	rv = *GPIO_IDR_HIGH;
 347              		.loc 1 92 0
 348 0140 064A     		ldr	r2, .L18
 349 0142 FB1D     		adds	r3, r7, #7
 350 0144 1278     		ldrb	r2, [r2]
 351 0146 1A70     		strb	r2, [r3]
  93:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear( B_E );
 352              		.loc 1 93 0
 353 0148 4020     		movs	r0, #64
 354 014a FFF7FEFF 		bl	ascii_ctrl_bit_clear
  94:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	return rv;
 355              		.loc 1 94 0
 356 014e FB1D     		adds	r3, r7, #7
 357 0150 1B78     		ldrb	r3, [r3]
  95:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** }
 358              		.loc 1 95 0
 359 0152 1800     		movs	r0, r3
 360 0154 BD46     		mov	sp, r7
 361 0156 02B0     		add	sp, sp, #8
 362              		@ sp needed
 363 0158 80BD     		pop	{r7, pc}
 364              	.L19:
 365 015a C046     		.align	2
 366              	.L18:
 367 015c 11100240 		.word	1073877009
 368              		.cfi_endproc
 369              	.LFE7:
 371              		.align	2
 372              		.global	ascii_read_status
 373              		.code	16
 374              		.thumb_func
 376              	ascii_read_status:
 377              	.LFB8:
  96:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
  97:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** //Läser *STATUS* från ASCII-display
  98:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** unsigned char ascii_read_status(void){
 378              		.loc 1 98 0
 379              		.cfi_startproc
 380 0160 90B5     		push	{r4, r7, lr}
 381              		.cfi_def_cfa_offset 12
 382              		.cfi_offset 4, -12
 383              		.cfi_offset 7, -8
 384              		.cfi_offset 14, -4
 385 0162 83B0     		sub	sp, sp, #12
 386              		.cfi_def_cfa_offset 24
 387 0164 00AF     		add	r7, sp, #0
 388              		.cfi_def_cfa_register 7
  99:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	*((unsigned long*) (GPIO_MODER)) = 0x00005555;
 389              		.loc 1 99 0
 390 0166 0B4B     		ldr	r3, .L22
 391 0168 0B4A     		ldr	r2, .L22+4
 392 016a 1A60     		str	r2, [r3]
 100:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 393              		.loc 1 100 0
 394 016c 0220     		movs	r0, #2
 395 016e FFF7FEFF 		bl	ascii_ctrl_bit_set
 101:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 396              		.loc 1 101 0
 397 0172 0120     		movs	r0, #1
 398 0174 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 102:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	unsigned char rv;
 103:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	rv = ascii_read_controller();
 399              		.loc 1 103 0
 400 0178 FC1D     		adds	r4, r7, #7
 401 017a FFF7FEFF 		bl	ascii_read_controller
 402 017e 0300     		movs	r3, r0
 403 0180 2370     		strb	r3, [r4]
 104:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	*((unsigned long*) (GPIO_MODER)) = 0x55555555;
 404              		.loc 1 104 0
 405 0182 044B     		ldr	r3, .L22
 406 0184 054A     		ldr	r2, .L22+8
 407 0186 1A60     		str	r2, [r3]
 105:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	return rv;
 408              		.loc 1 105 0
 409 0188 FB1D     		adds	r3, r7, #7
 410 018a 1B78     		ldrb	r3, [r3]
 106:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** }
 411              		.loc 1 106 0
 412 018c 1800     		movs	r0, r3
 413 018e BD46     		mov	sp, r7
 414 0190 03B0     		add	sp, sp, #12
 415              		@ sp needed
 416 0192 90BD     		pop	{r4, r7, pc}
 417              	.L23:
 418              		.align	2
 419              	.L22:
 420 0194 00100240 		.word	1073876992
 421 0198 55550000 		.word	21845
 422 019c 55555555 		.word	1431655765
 423              		.cfi_endproc
 424              	.LFE8:
 426              		.align	2
 427              		.global	ascii_read_data
 428              		.code	16
 429              		.thumb_func
 431              	ascii_read_data:
 432              	.LFB9:
 107:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
 108:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** //Läser *DATA* från ASCII-display
 109:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** unsigned char ascii_read_data(void){
 433              		.loc 1 109 0
 434              		.cfi_startproc
 435 01a0 90B5     		push	{r4, r7, lr}
 436              		.cfi_def_cfa_offset 12
 437              		.cfi_offset 4, -12
 438              		.cfi_offset 7, -8
 439              		.cfi_offset 14, -4
 440 01a2 83B0     		sub	sp, sp, #12
 441              		.cfi_def_cfa_offset 24
 442 01a4 00AF     		add	r7, sp, #0
 443              		.cfi_def_cfa_register 7
 110:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	*((unsigned long*) (GPIO_MODER)) = 0x00005555;
 444              		.loc 1 110 0
 445 01a6 0A4B     		ldr	r3, .L26
 446 01a8 0A4A     		ldr	r2, .L26+4
 447 01aa 1A60     		str	r2, [r3]
 111:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RW | B_RS);
 448              		.loc 1 111 0
 449 01ac 0320     		movs	r0, #3
 450 01ae FFF7FEFF 		bl	ascii_ctrl_bit_set
 112:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	unsigned char rv = ascii_read_controller();
 451              		.loc 1 112 0
 452 01b2 FC1D     		adds	r4, r7, #7
 453 01b4 FFF7FEFF 		bl	ascii_read_controller
 454 01b8 0300     		movs	r3, r0
 455 01ba 2370     		strb	r3, [r4]
 113:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	*((unsigned long*) (GPIO_MODER)) = 0x55555555;
 456              		.loc 1 113 0
 457 01bc 044B     		ldr	r3, .L26
 458 01be 064A     		ldr	r2, .L26+8
 459 01c0 1A60     		str	r2, [r3]
 114:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	return rv;
 460              		.loc 1 114 0
 461 01c2 FB1D     		adds	r3, r7, #7
 462 01c4 1B78     		ldrb	r3, [r3]
 115:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** }
 463              		.loc 1 115 0
 464 01c6 1800     		movs	r0, r3
 465 01c8 BD46     		mov	sp, r7
 466 01ca 03B0     		add	sp, sp, #12
 467              		@ sp needed
 468 01cc 90BD     		pop	{r4, r7, pc}
 469              	.L27:
 470 01ce C046     		.align	2
 471              	.L26:
 472 01d0 00100240 		.word	1073876992
 473 01d4 55550000 		.word	21845
 474 01d8 55555555 		.word	1431655765
 475              		.cfi_endproc
 476              	.LFE9:
 478              		.align	2
 479              		.global	delay_250ns
 480              		.code	16
 481              		.thumb_func
 483              	delay_250ns:
 484              	.LFB10:
 116:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
 117:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
 118:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
 119:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
 120:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
 121:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** /********** Tids funktioner **********/
 122:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** void delay_250ns( void ){
 485              		.loc 1 122 0
 486              		.cfi_startproc
 487 01dc 80B5     		push	{r7, lr}
 488              		.cfi_def_cfa_offset 8
 489              		.cfi_offset 7, -8
 490              		.cfi_offset 14, -4
 491 01de 00AF     		add	r7, sp, #0
 492              		.cfi_def_cfa_register 7
 123:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** /* SystemCoreClock = 168000000 */
 124:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		*STK_CTRL = 0;
 493              		.loc 1 124 0
 494 01e0 0C4B     		ldr	r3, .L30
 495 01e2 0022     		movs	r2, #0
 496 01e4 1A60     		str	r2, [r3]
 125:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		*STK_LOAD = ( (168/4) -1 );
 497              		.loc 1 125 0
 498 01e6 0C4B     		ldr	r3, .L30+4
 499 01e8 2922     		movs	r2, #41
 500 01ea 1A60     		str	r2, [r3]
 126:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		*STK_VAL = 0;
 501              		.loc 1 126 0
 502 01ec 0B4B     		ldr	r3, .L30+8
 503 01ee 0022     		movs	r2, #0
 504 01f0 1A60     		str	r2, [r3]
 127:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		*STK_CTRL = 5;
 505              		.loc 1 127 0
 506 01f2 084B     		ldr	r3, .L30
 507 01f4 0522     		movs	r2, #5
 508 01f6 1A60     		str	r2, [r3]
 128:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		while( (*STK_CTRL & 0x10000 )== 0 )
 509              		.loc 1 128 0
 510 01f8 C046     		nop
 511              	.L29:
 512              		.loc 1 128 0 is_stmt 0 discriminator 1
 513 01fa 064B     		ldr	r3, .L30
 514 01fc 1A68     		ldr	r2, [r3]
 515 01fe 8023     		movs	r3, #128
 516 0200 5B02     		lsls	r3, r3, #9
 517 0202 1340     		ands	r3, r2
 518 0204 F9D0     		beq	.L29
 129:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		{}
 130:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		*STK_CTRL = 0;
 519              		.loc 1 130 0 is_stmt 1
 520 0206 034B     		ldr	r3, .L30
 521 0208 0022     		movs	r2, #0
 522 020a 1A60     		str	r2, [r3]
 131:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** }
 523              		.loc 1 131 0
 524 020c C046     		nop
 525 020e BD46     		mov	sp, r7
 526              		@ sp needed
 527 0210 80BD     		pop	{r7, pc}
 528              	.L31:
 529 0212 C046     		.align	2
 530              	.L30:
 531 0214 10E000E0 		.word	-536813552
 532 0218 14E000E0 		.word	-536813548
 533 021c 18E000E0 		.word	-536813544
 534              		.cfi_endproc
 535              	.LFE10:
 537              		.align	2
 538              		.global	delay_micro
 539              		.code	16
 540              		.thumb_func
 542              	delay_micro:
 543              	.LFB11:
 132:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
 133:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** void delay_micro(unsigned int us){
 544              		.loc 1 133 0
 545              		.cfi_startproc
 546 0220 80B5     		push	{r7, lr}
 547              		.cfi_def_cfa_offset 8
 548              		.cfi_offset 7, -8
 549              		.cfi_offset 14, -4
 550 0222 82B0     		sub	sp, sp, #8
 551              		.cfi_def_cfa_offset 16
 552 0224 00AF     		add	r7, sp, #0
 553              		.cfi_def_cfa_register 7
 554 0226 7860     		str	r0, [r7, #4]
 134:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	while(us--) {
 555              		.loc 1 134 0
 556 0228 07E0     		b	.L33
 557              	.L34:
 135:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		delay_250ns();
 558              		.loc 1 135 0
 559 022a FFF7FEFF 		bl	delay_250ns
 136:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		delay_250ns();
 560              		.loc 1 136 0
 561 022e FFF7FEFF 		bl	delay_250ns
 137:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		delay_250ns();
 562              		.loc 1 137 0
 563 0232 FFF7FEFF 		bl	delay_250ns
 138:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		delay_250ns();
 564              		.loc 1 138 0
 565 0236 FFF7FEFF 		bl	delay_250ns
 566              	.L33:
 134:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		delay_250ns();
 567              		.loc 1 134 0
 568 023a 7B68     		ldr	r3, [r7, #4]
 569 023c 5A1E     		subs	r2, r3, #1
 570 023e 7A60     		str	r2, [r7, #4]
 571 0240 002B     		cmp	r3, #0
 572 0242 F2D1     		bne	.L34
 139:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	}
 140:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** }
 573              		.loc 1 140 0
 574 0244 C046     		nop
 575 0246 BD46     		mov	sp, r7
 576 0248 02B0     		add	sp, sp, #8
 577              		@ sp needed
 578 024a 80BD     		pop	{r7, pc}
 579              		.cfi_endproc
 580              	.LFE11:
 582              		.align	2
 583              		.global	delay_milli
 584              		.code	16
 585              		.thumb_func
 587              	delay_milli:
 588              	.LFB12:
 141:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
 142:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** void delay_milli(unsigned int ms){
 589              		.loc 1 142 0
 590              		.cfi_startproc
 591 024c 80B5     		push	{r7, lr}
 592              		.cfi_def_cfa_offset 8
 593              		.cfi_offset 7, -8
 594              		.cfi_offset 14, -4
 595 024e 82B0     		sub	sp, sp, #8
 596              		.cfi_def_cfa_offset 16
 597 0250 00AF     		add	r7, sp, #0
 598              		.cfi_def_cfa_register 7
 599 0252 7860     		str	r0, [r7, #4]
 143:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	#ifdef SIMULATOR
 144:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		while( ms-- )
 145:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 			delay_micro(1);
 146:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	#else
 147:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		while( ms-- )
 600              		.loc 1 147 0
 601 0254 04E0     		b	.L36
 602              	.L37:
 148:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 			delay_micro(1000);
 603              		.loc 1 148 0
 604 0256 FA23     		movs	r3, #250
 605 0258 9B00     		lsls	r3, r3, #2
 606 025a 1800     		movs	r0, r3
 607 025c FFF7FEFF 		bl	delay_micro
 608              	.L36:
 147:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 			delay_micro(1000);
 609              		.loc 1 147 0
 610 0260 7B68     		ldr	r3, [r7, #4]
 611 0262 5A1E     		subs	r2, r3, #1
 612 0264 7A60     		str	r2, [r7, #4]
 613 0266 002B     		cmp	r3, #0
 614 0268 F5D1     		bne	.L37
 149:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	#endif
 150:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** }
 615              		.loc 1 150 0
 616 026a C046     		nop
 617 026c BD46     		mov	sp, r7
 618 026e 02B0     		add	sp, sp, #8
 619              		@ sp needed
 620 0270 80BD     		pop	{r7, pc}
 621              		.cfi_endproc
 622              	.LFE12:
 624 0272 C046     		.align	2
 625              		.global	ascii_init
 626              		.code	16
 627              		.thumb_func
 629              	ascii_init:
 630              	.LFB13:
 151:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
 152:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** /*void delay_milli(int ms){
 153:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	int i;
 154:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	while(ms--){
 155:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		for( i = 0; i < 1000; i++ ){
 156:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 			delay_250ns();
 157:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 			delay_250ns();
 158:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 			delay_250ns();
 159:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 			delay_250ns();
 160:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		}
 161:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	}
 162:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** }*/
 163:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** /***** Initierar ASCII-Display *****/
 164:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** void ascii_init(void){
 631              		.loc 1 164 0
 632              		.cfi_startproc
 633 0274 80B5     		push	{r7, lr}
 634              		.cfi_def_cfa_offset 8
 635              		.cfi_offset 7, -8
 636              		.cfi_offset 14, -4
 637 0276 00AF     		add	r7, sp, #0
 638              		.cfi_def_cfa_register 7
 165:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_RS | B_RW);
 639              		.loc 1 165 0
 640 0278 0320     		movs	r0, #3
 641 027a FFF7FEFF 		bl	ascii_ctrl_bit_clear
 166:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	/* Funktion Set */
 167:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){} 				///Väntar tills display är klar att ta emot ko
 642              		.loc 1 167 0
 643 027e C046     		nop
 644              	.L39:
 645              		.loc 1 167 0 is_stmt 0 discriminator 1
 646 0280 FFF7FEFF 		bl	ascii_read_status
 647 0284 0300     		movs	r3, r0
 648 0286 DBB2     		uxtb	r3, r3
 649 0288 5BB2     		sxtb	r3, r3
 650 028a 002B     		cmp	r3, #0
 651 028c F8DB     		blt	.L39
 168:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	delay_micro(8);												///Latenstid för kommando
 652              		.loc 1 168 0 is_stmt 1
 653 028e 0820     		movs	r0, #8
 654 0290 FFF7FEFF 		bl	delay_micro
 169:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_write_cmd(0x38);										///Funktion Set 
 655              		.loc 1 169 0
 656 0294 3820     		movs	r0, #56
 657 0296 FFF7FEFF 		bl	ascii_write_cmd
 170:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	delay_micro(39);											///Specifik delay för funktionen
 658              		.loc 1 170 0
 659 029a 2720     		movs	r0, #39
 660 029c FFF7FEFF 		bl	delay_micro
 171:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	//00 00111000
 172:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	
 173:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	/* Display control */
 174:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 661              		.loc 1 174 0
 662 02a0 C046     		nop
 663              	.L40:
 664              		.loc 1 174 0 is_stmt 0 discriminator 1
 665 02a2 FFF7FEFF 		bl	ascii_read_status
 666 02a6 0300     		movs	r3, r0
 667 02a8 DBB2     		uxtb	r3, r3
 668 02aa 5BB2     		sxtb	r3, r3
 669 02ac 002B     		cmp	r3, #0
 670 02ae F8DB     		blt	.L40
 175:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	delay_micro(8);
 671              		.loc 1 175 0 is_stmt 1
 672 02b0 0820     		movs	r0, #8
 673 02b2 FFF7FEFF 		bl	delay_micro
 176:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_write_cmd(0x0E);										///Display control 
 674              		.loc 1 176 0
 675 02b6 0E20     		movs	r0, #14
 676 02b8 FFF7FEFF 		bl	ascii_write_cmd
 177:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	delay_micro(39);											///Specifik delay för funktionen
 677              		.loc 1 177 0
 678 02bc 2720     		movs	r0, #39
 679 02be FFF7FEFF 		bl	delay_micro
 178:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	//00 00001110
 179:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	
 180:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	/* Clear Display */	
 181:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){} 
 680              		.loc 1 181 0
 681 02c2 C046     		nop
 682              	.L41:
 683              		.loc 1 181 0 is_stmt 0 discriminator 1
 684 02c4 FFF7FEFF 		bl	ascii_read_status
 685 02c8 0300     		movs	r3, r0
 686 02ca DBB2     		uxtb	r3, r3
 687 02cc 5BB2     		sxtb	r3, r3
 688 02ce 002B     		cmp	r3, #0
 689 02d0 F8DB     		blt	.L41
 182:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		delay_micro(8); 
 690              		.loc 1 182 0 is_stmt 1
 691 02d2 0820     		movs	r0, #8
 692 02d4 FFF7FEFF 		bl	delay_micro
 183:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		ascii_write_cmd(1);										///"Clear display"
 693              		.loc 1 183 0
 694 02d8 0120     		movs	r0, #1
 695 02da FFF7FEFF 		bl	ascii_write_cmd
 184:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		delay_milli(2);											///2ms istället för 1,53ms
 696              		.loc 1 184 0
 697 02de 0220     		movs	r0, #2
 698 02e0 FFF7FEFF 		bl	delay_milli
 185:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		
 186:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	/* Entry mode Set */
 187:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 699              		.loc 1 187 0
 700 02e4 C046     		nop
 701              	.L42:
 702              		.loc 1 187 0 is_stmt 0 discriminator 1
 703 02e6 FFF7FEFF 		bl	ascii_read_status
 704 02ea 0300     		movs	r3, r0
 705 02ec DBB2     		uxtb	r3, r3
 706 02ee 5BB2     		sxtb	r3, r3
 707 02f0 002B     		cmp	r3, #0
 708 02f2 F8DB     		blt	.L42
 188:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	delay_micro(8);
 709              		.loc 1 188 0 is_stmt 1
 710 02f4 0820     		movs	r0, #8
 711 02f6 FFF7FEFF 		bl	delay_micro
 189:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_write_cmd(4);											///Entry mode Set
 712              		.loc 1 189 0
 713 02fa 0420     		movs	r0, #4
 714 02fc FFF7FEFF 		bl	ascii_write_cmd
 190:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	delay_micro(39);											///Specifik delay för funktionen
 715              		.loc 1 190 0
 716 0300 2720     		movs	r0, #39
 717 0302 FFF7FEFF 		bl	delay_micro
 191:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	//00 00000100
 192:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** }
 718              		.loc 1 192 0
 719 0306 C046     		nop
 720 0308 BD46     		mov	sp, r7
 721              		@ sp needed
 722 030a 80BD     		pop	{r7, pc}
 723              		.cfi_endproc
 724              	.LFE13:
 726              		.align	2
 727              		.global	ascii_write_char
 728              		.code	16
 729              		.thumb_func
 731              	ascii_write_char:
 732              	.LFB14:
 193:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
 194:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
 195:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** /********** ASCII Skriv-Funktioner **********/
 196:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** void ascii_write_char(unsigned char c){
 733              		.loc 1 196 0
 734              		.cfi_startproc
 735 030c 80B5     		push	{r7, lr}
 736              		.cfi_def_cfa_offset 8
 737              		.cfi_offset 7, -8
 738              		.cfi_offset 14, -4
 739 030e 82B0     		sub	sp, sp, #8
 740              		.cfi_def_cfa_offset 16
 741 0310 00AF     		add	r7, sp, #0
 742              		.cfi_def_cfa_register 7
 743 0312 0200     		movs	r2, r0
 744 0314 FB1D     		adds	r3, r7, #7
 745 0316 1A70     		strb	r2, [r3]
 197:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 746              		.loc 1 197 0
 747 0318 C046     		nop
 748              	.L44:
 749              		.loc 1 197 0 is_stmt 0 discriminator 1
 750 031a FFF7FEFF 		bl	ascii_read_status
 751 031e 0300     		movs	r3, r0
 752 0320 DBB2     		uxtb	r3, r3
 753 0322 5BB2     		sxtb	r3, r3
 754 0324 002B     		cmp	r3, #0
 755 0326 F8DB     		blt	.L44
 198:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	delay_micro(8);
 756              		.loc 1 198 0 is_stmt 1
 757 0328 0820     		movs	r0, #8
 758 032a FFF7FEFF 		bl	delay_micro
 199:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_write_data(c);
 759              		.loc 1 199 0
 760 032e FB1D     		adds	r3, r7, #7
 761 0330 1B78     		ldrb	r3, [r3]
 762 0332 1800     		movs	r0, r3
 763 0334 FFF7FEFF 		bl	ascii_write_data
 200:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	delay_micro(39);
 764              		.loc 1 200 0
 765 0338 2720     		movs	r0, #39
 766 033a FFF7FEFF 		bl	delay_micro
 201:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** }
 767              		.loc 1 201 0
 768 033e C046     		nop
 769 0340 BD46     		mov	sp, r7
 770 0342 02B0     		add	sp, sp, #8
 771              		@ sp needed
 772 0344 80BD     		pop	{r7, pc}
 773              		.cfi_endproc
 774              	.LFE14:
 776 0346 C046     		.align	2
 777              		.global	ascii_gotoxy
 778              		.code	16
 779              		.thumb_func
 781              	ascii_gotoxy:
 782              	.LFB15:
 202:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
 203:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** void ascii_gotoxy(int row, int column){
 783              		.loc 1 203 0
 784              		.cfi_startproc
 785 0348 80B5     		push	{r7, lr}
 786              		.cfi_def_cfa_offset 8
 787              		.cfi_offset 7, -8
 788              		.cfi_offset 14, -4
 789 034a 84B0     		sub	sp, sp, #16
 790              		.cfi_def_cfa_offset 24
 791 034c 00AF     		add	r7, sp, #0
 792              		.cfi_def_cfa_register 7
 793 034e 7860     		str	r0, [r7, #4]
 794 0350 3960     		str	r1, [r7]
 204:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	int adress = row -1;
 795              		.loc 1 204 0
 796 0352 7B68     		ldr	r3, [r7, #4]
 797 0354 013B     		subs	r3, r3, #1
 798 0356 FB60     		str	r3, [r7, #12]
 205:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	if (column == 2){
 799              		.loc 1 205 0
 800 0358 3B68     		ldr	r3, [r7]
 801 035a 022B     		cmp	r3, #2
 802 035c 02D1     		bne	.L48
 206:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		adress += 0x40;				/** ?????????????????????????????????????? */
 803              		.loc 1 206 0
 804 035e FB68     		ldr	r3, [r7, #12]
 805 0360 4033     		adds	r3, r3, #64
 806 0362 FB60     		str	r3, [r7, #12]
 807              	.L48:
 207:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	}
 208:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80){}
 808              		.loc 1 208 0
 809 0364 C046     		nop
 810              	.L47:
 811              		.loc 1 208 0 is_stmt 0 discriminator 1
 812 0366 FFF7FEFF 		bl	ascii_read_status
 813 036a 0300     		movs	r3, r0
 814 036c DBB2     		uxtb	r3, r3
 815 036e 5BB2     		sxtb	r3, r3
 816 0370 002B     		cmp	r3, #0
 817 0372 F8DB     		blt	.L47
 209:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	delay_micro(8);
 818              		.loc 1 209 0 is_stmt 1
 819 0374 0820     		movs	r0, #8
 820 0376 FFF7FEFF 		bl	delay_micro
 210:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_write_cmd(0x80 | adress);  ///Behövs det en "inväntnings WHILE sats" här???????
 821              		.loc 1 210 0
 822 037a FB68     		ldr	r3, [r7, #12]
 823 037c DBB2     		uxtb	r3, r3
 824 037e 1A1C     		adds	r2, r3, #0
 825 0380 8023     		movs	r3, #128
 826 0382 5B42     		rsbs	r3, r3, #0
 827 0384 1343     		orrs	r3, r2
 828 0386 DBB2     		uxtb	r3, r3
 829 0388 DBB2     		uxtb	r3, r3
 830 038a 1800     		movs	r0, r3
 831 038c FFF7FEFF 		bl	ascii_write_cmd
 211:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	delay_micro(39);
 832              		.loc 1 211 0
 833 0390 2720     		movs	r0, #39
 834 0392 FFF7FEFF 		bl	delay_micro
 212:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** }
 835              		.loc 1 212 0
 836 0396 C046     		nop
 837 0398 BD46     		mov	sp, r7
 838 039a 04B0     		add	sp, sp, #16
 839              		@ sp needed
 840 039c 80BD     		pop	{r7, pc}
 841              		.cfi_endproc
 842              	.LFE15:
 844              		.section	.rodata
 845              		.align	2
 846              	.LC0:
 847 0000 416C6661 		.ascii	"Alfanumerisk \000"
 847      6E756D65 
 847      7269736B 
 847      2000
 848 000e 0000     		.align	2
 849              	.LC2:
 850 0010 44697370 		.ascii	"Display - test\000"
 850      6C617920 
 850      2D207465 
 850      737400
 851              		.text
 852 039e C046     		.align	2
 853              		.global	main
 854              		.code	16
 855              		.thumb_func
 857              	main:
 858              	.LFB16:
 213:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
 214:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
 215:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** /********** MAIN **********/
 216:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 
 217:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** void main(void)
 218:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** {
 859              		.loc 1 218 0
 860              		.cfi_startproc
 861 03a0 90B5     		push	{r4, r7, lr}
 862              		.cfi_def_cfa_offset 12
 863              		.cfi_offset 4, -12
 864              		.cfi_offset 7, -8
 865              		.cfi_offset 14, -4
 866 03a2 8BB0     		sub	sp, sp, #44
 867              		.cfi_def_cfa_offset 56
 868 03a4 00AF     		add	r7, sp, #0
 869              		.cfi_def_cfa_register 7
 219:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	char *s;
 220:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	char test1[] = "Alfanumerisk ";
 870              		.loc 1 220 0
 871 03a6 1423     		movs	r3, #20
 872 03a8 FB18     		adds	r3, r7, r3
 873 03aa 1D4A     		ldr	r2, .L55
 874 03ac 13CA     		ldmia	r2!, {r0, r1, r4}
 875 03ae 13C3     		stmia	r3!, {r0, r1, r4}
 876 03b0 1288     		ldrh	r2, [r2]
 877 03b2 1A80     		strh	r2, [r3]
 221:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	char test2[] = "Display - test";
 878              		.loc 1 221 0
 879 03b4 3B1D     		adds	r3, r7, #4
 880 03b6 1B4A     		ldr	r2, .L55+4
 881 03b8 13CA     		ldmia	r2!, {r0, r1, r4}
 882 03ba 13C3     		stmia	r3!, {r0, r1, r4}
 883 03bc 1188     		ldrh	r1, [r2]
 884 03be 1980     		strh	r1, [r3]
 885 03c0 9278     		ldrb	r2, [r2, #2]
 886 03c2 9A70     		strb	r2, [r3, #2]
 222:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	
 223:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	appInit();
 887              		.loc 1 223 0
 888 03c4 FFF7FEFF 		bl	appInit
 224:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_init();
 889              		.loc 1 224 0
 890 03c8 FFF7FEFF 		bl	ascii_init
 225:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_gotoxy(1,1);
 891              		.loc 1 225 0
 892 03cc 0121     		movs	r1, #1
 893 03ce 0120     		movs	r0, #1
 894 03d0 FFF7FEFF 		bl	ascii_gotoxy
 226:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	s = test1;
 895              		.loc 1 226 0
 896 03d4 1423     		movs	r3, #20
 897 03d6 FB18     		adds	r3, r7, r3
 898 03d8 7B62     		str	r3, [r7, #36]
 227:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	while(*s)
 899              		.loc 1 227 0
 900 03da 06E0     		b	.L50
 901              	.L51:
 228:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		ascii_write_char(*s++);
 902              		.loc 1 228 0
 903 03dc 7B6A     		ldr	r3, [r7, #36]
 904 03de 5A1C     		adds	r2, r3, #1
 905 03e0 7A62     		str	r2, [r7, #36]
 906 03e2 1B78     		ldrb	r3, [r3]
 907 03e4 1800     		movs	r0, r3
 908 03e6 FFF7FEFF 		bl	ascii_write_char
 909              	.L50:
 227:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	while(*s)
 910              		.loc 1 227 0
 911 03ea 7B6A     		ldr	r3, [r7, #36]
 912 03ec 1B78     		ldrb	r3, [r3]
 913 03ee 002B     		cmp	r3, #0
 914 03f0 F4D1     		bne	.L51
 229:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	ascii_gotoxy(1,2);
 915              		.loc 1 229 0
 916 03f2 0221     		movs	r1, #2
 917 03f4 0120     		movs	r0, #1
 918 03f6 FFF7FEFF 		bl	ascii_gotoxy
 230:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	s = test2;
 919              		.loc 1 230 0
 920 03fa 3B1D     		adds	r3, r7, #4
 921 03fc 7B62     		str	r3, [r7, #36]
 231:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	while(*s)
 922              		.loc 1 231 0
 923 03fe 06E0     		b	.L52
 924              	.L53:
 232:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 		ascii_write_char(*s++);
 925              		.loc 1 232 0
 926 0400 7B6A     		ldr	r3, [r7, #36]
 927 0402 5A1C     		adds	r2, r3, #1
 928 0404 7A62     		str	r2, [r7, #36]
 929 0406 1B78     		ldrb	r3, [r3]
 930 0408 1800     		movs	r0, r3
 931 040a FFF7FEFF 		bl	ascii_write_char
 932              	.L52:
 231:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	while(*s)
 933              		.loc 1 231 0
 934 040e 7B6A     		ldr	r3, [r7, #36]
 935 0410 1B78     		ldrb	r3, [r3]
 936 0412 002B     		cmp	r3, #0
 937 0414 F4D1     		bne	.L53
 233:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** 	return 0;
 938              		.loc 1 233 0
 939 0416 C046     		nop
 234:C:/Users/Olof/Documents/C_rymdskepp/asciidisplay\startup.c **** }
 940              		.loc 1 234 0
 941 0418 BD46     		mov	sp, r7
 942 041a 0BB0     		add	sp, sp, #44
 943              		@ sp needed
 944 041c 90BD     		pop	{r4, r7, pc}
 945              	.L56:
 946 041e C046     		.align	2
 947              	.L55:
 948 0420 00000000 		.word	.LC0
 949 0424 10000000 		.word	.LC2
 950              		.cfi_endproc
 951              	.LFE16:
 953              	.Letext0:
