#include <stdio.h>

  extern int iSortA(int *);
  extern int iSortC(int *);
  
  int main()
  {
	   int dataSetA[200000] = {0};
	   int dataSetC[200000] = {0};
	   const int SIZE = 200000;
	   int elementCount = 0;
	   int aTime = 0, cTime = 0;
	   int choice = 0;
	   int temp =0;
	   int x = 0;
	   FILE* file;
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
		 
		   if(scanf("%d", &temp) != 1){
			   getchar();
			   printf("Invalid Input! Please only enter numbers.");
		   }else{
			   choice = temp;
		   }
		   
		   
		   switch(choice){
			   case 1:
					file = fopen ("input.txt", "r");
					if(!file){
						return -1;
						printf("File was not opened!");
					}
					for(int i = 0; i < SIZE; i++){
						fscanf (file, "%d\n", &x); 
						dataSetA[i] = x;
						dataSetC[i] = x;
					}
					printf("File was sucsessfully loaded.");
					elementCount =SIZE;
			   break;
			   case 2:
			   
			   break;
			   case 3:
			   
			   break;
			   case 5: 
			   for(int i = 0; i< 200000; i++)
				printf("%d ", dataSetA[i]);
			   break;
			   
			   default:
			   break;
		   }
		   
	   }
	   return 0;
  }