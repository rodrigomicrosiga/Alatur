#INCLUDE "PROTHEUS.CH"

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  � FA050DEL   �Autor  �Ana                � Data �  14/01/15   ���
�������������������������������������������������������������������������͹��
���Desc.     �                            ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � ALATUR                                   ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function FA050DEL()
//Local _lOk := ParamIXB == 0
uRet := .F.
//IF _lOk // confirmou         
	IF  !IsInCallStack("U_SIESBA04") .and.  !IsInCallStack("U_SICFGA01") /*Rotina ESB*//*Rotina CARGA*/  
		SZZ->(dbSetOrder(1))
		IF SZZ->(dbSeek(XFilial("SZZ")+"FINA050")).And. (SZZ->ZZ_TPINT <>  '2') //Se existe a integracao e se ha a op��o de envio.
			MsgRun('Enviando pacote para EAI. Aguarde...',, {|| U_SIESBA04() } )
		uRet :=.T.
		ENDIF	
//	ENDIF
ENDIF

Return(uRet)
