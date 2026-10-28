#include <stdio.h>
#include <string.h>


#define MAX 10
#define LIMITE_REPOSICAO 5

void limparBuffer();
int lerInteiro();
float lerFloat();
void lerNome(char destino[]);
int codigoValido(int codigo);
int nomeJaExiste(char nome[]);
void listarCodigos();
void cadastrarProdutos();
float valorTotalEstoque();
void consultarEstoque();
float calcularFaturamento(float preco,int quantidade);
void registrarVenda();
void alertaReposicao();
void entradaMercadorias();
