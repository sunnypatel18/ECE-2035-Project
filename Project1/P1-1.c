/*  <Sunny Patel>

This program finds George in a crowd. */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
   int	             CrowdInts[1024];
   int	             NumInts, HatLoc, ShirtLoc;
   int               Load_Mem(char *, int *);

   if (argc != 2) {
     printf("usage: ./P1-1 valuefile\n");
     exit(1);
   }
   NumInts = Load_Mem(argv[1], CrowdInts);
   if (NumInts != 1024) {
      printf("valuefiles must contain 1024 entries\n");
      exit(1);
   }

   /* your code goes here. */
int i;
int j;
int k;

unsigned int x;
unsigned char y;
int z=0;

int store[4096];
	for (i=0; i<1024; i++) /* unpacks all the pixels into bits. each pixel has 4 bits. used a masking technique and went from the end to the beginning when unpacking the pixels*/
	{
		for (j=0; j<4;j++)	
		{
			if (j==3) 
			{	
			x = (CrowdInts[i] & 0xFF000000);
			y = x >> 24;
			store[z]=y;
			z++;
			}
			else if (j==2) 
			{
			x = (CrowdInts[i] & 0x00FF0000); 
			y = x >> 16;
			store[z]=y;
			z++;
			}
			else if (j==1) 
			{
			x = (CrowdInts[i] & 0x0000FF00); 
			y = x >> 8;
			store[z]=y;
			z++;			
			}
			else if (j==0)
			{
			x = (CrowdInts[i] & 0x000000FF);
			y = x;
			store[z]=y;
			z++;
			}
		}	
	}
for (k=0;k<4096;k++)  /*used to index some of the elements in the store array and then checked them to corresonding colors. I used 4 if statements to check for the 4 possible directions. */
{
	/* for 0 degrees*/

		if (store[k] == 2 && store[k+1] == 2 && store[k+5] == 2 && store[k+6] == 2 && store[k+64] == 2 && store[k+65] == 2 && store[k+66] == 2 && store[k+67] == 2 && store[k+68] == 2 && store[k+69] == 2 && store[k+70] == 2 && store[k+128] == 2 && store[k+134] == 2 && store[k+190] == 2 && store[k+191] == 2 && store[k+192] == 2  && store[k+193] == 2)
		{
			if (store[k+2] == 1 && store[k+3] == 1 && store[k+4] == 1 && store[k+129] == 1 && store[k+130] == 1 && store[k+131] == 1 && store[k+132] == 1 && store[k+133] == 1)
			{
				if (store[k+255] == 5 && store[k+256] == 5 && store[k+258] == 5 && store[k+259] == 5 && store[k+260] == 5 && store[k+262] == 5 && store[k+263] == 5)
				{
					if (store[k+257] == 7 && store[k+261] == 7)
					{
						if (store[k+385] == 8 && store[k+389] == 8 && store[k+450] == 8 && store[k+451] == 8 && store[k+452] == 8 && store[k+515] == 8)
						
						{
							if (store[k+705] == 3 && store[k+706] == 3 && store[k+707] == 3 && store[k+708] == 3 && store[k+709] == 3)
							{
							HatLoc = k+3;
							ShirtLoc = k+707;
							break;
							}
						}
					}	
				}
			}
		}		
	/* for 90 degrees*/
	
		if (store[k]  == 2 && store[k+64]  == 2 && store[k+128]  == 2 && store[k+192] == 2 && store[k+256] == 2);
		{
			if (store[k+193] == 1 && store[k+257] == 1)
			{
				if (store[k+59] == 5 && store[k+60] == 5 && store[k+61] == 5 && store[k+62] == 5 && store[k+63] == 5)
				{
					if (store[k+191] == 7 && store[k+447] == 7)
					{
						if (store[k+189] == 8 && store[k+445] == 8)
						{
							if (store[k+184] == 3 && store[k+248] == 3 && store[k+312] == 3 && store[k+376] == 3 && store[k+440] == 3)
							{
							HatLoc = k+323;
							ShirtLoc = k+312;
							break;
							}
						}
					}	
				}
			}
		}

	 /* for 180 degrees*/

		if (store[k] == 3 && store[k+1] == 3 && store[k+2] == 3 && store[k+3] == 3 && store[k+4] == 3)
		{
			if (store[k+576] == 1 && store[k+577] == 1 && store[k+578] == 1 && store[k+579] == 1 && store[k+580] == 1)
			{	
				if (store[k+65] == 5 && store[k+66] == 5 && store[k+67] == 5)
				{
					if (store[k+448] == 7 && store[k+452] == 7)
					{
						if (store[k+509] == 2 && store[k+510] == 2 && store[k+511] == 2 && store[k+512] == 2)
						{
							if (store[k+320] == 8 && store[k+324] == 8)
							{
							HatLoc = k+706;
							ShirtLoc = k+2;
							break;
							}
						}
					}	
				}
			}
		}
/* for 270 degrees*/

if (store[k] == 2 && store[k+64] && store[k+128] == 2);
		{
			if (store[k+191] == 1 && store[k+253] == 1 && store[k+255] == 1)
			{
				if (store[k+65] == 5 && store[k+66] == 5)
				{
					if (store[k+193] == 7 && store[k+449] == 7)
					{
						if (store[k+195] == 8 && store[k+451] == 8)
						{
							if (store[k+200] == 3 && store[k+264] == 3  && store[k+328] == 3 && store[k+392] == 3 && store[k+456] == 3)
							{
							HatLoc = k+317;
							ShirtLoc = k+328;
							break;
							}
						}
					}	
				}
			}
		}
}

   printf("George is located at: hat pixel %4d, shirt pixel %4d.\n", HatLoc, ShirtLoc);
   exit(0);
}

/* This routine loads in up to 1024 newline delimited integers from
a named file in the local directory. The values are placed in the
passed integer array. The number of input integers is returned. */

int Load_Mem(char *InputFileName, int IntArray[]) {
   int	N, Addr, Value, NumVals;
   FILE	*FP;

   FP = fopen(InputFileName, "r");
   if (FP == NULL) {
      printf("%s could not be opened; check the filename\n", InputFileName);
      return 0;
   } else {
      for (N=0; N < 1024; N++) {
         NumVals = fscanf(FP, "%d: %d", &Addr, &Value);
         if (NumVals == 2)
            IntArray[N] = Value;
         else
            break;
      }
      fclose(FP);
      return N;
   }
}
