<%
mode = request("mode")
if mode = "" then mode = 0

pkid=1

if mode=1 then



			'invio l'email di benvenuto al cliente
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
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Complimenti "&nome&" "&nominativo&"! La tua iscrizione a Cristalensi.it &egrave; avvenuta correttamente.<br>Da adesso potrai ordinare i nostri prodotti senza dover inserire nuovamente i tuoi dati.</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Dati sensibili e determinanti per l'accesso ai servizi di Cristalensi.it:<br>Nome e Cognome: <b>"&nome&" "&nominativo&"</b><br>Login: <b>"&email&"</b><br>Password: <b>"&password&"</b></font><br>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = "viadeimedici@gmail.com"
			Oggetto = "Iscrizione al sito Cristalensi.it"
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
				'.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.cristalensi.it"
        .Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtpdom.interhost.it"
				' Porta SMTP
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
				'Username
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendusername") = "smtp@cristalensi.it"
				'Password
				.Fields.item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "qXFqrKgo"

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
</head>
<body>
  <p>
    <%if mode=1 then%>
    Email inviata
    <%else%>
    <a href="test-email.asp?mode=1">Invia email</a>
    <%end if%>
  </p>
</body>
