<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-3 address-col" itemtype="http://schema.org/Organization">
                <h4>Cristalensi Vendita Lampadari</h4>
                <p>
                  <span itemprop="name">Cristalensi Snc di Lensi Massimiliano & C.</span><br />

                  C.F. e Iscr. Reg. Impr. di Firenze 05305820481<br />
                  R.E.A. Firenze 536760<br />
                  <span itemprop="address" itemtype="http://schema.org/PostalAddress">
                  <span itemprop="postalCode">50056</span> <span itemprop="addressLocality">Montelupo Fiorentino (FI)</span><br />
                  <span itemprop="streetAddress">Via arti e mestieri, 1<br /></span>
                  </span>
                  Tel.: <span itemprop="telephone">0571.911163</span><br />
                  Fax: <span itemprop="faxNumber">0571.073327</span><br />
                  E-mail: <span itemprop="email">info@cristalensi.it</span>
                </p>
                <h4>Contatti Social</h4>
                <p class="social">
                    <a href="https://www.facebook.com/CristalensiLampadari/" target="_blank"><i class="fa fa-facebook-square"></i></a>
                    <a href="https://www.youtube.com/channel/UCsP3WTO0PryxgRq6OymSfpA/videos" target="_blank"><i class="fa fa-youtube-square"></i></a>
                </p>
                <p>
                    <br /><br />&raquo; <a href="https://www.viadeimedici.it" target="_blank" rel="nofollow" style="color:#000;" title="ViaDeiMedici: Realizzazione campagne Web Marketing e Siti Internet">ViaDeiMedici: Web Marketing e Siti Internet</a>
                </p>

            </div>
            <div class="col-md-3 menu-col">
                <h4>Cosa cerchi?</h4>
                <ul>
                    <li><a href="/illuminazione-interni-ed-esterni/1ng-lampade-da-interno.asp" title="Lampade da interno e illuminazione interni">Lampade da interno</a></li>
                    <li><a href="/illuminazione-interni-ed-esterni/2ng-lampade-da-esterno.asp" title="Lampade da esterno e illuminazione esterni">Lampade da esterno</a></li>
                    <li><a href="/illuminazione-interni-ed-esterni/3ng-ventilatori.asp" title="Ventiltori">Ventiltori</a></li>
                    <li><a href="/illuminazione-interni-ed-esterni/4ng-lampadine-componenti-illuminazione.asp" title="Lampadine e componenti">Lampadine e componenti</a></li>
                    <li>&nbsp;</li>
                </ul>
                <h4>Oppure cerca in</h4>
                <ul>
                    <li><a href="/offerte.asp" title="Offerte prodotti illuminazione">Offerte</a></li>
                    <li><a href="/novita-illuminazione-ultimi-arrivi.asp" title="Novit&agrave; illuminazione e ultimi arrivi lampadari">Novit&agrave; e ultimi arrivi</a></li>
                </ul>
            </div>
            <div class="col-md-3 menu-col">
                <h4>Riferimenti</h4>
                <ul>
                    <li><a href="/contatti.asp">Contatti e mappa</a></li>
                    <li><a href="/chi_siamo.asp">Chi siamo: lo showroom</a></li>
                    <li><a href="/video_elenco.asp">Video</a></li>
                    <li><a href="/commenti_elenco.asp">Dicono noi</a></li>
                </ul>
                <h4>Area Clienti</h4>
                <ul>
                    <li><a href="/iscrizione.asp">Iscriviti/Accedi</a></li>
                    <li><a href="/preferiti.asp">Lista dei desideri</a></li>
                    <li><a href="/carrello1.asp">Carrello</a></li>
                    <li><a href="/areaprivata.asp">Elenco ordini</a></li>
                </ul>
            </div>
            <div class="col-md-3 menu-col">
                <h4>Note legali</h4>
                <ul>
                    <li><a href="/condizioni_di_vendita.asp">Condizioni di vendita</a></li>
                    <li><a href="/privacy.asp">Privacy e note legali</a></li>
                </ul>
                <h4>Spedizioni</h4>
                <ul class="checklist">
                    <li>Spedizioni assicurate <strong>GRATUITE</strong> in tutta Italia per ordini superiori a 250&euro;</li>
                    <li>Spedizioni assicurate in tutta Italia per ordini fino a 250&euro;: <strong>10&euro;</strong></li>
                </ul>
                <h4>Pagamenti accettati</h4>
                <ul class="checklist">
                    <li>Bonifico Bancario - PostePay</li>
                    <li>Contrassegno</li>
                    <li>Carte di credito - Prepagate - PayPal</li>
                </ul>
            </div>
        </div>
    </div>
