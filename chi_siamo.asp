/<!--#include file="inc_strConn.asp"-->
<!DOCTYPE html>
<html>

<head>
    <title>Negozio lampadari Firenze prodotti illuminazione</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Cristalensi, negozio lampadari vicino Firenze, vende prodotti per illuminazione da interno, illuminazione da esterno, lampadari, piantane, plafoniere, lampade da esterno, ventilatori, lampade per bambini e lampade per il bagno, prodotti in molti stili dal moderno al classico.">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Cristalensi, negozio lampadari vicino Firenze, vende prodotti per illuminazione da interno, illuminazione da esterno, lampadari, piantane, plafoniere, lampade da esterno, ventilatori, lampade per bambini e lampade per il bagno, prodotti in molti stili dal moderno al classico.">
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
    <link href="/stylesheets/jquery.fancybox.min.css" media="screen" rel="stylesheet" type="text/css">
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
            <!--#include file="inc_slider.asp"-->
            <div class="row top-buffer">
                <div class="col-md-8">
                    <h1 class="slogan">Cristalensi vuol dire illuminazione:<br />negozio di lampadari vicino Firenze</h1>
                    <p class="main-description">
                      <strong>Da pi&ugrave; 50 anni</strong>, la prerogativa di questo affermato negozio di lampadari &eacute; fornire alla clientela una <strong>vasta e raffinata gamma di prodotti di illuminazione da interno ed esterno</strong> volti a soddisfare esigenze <strong>classiche e moderne</strong>.
                          Lampadari, plafoniere, appliques, lumi da tavolo, fari, faretti e lampade LED fanno bella mostra di s&eacute; nella <strong>sala espositiva</strong> dell'azienda stessa.<br><br>
                          Grazie ad una privilegiata posizione stradale, (tra Firenze, Pisa e Siena: <a href="/contatti.asp" title="Negozio illuminazione Firenze">vedi la mappa</a>) e favoriti da un <strong>ampio parcheggio</strong>, il negozio di lampadari offre la possibilit&agrave; di una visita in tutta tranquillit&agrave; al nostro <strong>showroom</strong>.<br><br>
                          Piscine, parchi e giardini assumono un aspetto caratteristico grazie al gioco di luci ed ombre creato da <strong>tecnici esperti</strong> per il montaggio in esterni:
                          l'azienda Cristalensi offre un <strong>servizio completo</strong> alla sua clientela, offrendo <strong>preventivi gratuiti</strong> con <strong>sopralluoghi</strong> all'ambiente da illuminare.
                    </p>
                </div>
                <%
                Set com_rs = Server.CreateObject("ADODB.Recordset")
                sql = "SELECT TOP 3 * FROM Commenti_Clienti WHERE Pubblicato=1 ORDER BY PkId DESC"
                com_rs.open sql,conn, 1, 1
                if com_rs.recordcount>0 then
                %>
                <div class="col-md-4 ">
                    <div class="panel panel-default user-comment">
                        <!-- Default panel contents -->
                        <div class="panel-heading">
                            <h5><i class="fa fa-users"></i> Dicono di noi...</h5>
                        </div>
                        <ul class="list-group">
                            <%Do While not com_rs.EOF%>
                            <li class="list-group-item"><i class="fa fa-user"></i> <em><%=Left(NoHTML(com_rs("Testo")), 90)%>... Voto: <%=com_rs("Valutazione")%>/5</em></li>
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
                    <h4 class="subtitle pull-left"><div class="dot"></div><span>Foto del negozio</span></h4>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/17.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/17.jpg)" title="Negozio illuminazione - Entrata e parcheggio"><img alt="Negozio illuminazione - Entrata e parcheggio" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/18.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/18.jpg)" title="Negozio illuminazione - Staff"><img alt="Negozio illuminazione - Staff" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/19.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/19.jpg)" title="Negozio lampadari - Panoramica"><img alt="Negozio lampadari - Panoramica" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/20.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/20.jpg)" title="Negozio lampadari Firenze - Panoramica"><img alt="Negozio lampadari Firenze - Panoramica" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/21.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/21.jpg)" title="Negozio lampade rustiche"><img alt="Negozio lampade rustiche" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/22.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/22.jpg)" title="Negozio lampadari in cristallo"><img alt="Negozio lampadari in cristallo" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>

                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/23.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/23.jpg)" title="Negozio illuminazione - Entrata e parcheggio"><img alt="Negozio illuminazione - Entrata e parcheggio" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/24.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/24.jpg)" title="Negozio illuminazione - Staff"><img alt="Negozio illuminazione - Staff" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/25.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/25.jpg)" title="Negozio lampadari - Panoramica"><img alt="Negozio lampadari - Panoramica" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/26.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/26.jpg)" title="Negozio lampadari Firenze - Panoramica"><img alt="Negozio lampadari Firenze - Panoramica" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/27.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/27.jpg)" title="Negozio lampade rustiche"><img alt="Negozio lampade rustiche" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/28.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/28.jpg)" title="Negozio lampadari in cristallo"><img alt="Negozio lampadari in cristallo" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>

                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/5.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/5.jpg)" title="Negozio illuminazione - Entrata e parcheggio"><img alt="Negozio illuminazione - Entrata e parcheggio" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/6.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/6.jpg)" title="Negozio illuminazione - Staff"><img alt="Negozio illuminazione - Staff" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/1.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/1.jpg)" title="Negozio lampadari - Panoramica"><img alt="Negozio lampadari - Panoramica" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/2.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/2.jpg)" title="Negozio lampadari Firenze - Panoramica"><img alt="Negozio lampadari Firenze - Panoramica" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/3.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/3.jpg)" title="Negozio lampade rustiche"><img alt="Negozio lampade rustiche" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/4.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/4.jpg)" title="Negozio lampadari in cristallo"><img alt="Negozio lampadari in cristallo" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>


                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/10.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/10.jpg)" title="Negozio lampadari moderni"><img alt="Negozio lampadari moderni" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/11.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/11.jpg)" title="Negozio ventilatori con lampade"><img alt="Negozio ventilatori con lampade" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/13.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/13.jpg)" title="Negozio lampadari - Panoramica"><img alt="Negozio lampadari - Panoramica" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>

                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/8.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/8.jpg)" title="Negozio lampadari - Panoramica"><img alt="Negozio lampadari - Panoramica" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>

                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/15.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/15.jpg)" title="Negozio lampade da esterni"><img alt="Negozio lampade da esterni" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>

                <div class="col-xs-6 col-sm-3 col-md-2 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/images/chi-siamo/grandi/16.jpg" data-fancybox="group" data-caption="Caption #1" class="prod-img-replace" style="background-image: url(/images/chi-siamo/piccole/16.jpg)" title="Negozio lampade da esterni"><img alt="Negozio lampade da esterni" src="images/blank.png"></a>
                        </div>
                    </article>
                </div>

            </div>


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
