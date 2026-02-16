#Include "totvs.ch"
/*/{Protheus.doc} MT094END
Finalização da Liberação de Docto
@type   function
@since  16/02/2026
/*/
user function MT094END()
    local aAreaATU      := getArea()
    local aAreaSC7      := SC7->(getArea())
    local cCRNUM        := ParamIXB[01]
    local cCRTIPO       := ParamIXB[02]
    local nOpc          := ParamIXB[03]
    local cCRFILIAL     := ParamIXB[04]
/*
nOpc
01 = Aprovar
05 = Rejeitar
06 = Bloquear
*/
if nOpc == 01
    SC7->(dbSetOrder(1))
    if SC7->(dbSeek(xFilial("SC7") + padR(cCRNUM, tamSX3("C7_NUM")[01])))
        if SC7->C7_CONAPRO == "B" .and. !empty(SC7->C7_APROV)
            U_EnviaEmail(SC7->C7_NUM)
        endIf
    endIf
endIf
    restArea(aAreaSC7)
    restArea(aAreaATU)
return



