<!--#include file="inc_strConn.asp"-->
<%if idsession=0 then response.Redirect("/iscrizione.asp")%>
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
    <link rel="stylesheet" type="text/css" href="stylesheets/customization.css" shim-shadowdom>
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
                <div class="col-md-8">
                    <h1 class="slogan">Area riservata ai Clienti Cristalensi</h1>
                    <p class="main-description">
                      Benvenuto!<br />Questa &egrave; la tua Area Privata e da qui potrai accedere ai servizi riservati ai clienti Cristalensi: elenco ordini, aggiornamento dati di registrazione, inserimento commenti su gli acquisti e i prodotti, elenco prodotti preferiti.
                    </p>
                </div>
            </div>
            <div class="row top-buffer">
                <div class="col-xl-12 clearfix">
                    <h4 class="subtitle pull-left"><div class="dot"></div><span>I servizi riservati</span></h4> <a href="/admin/logout.asp" class="btn btn-default pull-right">Esci dall'Area Clienti <i class="fa fa-chevron-right"></i></a>
                </div>
                <div class="col-xs-6 col-sm-4 col-md-3 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="ordini_elenco.asp" class="prod-img-replace" style="background-image: url(images/logo-cristalensi-piccolo.png)"><img alt="Elenco ordini" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="ordini_elenco.asp"><h3>Elenco ordini</h3></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <article class="col-item">
                        <div class="photo">
                            <a href="/preferiti.asp" class="prod-img-replace" style="background-image: url(images/logo-cristalensi-piccolo.png)"><img alt="Lista dei desideri" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="/preferiti.asp"><h3>Lista dei desideri</h3></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <article class="col-item">
                        <div class="photo">
                            <a href="commenti_form.asp" class="prod-img-replace" style="background-image: url(images/logo-cristalensi-piccolo.png)"><img alt="Inserisci un commento" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="commenti_form.asp"><h3>Inserisci un commento</h3></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
                <div class="col-xs-6 col-sm-4 col-md-3 ">
                    <article class="col-item">
                        <div class="photo">
                            <a href="iscrizione.asp" class="prod-img-replace" style="background-image: url(images/logo-cristalensi-piccolo.png)"><img alt="Modifica dati iscrizione" src="images/blank.png"></a>
                        </div>
                        <div class="info">
                            <div class="row">
                                <div class="category col-md-6">
                                    <a href="iscrizione.asp"><h3>Modifica dati iscrizione</h3></a>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </div>


        </div>
    </div>
    <!--#include file="inc_footer.asp"-->
</body>
<!--#include file="inc_strClose.asp"-->
