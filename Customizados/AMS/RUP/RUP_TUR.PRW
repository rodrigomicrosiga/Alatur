#Include 'Protheus.ch'

//------------------------------------------------------------------------------
/*/{Protheus.doc} RUP_TUR()
Fun��es de compatibiliza��o e/ou convers�o de dados para as tabelas do sistema.

@sample		RUP_TUR("12", "2", "003", "017", "BRA")
@param		cVersion	- Vers�o do Protheus
@param		cMode		- Modo de execu��o	- "1" = Por grupo de empresas / "2" =Por grupo de empresas + filial (filial completa)
@param		cRelStart	- Release de partida	- (Este seria o Release no qual o cliente est�)
@param		cRelFinish	- Release de chegada	- (Este seria o Release ao final da atualiza��o)
@param		cLocaliz	- Localiza��o (pa�s)	- Ex. "BRA"
@return		Nil
@author		bruno.soliveira
@since		22/09/2017
@version	12
/*/
//------------------------------------------------------------------------------
Function RUP_TUR(cVersion, cMode, cRelStart, cRelFinish, cLocaliz)
Return NIL