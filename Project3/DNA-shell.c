/* 24 March 2014	               <your name goes here>

ECE 3035 Project 1-2

This is the only file that should be modified for the C implementation
of Project 1.

This program initializes a DNA sequence of 10,240 random characters and
a pattern of 3 to 7 random characters, all characters are from the DNA
alphabet {A, T, G, C}.

*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define SEQLEN        10240
#define MAXPATLEN     10
#define NUMCHAR       4

char Alphabet[] = "ACTG";

int main(int argc, char *argv[])  {

   char           Seq[SEQLEN], Pat[MAXPATLEN];
   int            I, *MatchLocs, PatLen;
   void           Print_Seq(char *Seq, int SeqLen);
   void           Print_Pat(char *Pat, int PatLen);
   int            *Match(char *Pat, int PatLen, char *Seq, int SeqLen);

   srand((unsigned int) time(NULL));              // seed random number generator
   PatLen = (rand() % MAXPATLEN) + 1;             // compute pattern length	
   for (I = 0; I < SEQLEN; I++)
      Seq[I] = Alphabet[rand() % NUMCHAR];        // create sequence
   for (I = 0; I < PatLen; I++)
      Pat[I] = Alphabet[rand() % NUMCHAR];        // create pattern
   Print_Pat(Pat, PatLen);                        // print pattern
   Print_Seq(Seq, SEQLEN);                        // print sequence
   MatchLocs = Match(Pat, PatLen, Seq, SEQLEN);    // match pattern in sequence
   printf("Pattern detected at the following locations:\n");
   while (*MatchLocs != 0) printf("Base pair %d in the sequence\n", *MatchLocs++);
   return 0;
}

/*          Print Sequence

This routine prints the sequence. */

void Print_Seq(char *Seq, int SeqLen) {

   int          I;

   printf("The sequence is ...\n");
   for (I = 0; I < SeqLen; I++) {
      putchar(Seq[I]);
      if (I % 80 == 79)
         printf("\n");
   }
}

/*          Print Pattern

This routine prints the match pattern. */

void Print_Pat(char *Pat, int PatLen) {

   int          I;

   printf("The pattern is ... \"");
   for (I = 0; I < PatLen; I++)
      putchar(Pat[I]);
   printf("\"\n");
}

/*                Match

This routine find indices of occurrances of a variable length DNA
patttern in a DNA sequence. A null terminated array of indices of occurences is returned */

int *Match(char *Pat, int PatLen, char *Seq, int SeqLen) {

   // insert your code here

  return 0;  // modify to return the array of indices
}
