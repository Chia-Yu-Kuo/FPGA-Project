#include <stdio.h>
#include "xil_printf.h"
#include "xil_io.h"
#include "xparameters.h"

// to be modified
#define BRAM1_BASEADDR XPAR_AXI_BRAM_CTRL_1_S_AXI_BASEADDR
#define BRAM0_BASEADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR

int main(){
	u32 inst;
	u32 data;
	u32 bram0_Raddr;
	u32 bram1_Raddr;
	u32 bram1_Waddr;
	u32 dsp_inmode;
	u32 dsp_opmode;
	u32 dsp_alumode;
	/*
	bram0_Raddr = inst[4:0];
	bram1_Raddr = inst[9:5];
	bram1_Waddr = inst[14:10];
	dsp_inmode = inst[19:15];
	dsp_opmode = inst[26:20];
	dsp_alumode = inst[30:27];
	*/



	printf("\r\nProgram Start.\r\n");
	printf("\r\nstep 1.\r\n");
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, 0);


/*
	// BRAM1[5] <= BRAM0[0] : BRAM1[2]
	bram0_Raddr = 0;
	bram1_Raddr = 2;
	bram1_Waddr = 5;
	dsp_inmode = 0b00000;
	dsp_opmode = 0b0110011;
	dsp_alumode = 0b0000;
	inst = (1<<31) + (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, inst);

	inst = (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, (inst));
	*/


	// BRAM1[3] <= BRAM0[0] * BRAM1[2]
	bram0_Raddr = 0;
	bram1_Raddr = 2;
	bram1_Waddr = 3;
	dsp_inmode = 0b10001;
	dsp_opmode = 0b0000101;
	dsp_alumode = 0b0000;
	inst = (1<<31) + (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, inst);
	inst = (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, (inst));

	/*
	//////////////////////
	data = Xil_In32(XPAR_AXI_GPIO_0_BASEADDR);
	printf("inst_o = %x \r\n", inst);
	printf("inst_0 = %x \r\n", data);
	data = Xil_In32(XPAR_AXI_GPIO_1_BASEADDR);
	printf("BRAM0DATA = %x \r\n", data);
	data = Xil_In32(XPAR_AXI_GPIO_2_BASEADDR);
	printf("BRAM1DATA = %x \r\n", data);
	//////////////////////
	*/

	
	// BRAM1[7] <= BRAM0[11] * BRAM1[3]
	bram0_Raddr = 11;
	bram1_Raddr = 3;
	bram1_Waddr = 7;
	dsp_inmode = 0b10001;
	dsp_opmode = 0b0000101;
	dsp_alumode = 0b0000;
	inst = (1<<31) + (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, inst);
	inst = (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, (inst));


	// BRAM1[10] <= BRAM0[31] * BRAM1[7] + C
	bram0_Raddr = 31;
	bram1_Raddr = 7;
	bram1_Waddr = 10;
	dsp_inmode = 0b10001;
	dsp_opmode = 0b0110101;
	dsp_alumode = 0b0000;
	inst = (1<<31) + (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, inst);
	inst = (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, (inst));

	// BRAM1[13] <= C - BRAM0[1] * BRAM1[6]
	bram0_Raddr = 1;
	bram1_Raddr = 6;
	bram1_Waddr = 13;
	dsp_inmode = 0b10001;
	dsp_opmode = 0b0110101;
	dsp_alumode = 0b0011;
	inst = (1<<31) + (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, inst);
	inst = (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, (inst));

	// BRAM1[15] <= BRAM0[0] * BRAM1[31] - C - 1
	bram0_Raddr = 0;
	bram1_Raddr = 31;
	bram1_Waddr = 15;
	dsp_inmode = 0b10001;
	dsp_opmode = 0b0110101;
	dsp_alumode = 0b0001;
	inst = (1<<31) + (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, inst);
	inst = (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, (inst));

	//Read Data from BRAM
	for(int i=0; i<32; i++) {
		data = Xil_In32(BRAM1_BASEADDR + i*4);
		printf("BRAM1[%d] = %x \r\n", i, data);
	}
	
	//Write Data to BRAM
	for(int i=0; i<32; i++) {
		Xil_Out32(BRAM0_BASEADDR + i*4, (i+1)*(i+1));
	}
	

	printf("\r\nstep 2.\r\n");

	// BRAM1[16] <= BRAM0[0] * BRAM1[2]
	bram0_Raddr = 0;
	bram1_Raddr = 2;
	bram1_Waddr = 16;
	dsp_inmode = 0b10001;
	dsp_opmode = 0b0000101;
	dsp_alumode = 0b0000;
	inst = (1<<31) + (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, inst);
	inst = (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, (inst));
	
	// BRAM1[17] <= BRAM0[11] * BRAM1[3]
	bram0_Raddr = 11;
	bram1_Raddr = 3;
	bram1_Waddr = 17;
	dsp_inmode = 0b10001;
	dsp_opmode = 0b0000101;
	dsp_alumode = 0b0000;
	inst = (1<<31) + (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, inst);
	inst = (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, (inst));

	// BRAM1[18] <= BRAM0[31] * BRAM1[7] + C
	bram0_Raddr = 31;
	bram1_Raddr = 7;
	bram1_Waddr = 18;
	dsp_inmode = 0b10001;
	dsp_opmode = 0b0110101;
	dsp_alumode = 0b0000;
	inst = (1<<31) + (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, inst);
	inst = (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, (inst));
	
	// BRAM1[19] <= C - BRAM0[1] * BRAM1[6]
	bram0_Raddr = 1;
	bram1_Raddr = 6;
	bram1_Waddr = 19;
	dsp_inmode = 0b10001;
	dsp_opmode = 0b0110101;
	dsp_alumode = 0b0011;
	inst = (1<<31) + (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, inst);
	inst = (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, (inst));

	// BRAM1[20] <= BRAM0[0] * BRAM1[31] - C - 1
	bram0_Raddr = 0;
	bram1_Raddr = 31;
	bram1_Waddr = 20;
	dsp_inmode = 0b10001;
	dsp_opmode = 0b0110101;
	dsp_alumode = 0b0001;
	inst = (1<<31) + (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, inst);
	inst = (dsp_alumode<<27) + (dsp_opmode<<20) + (dsp_inmode<<15) + (bram1_Waddr<<10) + (bram1_Raddr<<5) + (bram0_Raddr);
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, (inst));

	//Read Data from BRAM
	for(int i=0; i<32; i++) {
		data = Xil_In32(BRAM1_BASEADDR + i*4);
		printf("BRAM1[%d] = %x \r\n", i, data);
	}
	
	/*
	printf("\n                            . .  ,  , ");
	printf("\n                            |` \/ \/ \,', ");
	printf("\n                            ;          ` \/\,. ");
	printf("\n                           :               ` \,/ ");
	printf("\n                           |                  / ");
	printf("\n                           ;                 : ");
	printf("\n                          :                  ; ");
	printf("\n                          |      ,---.      / ");
	printf("\n                         :     ,'     `,-._ \ ");
	printf("\n                         ;    (   o    \   `' ");
	printf("\n                       _:      .      ,'  o ; ");
	printf("\n                      /,.`      `.__,'`-.__, ");
	printf("\n                      \_  _               \ ");
	printf("\n                     ,'  / `,          `.,' ");
	printf("\n               ___,'`-._ \_/ `,._        ; ");
	printf("\n            __;_,'      `-.`-'./ `--.____) ");
	printf("\n         ,-'           _,--\^-' ");
	printf("\n       ,:_____      ,-'     \ ");
	printf("\n      (,'     `--.  \-._     ");
	printf("\n      :    Y      `-/    `,  : ");
	printf("\n      :    :       :     /_' ");
	printf("\n      :    :       |    : ");
	printf("\n       \    \      :    : ");
	printf("\n        `-._ `-.__, \    `. ");
	printf("\n           \   \  `. \     `. ");
	printf("\n         ,-    \---)_\ ,','/ ");
	printf("\n         \_ `---'--' ,'^-' ");
	printf("\n         (_`     ---' ,-') ");
	printf("\n         / `--.__,. ,-'    \ ");
	printf("\n-hrr-    )-.__,-- ||___,--' `-. ");
	printf("\n        /._______,|__________,'\ ");
	printf("\n        `--.____,'|_________,-' ");


	printf("\n\n\n\n\n 7shian TA NI HUO ARR~~");
	*/
}
