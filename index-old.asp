<!--#include file="inc_strConn.asp"-->
<!DOCTYPE html>
<html>

<head>
    <title>Vendita lampadari online | illuminazione interni | illuminazione da esterno</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Cristalensi, specializzato in vendita di lampari online. Showroom di lampade vicino Firenze, illuminazione interni, illuminazione da esterno, piantane, plafoniere, ventilatori, applique e faretti. Trovi ampia scelta di lampadari moderni, classici, rustici, in cristallo, in gesso, vetro Murano e lampade a LED.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Cristalensi, specializzato in vendita di lampari online. Showroom di lampade vicino Firenze, illuminazione interni, illuminazione da esterno, piantane, plafoniere, ventilatori, applique e faretti. Trovi ampia scelta di lampadari moderni, classici, rustici, in cristallo, in gesso, vetro Murano e lampade a LED.">
    <link rel="alternate" href="https://www.cristalensi.it/" hreflang="it-it" />
		<link rel="alternate" href="https://www.cristalensi.com/de/" hreflang="de-de" />
		<link rel="alternate" href="https://www.cristalensi.com/" hreflang="en-GB" />
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="apple-touch-icon-57x57.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="apple-touch-icon-114x114.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="apple-touch-icon-72x72.png" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="apple-touch-icon-144x144.png" />
    <link rel="apple-touch-icon-precomposed" sizes="60x60" href="apple-touch-icon-60x60.png" />
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="apple-touch-icon-120x120.png" />
    <link rel="apple-touch-icon-precomposed" sizes="76x76" href="apple-touch-icon-76x76.png" />
    <link rel="apple-touch-icon-precomposed" sizes="152x152" href="apple-touch-icon-152x152.png" />
    <link rel="icon" type="image/png" href="favicon-196x196.png" sizes="196x196" />
    <link rel="icon" type="image/png" href="favicon-96x96.png" sizes="96x96" />
    <link rel="icon" type="image/png" href="favicon-32x32.png" sizes="32x32" />
    <link rel="icon" type="image/png" href="favicon-16x16.png" sizes="16x16" />
    <link rel="icon" type="image/png" href="favicon-128.png" sizes="128x128" />
    <meta name="application-name" content="&nbsp;"/>
    <meta name="msapplication-TileColor" content="#FFFFFF" />
    <meta name="msapplication-TileImage" content="mstile-144x144.png" />
    <meta name="msapplication-square70x70logo" content="mstile-70x70.png" />
    <meta name="msapplication-square150x150logo" content="mstile-150x150.png" />
    <meta name="msapplication-wide310x150logo" content="mstile-310x150.png" />
    <meta name="msapplication-square310x310logo" content="mstile-310x310.png" />

    <link href="stylesheets/styles.css" media="screen" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="stylesheets/customization.css" shim-shadowdom>
    <link rel="stylesheet" type="text/css" href="stylesheets/camera.css" shim-shadowdom>
    <!--[if lt IE 9]><script src="javascripts/html5shiv.js"></script><![endif]-->
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,400i,500,600,700" rel="stylesheet">
    <!--#include virtual="/inc_funzioni_head.asp"-->
</head>