</footer>
<div class="floating-links">

</div>
<span id="top-link-block" class="hidden">
    <a href="#top" class="btn btn-default"  onclick="$('html,body').animate({scrollTop:0},'slow');return false;">
        <i class="glyphicon glyphicon-chevron-up"></i> Back to Top
    </a>
</span>
<!-- /top-link-block -->
<%if ((id>0 and Len(Titolo_prodotto)>0) or (richiesta_carrello=1)) then%>
  <%
  ric=request("ric")
  if ric="" then ric=0

  if ric=1 then
    email=request("email")
    nome=request("nome")
    telefono=request("telefono")
    richiesta=request("richiesta")
    if InStr(richiesta, "http")>0 or InStr(richiesta, "www")>0 or InStr(richiesta, "href")>0 then
      invioemail="no"
    Else
      invioemail="si"
    end if
    ip=Request.ServerVariables("REMOTE_ADDR")

    if email<>"" and invioemail="si" and ip<>"194.226.137.235" then

  		data=date()

  		HTML1 = ""
  		HTML1 = HTML1 & "<html>"
  		HTML1 = HTML1 & "<head>"
  		HTML1 = HTML1 & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">"
  		HTML1 = HTML1 & "<title>Cristalensi</title>"
  		HTML1 = HTML1 & "</head>"
  		HTML1 = HTML1 & "<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"
  		HTML1 = HTML1 & "<table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td>"
      if richiesta_carrello=1 then
        HTML1 = HTML1 & "<font face=Verdana size=1 color=#000000>E' stata fatta la seguente richiesta di disponibilit&agrave; dal sito il "&data&"<br><br>Dati della richiesta:<br>Nome e Cognome: <b>"&nome&"</b><br>Telefono: <b>"&telefono&"</b><br>E-mail: <b>"&email&"</b><br>IP connessione: <b>"&ip&"</b><br><br>Richiesta:<br><b>"&richiesta&"</b><br><br>Prodotti nel carrello:"&ProdottiCarrello&"</font>"
      else
  		  HTML1 = HTML1 & "<font face=Verdana size=1 color=#000000>E' stata fatta la seguente richiesta di disponibilit&agrave; dal sito il "&data&"<br><br>Dati della richiesta:<br>Nome e Cognome: <b>"&nome&"</b><br>Telefono: <b>"&telefono&"</b><br>E-mail: <b>"&email&"</b><br>IP connessione: <b>"&ip&"</b><br><br>Codice articolo: <b>"&CodiceArticolo&"</b><br>Nome prodotto: <b>"&Titolo_prodotto&"</b><br>Produttore: <b>"&produttore&"</b><br>Codice progressivo prodotto: <b>"&id&"</b><br><br>Richiesta:<br><b>"&richiesta&"</b></font>"
      end if
      HTML1 = HTML1 & "</td></tr></table>"
  		HTML1 = HTML1 & "</body>"
  		HTML1 = HTML1 & "</html>"

  		Destinatario = "info@cristalensi.it"
  		Mittente = "info@cristalensi.it"
      if richiesta_carrello=1 then
        Oggetto = "Richiesta informazioni prodotti"
      else
        Oggetto = "Richiesta informazioni per l'articolo codice: "&CodiceArticolo
      end if
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

  		Destinatario = "viadeimedici@gmail.com"
  		Mittente = "info@cristalensi.it"
      if richiesta_carrello=1 then
        Oggetto = "Richiesta informazioni prodotti"
      else
        Oggetto = "Richiesta informazioni per l'articolo codice: "&CodiceArticolo
      end if
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


  		'email di conferma per il cliente
  		HTML1 = ""
  		HTML1 = HTML1 & "<html>"
  		HTML1 = HTML1 & "<head>"
  		HTML1 = HTML1 & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">"
  		HTML1 = HTML1 & "<title>Cristalensi</title>"
  		HTML1 = HTML1 & "</head>"
  		HTML1 = HTML1 & "<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"
  		HTML1 = HTML1 & "<table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td>"
      if richiesta_carrello=1 then
        HTML1 = HTML1 & "<font face=Verdana size=1 color=#000000>E' stata fatta la seguente richiesta di disponibilit&agrave; dal sito il "&data&"<br><br>Dati della richiesta:<br>Nome e Cognome: <b>"&nome&"</b><br>Telefono: <b>"&telefono&"</b><br>E-mail: <b>"&email&"</b><br><br>Richiesta:<br><b>"&richiesta&"</b><br><br>Prodotti nel carrello:"&ProdottiCarrello&"<br><br><br><br>Questa &egrave; un'email di conferma dell'invio della richiesta di disponibilit&agrave;.<br><br>La ringraziamo per aver scelto i prodotti di Cristalensi</font>"
      else
  		  HTML1 = HTML1 & "<font face=Verdana size=1 color=#000000>E' stata fatta la seguente richiesta di disponibilit&agrave; dal sito il "&data&"<br><br>Dati della richiesta:<br>Nome e Cognome: <b>"&nome&"</b><br>Telefono: <b>"&telefono&"</b><br>E-mail: <b>"&email&"</b><br><br>Codice articolo: <b>"&CodiceArticolo&"</b><br>Nome prodotto: <b>"&Titolo_prodotto&"</b><br>Produttore: <b>"&produttore&"</b><br>Codice progressivo prodotto: <b>"&id&"</b><br><br>Richiesta:<br><b>"&richiesta&"</b><br><br><br><br>Questa &egrave; un'email di conferma dell'invio della richiesta di disponibilit&agrave;.<br><br>La ringraziamo per aver scelto i prodotti di Cristalensi</font>"
      end if
  		HTML1 = HTML1 & "</td></tr></table>"
  		HTML1 = HTML1 & "</body>"
  		HTML1 = HTML1 & "</html>"

  		Destinatario = email
  		Mittente = "info@cristalensi.it"
      if richiesta_carrello=1 then
        Oggetto = "Richiesta informazioni prodotti"
      else
        Oggetto = "Richiesta informazioni per l'articolo codice: "&CodiceArticolo
      end if
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

  	else
  		ric=0
  	end if

  end if
  %>
  <SCRIPT language="JavaScript">
    function verifica_request() {

    email=document.requestform.email.value;
    richiesta=document.requestform.richiesta.value;

    if (email==""){
      alert("Non  e\' stato compilato il campo \"Email\".");
      return false;
    }
    if (email.indexOf("@")==-1 || email.indexOf(".")==-1){
    alert("ATTENZIONE! \"e-mail\" non valida.");
    return false;
    }
    if (richiesta.indexOf("https")>-1 || richiesta.indexOf("http")>-1 || richiesta.indexOf("www")>-1 || richiesta.indexOf("href")>-1){
    alert("ATTENZIONE! Non possono essere inseriti indirizzi di siti internet.");
    return false;
    }

      else

        document.requestform.method = "post";
        document.requestform.action = "<%=toUrl_completo%>";
        document.requestform.submit();
    }

  </SCRIPT>
  <div style="display: none; max-width: 800px;" id="hidden-content">
      <%if richiesta_carrello=1 then%>
        <h4>Richiesta informazioni e disponibilit&agrave; prodotti</h4>
      <%else%>
        <h4>Richiesta informazioni e disponibilit&agrave; per<br /><em><%=Titolo_prodotto%></em><br />Codice prodotto: <%=CodiceArticolo%></h4>
      <%end if%>
      <%if ric=1 then%>
      <p><strong>La richiesta &egrave; stata inoltrata correttamente, il nostro staff ti contatter&agrave; il prima possibile.<br />Saluti da CRISTALENSI</strong></p>
      <%else%>
      <p class="description">Per richiedere informazioni e disponibilit&agrave; del prodotto riempi il seguente modulo, oppure contattaci direttamente.</p>
      <form class="form-horizontal" name="requestform" id="requestform" onSubmit="return verifica_request();">
      <input type="hidden" name="ric" value="1" />
          <div class="form-group">
              <label for="nome" class="col-sm-4 control-label">Nome e Cognome</label>
              <div class="col-sm-8">
                  <input type="text" class="form-control" id="nome" name="nome">
              </div>
          </div>
          <div class="form-group">
              <label for="email" class="col-sm-4 control-label">Indirizzo Email</label>
              <div class="col-sm-8">
                  <input type="email" class="form-control" id="email" name="email">
              </div>
          </div>
          <div class="form-group">
              <label for="telefono" class="col-sm-4 control-label">Telefono</label>
              <div class="col-sm-8">
                  <input type="number" class="form-control" id="telefono" name="telefono">
              </div>
          </div>
          <div class="form-group">
              <label for="richiesta" class="col-sm-4 control-label">Dettagli richiesta</label>
              <div class="col-sm-8">
                  <textarea class="form-control" name="richiesta" id="richiesta"></textarea>
              </div>
          </div>
          <div class="form-group">
              <div class="col-sm-offset-4 col-sm-8">
                  <button type="submit" id="inviarichiesta" class="btn btn-danger">invia richiesta</button>
              </div>
          </div>
      </form>
      <%end if%>
  </div>

  <%
  'in caso di pulsante per richiede un preventivo'
  if richiesta_prev=1 then

  if ric=2 then
    email=request("email")
    nome=request("nome")
    telefono=request("telefono")
    richiesta=request("richiesta")
    if InStr(richiesta, "http")>0 or InStr(richiesta, "www")>0 or InStr(richiesta, "href")>0 then
      invioemail="no"
    Else
      invioemail="si"
    end if
    ip=Request.ServerVariables("REMOTE_ADDR")

    if email<>"" and invioemail="si" and ip<>"194.226.137.235" then

  		data=date()

  		HTML1 = ""
  		HTML1 = HTML1 & "<html>"
  		HTML1 = HTML1 & "<head>"
  		HTML1 = HTML1 & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">"
  		HTML1 = HTML1 & "<title>Cristalensi</title>"
  		HTML1 = HTML1 & "</head>"
  		HTML1 = HTML1 & "<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"
  		HTML1 = HTML1 & "<table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td>"
  		HTML1 = HTML1 & "<font face=Verdana size=1 color=#000000>E' stata fatta la seguente richiesta di preventivo dal sito il "&data&"<br><br>Dati della richiesta:<br>Nome e Cognome: <b>"&nome&"</b><br>Telefono: <b>"&telefono&"</b><br>E-mail: <b>"&email&"</b><br>IP connessione: <b>"&ip&"</b><br><br>Codice articolo: <b>"&CodiceArticolo&"</b><br>Nome prodotto: <b>"&Titolo_prodotto&"</b><br>Produttore: <b>"&produttore&"</b><br>Codice progressivo prodotto: <b>"&id&"</b><br><br>Richiesta:<br><b>"&richiesta&"</b></font>"
  		HTML1 = HTML1 & "</td></tr></table>"
  		HTML1 = HTML1 & "</body>"
  		HTML1 = HTML1 & "</html>"

  		Destinatario = "info@cristalensi.it"
  		Mittente = "info@cristalensi.it"
  		Oggetto = "Richiesta preventivo per l'articolo codice: "&CodiceArticolo
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

  		Destinatario = "viadeimedici@gmail.com"
  		Mittente = "info@cristalensi.it"
  		Oggetto = "Richiesta preventivo per l'articolo codice: "&CodiceArticolo
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


  		'email di conferma per il cliente
  		HTML1 = ""
  		HTML1 = HTML1 & "<html>"
  		HTML1 = HTML1 & "<head>"
  		HTML1 = HTML1 & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">"
  		HTML1 = HTML1 & "<title>Cristalensi</title>"
  		HTML1 = HTML1 & "</head>"
  		HTML1 = HTML1 & "<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"
  		HTML1 = HTML1 & "<table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td>"
  		HTML1 = HTML1 & "<font face=Verdana size=1 color=#000000>E' stata inviata la seguente richiesta di preventivo dal sito Cristalensi.it il "&data&"<br><br>Dati della richiesta:<br>Nome e Cognome: <b>"&nome&"</b><br>Telefono: <b>"&telefono&"</b><br>E-mail: <b>"&email&"</b><br><br>Codice articolo: <b>"&CodiceArticolo&"</b><br>Nome prodotto: <b>"&Titolo_prodotto&"</b><br>Produttore: <b>"&produttore&"</b><br><br>Richiesta:<br><b>"&richiesta&"</b><br><br><br><br>Questa &egrave; un'email di conferma dell'invio della richiesta di preventivo.<br><br>La ringraziamo per aver scelto i prodotti di Cristalensi</font>"
  		HTML1 = HTML1 & "</td></tr></table>"
  		HTML1 = HTML1 & "</body>"
  		HTML1 = HTML1 & "</html>"

  		Destinatario = email
  		Mittente = "info@cristalensi.it"
  		Oggetto = "Richiesta preventivo per l'articolo codice: "&CodiceArticolo
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

  	else
  		ric=0
  	end if

  end if
  %>
  <SCRIPT language="JavaScript">
    function verifica_request_prev() {

    email=document.requestprev.email.value;
    richiesta=document.requestprev.richiesta.value;

    if (email==""){
      alert("Non  e\' stato compilato il campo \"Email\".");
      return false;
    }
    if (email.indexOf("@")==-1 || email.indexOf(".")==-1){
    alert("ATTENZIONE! \"e-mail\" non valida.");
    return false;
    }
    if (richiesta.indexOf("https")>-1 || richiesta.indexOf("http")>-1 || richiesta.indexOf("www")>-1 || richiesta.indexOf("href")>-1){
    alert("ATTENZIONE! Non possono essere inseriti indirizzi di siti internet.");
    return false;
    }

      else

        document.requestprev.method = "post";
        document.requestprev.action = "<%=toUrl_completo%>";
        document.requestprev.submit();
    }

  </SCRIPT>
  <div style="display: none; max-width: 800px;" id="hidden-content-prev">
      <h4>Richiesta informazioni e preventivo per<br /><em><%=Titolo_prodotto%></em><br />Codice prodotto: <%=CodiceArticolo%></h4>
      <%if ric=2 then%>
      <p><strong>La richiesta &egrave; stata inoltrata correttamente, il nostro staff ti contatter&agrave; il prima possibile.<br />Saluti da CRISTALENSI</strong></p>
      <%else%>
      <p class="description">Per richiedere informazioni e preventivi del prodotto riempi il seguente modulo, oppure contattaci direttamente.</p>
      <form class="form-horizontal" name="requestprev" id="requestprev" onSubmit="return verifica_request_prev();">
      <input type="hidden" name="ric" value="2" />
          <div class="form-group">
              <label for="nome" class="col-sm-4 control-label">Nome e Cognome</label>
              <div class="col-sm-8">
                  <input type="text" class="form-control" id="nome" name="nome">
              </div>
          </div>
          <div class="form-group">
              <label for="email" class="col-sm-4 control-label">Indirizzo Email</label>
              <div class="col-sm-8">
                  <input type="email" class="form-control" id="email" name="email">
              </div>
          </div>
          <div class="form-group">
              <label for="telefono" class="col-sm-4 control-label">Telefono</label>
              <div class="col-sm-8">
                  <input type="number" class="form-control" id="telefono" name="telefono">
              </div>
          </div>
          <div class="form-group">
              <label for="richiesta" class="col-sm-4 control-label">Dettagli richiesta</label>
              <div class="col-sm-8">
                  <textarea class="form-control" name="richiesta" id="richiesta"></textarea>
              </div>
          </div>
          <div class="form-group">
              <div class="col-sm-offset-4 col-sm-8">
                  <button type="submit" id="inviarichiesta" class="btn btn-danger">invia richiesta</button>
              </div>
          </div>
      </form>
      <%end if%>
  </div>
  <%end if%>
