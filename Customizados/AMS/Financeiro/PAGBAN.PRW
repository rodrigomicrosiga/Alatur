#include "rwmake.ch"        

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �PAGBAN    �Autor  �Osmil Squarcine     � Data �  31/03/05   ���
�������������������������������������������������������������������������͹��
���Desc.     �PROGRAMA PARA SEPARAR O BANCO DO CODIGO DE BARRAS           ���
���          �CNAB BRADESCO A PAGAR (PAGFOR) - POSICOES (96-98)           ���
�������������������������������������������������������������������������͹��
���Uso       � AP8 - CROW MATEC                                           ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function Pagban()        

//���������������������������������������������������������������������Ŀ
//� Declaracao de variaveis utilizadas no programa atraves da funcao    �
//� SetPrvt, que criara somente as variaveis definidas pelo usuario,    �
//� identificando as variaveis publicas do sistema utilizadas no codigo �
//� Incluido pelo assistente de conversao do AP5 IDE                    �
//�����������������������������������������������������������������������

SetPrvt("_BANCO,")

//  PROGRAMA PARA SEPARAR O BANCO DO CODIGO DE BARRAS
//  CNAB BRADESCO A PAGAR (PAGFOR) - POSICOES (96-98)

IF SUBSTR(SE2->E2_CODBAR,1,3) == "   "
   _BANCO := SUBSTR(SA2->A2_BANCO,1,3)
ELSE
   _BANCO := SUBSTR(SE2->E2_CODBAR,1,3)
ENDIF


Return(_BANCO)      
