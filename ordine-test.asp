<!--#include file="inc_strConn.asp"-->
<%
	Call Visualizzazione("",0,"ordine.asp")

	mode=request("mode")
	if mode="" then mode=0

	IdOrdine=session("ordine_shop")

	if IdOrdine="" then IdOrdine=0
	if idOrdine=0 then response.redirect("/carrello1.asp")

	if idsession=0 then response.redirect("/iscrizione.asp?prov=1")

	session("ordine_shop")=""

	Set ss = Server.CreateObject("ADODB.Recordset")
	sql = "SELECT * FROM Ordini where pkid="&idOrdine
	ss.Open sql, conn, 3, 3

	if ss.recordcount>0 then
		TotaleCarrello=ss("TotaleCarrello")
		CostoSpedizioneTotale=ss("CostoSpedizione")
		TipoTrasporto=ss("TipoTrasporto")
		FkSpedizione=ss("FkSpedizione")
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

		ss("stato")=6
		ss("DataAggiornamento")=now()
		ss("IpOrdine")=Request.ServerVariables("REMOTE_ADDR")
		ss.update
	end if

	ss.close

	if FkPagamento=1 then
		Set rs=Server.CreateObject("ADODB.Recordset")
		sql = "Select * From Clienti where pkid="&idsession
		rs.Open sql, conn, 1, 1

		nominativo_email=rs("nome")&" "&rs("nominativo")
		email=rs("email")

		rs.close

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
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Grazie "&nominativo_email&" per aver scelto i nostri prodotti!<br>Questa &egrave; un email di conferma per il completamento dell'ordine n&deg; "&idordine&".<br><br><b>TOTALE ORDINE: <u>"&TotaleGenerale&"&#8364;</u></b><br><br> Per completare l'ordine &egrave; necessario effettuare il bonifico con i seguenti dati:<br><u>BANCA DI CREDITO COOPERATIVO DI CAMBIANO AG. MONTELUPO FIORENTINO</u><br>IBAN: <u>IT33E0842537960000030277941</u><br>Codice BIC/SWIFT: <u>CRACIT33</u><br>Nella causale indicare: Ordine da sito internet n&deg; "&idordine&"<br><br>Beneficiario: Cristalensi Snc di Lensi Massimiliano & C. (P.Iva e C.Fiscale 05305820481)<br>Via arti e mestieri, 1 - 50056 Montelupo F.no (FI)<br><br><br>Il nostro staff avr&agrave; cura di spedirti la merce appena la banca avr&agrave; notificato il pagamento del bonifico oppure, per velocizzare la spedizione, &egrave; possibile inviarci per email la ricevuta dell'avvenuto pagamento con bonifico (in caso di bonifico fatto con home banking spesso viene fornita dalla banca una ricevuta, oppure &egrave; possibile scannerizzare la ricevuta rilasciata dalla banca).</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000><br><br>Cordiali Saluti, lo staff di Cristalensi</font>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = email
			Oggetto = "Conferma invio ordine n "&idordine&" a Cristalensi.it con pagamento con bonifico bancario"
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
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Nuovo ordine con pagamento con bonifico dal sito internet.</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Dati sensibili e determinanti del nuovo ordine:<br>Nominativo: <b>"&nominativo_email&"</b><br>Email: <b>"&email&"</b><br>Codice cliente: <b>"&idsession&"</b><br>Codice ordine: <b>"&idordine&"</b></font><br>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = "info@cristalensi.it"
			Oggetto = "Conferma invio ordine n "&idordine&" a Cristalensi.it con pagamento con bonifico bancario"
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

			'invio al webmaster

			Mittente = "info@cristalensi.it"
			Destinatario = "viadeimedici@gmail.com"
			Oggetto = "Conferma invio ordine n "&idordine&" a Cristalensi.it con pagamento con bonifico bancario"
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

	if FkPagamento=3 then
		Set rs=Server.CreateObject("ADODB.Recordset")
		sql = "Select * From Clienti where pkid="&idsession
		rs.Open sql, conn, 1, 1

		nominativo_email=rs("nome")&" "&rs("nominativo")
		email=rs("email")

		rs.close

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
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Grazie "&nominativo_email&" per aver scelto i nostri prodotti!<br>Questa &egrave; un email di conferma per il completamento dell'ordine n&deg; "&idordine&".<br><br><br>Il nostro staff avr&agrave; cura di spedirti la merce appena sar&agrave; disponibile nel nostro magazino.<br>Ti ricordiamo che per il pagamento in contrassegno, il corriere consegner&agrave; la merce solo se verr&agrave; pagata in contanti, non accetter&agrave; altri metodi di pagamento (anche gli assegni non saranno accettati).</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000><br><br>Cordiali Saluti, lo staff di Cristalensi</font>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = email
			Oggetto = "Conferma invio ordine n "&idordine&" a Cristalensi.it con pagamento in contrassegno"
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
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Nuovo ordine con pagamento in contrassegno dal sito internet.</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Dati sensibili e determinanti del nuovo ordine:<br>Nominativo: <b>"&nominativo_email&"</b><br>Email: <b>"&email&"</b><br>Codice cliente: <b>"&idsession&"</b><br>Codice ordine: <b>"&idordine&"</b></font><br>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = "info@cristalensi.it"
			Oggetto = "Conferma invio ordine n "&idordine&" a Cristalensi.it con pagamento in contrassegno"
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

			'invio al webmaster

			Mittente = "info@cristalensi.it"
			Destinatario = "viadeimedici@gmail.com"

			Oggetto = "Conferma invio ordine n "&idordine&" a Cristalensi.it con pagamento in contrassegno"
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

	if FkPagamento=4 then
		Set rs=Server.CreateObject("ADODB.Recordset")
		sql = "Select * From Clienti where pkid="&idsession
		rs.Open sql, conn, 1, 1

		nominativo_email=rs("nome")&" "&rs("nominativo")
		email=rs("email")

		rs.close

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
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Grazie "&nominativo_email&" per aver scelto i nostri prodotti!<br>Questa &egrave; un email di conferma per il completamento dell'ordine n&deg; "&idordine&".<br><br><strong>TOTALE ORDINE: <u>"&TotaleGenerale&"&#8364;</u></strong><br><br> Per completare l'ordine &egrave; necessario effettuare il pagamento su Carta POSTEPAY con i seguenti dati:<br><br><strong>Beneficiario: LENSI GIULIANO - c.f. LNS GLN 42A30 D403J<br>Numero carta: 5333 1710 4546 4407</strong><br><br>Nella causale indicare: <strong>Ordine da sito internet n&deg; "&idordine&"</strong><br><br><br>Il nostro staff avr&agrave; cura di spedirti la merce appena ricever&agrave; la notifica del pagamento oppure, per velocizzare la spedizione, &egrave; possibile inviarci per email la ricevuta dell'avvenuto pagamento.</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000><br><br>Cordiali Saluti, lo staff di Cristalensi</font>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = email
			Oggetto = "Conferma invio ordine n "&idordine&" a Cristalensi.it con pagamento con POSTEPAY"
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
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Nuovo ordine con pagamento con POSTEPAY dal sito internet.</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Dati sensibili e determinanti del nuovo ordine:<br>Nominativo: <b>"&nominativo_email&"</b><br>Email: <b>"&email&"</b><br>Codice cliente: <b>"&idsession&"</b><br>Codice ordine: <b>"&idordine&"</b></font><br>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = "info@cristalensi.it"
			Oggetto = "Conferma invio ordine n "&idordine&" a Cristalensi.it con pagamento con POSTEPAY"
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

			'invio al webmaster

			Mittente = "info@cristalensi.it"
			Destinatario = "viadeimedici@gmail.com"
			Oggetto = "Conferma invio ordine n "&idordine&" a Cristalensi.it con pagamento con POSTEPAY"
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
<%'**********************PAYPAL**********************%>
<%
if FkPagamento = 2 then

	TotalePaypal=TotaleGenerale
	Payment_Amount=Replace(TotalePaypal, ",", ".")
	currencyCodeType = "EUR"
	paymentType = "Sale"
	returnURL = "https://www.cristalensi.it/pagamento_paypal_ok_test.asp"
	cancelURL = "https://www.cristalensi.it/pagamento_paypal_ko_test.asp"
	if FkSpedizione=2 then
		shipToName = nominativo_email
		shipToStreet = "Via arti e mestieri, 1"
		shipToStreet2 = "" 'Leave it blank if there is no value
		shipToCity = "Montelupo Fiorentino"
		shipToState = "FI"
		'shipToCountryCode = "<<ShipToCountryCode>>" ' Please refer to the PayPal country codes in the API documentation
		shipToCountryCode = "IT"
		shipToZip = "50056"
		phoneNum = "0571.911163"
		INVNUM = IdOrdine 'valore aggiunto alla funzione
	else
		shipToName = Nominativo_sp
		shipToStreet = Indirizzo_sp
		shipToStreet2 = "" 'Leave it blank if there is no value
		shipToCity = Citta_sp
		shipToState = Provincia_sp
		'shipToCountryCode = "<<ShipToCountryCode>>" ' Please refer to the PayPal country codes in the API documentation
		shipToCountryCode = Nazione_sp
		shipToZip = CAP_sp
		phoneNum = Telefono_sp
		INVNUM = IdOrdine 'valore aggiunto alla funzione
	end if