<%end if%>
<%if FkProduttore>0 and richiesta_produttore=1 then%>
<%
ric=request("ric")
if ric="" then ric=0

if ric=1 then
  email=request("email")
  nome=request("nome")
  telefono=request("telefono")
  richiesta=request("richiesta")
  if InStr(richiesta, "http")>0 or InStr(richiesta, "www")>0 or InStr(richiesta, "href")>0 then
    invioemail="no"
  Else
    invioemail="si"
  end if
  ip=Request.ServerVariables("REMOTE_ADDR")

  if email<>"" and invioemail="si" and ip<>"194.226.137.235" then

		data=date()

		HTML1 = ""
		HTML1 = HTML1 & "<html>"
		HTML1 = HTML1 & "<head>"
		HTML1 = HTML1 & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">"
		HTML1 = HTML1 & "<title>Cristalensi</title>"
		HTML1 = HTML1 & "</head>"
		HTML1 = HTML1 & "<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"
		HTML1 = HTML1 & "<table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td>"
		HTML1 = HTML1 & "<font face=Verdana size=1 color=#000000>E' stata fatta la seguente richiesta di informazioni su i prodotti di un produttore dal sito il "&data&"<br><br>Dati della richiesta:<br>Nome e Cognome: <b>"&nome&"</b><br>Telefono: <b>"&telefono&"</b><br>E-mail: <b>"&email&"</b><br>IP connessione: <b>"&ip&"</b><br><br>Produttore: <b>"&titolo_produttore&"</b><br>Codice progressivo produttore: <b>"&id&"</b><br><br>Richiesta:<br><b>"&richiesta&"</b></font>"
		HTML1 = HTML1 & "</td></tr></table>"
		HTML1 = HTML1 & "</body>"
		HTML1 = HTML1 & "</html>"

		Destinatario = "info@cristalensi.it"
		Mittente = "info@cristalensi.it"
		Oggetto = "Richiesta informazioni sul produttore: "&titolo_produttore
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

		Destinatario = "viadeimedici@gmail.com"
		Mittente = "info@cristalensi.it"
		Oggetto = "Richiesta informazioni sul produttore: "&titolo_produttore
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


		'email di conferma per il cliente
		HTML1 = ""
		HTML1 = HTML1 & "<html>"
		HTML1 = HTML1 & "<head>"
		HTML1 = HTML1 & "<meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">"
		HTML1 = HTML1 & "<title>Cristalensi</title>"
		HTML1 = HTML1 & "</head>"
		HTML1 = HTML1 & "<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>"
		HTML1 = HTML1 & "<table width='100%' border='0' cellspacing='0' cellpadding='0'><tr><td>"
		HTML1 = HTML1 & "<font face=Verdana size=1 color=#000000>E' stata inviata la seguente richiesta di informazioni dal sito Cristalensi.it il "&data&"<br><br>Dati della richiesta:<br>Nome e Cognome: <b>"&nome&"</b><br>Telefono: <b>"&telefono&"</b><br>E-mail: <b>"&email&"</b><br><br>Produttore: <b>"&titolo_produttore&"</b><br><br>Richiesta:<br><b>"&richiesta&"</b><br><br><br><br>Questa &egrave; un'email di conferma dell'invio della richiesta.<br><br>La ringraziamo per aver scelto i prodotti di Cristalensi</font>"
		HTML1 = HTML1 & "</td></tr></table>"
		HTML1 = HTML1 & "</body>"
		HTML1 = HTML1 & "</html>"

		Destinatario = email
		Mittente = "info@cristalensi.it"
		Oggetto = "Richiesta informazioni sul produttore: "&titolo_produttore
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

	else
		ric=0
	end if

