<!--#include file="inc_strConn.asp"-->
<%
	id=request("id")
	if id="" then id=0

	mode=request("mode")
	if mode="" then mode=0

	if idsession=0 then
		if id>0 then Session("id_prodotto_preferiti")=id
		response.Redirect("/iscrizione.asp?prov=2")
	end if

	if idsession>0 and mode=0 then
		if id=0 then id=Session("id_prodotto_preferiti")
		if id="" then id=0

		if id>0 then
			Set ts = Server.CreateObject("ADODB.Recordset")
			sql = "SELECT * FROM Prodotti where PkId="&id
			ts.Open sql, conn, 1, 1
				PrezzoProdotto=ts("PrezzoProdotto")
				PrezzoListino=ts("PrezzoListino")
				if PrezzoProdotto=0 or isNull(PrezzoProdotto) then
					PrezzoProdotto=PrezzoListino
				end if
				Titolo=ts("Titolo")
				CodiceArticolo=ts("CodiceArticolo")
				NomePagina=ts("NomePagina")
			ts.close

			Set ts = Server.CreateObject("ADODB.Recordset")
			sql = "SELECT * FROM Preferiti"
			ts.Open sql, conn, 3, 3
				ts.addnew
				ts("FkCliente")=idsession
				ts("FkProdotto")=id
				ts("Titolo")=Titolo
				ts("CodiceArticolo")=CodiceArticolo
				ts("PrezzoProdotto")=PrezzoProdotto
				ts("NomePagina")=NomePagina
				ts("Data")=Now()
				ts.update
			ts.close

			Session("id_prodotto_preferiti")=0
			'Session.Contents.Remove("Nome_Variabile")'
		end if
	end if



'eliminazione prodotto/riga dai preferiti
	if mode=1 then
		riga=request("riga")
		if riga="" or isnull(riga) then riga=0
		'response.write("riga:"&riga)
		if riga>0 then
			Set ts = Server.CreateObject("ADODB.Recordset")
			sql = "SELECT * FROM Preferiti where PkId="&riga
			ts.Open sql, conn, 3, 3
				ts.delete
				ts.update
			ts.close
		end if
	end if

%>
<!DOCTYPE html>
<html>

