#include "rwmake.ch"        

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �PAGNOS    �Autor  �OSMIL MICROSIGA     � Data �  31/03/05   ���
�������������������������������������������������������������������������͹��
���Desc.     � PROGRAMA PARA TRATAMENTO DO NOSSO NUMERO                   ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP8 - CROW MATEC                                           ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function Pagnos()       

//���������������������������������������������������������������������Ŀ
//� Declaracao de variaveis utilizadas no programa atraves da funcao    �
//� SetPrvt, que criara somente as variaveis definidas pelo usuario,    �
//� identificando as variaveis publicas do sistema utilizadas no codigo �
//� Incluido pelo assistente de conversao do AP5 IDE                    �
//�����������������������������������������������������������������������

SetPrvt("_RETNOS,")

//// RETORNA O NOSSO NUMERO QUANDO COM VALOR NO E2_CODBAR, E ZEROS QUANDO NAO
//// TEM VALOR POSICAO ( 142 - 150 )

IF SUBS(SE2->E2_CODBAR,01,3) != "237"
    _RETNOS := "000000000"
Else
    _RETNOS := SUBS(SE2->E2_CODBAR,28,9)
EndIf


Return(_RETNOS)  