end if
%>
<SCRIPT language="JavaScript">
  function verifica_request() {

  email=document.requestform.email.value;
  richiesta=document.requestform.richiesta.value;

  if (email==""){
    alert("Non  e\' stato compilato il campo \"Email\".");
    return false;
  }
  if (email.indexOf("@")==-1 || email.indexOf(".")==-1){
  alert("ATTENZIONE! \"e-mail\" non valida.");
  return false;
  }
  if (richiesta.indexOf("https")>-1 || richiesta.indexOf("http")>-1 || richiesta.indexOf("www")>-1 || richiesta.indexOf("href")>-1){
  alert("ATTENZIONE! Non possono essere inseriti indirizzi di siti internet.");
  return false;
  }

    else

      document.requestform.method = "post";
      document.requestform.action = "<%=toUrl_completo%>";
      document.requestform.submit();
  }

</SCRIPT>
<div style="display: none; max-width: 800px;" id="hidden-content-produttori">
    <h4>Invia richiesta disponibilit&agrave; prodotti per<br /><b><%=titolo_produttore%></b></h4>
    <%if ric=1 then%>
    <p><strong>La richiesta &egrave; stata inoltrata correttamente, il nostro staff ti contatter&agrave; il prima possibile.<br />Saluti da CRISTALENSI</strong></p>
    <%else%>
    <p class="description">Inserisci quanti pi&uacute; dati possibili cos&iacute; da facilitare la ricerca al nostro staff, grazie.</p>
    <form class="form-horizontal" name="requestform" id="requestform" onSubmit="return verifica_request();">
    <input type="hidden" name="ric" value="1" />
        <div class="form-group">
            <label for="nome" class="col-sm-4 control-label">Nome e Cognome</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="nome" name="nome">
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-4 control-label">Indirizzo Email</label>
            <div class="col-sm-8">
                <input type="email" class="form-control" id="email" name="email">
            </div>
        </div>
        <div class="form-group">
            <label for="telefono" class="col-sm-4 control-label">Telefono</label>
            <div class="col-sm-8">
                <input type="number" class="form-control" id="telefono" name="telefono">
            </div>
        </div>
        <div class="form-group">
            <label for="richiesta" class="col-sm-4 control-label">Dettagli richiesta</label>
            <div class="col-sm-8">
                <textarea class="form-control" name="richiesta" id="richiesta"></textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-8">
                <button type="submit" id="inviarichiesta" class="btn btn-danger">invia richiesta</button>
            </div>
        </div>
    </form>
    <%end if%>
</div>
<%end if%>
<!-- fine finestra modale -->
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/javascripts/bootstrap.min.js"></script>
<script src="/javascripts/jquery.bootstrap-touchspin.min.js"></script>
<script src="/javascripts/bootstrap-select.min.js"></script>
<script src="/javascripts/readmore.min.js"></script>
<script src="/javascripts/jquery.fancybox.min.js"></script>
<script src="/javascripts/custom.js"></script>
<script>
    // $("input[name='pezzi']").TouchSpin({
    //     // verticalbuttons: true,
    //     // verticalupclass: 'glyphicon glyphicon-plus',
    //     // verticaldownclass: 'glyphicon glyphicon-minus'
    // });
    $('.selectpicker').selectpicker({
        style: 'btn-default'
    });
    $(document).ready(function() {
        $.fancybox.defaults.hash = false;
    });
    <% if ric=1 then %>
    $(document).ready(function() {
        $(".launch").fancybox().trigger('click');
    });
    <% end if %>
    <% if ric=2 then %>
    $(document).ready(function() {
        $(".launch-prev").fancybox().trigger('click');
    });
    <% end if %>
</script>
