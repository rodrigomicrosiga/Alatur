#include "rwmake.ch"        

User Function Pagcar()       

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �PAGCAR    �Autor  �Osmil Squarcine     � Data �  31/03/05   ���
�������������������������������������������������������������������������͹��
���Desc.     �PROGRAMA PARA SELECIONAR A CARTEIRA NO CODIGO DE BARRAS     ���
���          �QUANDO NAO TIVER TEM QUE SER COLOCADO "00"                  ���
�������������������������������������������������������������������������͹��
���Uso       � AP8 - CROW MATEC                                           ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

//���������������������������������������������������������������������Ŀ
//� Declaracao de variaveis utilizadas no programa atraves da funcao    �
//� SetPrvt, que criara somente as variaveis definidas pelo usuario,    �
//� identificando as variaveis publicas do sistema utilizadas no codigo �
//� Incluido pelo assistente de conversao do AP5 IDE                    �
//�����������������������������������������������������������������������

SetPrvt("_RETCAR,")

////  PROGRAMA PARA SELECIONAR A CARTEIRA NO CODIGO DE BARRAS QUANDO
////  NAO TIVER TEM QUE SER COLOCADO "00"

IF SUBS(SE2->E2_CODBAR,01,3) != "237"
   _Retcar := "000"
Else
   _Retcar := "0" + SUBS(SE2->E2_CODBAR,24,2)
EndIf


Return(_Retcar)      
