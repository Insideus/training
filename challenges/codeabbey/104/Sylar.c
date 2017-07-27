#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>

int Calculate_Area_Perimeter_Triangle(float ax, float ay, float bx, float by, float cx, float cy, float *perimeter, float *area)
{
    float A = sqrt((float)(bx-ax) * (bx-ax) + (by-ay) * (by-ay));
    float B = sqrt((float)(bx-cx) * (bx-cx) + (by-cy) * (by-cy));
    float C = sqrt((float)(ax-cx) * (ax-cx) + (ay-cy) * (ay-cy));
    float height = 0;

    // Heron's formula for area calculation
    // area = sqrt( s * (s-a) * (s-b) * (s-c))
    float s = (A + B + C) / 2;

    *perimeter = A + B + C;

    *area = sqrt( s * (s-A) * (s-B) * (s-C));

    // area = 1/2 * base * height
    // if side A is base, then height
    height = (*area * 2) / A;

    return 1;
}

int main()
{
    FILE *archivo;
    int lineas;
    int i=0;
    char a[100], b[100];
    char *ch;
    archivo = fopen("triangulos.txt","r");
    float m1, c1, m2, c2;
    float ax, ay, bx, by, cx, cy;
    float perimeter, area;
    float angleA, angleB, angleC;
    int type = 0;
    float total = 0;
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
