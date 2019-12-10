#include <stdio.h>

  extern int iSortA(int [200000]);
  extern int iSortC(int [200000]);
  
  int main()
  {
	   int elementCount = 0;
	   int aTime, cTime = 0;
	   int choice = 0;
	   int temp =0;
	   while(choice != 4){
		   
		   
		   printf("\t\tRASM5 C Vs Assembly\n");
		   printf("\t\tFile Element Count: %d\n", elementCount);
		   printf("------------------------------------------------\n");
		   printf("C)\t BubbleSort Time: %d\n", cTime);
		   printf("Assembly) BubbleSort Time: %d\n", aTime);
		   printf("------------------------------------------------\n");
		   printf("<1> Load input file (integers)\n");
		   printf("<2> Sort using C BubbleSort algorithm\n");
		   printf("<3> Sort using Assembly BubbleSort algorithm\n");
		   printf("<4> Quit\n");
		   printf("Choice -> \n");
		   while(temp == 0){
			   if(scanf("%d", &temp) == 0){
				   getchar();
				   printf("Invalid Input! Please only enter numbers.");
				   printf("Choice -> \n");
			   }else{
				   choice = temp;
			   }
		   }
	   }
	   return 0;
  }