<!--#include file="inc_strConn.asp"-->
<%'**********************PAYPAL**********************%>
<%
'numero ordine passato da paypal
invoice=request("invoice")
esito="NO"

' read post from PayPal system and add 'cmd'
str = Request.Form & "&cmd=_notify-validate"
' post back to PayPal system to validate
set objHttp = Server.CreateObject("Msxml2.ServerXMLHTTP")
' set objHttp = Server.CreateObject("Msxml2.ServerXMLHTTP.4.0")
' set objHttp = Server.CreateObject("Microsoft.XMLHTTP")

' https://ipnpb.sandbox.paypal.com/cgi-bin/webscr
' https://ipnpb.paypal.com/cgi-bin/webscr
' https://www.paypal.com/cgi-bin/webscr

objHttp.open "POST", "https://www.paypal.com/cgi-bin/webscr", false
objHttp.setRequestHeader "Content-type", "application/x-www-form-urlencoded"
objHttp.Send str

Payment_status = Request.Form("payment_status")
'response.write("Payment_status:"&Payment_status&"<br>")
Txn_id = Request.Form("txn_id")
'response.write("Txn_id:"&Txn_id&"<br>")

' Check notification validation
if (objHttp.status <> 200 ) then
	' HTTP error handling
	objHttpstatus = objHttp.status
	esito="NO"
	caso="1"
elseif (objHttp.responseText = "VERIFIED") then
	esito="SI"
elseif (objHttp.responseText = "INVALID") then
	esito="NO"
	caso="2"
else
	esito="NO"
	caso="3"
