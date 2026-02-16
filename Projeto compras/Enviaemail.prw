#Include "totvs.ch"

User Function EnviaEmail(cPedido)

    Local cArquivo := U_GeraMatr110(cPedido)
    Local cEmail   := ""
    Local oMail
    Local cAssunto := "Pedido de Compra Lopes Cell" + cPedido
    Local cCorpo   := ""

    // Busca email do fornecedor
    DbSelectArea("SC7")
    DbSetOrder(1)

    If DbSeek(xFilial("SC7") + cPedido)
        DbSelectArea("SA2")
        DbSetOrder(1)

        If DbSeek(xFilial("SA2") + SC7->C7_FORNECE + SC7->C7_LOJA)
            cEmail := SA2->A2_EMAIL
        EndIf
    EndIf

    If Empty(cEmail)
        MsgStop("Fornecedor sem email cadastrado.")
        Return
    EndIf

    cCorpo := "Prezado fornecedor," + CRLF + CRLF + ;
              "Segue pedido de compra em anexo." + CRLF + ;
              "Pedido: " + cPedido + CRLF + CRLF + ;
              "Atenciosamente."

    oMail := TMailManager():New()
    oMail:SetUseTLS(.T.)
    oMail:SetSMTP("smtp.office365.com", 587)
    oMail:SetUser("gustavohlopes20@hotmail.com")
    oMail:SetPass("senha")

    oMail:NewMessage()
    oMail:SetFrom("email@empresa.com.br")
    oMail:AddTo(cEmail)
    oMail:SetSubject(cAssunto)
    oMail:SetBody(cCorpo)
    oMail:AddAttachment(cArquivo)

    If !oMail:Send()
        MsgStop("Erro ao enviar email.")
    EndIf

Return