End If
%>
<%'**********************PAYPAL**********************%>
<!DOCTYPE html>
<html>

<head>
    <title>Cristalensi</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Cristalensi.">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Cristalensi.">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png">
    <link rel="icon" type="image/png" href="/favicon-32x32.png" sizes="32x32">
    <link rel="icon" type="image/png" href="/android-chrome-192x192.png" sizes="192x192">
    <link rel="icon" type="image/png" href="/favicon-16x16.png" sizes="16x16">
    <link rel="manifest" href="/manifest.json">
    <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#2790cf">
    <meta name="msapplication-TileColor" content="#2790cf">
    <meta name="msapplication-TileImage" content="/mstile-144x144.png">
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
		<script language="JavaScript" type="text/JavaScript">
		<!--
		function MM_openBrWindow(theURL,winName,features) { //v2.0
			window.open(theURL,winName,features);
		}
		//-->
		</script>
		<!--#include virtual="/inc_funzioni_head.asp"-->
</head>

<body>
  <!--#include file="inc_header_1.asp"-->
  <!--#include file="inc_header_2.asp"-->
    <div class="container content">
        <div class="row hidden">
            <div class="col-md-12 parentOverflowContainer">
            </div>
        </div>
        <div class="col-sm-12">
            <div class="row bs-wizard">

                <div class="col-sm-5 bs-wizard-step complete">
                    <div class="text-center bs-wizard-stepnum">1</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="/carrello1.asp" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Carrello</div>
                </div>
                <div class="col-sm-5 bs-wizard-step complete">
                    <div class="text-center bs-wizard-stepnum">2</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="/iscrizione.asp" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Accedi / Iscriviti</div>
                </div>
                <div class="col-sm-5 bs-wizard-step complete">
                    <div class="text-center bs-wizard-stepnum">3</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="/carrello2.asp" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Indirizzo di spedizione</div>
                </div>
								<div class="col-sm-5 bs-wizard-step complete">
										<div class="text-center bs-wizard-stepnum">4</div>
										<div class="progress">
												<div class="progress-bar"></div>
										</div>
										<a href="/carrello3.asp" class="bs-wizard-dot"></a>
										<div class="bs-wizard-info text-center">Pagamento &amp; fatturazione</div>
								</div>
								<div class="col-sm-5 bs-wizard-step active">
										<div class="text-center bs-wizard-stepnum">5</div>
										<div class="progress">
												<div class="progress-bar"></div>
										</div>
										<a href="#" class="bs-wizard-dot"></a>
										<div class="bs-wizard-info text-center">Conferma dell'ordine</div>
								</div>
            </div>
        </div>
        <div class="col-md-12">
						<div class="title">
								<h4>Ordine n. <%=idordine%> - Data <%=Left(DataAggiornamento, 10)%></h4>
						</div>
						<div class="col-md-12 hidden-print">
						<%if FkPagamento=1 then%>
								<p class="description">
									Grazie per aver scelto i nostri prodotti,<br>
										per completare l'ordine &egrave; necessario effettuare il bonifico con i seguenti dati:<br>
										<br>
										<strong>BANCA DI CREDITO COOPERATIVO DI CAMBIANO AG. MONTELUPO FIORENTINO<br>IBAN: IT33E0842537960000030277941<br>
										Codice BIC/SWIFT: CRACIT33</strong>
										<br><br>Nella causale indicare: "<strong>Ordine da sito internet n&deg; <%=idordine%></strong>"<br><br>
										Beneficiario:<br><strong>Cristalensi Snc di Lensi Massimiliano &amp; C. (P.Iva e C.Fiscale 05305820481)<br>
										Via arti e mestieri, 1 - 50056 Montelupo F.no (FI)</strong>
										<br><br>
										La merce verr&agrave; spedita al momento che la nostra banca ricever&agrave; il pagamento oppure, per velocizzare la spedizione, &egrave; possibile inviarci per email la ricevuta dell'avvenuto pagamento con bonifico (in caso di bonifico fatto con home banking spesso viene fornita dalla banca una ricevuta, oppure &egrave; possibile scannerizzare la ricevuta rilasciata dalla banca).<br>
										<br>
										Pagando, e quindi completando l'ordine, si accettano le condizioni di vendita.<br><br>
										Salva oppure stampa le condizioni di vendita (consultabili anche nell'apposita pagina del sito internet) da questo file (.pdf):<br><a href="#" target="_blank">condizioni di vendita</a>
										<br>
										<br>
										Cordiali saluti, lo staff di Cristalensi
										<br>
										<br>
								</p>
						<%end if%>
						<%if FkPagamento=4 then%>
								<p class="description">
										<br><br>Grazie per aver scelto i nostri prodotti,<br>
											per completare l'ordine &egrave; necessario effettuare il versamente sulla Carta di POSTEPAY con i seguenti dati:<br>
											<br><br>
											<strong>Beneficiario: LENSI GIULIANO - c.f. LNS GLN 42A30 D403J<br>
											Numero carta: 5333 1710 4546 4407</strong>
											<br><br>Nella causale indicare: "<strong>Ordine da sito internet n&deg; <%=idordine%></strong>"<br><br>

										La merce verr&agrave; spedita al momento che riceveremo il pagamento oppure, per velocizzare la spedizione, &egrave; possibile inviarci per email la ricevuta dell'avvenuto pagamento.<br>
										<br>
										Pagando, e quindi completando l'ordine, si accettano le condizioni di vendita.<br><br>
										Salva oppure stampa le condizioni di vendita (consultabili anche nell'apposita pagina del sito internet) da questo file (.pdf):<br><a href="https://www.cristalensi.it/condizioni_di_vendita.pdf" target="_blank">condizion di vendita</a>
										<br>
										<br>
										Cordiali saluti, lo staff di Cristalensi
										<br>
										<br>
								</p>
						<%end if%>
						<%if FkPagamento=3 then%>
								<p class="description">
								<br><br>Grazie per aver scelto i nostri prodotti,<br>
									la merce verr&agrave; spedita appena sar&agrave; disponibile nel nostro magazino.<br>
									Ti ricordiamo che per il pagamento in contrassegno, il corriere consegner&agrave; la merce solo se verr&agrave; pagata in contanti, non accetter&agrave; altri metodi di pagamento (anche gli assegni non saranno accettati).<br>
									<br>
								Pagando, e quindi completando l'ordine, si accettano le condizioni di vendita.<br>
								Salva oppure stampa le condizioni di vendita (consultabili nell'apposita pagina del sito internet) da questo file (.pdf):<br>
								<a href="https://www.cristalensi.it/condizioni_di_vendita.pdf" target="_blank">condizion di vendita</a>
								<br>
								<br>
								Cordiali saluti, lo staff di Cristalensi
								<br>
								<br>
								</p>
						<%end if%>
						<%if FkPagamento=2 then%>
							<p class="description">
								<a href="https://www.paypal.com/it/webapps/mpp/paypal-popup" title="Come funziona PayPal" onClick="javascript:window.open('https://www.paypal.com/it/webapps/mpp/paypal-popup','WIPaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1100, height=700'); return false;"><img src="https://www.paypalobjects.com/webstatic/mktg/logo-center/logo_paypal_carte.jpg" border="0" style="float:right; padding-left:20px; width:319px; height:110px;" alt="Che cos'&egrave; PayPal"></a>Grazie per aver scelto i nostri prodotti,<br>
								per completare l'ordine &egrave; necessario effettuare il pagamento con i sistemi sicuri di PayPal protetti dai loro protocolli di sicurezza.<br>PayPal permette di pagare con moltissime carte di credito e carte ricaribili garantendo una potezione sia per l'acquirente che per il venditore:<br>
								MasterCard, Visa e Visa Electron, PostePay, Carta Aura e ricariche PayPal.<br><br>
								Pagando, e quindi completando l'ordine, si accettano le condizioni di vendita consultabili nella pagina specifica oppure da questo file (pdf): <a href="https://www.cristalensi.it/condizioni_di_vendita.pdf" target="_blank">condizion di vendita</a>.<br><br>
							</p>

								<form action="https://securepayments.sandbox.paypal.com/webapps/HostedSoleSolutionApp/webflow/sparta/hostedSoleSolutionProcess" method="post">
								<input type="hidden" name="cmd" value="_hosted-payment">
								<input type="hidden" name="subtotal" value="<%=Payment_Amount%>">
								<input type="hidden" name="currency_code" value="<%=currencyCodeType%>">
								<input type="hidden" name="business" value="viadeimedici-facilitator@gmail.com"><!-- Codice conto commerciante -->
								<input type="hidden" name="paymentaction" value="<%=paymentType%>">
								<input type="hidden" name="return" value="<%=returnURL%>">
								<input type="hidden" name="template" value=”TemplateB">  <!--PayPal templates -->

								<input type="hidden" name="cancel_return" value="<%=cancelURL%>">
								<input type="hidden" name="cbt" value="Torna al sito di Cristalensi Lampadari">

								  <!-- Enable override of payer’s stored PayPal address. -->
								<input type="hidden" name="address_override" value="true">

								<input type="hidden" name="showShippingAddress" value="false">
								<input type="hidden" name="showCustomerName" value="false">
								<input type="hidden" name="showBillingEmail" value="false">
								<input type="hidden" name="showBillingPhone" value="false">
								<input type="hidden" name="showBillingAddress" value="false">

								 <!-- popola indirizzo di spedizione e fatturazione  -->
								<input type="hidden" name="address1" value="<%=shipToName%>">
								<input type="hidden" name="address2" value="<%=shipToStreet2%>">
								<input type="hidden" name="city" value="<%=shipToCity%>">
								<input type="hidden" name="state" value="<%=shipToState%>">
								<input type="hidden" name="zip" value="<%=shipToZip%>">
								<input type="hidden" name="night_phone_b" value="<%=phoneNum%>">

								<input type="hidden" name="invoice" value="<%=INVNUM%>">
								<input type="hidden" name="custom" value="Ordine n. <%=INVNUM%>">

								<input type="submit" name="METHOD" value=" Clicca qui per Pagare adesso con PayPal! " class="btn btn-danger pull-left">


								</form>
								<br><br>
						<%end if%>



						</div>
            <div class="col-md-12">
                <div class="top-buffer">
                    <table id="cart" class="table table-hover table-condensed table-cart">
                        <thead>
                            <tr>
                                <th style="width:45%">Prodotto</th>
                                <th style="width:10%" class="text-center">Quantit&agrave;</th>
                                <th style="width:10%" class="text-center">Prezzo unitario</th>
                                <th style="width:20%" class="text-center">Totale Prodotto</th>
                            </tr>
                        </thead>
												<%
													Set rs = Server.CreateObject("ADODB.Recordset")
													sql = "SELECT * FROM RigheOrdine WHERE FkOrdine="&idOrdine&""
													rs.Open sql, conn, 1, 1
													num_prodotti_carrello=rs.recordcount

												%>
                        <%if rs.recordcount>0 then%>
												<tbody>
														<%
														Do while not rs.EOF

														Set url_prodotto_rs = Server.CreateObject("ADODB.Recordset")
														sql = "SELECT PkId, NomePagina FROM Prodotti where PkId="&rs("FkProdotto")&""
														url_prodotto_rs.Open sql, conn, 1, 1

														NomePagina=url_prodotto_rs("NomePagina")
														if Len(NomePagina)>0 then
															NomePagina="/public/pagine/"&NomePagina
														else
															NomePagina="#"
														end if

														url_prodotto_rs.close
														%>
														<%
														quantita=rs("quantita")
														if quantita="" then quantita=1
														%>
														<tr>
                                <td data-th="Product" class="cart-product">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5 class="nomargin"><%=rs("titolo")%></h5>
																						<p><strong>Codice: <%=rs("codicearticolo")%></strong></p>
                                            <%if Len(rs("colore"))>0 or Len(rs("lampadina"))>0 then%><p><%if Len(rs("colore"))>0 then%>Col.: <%=rs("colore")%><%end if%><%if Len(rs("lampadina"))>0 then%> - Lamp.: Bianco satinato<%=rs("lampadina")%><%end if%></p><%end if%>
                                        </div>
                                    </div>
                                </td>
                                <td data-th="Quantity" class="text-center">
                                    <%=quantita%>
                                </td>
                                <td data-th="Price" class="hidden-xs text-center"><%=FormatNumber(rs("PrezzoProdotto"),2)%>&euro;</td>
                                <td data-th="Subtotal" class="text-center"><%=FormatNumber(rs("TotaleRiga"),2)%>&euro;</td>
                            </tr>
														<%
														rs.movenext
														loop
														%>
                        </tbody>
												<%end if%>
												<%rs.close%>
												<tfoot>
                            <tr class="visible-xs">
                                <td colspan="4" class="text-center"><strong>Totale Carrello <%if TotaleCarrello<>0 then%>
								<%=FormatNumber(TotaleCarrello,2)%>&euro;<%else%>0&euro;<%end if%></strong></td>
                            </tr>
                            <tr class="hidden-xs">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="text-center"><strong>Totale Carrello <%if TotaleCarrello<>0 then%>
								<%=FormatNumber(TotaleCarrello,2)%>&euro;<%else%>0&euro;<%end if%></strong></td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <h5>Eventuali annotazioni</h5>
                                    <textarea class="form-control" rows="3" readonly style="font-size: 12px;"><%=NoteCliente%></textarea>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="row top-buffer">
                <div class="col-md-6">
                    <div class="title">
                        <h4>Modalit&agrave; di spedizione</h4>
                    </div>
                    <div class="col-md-12 top-buffer">
                        <table id="cart" class="table table-hover table-condensed table-cart">
                            <thead>
                                <tr>
                                    <th style="width:75%">Modalit&agrave; di spedizione</th>
                                    <th style="width:25%" class="text-center">Totale</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td data-th="Product" class="cart-product">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <p><%=TipoTrasporto%></p>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Quantity" class="text-center">
                                        <%=FormatNumber(CostoSpedizioneTotale,2)%>&euro;
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="title">
                        <h4>Indirizzo di spedizione</h4>
                    </div>
                    <div class="col-md-12 top-buffer">
                        <p><%=Nominativo_sp%>&nbsp;-&nbsp;Telefono:&nbsp;<%=Telefono_sp%><br /><%=Indirizzo_sp%>&nbsp;-&nbsp;<%=CAP_sp%>&nbsp;-&nbsp;<%=Citta_sp%><%if Provincia_sp<>"" then%>&nbsp;(<%=Provincia_sp%>)<%end if%>&nbsp;-&nbsp;<%=Nazione_sp%></p>
                    </div>
                </div>
            </div>
						<div class="clearfix"></div>
            <div class="row top-buffer">
                <div class="col-md-6">
                    <div class="title">
                        <h4>Modalit&agrave; di pagamento</h4>
                    </div>
                    <div class="col-md-12 top-buffer">
                        <table id="cart" class="table table-hover table-condensed table-cart">
                            <thead>
                                <tr>
                                    <th style="width:75%">Modalit&agrave; di pagamento</th>
                                    <th style="width:25%" class="text-center">Totale</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td data-th="Product" class="cart-product">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <p><%=TipoPagamento%></p>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Quantity" class="text-center">
                                        <%=FormatNumber(CostoPagamento,2)%>&#8364;
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="title">
                        <h4>Riferimenti per i dati di fatturazione:</h4>
                    </div>
                    <div class="col-md-12 top-buffer">
                        <p>
													<%if Rag_Soc<>"" then%><%=Rag_Soc%>&nbsp;&nbsp;<%end if%><%if nominativo<>"" then%><%=nominativo%><%end if%><br />
													<%if Cod_Fisc<>"" then%>Codice fiscale: <%=Cod_Fisc%>&nbsp;&nbsp;<%end if%><%if PartitaIVA<>"" then%>Partita IVA: <%=PartitaIVA%><%end if%><br />
													<%if Len(indirizzo)>0 then%><%=indirizzo%><br /><%end if%>
													<%=cap%>&nbsp;&nbsp;<%=citta%><%if provincia<>"" then%>&nbsp;(<%=provincia%>)&nbsp;<%end if%>
												</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
						<div class="col-md-12">
								<div class="bg-primary">
		                <p style="font-size: 1.2em; text-align: right; padding: 10px 15px; color: #000;">Totale Ordine: <b>
										<%if TotaleGenerale<>0 then%>
											<%=FormatNumber(TotaleGenerale,2)%>
										<%else%>
											0,00
										<%end if%>
										&#8364;&nbsp;
										</b></p>
		            </div>
		            <%if FkPagamento=1 or FkPagamento=3 or FkPagamento=4 then%>
		            <a href="#" onClick="MM_openBrWindow('stampa_ordine.asp?idordine=<%=IdOrdine%>&mode=1','','width=760,height=900,scrollbars=yes')" class="btn btn-danger pull-right hidden-print"><i class="glyphicon glyphicon-print"></i> Stampa ordine</a>
								<%end if%>
		        </div>
				</div>
    </div>
    <!--#include file="inc_footer.asp"-->
</body>
