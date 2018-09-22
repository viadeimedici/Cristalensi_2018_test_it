<!--#include file="inc_strConn.asp"-->
<!DOCTYPE html>
<html>

<head>
    <title>Produttori articoli illuminazione marche CRISTALENSI</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Elenco produttori articoli illuminazione, elenco di imprese illuminazione, catalogo dei produttori di lampadari, piantane, plafoniere, lampade esterne, ventilatori, prodotti per bambini.">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Elenco produttori articoli illuminazione, elenco di imprese illuminazione, catalogo dei produttori di lampadari, piantane, plafoniere, lampade esterne, ventilatori, prodotti per bambini.">
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
    <link rel="stylesheet" type="text/css" href="stylesheets/camera.css" shim-shadowdom>
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
    <!--#include file="inc_header_1.asp"-->
    <!--#include file="inc_header_2.asp"-->
    <div class="container content">
        <div class="col-md-12">
            <div class="row top-buffer">
                <div class="col-xl-12 clearfix">
                    <h1 class="slogan">Elenco produttori articoli per illuminazione</h1>
                </div>
                <p class="description">
                  Questo &eacute; l'elenco delle imprese produttrici di articoli per illuminazione che riforniscono il nostro negozio.<br>
Scegliendo un produttore vedrete l'elenco dei suoi prodotti, da l&igrave; potete accedere alla scheda del prodotto e acquistarlo. Se cercate un articolo specifico di un produttore, ma non lo trovate nel suo elenco, contattate il nostro staff per avere informazioni e un preventivo: nel catalogo sul sito internet non sono presenti tutti i prodotti, &eacute; stata fatta una selezione dai singoli cataloghi dei produttori.</i>.
                </p>
                <p>&nbsp;</p>
                <%
                Set prod_rs = Server.CreateObject("ADODB.Recordset")
  							sql = "SELECT * FROM Produttori ORDER BY Titolo ASC"
  							prod_rs.open sql,conn, 1, 1
  							if prod_rs.recordcount>0 then
                %>
                <%
                Do while not prod_rs.EOF

                id=prod_rs("PkId")
                titolo=prod_rs("titolo")
                descrizione=prod_rs("descrizione")
                file_img=NoLettAcc(prod_rs("logo"))
                'link=prod_rs("prodotti")

                'url="https://www.cristalensi.it/prodotti.asp?FkProduttore="&id
                url="/produttori-illuminazione/"&ConvertiTitoloInUrlProduttore(Titolo, Id)
  							%>
                <div class="col-xs-4 col-sm-3 col-md-2 col-lg-2">
                  <article class="col-item">
                      <div class="photo">
                          <a href="<%=url%>" class="prod-img-replace" style="background-image: url(https://www.cristalensi.it/public/<%=file_img%>)" title="<%=titolo%>"><img alt="<%=titolo%>" src="/images/blank.png"></a>
                      </div>
                      <div class="info">
                          <div class="row">
                              <div class="price-details col-md-6">
                                  <a href="<%=url%>" title="<%=titolo%>"><h3><%=titolo%></h3></a>
                              </div>
                          </div>

                          <div class="clearfix"></div>
                      </div>
                  </article>
                </div>
                <%
                prod_rs.movenext
                loop
                end if
                prod_rs.close
                %>
            </div>

        </div>
    </div>
    <!--#include file="inc_footer.asp"-->
    <script type='text/javascript' src='javascripts/camera.js'></script>
    <script type='text/javascript' src='javascripts/jquery.easing.1.3.js'></script>
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
