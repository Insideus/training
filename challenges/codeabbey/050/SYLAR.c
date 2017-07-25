#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

void getWord(char*);
void MinToMay(char string[]); 
int main()
{
	FILE *archivo;
	int lineas;
	char a[100], b[100];
	archivo = fopen("prueba.txt","r");
   
   if (archivo == NULL)
   {
   		 printf("\nError de apertura del archivo. \n\n");
   }
   else
    {
            printf("\nEl contenido del archivo de prueba es \n\n");
            fgets(a,100,archivo);
            lineas=atoi(a);
            //printf("%d",lineas);
            while (feof(archivo) == 0 && lineas>0)
 			{
 				fgets(a,100,archivo);
 				//printf("%s",a);
 				getWord(a);
 				MinToMay(a);
 				strcpy(b,a);
   				strrev(b);
   				if (strcmp(a,b) == 0)
     				 printf("Y");
  				 else
   					printf("N");
   				printf(" ");
   				lineas--;
 			}
        system("PAUSE");

	}
	fclose(archivo);

 
   return 0;
}


void getWord(char* text){
   char blank[100];
   int c = 0, d = 0;
  
   while (text[c] != '\0')
   {
      if ((isalpha(text[c]))) {
        blank[d] = text[c];
        d++;
      }
      c++;
   }
 
   blank[d] = '\0';
  // text=blank;
   strcpy(text,blank);
 
 
}

void MinToMay(char string[])
{
	int i=0;
	int desp='a'-'A';
	for (i=0;string[i]!='\0';++i)
	{
		if(string[i]>='a'&&string[i]<='z')
		{
			string[i]=string[i]-desp;
		}
	}
}
