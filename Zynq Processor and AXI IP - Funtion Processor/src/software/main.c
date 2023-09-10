

#include <stdio.h>
#include "xil_printf.h"
#include "xil_io.h"
#include "xparameters.h"
#include "myip.h"


int main()
{
	u32 mode ;
	printf("Program Start.\n\r");
	while(1) {

		printf("Please input mode : (0:arithmatic  1:sorting  2:parity bit)\r\n" );
		scanf("%d", &mode);
		printf(" %d\r\n", mode);


		if (mode==0)
		{
			u32 op1, op2 , op ;
			u32 arith_result;
			u32 sum, ov ;
			u32 operator;
			printf("Input operand1:\r\n");
			scanf("%d", &op1);
			printf(" %d\r\n", op1);
			printf("Input operand2:\r\n");
			scanf("%d", &op2);
			printf(" %d\r\n", op2);

			printf("Input operator: (+: keyin 0 / -: keyin 1 / *: keyin 2 )\r\n");
			scanf("%d", &operator);
			printf(" %d\r\n", operator);

			if (operator==0)
			{
				op=0;
			}
			else if (operator==1)
			{
				op=1;
			}
			else if (operator==2)
			{
				op=2;
			}
			else
			{
				op=3;
			}

			Arith_pass_data(XPAR_MYIP_0_S00_AXI_BASEADDR, op1,op2,op);
			start_process(XPAR_MYIP_0_S00_AXI_BASEADDR, mode);
			arith_result=Arith_get_result(XPAR_MYIP_0_S00_AXI_BASEADDR);

			sum =  arith_result & 255;		// & 1111_1111
			//sign extension
			if ((sum>>7))
			{
				sum += 0xFFFFFF00 ;
			}

			ov = arith_result & 256; // & 1_0000_0000

			printf("result = %d\n\r" , sum);
			if (ov)
			{
				printf("overflow is happened !! \n\r");
			}
			else
			{
				printf("no overflow  !! \n\r");
			}

		}
		else if (mode==1)
		{
			/*
			u32 in_data;
			u64 sort_result;
			// u32 small1 ,small2 ,small3 ,small4 ,small5 ,small6 ,small7 ,small8;
			u32 small[8];

			clear_sort_reg(XPAR_MYIP_0_S00_AXI_BASEADDR);
			start_process(XPAR_MYIP_0_S00_AXI_BASEADDR, mode);

			for (int i = 0; i < 8; i++)
			{
				printf("Input data\r\n");
				scanf("%d", &in_data);
				printf(" %d\r\n", in_data);
				Sort_pass_data(XPAR_MYIP_0_S00_AXI_BASEADDR, in_data);
			}
			sort_result = Sort_get_result(XPAR_MYIP_0_S00_AXI_BASEADDR);

			printf("main.c %lld\r\n", sort_result);

			//small[0] =  sort_result &    -72057594037927936;  // & 1111 1111 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000
			//small[1] =  sort_result &     71776119061217280;  // & 0000 0000 1111 1111 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000
			//small[2] =  sort_result &       280375465082880;  // & 0000 0000 0000 0000 1111 1111 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000
			//small[3] =  sort_result &         1095216660480;  // & 0000 0000 0000 0000 0000 0000 1111 1111 0000 0000 0000 0000 0000 0000 0000 0000
			//small[4] =  sort_result & 		     4278190080;  // & 0000 0000 0000 0000 0000 0000 0000 0000 1111 1111 0000 0000 0000 0000 0000 0000
			//small[5] =  sort_result & 		  	   16711680;  // & 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 1111 1111 0000 0000 0000 0000
			//small[6] =  sort_result & 		  	      65280;  // & 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 1111 1111 0000 0000
			//small[7] =  sort_result & 		  		    255;  // & 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 1111 1111
			//
			//
			//small[0] =  sort_result &    0xFF00000000000000 ;
			//small[1] =  sort_result &    0x00FF000000000000 ;
			//small[2] =  sort_result & 	 0x0000FF0000000000 ;
			//small[3] =  sort_result & 	 0x000000FF00000000 ;
			//small[4] =  sort_result & 	 0x00000000FF000000;
			//small[5] =  sort_result & 	 0x0000000000FF0000;
			//small[6] =  sort_result & 	 0x000000000000FF00;
			//small[7] =  sort_result & 	 0x00000000000000FF;


			//small[0] =  ( sort_result >>32 ) &   0xFF000000;
			//small[1] =  ( sort_result >>32 ) &   0x00FF0000;
			//small[2] =  ( sort_result >>32 ) & 	 0x0000FF00;
			//small[3] =  ( sort_result >>32 ) & 	 0x000000FF;
			//small[4] =  sort_result & 	 0xFF000000;
			//small[5] =  sort_result & 	 0x00FF0000;
			//small[6] =  sort_result & 	 0x0000FF00;
			//small[7] =  sort_result & 	 0x000000FF;

			small[0] =  (sort_result >> 56) &    0xFF;
			small[1] =  (sort_result >> 48) &    0xFF;
			small[2] =  (sort_result >> 40) & 	 0xFF;
			small[3] =  (sort_result >> 32) & 	 0xFF;
			small[4] =  (sort_result >> 24) & 	 0xFF;
			small[5] =  (sort_result >> 16) & 	 0xFF;
			small[6] =  (sort_result >> 8)  & 	 0xFF;
			small[7] =  (sort_result) & 	     0xFF;

			for (int i = 0; i < 8; i++)
			{
				printf("The %d th small number is  = %d\n\r", i , small[i]);
			}
			*/
			u32 in_data;
			u32 sort_result1,sort_result2;
			u32 small[8];

			clear_sort_reg(XPAR_MYIP_0_S00_AXI_BASEADDR);
			start_process(XPAR_MYIP_0_S00_AXI_BASEADDR, mode);

			for (int i = 0; i < 8; i++)
			{
				printf("Input data\r\n");
				scanf("%d", &in_data);
				printf(" %d\r\n", in_data);
				Sort_pass_data(XPAR_MYIP_0_S00_AXI_BASEADDR, in_data);
			}
			sort_result1 = Sort_get_result1(XPAR_MYIP_0_S00_AXI_BASEADDR);
			sort_result2 = Sort_get_result2(XPAR_MYIP_0_S00_AXI_BASEADDR);


			small[0] =  (sort_result1 >> 24) &    0xFF;
			small[1] =  (sort_result1 >> 16) &    0xFF;
			small[2] =  (sort_result1 >> 8 ) & 	  0xFF;
			small[3] =  (sort_result1      ) & 	  0xFF;
			small[4] =  (sort_result2 >> 24) & 	  0xFF;
			small[5] =  (sort_result2 >> 16) & 	  0xFF;
			small[6] =  (sort_result2 >> 8 ) & 	  0xFF;
			small[7] =  (sort_result2	   ) & 	  0xFF;

			for (int i = 0; i < 8; i++)
			{
				printf("The %d th small number is  = %d\n\r", i , small[i]);
			}

		}
		else if(mode==2)//(mode==2)
		{
			u32 in_data;
			u32 parity_result;

			printf("Input data\r\n");
			scanf("%d", &in_data);
			printf(" %d\r\n", in_data);


			Parity_pass_data(XPAR_MYIP_0_S00_AXI_BASEADDR, in_data);

			start_process(XPAR_MYIP_0_S00_AXI_BASEADDR, mode);

			parity_result = Parity_get_result(XPAR_MYIP_0_S00_AXI_BASEADDR);

			printf("The parity bit is  = %d\n\r" , parity_result);
		}
		else
		{
			printf("The error mode\n\r");
		}




	}
	printf("Program End.\n\r\n\n\n\n\n");
    return 0;
}
