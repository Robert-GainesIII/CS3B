#include <stdio.h>

  extern int iSortA(int *);
  extern int iSortC(int *);
  int loadFile(int *, int *);
  
  int main()
  {
	   int dataSetA[200000] = {0};
	   int dataSetC[200000] = {0};
	   int elementCount = 0;
	   int aTime = 0, cTime = 0;
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
		 
		   if(scanf("%d", &temp) != 1){
			   getchar();
			   printf("Invalid Input! Please only enter numbers.");
		   }else{
			   choice = temp;
		   }
		   
		   
		   if(choice == 1){
			  elementCount = loadFile(dataSetA, dataSetC); 
		   }
		   
	   }
	   return 0;
  }
  
  int loadFile(int *a, int *c){
	  
	  /* Pointer to the file */
  
	  FILE* file = fopen ("input.txt", "r");
	  int i = 0;
      int count = 0;
	  fscanf (file, "%d", &i);    
	  while (!feof (file))
		{  
		  (*a)[count] = i;
		  (*c)[count] = i;
	      count ++;
		  fscanf (file, "%d", &i);      
		}
	  fclose (file);        
	  return count;
  }