end if
set objHttp = nothing
%>
<%
	Call Visualizzazione("",0,"pagamento_paypal_ok.asp")

	IdOrdine=invoice
	if IdOrdine="" then IdOrdine=0
	if IdOrdine>0 then
		Set ss = Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * FROM Ordini where pkid="&idOrdine
		ss.Open sql, conn, 3, 3

		if ss.recordcount>0 then
			FkCliente=ss("FkCliente")
			if FkCliente="" then FkCliente=0
			TotaleCarrello=ss("TotaleCarrello")
			CostoSpedizioneTotale=ss("CostoSpedizione")
			TipoTrasporto=ss("TipoTrasporto")
			'DatiSpedizione=ss("DatiSpedizione")
			Nominativo_sp=ss("Nominativo_sp")
			Telefono_sp=ss("Telefono_sp")
			Indirizzo_sp=ss("Indirizzo_sp")
			CAP_sp=ss("CAP_sp")
			Citta_sp=ss("Citta_sp")
			Provincia_sp=ss("Provincia_sp")
			Nazione_sp=ss("Nazione_sp")
			NoteCliente=ss("NoteCliente")

			FkPagamento=ss("FkPagamento")
			TipoPagamento=ss("TipoPagamento")
			CostoPagamento=ss("CostoPagamento")

			Nominativo=ss("Nominativo")
			Rag_Soc=ss("Rag_Soc")
			Cod_Fisc=ss("Cod_Fisc")
			PartitaIVA=ss("PartitaIVA")
			Indirizzo=ss("Indirizzo")
			Citta=ss("Citta")
			Provincia=ss("Provincia")
			CAP=ss("CAP")

			TotaleGenerale=ss("TotaleGenerale")

			DataAggiornamento=ss("DataAggiornamento")

			If esito="SI" and Payment_status="Completed" Then
				ss("stato")=4
			else
				ss("stato")=5
			end if

			ss("DataAggiornamento")=now()
			ss("IpOrdine")=Request.ServerVariables("REMOTE_ADDR")
			ss.update
		end if

		ss.close

		if FkCliente>0 then
			Set rs=Server.CreateObject("ADODB.Recordset")
			sql = "Select * From Clienti where pkid="&FkCliente
			rs.Open sql, conn, 1, 1

			nominativo_email=rs("nome")&" "&rs("nominativo")
			email=rs("email")

			rs.close
		end if
	end if

	if FkPagamento=2 and esito="SI" then
		if Payment_status="Completed" then
			HTML1 = ""
			HTML1 = HTML1 & "<html>"
			HTML1 = HTML1 & "<head>"
			HTML1 = HTML1 & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">"
			HTML1 = HTML1 & "<title>Cristalensi</title>"
			HTML1 = HTML1 & "</head>"
			HTML1 = HTML1 & "<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"
			HTML1 = HTML1 & "<table width='553' border='0' cellspacing='0' cellpadding='0'>"
			HTML1 = HTML1 & "<tr>"
			HTML1 = HTML1 & "<td>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Grazie "&nominativo_email&" per aver scelto i nostri prodotti!<br>Questa &egrave; un email di conferma per il completamento dell'ordine n&deg; "&idordine&".<br> Il nostro staff avr&agrave; cura di spedirti la merce appena l'amministrazione avr&agrave; notificato il pagamento con Paypal.</font>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000><br><br>Cordiali Saluti, lo staff di Cristalensi</font>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = email
			Oggetto = "Conferma pagamento ordine n "&idordine&" con Paypal a Cristalensi.it"
			Testo = HTML1

			Set eMail_cdo = CreateObject("CDO.Message")

			' Imposta le configurazioni
			Set myConfig = Server.createObject("CDO.Configuration")
			With myConfig
				'autentication
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
				' Porta CDO
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
				' Timeout
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
				' Server SMTP di uscita
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = msg_smtpserver
				' Porta SMTP
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
				'Username
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusername") = msg_sendusername
				'Password
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = msg_sendpassword

				.Fields.update
			End With
			Set eMail_cdo.Configuration = myConfig

			eMail_cdo.From = Mittente
			eMail_cdo.To = Destinatario
			eMail_cdo.Subject = Oggetto

			eMail_cdo.HTMLBody = Testo

			eMail_cdo.Send()

			Set myConfig = Nothing
			Set eMail_cdo = Nothing

			'fine invio email

			'invio l'email all'amministratore
			HTML1 = ""
			HTML1 = HTML1 & "<html>"
			HTML1 = HTML1 & "<head>"
			HTML1 = HTML1 & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">"
			HTML1 = HTML1 & "<title>Cristalensi</title>"
			HTML1 = HTML1 & "</head>"
			HTML1 = HTML1 & "<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"
			HTML1 = HTML1 & "<table width='553' border='0' cellspacing='0' cellpadding='0'>"
			HTML1 = HTML1 & "<tr>"
			HTML1 = HTML1 & "<td>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Nuovo ordine con pagamento da Paypal dal sito internet.</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Dati sensibili e determinanti del nuovo ordine:<br>Nominativo: <b>"&nominativo_email&"</b><br>Email: <b>"&email&"</b><br>Codice cliente: <b>"&FkCliente&"</b><br>Codice ordine: <b>"&idordine&"</b><br>Stato pagamento: <b>"&Payment_status&"</b></font><br>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = "info@cristalensi.it"
			Oggetto = "Conferma pagamento ordine n "&idordine&" con Paypal a Cristalensi.it"
			Testo = HTML1

			Set eMail_cdo = CreateObject("CDO.Message")

			' Imposta le configurazioni
			Set myConfig = Server.createObject("CDO.Configuration")
			With myConfig
				'autentication
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
				' Porta CDO
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
				' Timeout
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
				' Server SMTP di uscita
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = msg_smtpserver
				' Porta SMTP
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
				'Username
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusername") = msg_sendusername
				'Password
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = msg_sendpassword

				.Fields.update
			End With
			Set eMail_cdo.Configuration = myConfig

			eMail_cdo.From = Mittente
			eMail_cdo.To = Destinatario
			eMail_cdo.Subject = Oggetto

			eMail_cdo.HTMLBody = Testo

			eMail_cdo.Send()

			Set myConfig = Nothing
			Set eMail_cdo = Nothing
			'fine invio email
		end if

			'invio l'email all'amministratore
			HTML1 = ""
			HTML1 = HTML1 & "<html>"
			HTML1 = HTML1 & "<head>"
			HTML1 = HTML1 & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">"
			HTML1 = HTML1 & "<title>Cristalensi</title>"
			HTML1 = HTML1 & "</head>"
			HTML1 = HTML1 & "<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"
			HTML1 = HTML1 & "<table width='553' border='0' cellspacing='0' cellpadding='0'>"
			HTML1 = HTML1 & "<tr>"
			HTML1 = HTML1 & "<td>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Nuovo ordine con pagamento da Paypal dal sito internet.</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Dati sensibili e determinanti del nuovo ordine:<br>Nominativo: <b>"&nominativo_email&"</b><br>Email: <b>"&email&"</b><br>Codice cliente: <b>"&FkCliente&"</b><br>Codice ordine: <b>"&idordine&"</b><br>Stato pagamento: <b>"&Payment_status&"</b></font><br>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			'invio al webmaster

			Mittente = "info@cristalensi.it"
			Destinatario = "viadeimedici@gmail.com"
			Oggetto = "Conferma pagamento ordine n "&idordine&" con Paypal a Cristalensi.it"
			Testo = HTML1

			Set eMail_cdo = CreateObject("CDO.Message")

			' Imposta le configurazioni
			Set myConfig = Server.createObject("CDO.Configuration")
			With myConfig
				'autentication
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
				' Porta CDO
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
				' Timeout
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
				' Server SMTP di uscita
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = msg_smtpserver
				' Porta SMTP
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
				'Username
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusername") = msg_sendusername
				'Password
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = msg_sendpassword

				.Fields.update
			End With
			Set eMail_cdo.Configuration = myConfig

			eMail_cdo.From = Mittente
			eMail_cdo.To = Destinatario
			eMail_cdo.Subject = Oggetto

			eMail_cdo.HTMLBody = Testo

			eMail_cdo.Send()

			Set myConfig = Nothing
			Set eMail_cdo = Nothing

			'fine invio email
	end if

	If esito="NO" Then

		'invio l'email all'amministratore
		HTML1 = ""
		HTML1 = HTML1 & "<html>"
		HTML1 = HTML1 & "<head>"
		HTML1 = HTML1 & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">"
		HTML1 = HTML1 & "<title>Cristalensi</title>"
		HTML1 = HTML1 & "</head>"
		HTML1 = HTML1 & "<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"
		HTML1 = HTML1 & "<table width='553' border='0' cellspacing='0' cellpadding='0'>"
		HTML1 = HTML1 & "<tr>"
		HTML1 = HTML1 & "<td>"
		HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Un ordine con pagamento da Paypal dal sito internet non &egrave; andato a buon fine.</font><br>"
		HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Dati sensibili e determinanti dell'ordine:<br>Nominativo: <b>"&nominativo_email&"</b><br>Email: <b>"&email&"</b><br>Codice cliente: <b>"&FkCliente&"</b><br>Codice ordine: <b>"&idordine&"</b><br>Stato pagamento: <b>"&Payment_status&"</b><br>Caso: <b>"&caso&"</b></font><br>"
		HTML1 = HTML1 & "</td>"
		HTML1 = HTML1 & "</tr>"
		HTML1 = HTML1 & "</table>"
		HTML1 = HTML1 & "</body>"
		HTML1 = HTML1 & "</html>"

		Mittente = "info@cristalensi.it"
		Destinatario = "info@cristalensi.it"
		Oggetto = "Pagamento con Paypal non andato a buon fine"
		Testo = HTML1

		Set eMail_cdo = CreateObject("CDO.Message")

		' Imposta le configurazioni
		Set myConfig = Server.createObject("CDO.Configuration")
		With myConfig
			'autentication
			.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
			' Porta CDO
			.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
			' Timeout
			.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
			' Server SMTP di uscita
			.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = msg_smtpserver
			' Porta SMTP
			.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
			'Username
			.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusername") = msg_sendusername
			'Password
			.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = msg_sendpassword

			.Fields.update
		End With
		Set eMail_cdo.Configuration = myConfig

		eMail_cdo.From = Mittente
		eMail_cdo.To = Destinatario
		eMail_cdo.Subject = Oggetto

		eMail_cdo.HTMLBody = Testo

		eMail_cdo.Send()

		Set myConfig = Nothing
		Set eMail_cdo = Nothing

		Mittente = "info@cristalensi.it"
		Destinatario = "viadeimedici@gmail.com"
		Oggetto = "Pagamento con Paypal non andato a buon fine"
		Testo = HTML1

		Set eMail_cdo = CreateObject("CDO.Message")

		' Imposta le configurazioni
		Set myConfig = Server.createObject("CDO.Configuration")
		With myConfig
			'autentication
			.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
			' Porta CDO
			.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
			' Timeout
			.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
			' Server SMTP di uscita
			.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = msg_smtpserver
			' Porta SMTP
			.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
			'Username
			.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusername") = msg_sendusername
			'Password
			.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = msg_sendpassword

			.Fields.update
		End With
		Set eMail_cdo.Configuration = myConfig

		eMail_cdo.From = Mittente
		eMail_cdo.To = Destinatario
		eMail_cdo.Subject = Oggetto

		eMail_cdo.HTMLBody = Testo

		eMail_cdo.Send()

		Set myConfig = Nothing
		Set eMail_cdo = Nothing

		'fine invio email

	end if
%>
<!DOCTYPE html>
<html>

<head>
    <title>Cristalensi</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Cristalensi.">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Cristalensi.">
    <meta name="theme-color" content="#ffffff">
    <link href="stylesheets/styles.css" media="screen" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]><script src="javascripts/html5shiv.js"></script><![endif]-->
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,400i,500,600,700" rel="stylesheet">
    <style type="text/css">
        .clearfix:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }
    </style>
		<!--#include virtual="/inc_funzioni_head.asp"-->
</head>

<body>
</body>
<!--#include file="inc_strClose.asp"-->
