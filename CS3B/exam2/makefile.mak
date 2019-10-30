all: exam2
 
exam2: exam2.o 
	ld -o $@ $+ lib.a
 
exam2.o : exam2.s
	as -g -o $@ $<
	
lib.a: stringLength.o macros.a
	ar rvs stringLength.o macros.a
	
stringLength.o: String_length.s
	as -g -o $@ $<
clean:
	rm -vf exam2 *.o
