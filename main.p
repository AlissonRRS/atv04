#include <stdio.h>

#define MAX 10

char nomes[MAX][50];
float precos[MAX];
int quantidades[MAX];
int total=0;

void cadastrarProdutos(){
    int i,qtd;

    if(total>=MAX){
        printf("Ja cadastrou os 10 produto, nao cabe mais!\n");
        return;
    }

    printf("Quantos produtos quer cadastrar? (restam %d vagas): ",MAX-total);
    scanf("%d",&qtd);

    if(qtd<=0 || qtd>MAX-total){
        printf("Quantidade invalida!\n");
        return;
    }



    for(i=0;i<qtd;i++){
        printf("\n--- Produto %d ---\n",total+1);

        printf("Nome (sem espaco): ");
        scanf("%s",nomes[total]);

        printf("Preco unitario: ");
        scanf("%f",&precos[total]);

        printf("Quantidade em estoque: ");
        scanf("%d",&quantidades[total]);

        while(quantidades[total]<0){
            printf("Nao pode ser negativo, digite de novo: ");
            scanf("%d",&quantidades[total]);
        }
        total++;
    }
    printf("\nProdutos cadastrados!\n");
}



float valorTotalEstoque(){
    int i;
    float soma=0;
    for(i=0;i<total;i++){
        soma=soma+precos[i]*quantidades[i];
    }
    return soma;
}

void consultarEstoque()
{
    int i;

    if(total==0){
        printf("Nenhum produto cadastrado ainda.\n");
        return;
    }



    printf("\n---- ESTOQUE ----\n");
    for(i=0;i<total;i++){
        printf("Codigo %d  Nome: %s  Preco: R$ %.2f  Quantidade: %d\n",i+1,nomes[i],precos[i],quantidades[i]);
    }

    printf("\nValor total do estoque: R$ %.2f\n",valorTotalEstoque());
}

float calcularFaturamento(float preco,int quantidade){
    float resultado;
    resultado=preco*quantidade;
    return resultado;
}



void registrarVenda(){
    int codigo,qtd;
    float valor;

    if(total==0){
        printf("Nenhum produto cadastrado ainda.\n");
        return;
    }


    printf("Codigo do produto: ");
    scanf("%d",&codigo);

    if(codigo<1 || codigo>total){
        printf("Codigo nao existe!\n");
        return;
    }



    printf("Quantidade que o cliente quer comprar: ");
    scanf("%d",&qtd);

    if(qtd<=0){
        printf("Quantidade invalida!\n");
        return;
    }



    if(qtd<=quantidades[codigo-1]){
        quantidades[codigo-1]=quantidades[codigo-1]-qtd;
        valor=calcularFaturamento(precos[codigo-1],qtd);
        printf("Venda realizada! Total da venda: R$ %.2f\n",valor);
    }
    else{
        printf("Venda nao pode ser realizada, estoque insuficiente (so tem %d).\n",quantidades[codigo-1]);
    }
}



void alertaReposicao(){
    int i;
    int achou=0;

    printf("\n===== PRECISAM DE REPOSICAO =====\n");
    for(i=0;i<total;i++){
        if(quantidades[i]<5){
            printf("%s - quantidade atual: %d\n",nomes[i],quantidades[i]);
            achou=1;
        }
    }
    if(achou==0){
        printf("Nenhum produto precisa de reposicao.\n");
    }


}

void entradaMercadorias(){
    int codigo,qtd;

    if(total==0){
        printf("Nenhum produto cadastrado ainda.\n");
        return;
    }



    printf("Codigo do produto: ");
    scanf("%d",&codigo);



    if(codigo<1 || codigo>total){
        printf("Codigo nao existe!\n");
        return;
    }



    printf("Quantidade recebida: ");
    scanf("%d",&qtd);

    if(qtd<=0){
        printf("Quantidade tem que ser maior que zero!\n");
        return;
    }



    quantidades[codigo-1]=quantidades[codigo-1]+qtd;
    printf("Entrada registrada! Agora %s tem %d unidades.\n",nomes[codigo-1],quantidades[codigo-1]);
}

int main(){

    int opcao;


    do{
        printf("\n===== MENU =====\n");
        printf("1 - Cadastrar produtos\n");
        printf("2 - Consultar estoque\n");
        printf("3 - Registrar venda\n");
        printf("4 - Consultar produtos que precisam de reposicao\n");
        printf("5 - Registrar entrada de mercadorias\n");
        printf("6 - Encerrar o programa\n");
        printf("Escolha: ");
        scanf("%d",&opcao);



        switch(opcao){
            case 1:
                cadastrarProdutos();
                break;
            case 2:
                consultarEstoque();
                break;
            case 3:
                registrarVenda();
                break;
            case 4:
                alertaReposicao();
                break;
            case 5:
                entradaMercadorias();
                break;
            case 6:
                printf("Encerrando...\n");
                break;
            default:
                printf("Opcao invalida, tente de novo.\n");
        }
    }while(opcao!=6);

    return 0;


}