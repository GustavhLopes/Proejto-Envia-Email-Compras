#include "totvs.ch"
#include "Protheus.ch"

 /*/{Protheus.doc} ChamaMatr110
    (long_description)
    @type  Function
    @author Gustavo Lopes   
    @since 14/02/202*/
   
   
User Function ChamaMatr110()

   // Local cAliasSC7 := "SC7"
    Local cPedido   := "000002" // Número do Pedido de Compras
    //Local cFilial   := xFilial() // Filial Atual
    //Local cEmpresa  := cEmpAnt
    
    // Posiciona no pedido desejado
    DbSelectArea("SC7")
    DbSetOrder(1) // C7_FILIAL + C7_NUM
    If DbSeek(cFilial + cPedido)
        
        // --- PREPARAÇÃO PARA MATR110 ---
        // Define o relatório a ser impresso
        //Local cReport := "MATR110"
        
        // Chama a rotina padrão
        // A MATR110/MATR110X é a função de impressão do Pedido de Compras
        U_MATR110() // Em muitos casos, basta chamar a função diretamente se o ponteiro estiver correto
        
        // Ou utilizando a forma de impressão de relatórios:
        // RptOrdem(cReport, ...)
    Else
        MsgStop("Pedido de compra não encontrado: " + cPedido)
    EndIf

Return










Return 
