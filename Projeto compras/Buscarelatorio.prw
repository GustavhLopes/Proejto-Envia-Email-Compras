#Include "totvs.ch"
#Include "rwmake.ch"

User Function GeraMatr110(cPedido)

    Local cArquivo := "\temp\MATR110_" + cPedido + ".pdf"
    Local cAlias   := "SC7"

    DbSelectArea(cAlias)
    DbSetOrder(1)

    If DbSeek(xFilial(cAlias) + cPedido)

        // Define parâmetros do relatório
        Pergunte("MATR110", .F.)

        // Força pedido
        MV_PAR01 := cPedido
        MV_PAR02 := cPedido

        // Gera PDF
        SetPrint(.F., "PDF", cArquivo)

        U_MATR110()

        SetPrint(.T.)

    EndIf

Return cArquivo
