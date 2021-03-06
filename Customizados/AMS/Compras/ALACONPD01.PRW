#include "protheus.ch"
#include "TopConn.ch"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �ALACONPD01  �Autor  �J. Augusto C. Molla Data �  22/06/16   ���
�������������������������������������������������������������������������͹��
���Desc.     � Rotina para ser utilizada na consulta padr�o de cod. de    ���
���Desc.     � municipio em cadastros de clientes e fornecedores.         ���
���          � Quando UF=EX olha para tabelas G5S no cadastro de cidades  ���
���          � do Turismo, quando difente olha para tabela padr�o CC2     ���
�������������������������������������������������������������������������͹��
���Uso       � Alatur                                                     ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User function ALACONPD01(_ConsultaA, _RetornoA,  _ConsultaB, _RetornoB)

//local cRetorno := ''
Static cRetorno := ''

If ISINCALLSTACK("MATA020")
	If M->A2_EST <> "EX"
		cRetorno := ConPad1(,,,_ConsultaA,_RetornoA,,.F.)
	Else
		cRetorno := ConPad1(,,,_ConsultaB,_RetornoB,,.F.)
	Endif
Endif

If ISINCALLSTACK("MATA030")
	If M->A1_EST <> "EX"
		cRetorno := ConPad1(,,,_ConsultaA,_RetornoA,,.F.)
	Else
		cRetorno := ConPad1(,,,_ConsultaB,_RetornoB,,.F.)
	Endif
Endif

Return cRetorno

user function AlaGetRet() 

	If ISINCALLSTACK("MATA020")
		If M->A2_EST <> "EX"
			cRetorno := CC2->CC2_CODMUN
		Else
			cRetorno := G5S->G5S_CODIGO
		Endif
	Endif

return cRetorno		// colocar no sxb no lugar do cretorno