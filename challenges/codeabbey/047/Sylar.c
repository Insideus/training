#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <errno.h>

#define caesar(x) rot(3, x)
#define decaesar(x) rot(3, x)
#define decrypt_rot(x, y) rot((26-x), y)
 
void rot(int c, char *str)
{
	int l = strlen(str);
	const char *alpha[2] = { "abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ"};
 
	int i;
	for (i = 0; i < l; i++)
	{
		if (!isalpha(str[i]))
			continue;
 
		str[i] = alpha[isupper(str[i])][((int)(tolower(str[i])-'a')+c)%26];
	}
}
 
 
int main()
{
	FILE *archivo;
	int lineas, key,i=0;
	char a[100], *ch;
	archivo = fopen("cesar.txt","r");
	if (archivo == NULL)
   {
   		 printf("\nError de apertura del archivo. \n\n");
   }
   else
    {
    		
            fgets(a,100,archivo);
            ch = strtok(a, "\s");
            lineas=atoi(ch);
 			printf("%d\n", lineas);
  			ch = strtok(NULL, "\s");
  			key=atoi(ch);
  			printf("%d\n", key);
  			while (feof(archivo) == 0 && lineas>0)
 			{
 				fgets(a,100,archivo);
 				decrypt_rot(key,a);
 				printf("%s ",a);
 				lineas--;
 				i++;
 			}

            //lineas=atoi(a);
            //printf("%d",lineas);
           
	}
 	fclose(archivo);
	return 0;
}
