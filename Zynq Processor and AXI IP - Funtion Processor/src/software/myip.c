

/***************************** Include Files *******************************/
#include "myip.h"

/************************** Function Definitions ***************************/


/*
u32 add(UINTPTR baseAddr, u32 A, u32 B) {
	u32 Sum;
	u32 data = A + (B << 3);
	ADDER_mWriteReg(baseAddr, 0, data);
	Sum = ADDER_mReadReg (baseAddr, 4);
	return Sum;
}*/



void Arith_pass_data(UINTPTR baseAddr, u32 op1, u32 op2 , u32 op ) {
	u32 data = (op1 & 0x000000ff) + ((op2 & 0x000000ff)<<8) + (op << 16);
	//printf ("%d \n" , data);
	MYIP_mWriteReg(baseAddr, 4, data); // pass data

	/*
	data = MYIP_mReadReg (baseAddr, 8);
	printf ("%d \n" , data);
	//for(int i=0; i<9; i++);
	*/
}

u32 Arith_get_result(UINTPTR baseAddr) {
	u32 arith_result = MYIP_mReadReg (baseAddr, 8);
	return arith_result;
}

void Sort_pass_data(UINTPTR baseAddr, u32 in_data) {
	u32 data = (1 << 8) + in_data;
	MYIP_mWriteReg(baseAddr, 4, data); // pass data

	//printf ("%d \n" , data);
//	for (size_t i = 0; i < 10; i++);			//delay
	data = (0 << 8) + in_data;

	//printf ("%d \n" , data);
	MYIP_mWriteReg(baseAddr, 4, data); // set en = 0
}
/*
u64 Sort_get_result(UINTPTR baseAddr) {
	u64 sort_result1 ,  sort_result2;
	u64 sort_result;
	sort_result1 = MYIP_mReadReg (baseAddr, 8);
	sort_result2 = MYIP_mReadReg (baseAddr, 12);

	printf ("%lld \n" , sort_result1);
	printf ("%lld \n" , sort_result2);

	sort_result= (sort_result1<<32) + sort_result2;

	printf ("myip.c  %lld \n" , sort_result);

	return sort_result;
}
*/
u32 Sort_get_result1(UINTPTR baseAddr) {
	u32 sort_result1;
	sort_result1 = MYIP_mReadReg (baseAddr, 8);

	return sort_result1;
}

u32 Sort_get_result2(UINTPTR baseAddr) {
	u32 sort_result2;
	sort_result2 = MYIP_mReadReg (baseAddr, 12);

	return sort_result2;
}

void Parity_pass_data(UINTPTR baseAddr, u32 in_data) {
	MYIP_mWriteReg(baseAddr, 4, in_data); // pass data
}

u32 Parity_get_result(UINTPTR baseAddr) {
	u32 parity_result;
	parity_result = MYIP_mReadReg (baseAddr, 8);
	return parity_result;
}

void clear_sort_reg (UINTPTR baseAddr){
	MYIP_mWriteReg(baseAddr, 0, 3);
}

void start_process (UINTPTR baseAddr, u32 mode){
	MYIP_mWriteReg(baseAddr, 0, mode); //pass mode
}
