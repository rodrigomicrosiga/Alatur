#include "PROTHEUS.CH"
#include "topconn.ch"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �M020ALT	 �Autor  �Totvs     � Data �  11/11/16            ���
�������������������������������������������������������������������������͹��
���Desc.     � PE para alterar dados do Complemento de Fornececedor pelo  ���
���          � Cadastro de Fornecedor. Campos: Raz�o Social e Municipio.  ���
�������������������������������������������������������������������������͹��
���Uso       � P12 - Alatur                                               ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function M020ALT()

Local _xRet := .T.
Local _aArea    := GetArea()
Local _aAreaSa2 := SA2->(GetArea())
Local _aAreaG4R := G4R->(GetArea())

DbSelectArea("G4R")
DbSetOrder(1)
If G4R->(MsSeek(xFilial("G4R")+SA2->(A2_COD+A2_LOJA),.T.))
	
	//Se Alterado Raz�o Social/Nome do Fornecedor o sistema deve alterar tamb�m na tabela G4L (Complemento de Fornecedor-Turismo)
	If ALLTRIM(G4R->G4R_XNOME) <> ALLTRIM(SA2->A2_NOME)
		RecLock("G4R",.F.)
	   		G4R->G4R_XNOME := SA2->A2_NOME
		G4R->(MsUnlock())
	EndIf
	//Se Alterado Raz�o Nome do Municipio do Fornecedor o sistema deve alterar tamb�m na tabela G4L (Complemento de Fornecedor-Turismo)
	If ALLTRIM(G4R->G4R_XMUN) <> ALLTRIM(SA2->A2_MUN)
		RecLock("G4R",.F.)
	   		G4R->G4R_XMUN := SA2->A2_MUN
		G4R->(MsUnlock())
	EndIf
	
EndIf

RestArea(_aAreaG4R)
RestArea(_aAreaSa2)
RestArea(_aArea)

Return(_xRet)