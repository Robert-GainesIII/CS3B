#include <iostream>
#include <fstream>
#include <istream>
#include <stdio.h>
#include "iSortC.h"

  extern "C" int iSortA(int [], int size);
  using namespace std;
  
  int main()
  {
	   int dataSetA[200000] = {0};
	   int dataSetC[200000] = {0};
	   int dataSetA2[200000] = {0};
	   int dataSetC2[200000] = {0};
	   
	   const int SIZE = 200000;
	   int elementCount = 0;
	   int aTime = 0, cTime = 0;
	   int aTime2 = 0, cTime2 = 0;
	   int choice = 0;
	   int x;
	   char c;
	   string temp;
	   ifstream input;
	   ofstream output1;
	   ofstream output2;
	   ofstream output3;
	   ofstream output4;
	   while(choice != 7){
		   temp = "";
		   
		   printf("\t\tRASM5 C Vs Assembly\n");
		   printf("\t\tFile Element Count: %d\n", elementCount);
		   printf("------------------------------------------------\n");
		   printf("C)\t BubbleSort Time: %dsecs\n", cTime);
		   printf("Assembly) BubbleSort Time: %dsecs\n", aTime);
		   printf("C)\t Insertion Sort Time: %dsecs\n", cTime2);
		   printf("Assembly) Insertion Sort Time: %dsecs\n", aTime2);
		   printf("------------------------------------------------\n");
		   printf("<1> Load input file (integers)\n");
		   printf("<2> Sort using C BubbleSort algorithm\n");
		   printf("<3> Sort using Assembly BubbleSort algorithm\n");
		   printf("<4> Sort using C Insertion Sort algorithm\n");
		   printf("<5> Sort using Assembly Insertion Sort algorithm\n");
		   printf("<6> Save arrays\n");
		   printf("<7> Quit\n");
		   printf("Choice -> \n");
		 
		   cin >> c;
		   temp += c;
		   choice = atoi(temp.c_str());
		   
		   time_t timeBefore;
		   time_t timeAfter;
		
		string str;
		   
		   switch(choice){
			   case 1:
			   {
					//input.open("/home/pi/CS3B/CS3B/RASM5/input.txt"
					int x;
					input.open("/home/pi/CS3B/CS3B/RASM5/input.txt");
					if(input.is_open()){
					
						for(int i =0; i< 200000; i++)
						{
							getline(input, str, '\n');
							//input.ignore(10, '\n');
							//printf("value at line %d: %d", i, x);
							//dataSetA[i] = x;
							//dataSetC[i] = x;
							cout <<str <<  endl;
							//dataSetA2[i] = x;
							//dataSetC2[i] = x;
						}
						printf("File was sucsessfully loaded.");	
					}
					input.close();
			   break;
			   }
			   case 2:
					printf("Executing C++ bubblesort.\nPlease Wait for Completion do NOT exit program!\n");
					cTime = iSortC(dataSetC, 200000);
					printf("Finished Sorting Data!");
			   break;
			   case 3:
					
			   break;
			   case 4:
					printf("Executing C++ Insertion Sort.\nPlease Wait for Completion do NOT exit program!\n");
					cTime = iSortC(dataSetC2, 200000);
					printf("Finished Sorting Data!");
		       break;
			   
			   case 5: 
					
					printf("Executing Arm Assembly Insertion Sort.\nPlease Wait for Completion do NOT exit program!\n");
					timeBefore = time(NULL);
					iSortA(dataSetA, 200000);
					timeAfter = time(NULL);
					aTime2 = timeAfter - timeBefore;
					printf("Finished Sorting Data!");
			   
			   break;
			   
			   case 6:
					output1.open("cInsertionSort.txt");
					output2.open("cBubbleSort.txt");
					output3.open("aInsertionSort.txt");
					output4.open("aBubbleSort.txt");
					
					for(int i = 0; i < 200000; i++){
						output1 << dataSetC2[i] << endl;
						output2 << dataSetC[i] << endl;
						output3 << dataSetA2[i] << endl;
						output4 << dataSetA[i] << endl;
					}
					
					output1.close();
					output2.close();
					output3.close();
					output4.close();
			   break;
			   
			   case 7:
			   
				printf("Thank you for using my Program!\n");
				
				break;
				
			  case 8:
			  
				
				
				printf("C++ BubbleSort first 100\n==================================\n");
				for(int i = 0; i < 100; i++){
					printf("%d: %d\n" ,i ,dataSetC[i]);
				}
				
				printf("A Insertion Sort first 100\n==================================\n");
				for(int i = 0; i < 100; i++){
					printf("%d: %d\n" ,i ,dataSetA[i]);
				}
			   default:
			   cout << "Enter a valid Selection!" << endl;
			   break;
		   }
		   
	   }
	   return 0;
  }
