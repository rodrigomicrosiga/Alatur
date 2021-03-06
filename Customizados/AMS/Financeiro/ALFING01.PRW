#Include "Protheus.ch"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �ALFING01  �Autor  �Felipe Morais       � Data �  01/09/16   ���
�������������������������������������������������������������������������͹��
���Desc.     �Fun��es gen�ricas do Financeiro.                            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � Alatur                                                     ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function FING01Liq()
Local nRet := 0
Local aArea := GetArea()
Local aAreaSE1 := SE1->(GetArea())
Local aAreaSA1 := SA1->(GetArea())
Local nVlrAbat := 0

DbSelectArea("SA1")
SA1->(DbSetOrder(1))
If (SA1->(DbSeek(xFilial("SA1") + SE1->E1_CLIENTE + SE1->E1_LOJA)))
	nVlrAbat := SomaAbat(SE1->E1_PREFIXO, SE1->E1_NUM, SE1->E1_PARCELA, "R", 1, dDataBase, SA1->A1_COD, SA1->A1_LOJA)

	nRet := SE1->E1_SALDO - nVlrAbat
Endif

RestArea(aAreaSA1)
RestArea(aAreaSE1)
RestArea(aArea)
Return(nRet)