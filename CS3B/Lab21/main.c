#include <stdio.h>

  extern int String_length(int a, char []);
  
  int main()
  {
	   int dummyVariable;
	   char string[] = "I love assembly language and pizza!\0";
	   printf("length of the string is: %d\n", String_length(dummyVariable, string));
	   return 0;
  }