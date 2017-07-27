#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>

char** strsplit(char* str, const char* delim);
int Calculate_Area_Perimeter_Triangle(double ax, double ay, double bx, double by, double cx, double cy, double *perimeter, double *area)
{
    double A = sqrt((double)(bx-ax) * (bx-ax) + (by-ay) * (by-ay));
    double B = sqrt((double)(bx-cx) * (bx-cx) + (by-cy) * (by-cy));
    double C = sqrt((double)(ax-cx) * (ax-cx) + (ay-cy) * (ay-cy));
    double height = 0;

    // Heron's formula for area calculation
    // area = sqrt( s * (s-a) * (s-b) * (s-c))
    double s = (A + B + C) / 2;

    *perimeter = A + B + C;

    *area = sqrt( s * (s-A) * (s-B) * (s-C));

    // area = 1/2 * base * height
    // if side A is base, then height
    height = (*area * 2) / A;

    return 1;
}

char** strsplit(char* str, const char* delim){
    char** res = NULL;
    char*  part;
    int i = 0;

    char* aux = strdup(str);

    part = strtok(aux, delim);

    while(part){
        res = (char**)realloc(res, (i + 1) * sizeof(char*));
        *(res + i) = part;

        part = strtok(NULL, delim);
        i++;
    }

    res = (char**)realloc(res, i * sizeof(char*));
    *(res + i) = NULL;

    return res;
}

int main()
{
    FILE *archivo;
    int lineas;
    int i=0;
    char a[100], b[100];
    char *ch;
    archivo = fopen("triangulos.txt","r");
    double m1, c1, m2, c2;
    double ax, ay, bx, by, cx, cy;
    double perimeter, area;
    double angleA, angleB, angleC;
    int type = 0;
    double total = 0;
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
            while (feof(archivo) == NULL && lineas>0)
            {
                fgets(a,100,archivo);

                ch = strtok(a, " ");
                ax=atof(ch);
                ch = strtok(NULL, " ");
                ay=atof(ch);
                ch = strtok(NULL, " ");
                bx=atof(ch);
                ch = strtok(NULL, " ");
                by=atof(ch);
                ch = strtok(NULL, " ");
                cx=atof(ch);
                ch = strtok(NULL, " ");
                cy=atof(ch);


                Calculate_Area_Perimeter_Triangle(ax, ay, bx, by, cx, cy, &perimeter, &area);
                printf(" %0.1f ",area);
                area=0;
                perimeter=0;

                lineas--;
            }
        system("PAUSE");

    }
    fclose(archivo);



    return 0;
}
