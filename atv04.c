#include <stdio.h>

int main() {
    char nome[5] = {'A', 'B', 'C', 'D', 'E'};
    int valor[5] = {8, 20, 15, 17, 3};
    int soma[5];
    int a, b, prox, i, j;
    int primo;

    for(i = 0; i < 5; i++) {
        a = 0;
        b = 1;
        soma[i] = 0;

        for(j = 0; j < valor[i]; j++) {
            soma[i] = soma[i] + a;

            prox = a + b;
            a = b;
            b = prox;
        }
    }

    printf("Resultado dos apostadores:\n");

    for(i = 0; i < 5; i++) {
        printf("%c - Valor: %d - Soma Fibonacci: %d\n",
               nome[i], valor[i], soma[i]);
    }

    return 0;
}