<body>
    <!--#include file="inc_header_1.asp"-->
    <!--#include file="inc_header_2.asp"-->
    <div class="container content">
        <div class="col-md-12">
            <!--#include file="inc_slider.asp"-->
            <div class="row top-buffer" itemscope itemtype="http://schema.org/WebSite">
              <link itemprop="url" href="https://www.cristalensi.it/"/>
                <div class="col-md-8">
                    <h1 class="slogan">Cristalensi, vendita lampadari online.</h1>
                    <h2 class="slogan">Illuminazione da oltre 50 anni!</h2>
                    <p class="main-description">
                        A portata di click una vasta e raffinata gamma di prodotti per illuminazione interni ed illuminazione da esterno per arredare la casa, il giardino, un ufficio oppure un locale...<br />Naviga nel catalogo online oppure visita il nostro Showroom, soddisferemo tutte le tue esigenze: trovi in vendita <b>lampadari</b>
                        moderni e classici, <b>applique</b>, <b>plafoniere</b> e <b>piantane</b> ma anche <b>faretti</b> e <b>ventilatori con luce</b>. Tanti prodotti per <b>illuminazione a LED</b>, <b>in cristallo</b> e <b>vetro Murano</b>, in stile
                        <b>Tiffany</b>, <b>rustici</b> o <b>vintage</b>. Abbiamo anche un'ampia esposizione di lampade da esterno sia <b>moderne</b> che <b>classiche</b> e articoli specifici <b>per bambini</b>, camerette e tutti gli altri ambienti della casa.<br />Sono presenti anche lampade per uffici, negozi, locali, aziende e ambienti professionali.<br />
                        Nello shop online trovi l'area delle <b>lampade in offerta</b> oppure puoi fare una ricerca sia per <b>marche</b>, per <b>stile</b> o per <b>ambiente</b>: vendita di lampadari online per privati e per aziende.<br />
                        Uno staff cordiale e professionale &egrave; pronto a consigliarti l'acquisto pi&ugrave; adatto alle tue richieste.
                    </p>
                </div>
                <%
                Set com_rs = Server.CreateObject("ADODB.Recordset")
                sql = "SELECT TOP 3 * FROM Commenti_Clienti WHERE Pubblicato=1 ORDER BY PkId DESC"
                com_rs.open sql,conn, 1, 1
                if com_rs.recordcount>0 then
                %>
                <div class="col-md-4 ">
                    <div class="panel panel-default user-comment" itemprop="review" itemscope itemtype="http://schema.org/Review">
                        <!-- Default panel contents -->
                        <div class="panel-heading">
                            <h5><i class="fa fa-users"></i> Dicono di noi...</h5>
                        </div>
                        <ul class="list-group">
                            <%Do While not com_rs.EOF%>
                            <%
                            Set cr_rs = Server.CreateObject("ADODB.Recordset")
                            sql = "SELECT PkId, Nome FROM Clienti WHERE PkId="&com_rs("FkIscritto")
                            cr_rs.open sql,conn, 1, 1
                            if cr_rs.recordcount>0 then
                              NomeIscritto=cr_rs("Nome")
                            end if
                            cr_rs.close
                            %>
                            <li class="list-group-item"><i class="fa fa-user"></i> <em><span itemprop="description"><%=Left(NoHTML(com_rs("Testo")), 90)%>...</span><span itemprop="author" style="display: none;"><%=NomeIscritto%></span> <span itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">Voto: <meta itemprop="worstRating" content = "1"><span itemprop="ratingValue"><%=com_rs("Valutazione")%></span>/<span itemprop="bestRating">5</span></span></em></li>
                            <%
                            com_rs.movenext
            								loop
                            %>
                        </ul>
                        <div class="panel-footer"><a href="commenti_elenco.asp" class="btn btn-default">leggi tutti i commenti <i class="fa fa-chevron-right"></i></a></div>
                    </div>
                </div>
                <%
                end if
                com_rs.close
                %>
            </div>
            <div class="row top-buffer">
                <div class="col-xl-12 clearfix">
                    <h4 class="subtitle"><div class="dot"></div><span>Cosa stai cercando?</span></h4>
                </div>
                <div class="col-xs-6 col-sm-4 col-md-3 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/illuminazione-interni-ed-esterni/1ng-lampade-da-interno.asp" class="prod-img-replace" style="background-image: url(images/home-lampade-da-interno.jpg)" title="Lampade da interno e illuminazione interni"><img alt="Lampade da interno" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="/illuminazione-interni-ed-esterni/1ng-lampade-da-interno.asp" title="Lampade da interno e illuminazione interni"><h3>Lampade da interno</h3></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/illuminazione-interni-ed-esterni/2ng-lampade-da-esterno.asp" class="prod-img-replace" style="background-image: url(images/home-lampade-da-esterno.jpg)" title="Lampade da esterno e illuminazione esterni"><img alt="Lampade da esterno" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="/illuminazione-interni-ed-esterni/2ng-lampade-da-esterno.asp" title="Lampade da esterno e illuminazione esterni"><h3>Lampade da esterno</h3></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/illuminazione-interni-ed-esterni/3ng-ventilatori.asp" class="prod-img-replace" style="background-image: url(images/home-ventilatori.jpg)" title="Ventilatori"><img alt="Ventilatori" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="/illuminazione-interni-ed-esterni/3ng-ventilatori.asp" title="Ventilatori"><h3>Ventilatori</h3></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-4 col-md-3 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/illuminazione-interni-ed-esterni/4ng-lampadine-componenti-illuminazione.asp" class="prod-img-replace" style="background-image: url(images/home-lampadine.jpg)" title="Lampadine"><img alt="Lampadine" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="/illuminazione-interni-ed-esterni/4ng-lampadine-componenti-illuminazione.asp" title="Lampadine"><h3>Lampadine, driver e strisce</h3></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
            <div class="row top-buffer">
                <div class="col-xl-12 clearfix">
                    <h4 class="subtitle"><div class="dot"></div><span>Offerte e prodotti in promozione</span></h4> <a href="/offerte.asp" class="btn btn-warning pull-right hidden-xs" title="Offerte e prodotti in promozione">Vedi tutte le Offerte <i class="fa fa-chevron-right"></i></a>
                    <a href="offerte.asp" class="btn btn-warning btn-block hidden visible-xs bottom-buffer" style="">vedi tutto <i class="fa fa-chevron-right"></i></a>
                </div>
                <%
                'random prodotti in offerta
                Set prod_rs = Server.CreateObject("ADODB.Recordset")
                sql = "SELECT pkid,codicearticolo,titolo,prezzoprodotto,prezzolistino,nomepagina,offerta,fkproduttore FROM Prodotti WHERE Offerta=1 OR Offerta=2 ORDER BY Titolo ASC"
                prod_rs.open sql,conn, 1, 1

                Randomize()
                constnum = 8

                if prod_rs.recordcount>0 then
                  IF NOT prod_rs.EOF THEN
                  rndArray = prod_rs.GetRows()
                  prod_rs.Close
                %>
                <%
  								Lenarray =  UBOUND( rndArray, 2 ) + 1
  								skip =  Lenarray  / constnum
  								IF Lenarray <= constnum THEN skip = 1
  								FOR i = 0 TO Lenarray - 1 STEP skip
  									numero = RND * ( skip - 1 )
  									id = rndArray( 0, i + numero )
  									codicearticolo = rndArray( 1, i + numero )
  									titolo_prodotto = rndArray( 2, i + numero )
  									prezzoarticolo = rndArray( 3, i + numero )
                    if prezzoarticolo="" or isNull(prezzoarticolo) then prezzoarticolo=0
  									prezzolistino = rndArray( 4, i+ numero )
                    if prezzolistino="" or isNull(prezzolistino) then prezzolistino=0

  									NomePagina = rndArray( 5, i+ numero )
  									if Len(NomePagina)>0 then
  										NomePagina="public/pagine/"&NomePagina
  										'NomePagina="/public/pagine/inc_scheda_prodotto.asp?id="&id
  									else
  										NomePagina="#"
  									end if

                    fkproduttore_pr = rndArray( 7, i + numero )
                    if fkproduttore_pr="" then fkproduttore_pr=0
                    'response.write("fkproduttore:"&fkproduttore)

                      if fkproduttore_pr>0 then
                        Set pr_rs = Server.CreateObject("ADODB.Recordset")
                        sql = "SELECT * FROM Produttori WHERE PkId="&fkproduttore_pr&""
                        pr_rs.open sql,conn, 1, 1
                        if pr_rs.recordcount>0 then
                          produttore=pr_rs("titolo")
                          url_produttore="/produttori-illuminazione/"&ConvertiTitoloInUrlProduttore(produttore, fkproduttore_pr)
                        end if
                        pr_rs.close
                      end if


  									'recupero l'immagine
  									Set img_rs = Server.CreateObject("ADODB.Recordset")
  									sql = "SELECT * FROM Immagini WHERE Record="&id&" AND Tabella='Prodotti' Order by PkId_Contatore ASC"
  									img_rs.open sql,conn, 1, 1
  									if img_rs.recordcount>0 then
  										tot_img=img_rs.recordcount
  										titolo_img=img_rs("titolo")
  										file_img=NoLettAcc(img_rs("file"))
                      file_img=Replace(file_img, "&rsquo;", "")
                    end if
                    img_rs.close

  							%>
                <div class="col-xs-12 col-sm-4 col-md-3">
                  <article class="col-item">
                      <div class="photo">
                          <a href="/<%=NomePagina%>" class="prod-img-replace" style="background-image: url(/public/<%=file_img%>)" title="<%=titolo_prodotto%>"><img alt="<%=titolo_prodotto%>" src="/images/blank.png"></a>
                      </div>
                      <div class="info">
                          <div class="row">
                              <div class="price-details col-md-6">
                                  <a href="/<%=NomePagina%>" title="<%=titolo_prodotto%>"><h3><%=titolo_prodotto%></h3></a>
                                  <p class="details"><span>codice: <b><%=codicearticolo%></b></span><span>produttore: <b><a href="<%=url_produttore%>"><%=produttore%></a></b></span></p>
                                  <div class="price-box separator">
                                      <%if prezzoarticolo<>0 then%>
                                        <span class="price-new"><i class="fa fa-tag"></i>&nbsp;<%=prezzoarticolo%> &euro;</span><br />
                                        <%if prezzolistino<>0 then%><span class="price-old">invece di  <b><%=prezzolistino%> &euro;</b></span><%else%>&nbsp;<%end if%>
                                      <%else%>
                                        <span class="price-new">&nbsp;<br /></span>
                                        <span class="price-old">Prezzo di listino: <b><%=prezzolistino%> &euro;</b></span>
                                      <%end if%>
                                  </div>
                              </div>
                          </div>
                          <div class="separator clear-left">
                              <p class="btn-add">
                                  <a href="/preferiti.asp?id=<%=id%>" rel="nofollow" class="hidden-lg" data-toggle="tooltip" data-placement="top" title="Aggiungi ai preferiti"><i class="fa fa-heart"></i></a>
                              </p>
                              <p class="btn-details">
                                  <a href="/<%=NomePagina%>" class="hidden-lg" data-toggle="tooltip" data-placement="top" title="vedi ed aggiungi al carrello">vedi scheda <i class="fa fa-chevron-right"></i></a>
                              </p>
                          </div>
                          <div class="clearfix"></div>
                      </div>
                  </article>
                </div>
                <%
                  NEXT
                  end if
                  else
                  prod_rs.close
                  end if
                %>
            </div>
            <%
            Set prod_rs = Server.CreateObject("ADODB.Recordset")
            sql = "SELECT Top 8 * FROM Prodotti WHERE (Offerta=0 or Offerta=2) ORDER BY PkId DESC"
            prod_rs.open sql,conn, 1, 1
            if prod_rs.recordcount>0 then
            %>
            <div class="row top-buffer">
                <div class="col-xl-12 clearfix">
                    <h4 class="subtitle"><div class="dot"></div><span>Novit&Agrave; illuminazione e ultimi arrivi</span></h4> <a href="/novita-illuminazione-ultimi-arrivi.asp" class="btn btn-warning pull-right hidden-xs" title="Novit&Agrave; illuminazione e ultimi arrivi">Vedi tutte le Novit&agrave; <i class="fa fa-chevron-right"></i></a>
                    <a href="/novita-illuminazione-ultimi-arrivi.asp" class="btn btn-warning btn-block hidden visible-xs bottom-buffer" style="">vedi tutto <i class="fa fa-chevron-right"></i></a>
                </div>
                <%
                Do while not prod_rs.EOF

                  id=prod_rs("pkid")
                  titolo_prodotto=prod_rs("titolo")
                  NomePagina=prod_rs("NomePagina")
                  if Len(NomePagina)>0 then
                    NomePagina="public/pagine/"&NomePagina
                    'NomePagina="/public/pagine/scheda_prodotto.asp?id="&id
                  else
                    NomePagina="#"
                  end if
                  codicearticolo=prod_rs("codicearticolo")
                  prezzoarticolo=prod_rs("PrezzoProdotto")
                  prezzolistino=prod_rs("PrezzoListino")

                  prezzoprodottosoloclienti=prod_rs("PrezzoProdottoSoloClienti")
                  if prezzoprodottosoloclienti=True THEN
                    prezzoprodottosoloclienti="si"
                  Else
                    prezzoprodottosoloclienti="no"
                  end if

                    fkproduttore_pr=prod_rs("fkproduttore")
                    if fkproduttore_pr="" then fkproduttore_pr=0

                    if fkproduttore_pr>0 then
                      Set pr_rs = Server.CreateObject("ADODB.Recordset")
                      sql = "SELECT * FROM Produttori WHERE PkId="&fkproduttore_pr&""
                      pr_rs.open sql,conn, 1, 1
                      if pr_rs.recordcount>0 then
                        produttore=pr_rs("titolo")
                        url_produttore="/produttori-illuminazione/"&ConvertiTitoloInUrlProduttore(produttore, fkproduttore_pr)
                      end if
                      pr_rs.close
                    end if

                    Set img_rs = Server.CreateObject("ADODB.Recordset")
                    sql = "SELECT * FROM Immagini WHERE Record="&id&" AND Tabella='Prodotti' Order by PkId_Contatore ASC"
                    img_rs.open sql,conn, 1, 1
                    if img_rs.recordcount>0 then
                      tot_img=img_rs.recordcount
                      titolo_img=img_rs("titolo")
                      file_img=NoLettAcc(img_rs("file"))
                      file_img=Replace(file_img, "&rsquo;", "")
                    end if
                    img_rs.close
                %>
                <div class="col-xs-12 col-sm-4 col-md-3">
                  <article class="col-item">
                      <div class="photo">
                          <a href="/<%=NomePagina%>" class="prod-img-replace" style="background-image: url(/public/<%=file_img%>)" title="<%=titolo_prodotto%>"><img alt="<%=titolo_prodotto%>" src="/images/blank.png"></a>
                      </div>
                      <div class="info">
                          <div class="row">
                              <div class="price-details col-md-6">
                                  <a href="/<%=NomePagina%>" title="<%=titolo_prodotto%>"><h3><%=titolo_prodotto%></h3></a>
                                  <p class="details"><span>codice: <b><%=codicearticolo%></b></span><span>produttore: <b><a href="<%=url_produttore%>"><%=produttore%></a></b></span></p>
                                  <div class="price-box separator">
                                      <%if prezzoarticolo<>0 then%>
                                        <%if idsession=0 and prezzoprodottosoloclienti="si" then%>
                                          <em><span class="price-new" style="color: #000;">SCONTO PER ISCRITTI !!!</span></em><br />
                                          <%if prezzolistino<>0 then%><span class="price-old">Prezzo di listino: <b><%=prezzolistino%> &euro;</b></span><%else%>&nbsp;<%end if%>
                                        <%else%>
                                          <span class="price-new"><i class="fa fa-tag"></i>&nbsp;<%=prezzoarticolo%> &euro;</span><br />
                                          <%if prezzolistino<>0 then%><span class="price-old">invece di  <b><%=prezzolistino%> &euro;</b></span><%else%>&nbsp;<%end if%>
                                        <%end if%>
                                      <%else%>
                                        <span class="price-new">&nbsp;<br /></span>
                                        <%if prezzolistino<>0 then%><span class="price-old">Prezzo di listino: <b><%=prezzolistino%> &euro;</b></span><%else%>&nbsp;<%end if%>
                                      <%end if%>
                                  </div>
                              </div>
                          </div>
                          <div class="separator clear-left">
                              <p class="btn-add">
                                  <a href="/preferiti.asp?id=<%=id%>" rel="nofollow" class="hidden-lg" data-toggle="tooltip" data-placement="top" title="Aggiungi ai preferiti"><i class="fa fa-heart"></i></a>
                              </p>
                              <p class="btn-details">
                                  <a href="/<%=NomePagina%>" class="hidden-lg" data-toggle="tooltip" data-placement="top" title="vedi ed aggiungi al carrello">vedi scheda <i class="fa fa-chevron-right"></i></a>
                              </p>
                          </div>
                          <div class="clearfix"></div>
                      </div>
                  </article>
                </div>
                <%
                prod_rs.movenext
                loop
                %>
            </div>
            <%
            end if
            prod_rs.close
            %>
        </div>
    </div>
    <!--#include file="inc_footer.asp"-->
    <script type='text/javascript' src='javascripts/camera.min.js'></script>
    <script type='text/javascript' src='javascripts/jquery.easing.1.3.min.js'></script>
    <script>
		jQuery(function(){

			jQuery('#slider').camera({
                height: '55%',
	            pagination: false,
				thumbnails: false,
                autoadvance: true,
                time: 5
			});
		});
	</script>
</body>
<!--#include file="inc_strClose.asp"-->
