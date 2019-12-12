#ifndef ISORTC_HEADER
#define ISORTC_HEADER

#include <ctime>

 double iSortC(int a[], int length){
	 
	time_t timeBefore;
	time_t timeAfter;
	timeBefore = time(NULL);
	
	int i, j, temp;
	
    for (i = 0; i < length; i++)
    {
        for (j = 0; j < length - i - 1; j++)
        {
            if (a[j + 1] < a[j])
            {
                temp = a[j];
                a[j] = a[j + 1];
                a[j + 1] = temp;
            }
        }
    }
	
	timeAfter = time(NULL);
	return timeAfter - timeBefore;
}

double insertionSort(int array[], int size) {
	
	time_t timeBefore;
	time_t timeAfter;
	timeBefore = time(NULL);
	
    int key, j;
    for(int k=1; k<size; k++)  
    { 
        int temp = array[k]; 
        j= k-1; 
        while(j>=0 && temp <= array[j]) 
        { 
            array[j+1] = array[j];  
            j = j-1; 
        } 
        array[j+1] = temp; 
    } 

	timeAfter = time(NULL);
	return timeAfter - timeBefore;
}



#endif