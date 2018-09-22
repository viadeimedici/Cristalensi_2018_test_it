<!--#include file="inc_strConn.asp"-->
<%
	mode=request("mode")
	if mode="" then mode=0

	if idsession=0 then response.Redirect("/iscrizione.asp")

	Destinazione=request("Destinazione")

	if mode=1 then
		testo=request("testo")
		if Len(testo)=0 then mode=2
		if Instr(1, testo, "www", 1)>0 then mode=2
		if Instr(1, testo, "@", 1)>0 then mode=2
	end if
	if mode=1 then
		Set rs=Server.CreateObject("ADODB.Recordset")
		sql = "Select Top 1 PkId From Commenti_Clienti Order by PkId DESC"
		rs.Open sql, conn, 1, 1
		PkId_Prec=rs("PkId")
		rs.close
		pkid_commento=PkId_Prec+1

		Set cli_rs=Server.CreateObject("ADODB.Recordset")
		sql = "Select * From Commenti_Clienti"
		cli_rs.Open sql, conn, 3, 3
		cli_rs.addnew
			cli_rs("PkId")=pkid_commento
			cli_rs("Testo")=request("Testo")
			cli_rs("Valutazione")=request("Valutazione")
			cli_rs("FkIscritto")=idsession
			cli_rs("Data")=now()
			cli_rs("Pubblicato")=False
			cli_rs("Risposta")=False
		cli_rs.update
		cli_rs.close

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
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Grazie "&nominativo_email&" per aver inserito un commento!<br>Se sar&agrave; accettato dal nostro staff riceverai una notifica via email della pubblicazione.</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000><br><br>Cordiali Saluti, lo staff di Cristalensi</font>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = email
			Oggetto = "Conferma invio commento a Cristalensi.it"
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
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Nuovo commento sul sito internet.</font><br>"
			HTML1 = HTML1 & "<font face=Verdana size=3 color=#000000>Dati sensibili e determinanti del nuovo commento:<br>Nominativo: <b>"&nominativo_email&"</b><br>Email: <b>"&email&"</b><br>Codice cliente: <b>"&idsession&"</b></font><br>"
			HTML1 = HTML1 & "</td>"
			HTML1 = HTML1 & "</tr>"
			HTML1 = HTML1 & "</table>"
			HTML1 = HTML1 & "</body>"
			HTML1 = HTML1 & "</html>"

			Mittente = "info@cristalensi.it"
			Destinatario = "info@cristalensi.it"
			Oggetto = "Conferma invio commento a Cristalensi.it"
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
			Oggetto = "Conferma invio commento a Cristalensi.it"
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
    <title>Commenti prodotti illuminazione recensioni lampadari acquistati Cristalensi</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Lascia un commento per i prodotti di illuminazione acquistati. Inserisci una recensione di un lampadario comprato. In un ottica di trasparenza, di avvicinamento alla clientela e di miglioramento dei nostri servizi abbiamo aperto quest'area dove i clienti possono lasciare un messaggio, un commento, un complimento o una critica al funzionamento del sito internet, ai prodotti di illuminazione comprati ma anche ai servizi dello staff stesso.">
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
    <link rel="stylesheet" type="text/css" href="stylesheets/customization.css" shim-shadowdom>
    <!--[if lt IE 9]><script src="javascripts/html5shiv.js"></script><![endif]-->
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,400i,500,600,700" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/webcomponentsjs/0.7.5/webcomponents.min.js"></script>
    <link rel="import" href="awesome-slider.html">
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
    <!--#include file="inc_header_1.asp"-->
    <!--#include file="inc_header_2.asp"-->
    <div class="container content">
        <div class="col-md-12">
            <div class="row top-buffer">
                <div class="col-md-8">


                  <div class="title">
                      <h4>Inserisci il tuo commento!</h4>
                  </div>
                  <div class="col-md-12">
                    <%if mode=1 then%>
                      <p class="description">Il tuo commento &egrave; stato inserito correttamente, adesso il nostro staff lo valuter&agrave; e se sar&agrave; approvato, ti verr&agrave; recapitata una notifica via email.<br />Grazie della tua collaborazione dallo staff di Cristalensi.<br /><br /><a href="https://www.cristalensi.it/commenti_elenco.asp" class="button_link_red" style="float:right">Elenco commenti</a>
                      </p>
                    <%else%>
                      <p class="description">Inserisci un commento su i prodotti acquistati, se ti sono piaciuti o no, oppure un commento sul sito internet o sull'azienda e lo staff.<br />Il commento non sar&agrave; pubblicato immediatamente ma sar&agrave; soggetto a un controllo da parte del nostro staff per evitare che vengano inseriti contenuti non leciti, offese e termini non pubblicabili.<br />Si prega di non inserire codice html, email, link e collegamenti ad altri siti internet: il commento non sar&agrave; pubblicato.<br />Per ogni commento sar&agrave; pubblicato anche il <strong>Nome</strong> inserito al momento dell'iscrizione.
                      </p>
                      <%if mode=2 then%><p><strong>Attenzione! Controllare il testo inserito rispettando le regole, grazie.</strong></p><%end if%>
                      <form class="form-horizontal" method="post" action="/commenti_form.asp?mode=1" name="newsform2">
                          <div class="form-group">
                              <label for="testo" class="col-sm-2 control-label">Commento</label>
                              <div class="col-sm-10">
                                  <textarea name="testo" style="width: 100%" rows="4" id="testo"></textarea>
                              </div>
                          </div>
													<div class="form-group">
                              <label for="valutazione" class="col-sm-2 control-label">Valutazione</label>
                              <div class="col-sm-10">
                                  <select class="selectpicker show-menu-arrow  show-tick" data-size="5" title="valutazione" name="valutazione" id="valutazione">
																	<option value="5" selected>5 - Ottimo</option>
																	<option value="4">4 - Buono</option>
																	<option value="3">3 - Sufficiente</option>
																	<option value="2">2 - Insufficiente</option>
																	<option value="1">1 - Scarso</option>
																	</select>
                              </div>
                          </div>
                          <div class="form-group">
                              <div class="col-sm-offset-4 col-sm-8">
                                  <a href="/commenti_elenco.asp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Elenco commenti</a>
                                  <button type="submit" class="btn btn-danger">Invia</button>
                              </div>
                          </div>
                      </form>
                    <%end if%>
                  </div>

                  <p>&nbsp;<br>&nbsp;</p>
                </div>
                <div class="col-md-4">
                    <!--#include file="inc_box_contatti.asp"-->
                </div>
            </div>
        </div>
    </div>
    <!--#include file="inc_footer.asp"-->
</body>
<!--#include file="inc_strClose.asp"-->