<head>
    <title>Cristalensi - Elenco prodotti preferiti</title>
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
    <link rel="manifest" href="manifest.json">
    <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#2790cf">
    <meta name="msapplication-TileColor" content="#2790cf">
    <meta name="msapplication-TileImage" content="/mstile-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <link href="stylesheets/styles.css" media="screen" rel="stylesheet" type="text/css">
	<link href="stylesheets/jquery.fancybox.min.css" media="screen" rel="stylesheet" type="text/css">
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
	<%
		Set rs = Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * FROM Preferiti WHERE FkCliente="&idsession&""
		rs.Open sql, conn, 1, 1
		num_prodotti_carrello=rs.recordcount

	%>
    <div class="container content">
        <div class="row hidden">
            <div class="col-md-12 parentOverflowContainer">
            </div>
        </div>
        <div class="col-sm-12">
            <div class="col-md-8">
                <div class="row">
                    <div class="title" style="padding-top:40px;">
                        <h4>Elenco prodotti preferiti</h4>
                    </div>
                    <div class="col-md-12">
                        <div class="top-buffer" style="padding-top:20px;">
                            <table id="cart" class="table table-hover table-condensed table-cart">
                                <thead>
                                    <tr>
                                        <th style="width:60%">Prodotto</th>
                                        <th style="width:20%">Prezzo</th>
                                        <th style="width:20%"></th>
                                    </tr>
                                </thead>

																<%if rs.recordcount>0 then%>
																<tbody>
																		<%
																		Do while not rs.EOF

																		NomePagina=rs("NomePagina")

																		if Len(NomePagina)>0 then
																			NomePagina="/public/pagine/"&NomePagina
																		else
																			NomePagina="#"
																		end if
																		%>
																		<form method="post" action="/preferiti.asp?mode=1&riga=<%=rs("pkid")%>">
																		<tr>
                                        <td data-th="Product" class="cart-product">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <h5 class="nomargin"><a href="<%=NomePagina%>" title="Scheda del prodotto: <%=NomePagina%>"><%=rs("titolo")%></a></h5>
																										<p><strong>Codice: <%=rs("codicearticolo")%></strong></p>
                                                </div>
                                            </div>
                                        </td>
                                        <td data-th="Price" class="hidden-xs"><%=FormatNumber(rs("PrezzoProdotto"),2)%>&euro;</td>
                                        <td class="actions" data-th="">
                                            <button class="btn btn-danger btn-sm" type="submit"><i class="fa fa-trash-o"></i></button>
                                            <button class="btn btn-info btn-sm" type="button" onClick="location.href='<%=NomePagina%>'"><i class="fa fa-shopping-cart"></i></button>
                                        </td>
                                    </tr>
																		</form>
																		<%
																		rs.movenext
																		loop
																		%>

																	</tbody>
																	<tfoot>
	                                    <tr>
	                                        <td><a href="<%=fromURL_preferiti%>" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continua gli acquisti</a></td>
	                                        <td colspan="2" class="hidden-xs"></td>
	                                    </tr>
	                                </tfoot>

																<%else%>
																	<tbody>
																	<tr>
																			<td data-th="Product" class="cart-product">
																					<div class="row">
																							<div class="col-sm-12">
																									<h5 class="nomargin"><br>Nessun prodotto nei Preferiti</h5>
																							</div>
																			</td>
																	</tr>
																	</tbody>
																<%end if%>


                            </table>

                        </div>
                    </div>

                </div>
            </div>
            <div class="col-md-4">

								<!--condizioni di vendita-->
								<div class="panel panel-default payment-list">
										<!-- Default panel contents -->
										<div class="panel-heading">
											<h5>Condizioni di vendita</h5>
										</div>
										<ul class="list-group">
											<li class="list-group-item"><strong>SPEDIZIONE ASSICURATA IN TUTTA ITALIA</strong></li>
											<li class="list-group-item"><i class="fa fa-check"></i> <em>Per ordini superiori a 250&euro;:</em><div style="float: right;"><em><strong>0&euro;</strong></em></div></li>
											<li class="list-group-item"><i class="fa fa-check"></i> <em>Per ordini fino a  250&euro;:</em><div style="float: right;"><em><strong>10&euro;</strong></em></div></li>
											<li class="list-group-item"><i class="fa fa-check"></i> <em>Ritiro in sede:</em><div style="float: right;"><em><strong>0&euro;</strong></em></div></li>
											<li class="list-group-item">&nbsp;</li>
											<li class="list-group-item"><strong>PAGAMENTI SICURI</strong></li>
											<li class="list-group-item"><i class="fa fa-check"></i> <em>Bonifico e PostePay:</em><div style="float: right;"><em><strong>0&euro;</strong></em></div></li>
											<li class="list-group-item"><i class="fa fa-check"></i> <em>Carte di credito e prepagate:</em><div style="float: right;"><em><strong>0&euro;</strong></em></div></li>
											<li class="list-group-item"><i class="fa fa-check"></i> <em>Contrassegno in contanti:</em><div style="float: right;"><em><strong>4&euro;</strong></em></div></li>
										</ul>
										<div class="panel-footer"><a href="/condizioni_di_vendita.asp" class="btn btn-default">Condizioni di vendita <i class="fa fa-chevron-right"></i></a></div>
								</div>
								<!--#include file="inc_box_contatti.asp"-->
            </div>
        </div>

		</div>
		<%
		ss.close
		rs.close
		%>
    <!--#include file="inc_footer.asp"-->
</body>
<!--#include file="inc_strClose.asp"-->
