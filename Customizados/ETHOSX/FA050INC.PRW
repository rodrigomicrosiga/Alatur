#INCLUDE "RWMAKE.CH"
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � FA050INC � Autor �Ethosx			     �Data  �  26/12/19   ���
�������������������������������������������������������������������������͹��
���Desc.     � Ponto de Entrada no OK da inclusao do titulo a Pagar no    ���
���          � Financeiro.                                                ���
�������������������������������������������������������������������������͹��
���Uso       � Obriga informa��o de Centro de Custo e Classe de Valor     ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
User Function FA050INC

Local lRet:=.T.

IF Alltrim(FunName()) $ "FINA050/FINA750"
    IF M->E2_RATEIO == "N"
		IF Empty(M->E2_CCD).or. Empty(M->E2_CLVLDB)
			lRet:=.F.
			MSGINFO('Preecher o campo Centro de Custo Deb e Classe de Valor Deb na pasta Contabil!!!','Aviso')
	    Endif
	EndIF	
Endif

Return (lRet)