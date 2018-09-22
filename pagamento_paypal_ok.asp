<!--#include file="inc_strConn.asp"-->
<%'**********************PAYPAL**********************%>
<%
	'numero ordine passato da paypal
	cm=request("cm")

	Call Visualizzazione("",0,"pagamento_paypal_ok.asp")

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
									<h4><%=cm%></h4>
							</div>
							<div class="col-md-12 hidden-print">
									<p class="description">
									La procedura di pagamento con Paypal &egrave; stata completata e riceverai un'email di conferma sull'esito dell'operazione.<br>
													<br>
											L'ordine sar&agrave; messo in lavorazione al momento che l'amministrazione notificher&agrave; il pagamento.<br>
											<br>
											Potrai seguire lo stato del tuo ordine direttamente dalla Tua <a href="/areaprivata.asp">Area Clienti</a>, comunque sar&agrave; cura del nostro staff informarti per email dell'invio dei prodotti ordinati.
											<br><br>
											Cordiali saluti, lo staff di Cristalensi
											<br>
											<br>
									</p>
							</div>

        </div>
    </div>
    <!--#include file="inc_footer.asp"-->
</body>
