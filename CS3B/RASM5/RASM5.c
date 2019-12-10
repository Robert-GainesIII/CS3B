#include <stdio.h>

  extern int iSortA(int [200000]);
  extern int iSortC(int [200000]);
  
  int main()
  {
	   int elementCount = 0;
	   int choice = 0;
	   while(choice != 4){
		   
		   
		   printf("\t\tRASM5 C Vs Assembly");
		   printf("\t\tFile Element Count: %d", elementCount);
		   printf("------------------------------------------------");
		   printf("C)\t BubbleSort Time: %d", cTime);
		   printf("Assembly) BubbleSort Time: %d", aTime);
		   printf("------------------------------------------------");
		   printf("<1> Load input file (integers)");
		   printf("<2> Sort using C BubbleSort algorithm");
		   printf("<3> Sort using Assembly BubbleSort algorithm");
		   printf("<4> Quit");
		   printf("Choice -> ");
		   scanf(%d, &choice);
	   }
	   return 0;
  }