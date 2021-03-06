#include "rwmake.ch"
#Include "protheus.ch"
#Include "tbiconn.ch"
#Include "APWEBEX.CH"

User Function WFW120P()

Local oProcess    := Nil                           //Objeto da classe TWFProcess.
Local cMailId     := ""                            //ID do processo gerado.
Local cHostWF     := "http://187.94.63.204:14010"   //URL configurado no ini para WF Link.
Local cTo         := "andrebritosilva@gmail.com"   //Destinat�rio de email.          

PREPARE ENVIRONMENT EMPRESA "01" FILIAL "01MG0006"

// Instanciamos a classe TWFProcess informando o c�digo e nome do processo.

oProcess := TWFProcess():New("000001", "Treinamento")

// Criamos a tafefa principal que ser� respondida pelo usu�rio.

oProcess:NewTask("FORMULARIO", "\Workflow\WF_FORM.html")

// Atribu�mos valor a um dos campos do formul�rio.

oProcess:oHtml:ValByName("TEXT_TIME", Time() )

// Informamos em qual diret�rio ser� gerado o formul�rio.

oProcess:cTo                := "HTML"  

// Informamos qual fun��o ser� executada no evento de timeout.

oProcess:bTimeOut        := {{"u_wfTimeout()", 0, 0, 5 }}

// Informamos qual fun��o ser� executada no evento de retorno.  

oProcess:bReturn        := "u_WfTeste()"

// Iniciamos a tarefa e recuperamos o nome do arquivo gerado.  

cMailID := oProcess:Start()    

//-------------------------------------------------------------------

// "LINK"

//-------------------------------------------------------------------

// Criamos o ling para o arquivo que foi gerado na tarefa anterior.

oProcess:NewTask("LINK", "\workflow\WF_LINK.html")

// Atribu�mos valor a um dos campos do formul�rio.

oProcess:oHtml:ValByName("A_LINK", cHostWF + "/messenger/emp" + cEmpAnt + "/HTML/" + cMailId + ".htm")        

// Informamos o destinat�rio do email contendo o link.

oProcess:cTo                := cTo          

// Informamos o assunto do email.

oProcess:cSubject        := "Workflow via link."

// Iniciamos a tarefa e enviamos o email ao destinat�rio.

oProcess:Start()    

User Function WfTeste()
Local lRet := .T.
lRet := .F.
Return