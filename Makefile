# Read an image with xli.
all : application

# Test : dep with .h versus dep with .c
ISS_PROJECT.o : ISS_PROJECT.c ISS_PROJECT.h 
	gcc -c ISS_PROJECT.c -o ISS_PROJECT.o

fonction_elementaire.o : fonction_elementaire.c fonction_elementaire.h 
	gcc -c fonction_elementaire.c -o fonction_elementaire.o

main : main_assembleur.c fonction_elementaire.h ISS_PROJECT.h
	gcc -c main_assembleur.c -o main_assembleur.o

application : Assemble/main_assembleur.o Assemble/ISS_PROJECT.o Assemble/fonction_elementaire.o
	gcc Assemble/main_assembleur.o Assemble/ISS_PROJECT.o Assemble/fonction_elementaire.o -o TransformeASMenHEXA

clean :
	rm *.o 
