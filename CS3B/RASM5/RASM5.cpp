#include <iostream>
#include <fstream>

  int iSortA(int *);
  int iSortC(int *);
  using namespace std;
  
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
	   const char * c;
	   ifstream input;
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
		 
		   cin >> c;
		   
		   choice = atoi(c);
		   
		   
		   switch(choice){
			   case 1:
					input.open("input.txt");
					if(!input){
						printf("File was not opened!");
						break;
					}
					else
					{
						for(int i = 0; i < 200000; i++){
							input >> x;
							printf("value at line %d: %d", i, x);
							dataSetA[i] = x;
							dataSetC[i] = x;
						}
						printf("File was sucsessfully loaded.");
						elementCount =SIZE;
					}
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
			   cout << "Enter a valid Selection!" << endl;
			   break;
		   }
		   
	   }
	   return 0;
  }