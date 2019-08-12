<!--#include file="inc_strConn.asp"-->
<%
'Call Visualizzazione("",0,"carrello1.asp")

	mode=request("mode")
	if mode="" then mode=0

	'se la session è già aperta sfrutto il pkid dell'ordine, altrimenti ne apro una
	IdOrdine=session("ordine_shop")
	if IdOrdine="" then IdOrdine=0

	id=request("id")
	if id="" then id=0

		if IdOrdine=0 and id<>0 then
			Set os1 = Server.CreateObject("ADODB.Recordset")
			sql = "SELECT Top 1 PkId, PkId_Contatore FROM Ordini Order by PkId_Contatore Desc"
			os1.Open sql, conn, 1, 1
			IdOrdine_ultimo=os1("PkId")
			IdOrdine_ultimo=CLng(IdOrdine_ultimo)
			IdOrdine=IdOrdine_ultimo+1
			os1.close

			Set os1 = Server.CreateObject("ADODB.Recordset")
			sql = "SELECT * FROM Ordini"
			os1.Open sql, conn, 3, 3

			os1.addnew
			os1("PkId")=IdOrdine
			os1("FkCliente")=idsession
			os1("stato")=0
			os1("TotaleCarrello")=0
			os1("TotaleGenerale")=0
			os1("DataOrdine")=now()
			os1("DataAggiornamento")=now()
			os1("IpOrdine")=Request.ServerVariables("REMOTE_ADDR")
			os1("Dominio")=dominio 'aggiunto per passaggio 2019'
			os1.update

			os1.close

			'Creo una sessione con l'id dell'ordine
			Session("ordine_shop")=IdOrdine

		end if

		IdOrdine=CLng(IdOrdine)

	'modifica del carrello: eliminazione o modifica di un articolo nel carrello
		'if mode=2 then
			'cs = conn.Execute("Delete * FROM RigheOrdine Where FkOrdine="&IdOrdine)
			'mode=0
		'end if

		if mode>0 then
			'eliminazione prodotto/riga dal carrello
			if mode=2 then
				riga=request("riga")
				if riga="" or isnull(riga) then riga=0
				if riga>0 then
					Set ts = Server.CreateObject("ADODB.Recordset")
					sql = "SELECT * FROM RigheOrdine WHERE Dominio LIKE '"&dominio&"' AND PkId="&riga 'aggiunto per passaggio 2019'
					ts.Open sql, conn, 3, 3
						ts.delete
						ts.update
					ts.close
				end if
			end if

			if mode=1 then
				'parte per la modifica delle quantita di un articolo nel carrello

				riga=request("riga")
				if riga="" or isnull(riga) then riga=0
				quantita=request("quantita")
				if quantita="" or isnull(quantita) then quantita=0

				if riga>0 and quantita>0 then
					Set ts = Server.CreateObject("ADODB.Recordset")
					sql = "SELECT * FROM RigheOrdine WHERE Dominio LIKE '"&dominio&"' AND PkId="&riga 'aggiunto per passaggio 2019'
					ts.Open sql, conn, 3, 3
						PrezzoProdotto=ts("PrezzoProdotto")
						ts("Quantita")=Quantita
						ts("TotaleRiga")=(Quantita*PrezzoProdotto)
						ts.update
					ts.close
				end if


				'Set ts = Server.CreateObject("ADODB.Recordset")
				'sql = "SELECT * FROM RigheOrdine where FkOrdine="&idordine
				'ts.Open sql, conn, 3, 3
				'num=0
				'Do while not ts.EOF
					'aggiornamento
					'PrezzoProdotto=ts("PrezzoProdotto")
					'Quantita=request("quantita"&num)
					'ts("Quantita")=Quantita
					'ts("TotaleRiga")=(Quantita*PrezzoProdotto)
					'ts.update
					'num=num+1
					'ts.movenext
				'loop
				'ts.close
			end if

		else
	'inserimento di un prodotto per la prima volta scelto con il carrello già aperto
			'Prendo il prezzo del prodotto

			if id<>0 then
				quantita=request("quantita")
				if quantita="" then quantita=1

				colore=request("colore")
				if colore="*****" then colore=""

				lampadina=request("lampadina")
				if lampadina="*****" then lampadina=""

				'prendo le caretteristriche del prodotto

				Set prodotto_rs = Server.CreateObject("ADODB.Recordset")
				sql = "SELECT * FROM Prodotti where PkId="&id&""
				prodotto_rs.Open sql, conn, 1, 1

				PrezzoProdotto=prodotto_rs("PrezzoProdotto")
				CodiceArticolo=prodotto_rs("CodiceArticolo")
				TitoloProdotto=prodotto_rs("Titolo")
				FkProduttore=prodotto_rs("FkProduttore")

				prodotto_rs.close


				Set riga_rs = Server.CreateObject("ADODB.Recordset")
				sql = "SELECT Top 1 PkId, PkId_Contatore FROM RigheOrdine Order by Pkid_Contatore Desc"
				riga_rs.Open sql, conn, 1, 1
				PkId_riga_ultimo=riga_rs("PkId")
				PkId_riga_ultimo=CLng(PkId_riga_ultimo)
				PkId_riga=PkId_riga_ultimo+1
				riga_rs.close

				Set riga_rs = Server.CreateObject("ADODB.Recordset")
				sql = "SELECT * FROM RigheOrdine"
				riga_rs.Open sql, conn, 3, 3

				riga_rs.addnew
				riga_rs("PkId")=PkId_riga
				riga_rs("Dominio")=dominio 'aggiunto per passaggio 2019'
				riga_rs("FkOrdine")=IdOrdine
				riga_rs("FkCliente")=idsession
				riga_rs("FkProdotto")=id
				riga_rs("PrezzoProdotto")=PrezzoProdotto
				riga_rs("Quantita")=Quantita
				TotaleRiga=PrezzoProdotto*Quantita
				riga_rs("TotaleRiga")=TotaleRiga
				riga_rs("colore")=Colore
				riga_rs("lampadina")=Lampadina
				riga_rs("CodiceArticolo")=CodiceArticolo
				riga_rs("Titolo")=TitoloProdotto
				if FkProduttore=59 then
					'non si applicano sconti
					riga_rs("Scontabile")=0
				Else
					'si applicano sconti
					riga_rs("Scontabile")=1
				end if
				riga_rs("Data")=now()
				riga_rs.update

				riga_rs.close
			end if
		end if

				'Calcolo la somma per l'ordine

				'Set rs2 = Server.CreateObject("ADODB.Recordset")
				'sql = "SELECT FkOrdine, SUM(TotaleRiga) AS TotaleCarrello FROM RigheOrdine WHERE FkOrdine="&IdOrdine&" GROUP BY FkOrdine"
				'rs2.Open sql, conn, 3, 3
				'		TotaleCarrello=rs2("TotaleCarrello")
				'	if TotaleCarrello="" or isnull(TotaleCarrello) then TotaleCarrello=0
				'rs2.close

				Set rs2 = Server.CreateObject("ADODB.Recordset")
				sql = "SELECT FkOrdine, Dominio, SUM(TotaleRiga) AS TotaleCarrello FROM RigheOrdine WHERE FkOrdine="&IdOrdine&" AND Dominio LIKE '"&dominio&"' AND Scontabile=1 GROUP BY FkOrdine, Dominio"
				rs2.Open sql, conn, 3, 3
						TotaleCarrello_Scontabile_Si=rs2("TotaleCarrello")
					if TotaleCarrello_Scontabile_Si="" or isnull(TotaleCarrello_Scontabile_Si) then TotaleCarrello_Scontabile_Si=0
				rs2.close

				Set rs2 = Server.CreateObject("ADODB.Recordset")
				sql = "SELECT FkOrdine, Dominio, SUM(TotaleRiga) AS TotaleCarrello FROM RigheOrdine WHERE FkOrdine="&IdOrdine&" AND Dominio LIKE '"&dominio&"' AND Scontabile=0 GROUP BY FkOrdine, Dominio"
				rs2.Open sql, conn, 3, 3
						TotaleCarrello_Scontabile_No=rs2("TotaleCarrello")
					if TotaleCarrello_Scontabile_No="" or isnull(TotaleCarrello_Scontabile_No) then TotaleCarrello_Scontabile_No=0
				rs2.close


				'Aggiorno la tabella dell'ordine con la somma calcolata prima
				Set ss = Server.CreateObject("ADODB.Recordset")
				sql = "SELECT * FROM Ordini WHERE Dominio LIKE '"&dominio&"' AND PkId="&IdOrdine
				'response.write("sql2:"&sql)
				ss.Open sql, conn, 3, 3
				if ss.recordcount>0 then
					TotaleCarrello=TotaleCarrello_Scontabile_Si+TotaleCarrello_Scontabile_No
					ss("TotaleCarrello")=TotaleCarrello

					if TotaleCarrello_Scontabile_Si>0 then
						if TotaleCarrello_Scontabile_Si<301 then
							Sconto=0
							TotaleGenerale=TotaleCarrello_Scontabile_Si+TotaleCarrello_Scontabile_No
						end if
						if TotaleCarrello_Scontabile_Si>300 and TotaleCarrello_Scontabile_Si<601 then
							Sconto=((TotaleCarrello_Scontabile_Si*2)/100)
							TotaleGenerale=(TotaleCarrello_Scontabile_Si-Sconto)+TotaleCarrello_Scontabile_No
						end if
						if TotaleCarrello_Scontabile_Si>600 and TotaleCarrello_Scontabile_Si<901 then
							Sconto=((TotaleCarrello_Scontabile_Si*3)/100)
							TotaleGenerale=(TotaleCarrello_Scontabile_Si-Sconto)+TotaleCarrello_Scontabile_No
						end if
						if TotaleCarrello_Scontabile_Si>900 then
							Sconto=((TotaleCarrello_Scontabile_Si*4)/100)
							TotaleGenerale=(TotaleCarrello_Scontabile_Si-Sconto)+TotaleCarrello_Scontabile_No
						end if
					Else
						Sconto=0
						TotaleGenerale=TotaleCarrello
					end if
					ss("Sconto")=Sconto
					ss("TotaleGenerale")=TotaleGenerale
					'ss("DataOrdine")=now()
					ss("DataAggiornamento")=now()
					ss("Stato")=0
					ss("FkCliente")=idsession
					ss("IpOrdine")=Request.ServerVariables("REMOTE_ADDR")
					ss.update
				end if
				ss.close
%>
<!DOCTYPE html>
<html>

<head>
    <title>Cristalensi - Carrello E-commerce vendita lampadari</title>
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
		<script language="javascript">
		function NoteCliente()
		{
				document.modulocarrello.method = "post";
				document.modulocarrello.action = "<%if italia_log="Si" or italia_log="" then%>/carrello2.asp<%end if%><%if italia_log="No" then%>/carrello2extra.asp<%end if%>";
				document.modulocarrello.submit();
		}
		</script>
		<!--#include virtual="/inc_funzioni_head.asp"-->
</head>

<body>
  <!--#include file="inc_header_1.asp"-->
  <!--#include file="inc_header_2.asp"-->
	<%
		Set rs = Server.CreateObject("ADODB.Recordset")
		sql = "SELECT PkId, Dominio, FkOrdine, FkProdotto, PrezzoProdotto, Quantita, TotaleRiga, Titolo, CodiceArticolo, Colore, Lampadina FROM RigheOrdine WHERE FkOrdine="&idOrdine&" AND Dominio LIKE '"&dominio&"'"
		rs.Open sql, conn, 1, 1
		num_prodotti_carrello=rs.recordcount

		Set ss = Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * FROM Ordini where pkid="&idOrdine&" AND Dominio LIKE '"&dominio&"'"
		ss.Open sql, conn, 1, 1
	%>
    <div class="container content">
        <div class="row hidden">
            <div class="col-md-12 parentOverflowContainer">
            </div>
        </div>
        <div class="col-sm-12 hidden-xs">
            <div class="row bs-wizard">
                <div class="col-sm-5 bs-wizard-step active">
                    <div class="text-center bs-wizard-stepnum">1</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Carrello</div>
                </div>
                <div class="col-sm-5 bs-wizard-step disabled">
                    <div class="text-center bs-wizard-stepnum">2</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Accedi / Iscriviti</div>
                </div>
                <div class="col-sm-5 bs-wizard-step disabled">
                    <div class="text-center bs-wizard-stepnum">3</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Indirizzo di spedizione</div>
                </div>
                <div class="col-sm-5 bs-wizard-step disabled">
                    <div class="text-center bs-wizard-stepnum">4</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Pagamento &amp; Fatturazione</div>
                </div>
                <div class="col-sm-5 bs-wizard-step disabled">
                    <div class="text-center bs-wizard-stepnum">5</div>
                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                    <a href="#" class="bs-wizard-dot"></a>
                    <div class="bs-wizard-info text-center">Conferma dell'ordine</div>
                </div>
            </div>
        </div>
        <div class="col-sm-12">
            <div class="col-md-8">
                <div class="row">
                    <div class="title">
                        <h4><span class="visible-xs" style="padding-top: 20px;">Carrello - Passo 1 di 5</span></h4>
                    </div>
                    <div class="col-md-12">
                        <div class="top-buffer">
                            <table id="cart" class="table table-hover table-condensed table-cart">
                                <thead>
                                    <tr>
                                        <th style="width:45%">Prodotto</th>
																				<th style="width:15%">Quantit&agrave;</th>
                                        <th style="width:15%" class="text-right">Prezzo</th>
                                        <th style="width:15%" class="text-right hidden-xs">Totale Pr.</th>
                                        <th style="width:10%"></th>
                                    </tr>
                                </thead>

																<%if rs.recordcount>0 then%>
																<tbody>
																		<%
																		ProdottiCarrello=""

																		Do while not rs.EOF

																		Set url_prodotto_rs = Server.CreateObject("ADODB.Recordset")
																		sql = "SELECT PkId, NomePagina, FkProduttore FROM Prodotti where PkId="&rs("FkProdotto")&""
																		url_prodotto_rs.Open sql, conn, 1, 1

																		NomePagina=url_prodotto_rs("NomePagina")
																		if Len(NomePagina)>0 then
																			NomePagina="/public/pagine/"&NomePagina
																		else
																			NomePagina="#"
																		end if
																		FkProduttore=url_prodotto_rs("FkProduttore")

																		url_prodotto_rs.close
																		%>
																		<form method="post" action="/carrello1.asp?mode=1&riga=<%=rs("pkid")%>">
																		<%
																		quantita=rs("quantita")
																		if quantita="" then quantita=1
																		%>
																		<tr>
                                        <td data-th="Product" class="cart-product">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <h6 class="nomargin"><a href="<%=NomePagina%>" title="Scheda del prodotto: <%=NomePagina%>"><%=rs("titolo")%></a></h6>
																										<p>
																											<strong>Codice: <%=rs("codicearticolo")%></strong>
                                                    	<%if Len(rs("colore"))>0 or Len(rs("lampadina"))>0 then%><br /><%if Len(rs("colore"))>0 then%>Col.: <%=rs("colore")%><%end if%><%if Len(rs("lampadina"))>0 then%> - Lamp.: <%=rs("lampadina")%><%end if%><%end if%>
																											<%if FkProduttore=59 then%><br /><span style="color:#a01010;"><strong><em>Sconti Extra non applicabili</em></strong></span><%end if%>
																										</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td data-th="Quantity"><input type="number" class="form-control text-center" name="quantita" value="<%=quantita%>"></td>
																				<td data-th="Price"class="text-right"><%=FormatNumber(rs("PrezzoProdotto"),2)%>&nbsp&euro;</td>
                                        <td data-th="Subtotal" class="text-right hidden-xs"><%=FormatNumber(rs("TotaleRiga"),2)%>&nbsp&euro;</td>
                                        <td class="actions text-center" data-th="">
                                            <button class="btn btn-info btn-sm" type="submit"><i class="fa fa-refresh"></i></button><br />
                                            <button class="btn btn-danger btn-sm" style="margin-top: 5px;" type="button" onClick="location.href='/carrello1.asp?mode=2&riga=<%=rs("pkid")%>'"><i class="fa fa-trash-o"></i></button>
                                        </td>
                                    </tr>
																		</form>
																		<%
																		ProdottiCarrello=ProdottiCarrello & "<br>" & rs("titolo") & " - " & rs("codicearticolo") & " - Pezzi: " & quantita

																		rs.movenext
																		loop
																		%>
																	</tbody>
																	<%if ss.recordcount>0 then%>
	                                <tfoot>
	                                    <tr>
																					<td class="text-right" colspan="3">Totale Carrello</td>
																					<td class="text-right"><%if ss("TotaleCarrello")<>0 then%>
												  								<%=FormatNumber(ss("TotaleCarrello"),2)%><%else%>0<%end if%>&nbsp&euro;</td>
																					<td class="hidden-xs"></td>
	                                    </tr>
																			<tr>
																					<td class="text-right" colspan="3"><strong>Sconto Extra</strong></td>
																					<td class="text-right"><strong><%if ss("Sconto")<>0 then%>
												  								-<%=FormatNumber(ss("Sconto"),2)%><%else%>0,00<%end if%>&nbsp&euro;</strong></td>
																					<td class="hidden-xs"></td>
	                                    </tr>
	                                    <tr>
	                                        <td><a href="/" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continua gli acquisti</a></td>
	                                        <td class="text-right" colspan="2"><strong>Totale Generale</strong></td>
																					<td class="text-right"><strong><%if ss("TotaleGenerale")<>0 then%>
												  								<%=FormatNumber(ss("TotaleGenerale"),2)%><%else%>0<%end if%>&nbsp&euro;</strong></td>
																					<td class="hidden-xs"></td>
	                                    </tr>
	                                </tfoot>
																	<%end if%>
																<%else%>
																	<tbody>
																	<tr>
																			<td data-th="Product" class="cart-product">
																					<div class="row">
																							<div class="col-sm-12">
																									<h5 class="nomargin"><br>Nessun prodotto nel carrello</h5>
																							</div>
																			</td>
																	</tr>
																	</tbody>
																<%end if%>


                            </table>

                        </div>
                    </div>

                </div>
								<%if ss.recordcount>0 then%>
								<form method="post" name="modulocarrello" action="<%if italia_log="Si" or italia_log="" then%>https://www.cristalensi.it/carrello2.asp<%end if%><%if italia_log="No" then%>https://www.cristalensi.it/carrello2extra.asp<%end if%>">
								<div class="panel panel-default user-comment">
										<!-- Default panel contents -->
										<div class="panel-heading">
												<h5><i class="glyphicon glyphicon-warning-sign"></i> Eventuali annotazioni</h5>
										</div>
										<ul class="list-group">
												<li class="list-group-item">
												<p>Potete usare questo spazio per inserire eventuali comunicazioni in relazione ai prodotti acquistati.</p>
												<textarea name="NoteCliente" style="width: 100%" rows="2" id="NoteCliente"><%=ss("NoteCliente")%></textarea>
												</li>
										</ul>
								</div>
								</form>
								<%end if%>
								<!--<div class="panel panel-default user-comment">
										<div class="panel-heading">
												<h5><i class="glyphicon glyphicon-warning-sign"></i> RICHIESTA INFORMAZIONI E DISPONIBILITA' DEI PRODOTTI</h5>
										</div>
										<ul class="list-group">
												<li class="list-group-item">
													<%if offerta=10 then%>
													IL PRODOTTO NON E' DISPONIBILE
													<%else%>
													Hai dubbi sui prodotti da acquistare? Vuoi avere dettagli sui tempi di consegna?<br />Vuoi maggiori informazioni sulla procedura di acquisto?<br />
													<%end if%>
												</li>
										</ul>
										<%richiesta_carrello=1%>
										<div class="panel-footer"><a data-fancybox data-src="#hidden-content" href="javascript:;" class="btn launch btn-warning btn-block">Contattaci per dettagli e informazioni <i class="fa fa-angle-right"></i></a></div>
								</div>-->
            </div>
            <div class="col-md-4">
								<%if ss.recordcount>0 then%>
								<div class="panel panel-default" style="box-shadow: 0 3px 5px #ccc;">
                    <ul class="list-group text-center">
                        <li class="list-group-item" style="padding-top: 20px">
                            <p>Totale Generale:<br />
                                <span class="price-new"><%if ss("TotaleGenerale")<>0 then%>
								<%=FormatNumber(ss("TotaleGenerale"),2)%><%else%>0<%end if%> &euro;</span>
                            </p>
                        </li>
                    </ul>
                    <div class="panel-footer">
                        <a href="#" class="btn btn-danger btn-block" style="padding: 10px 0px;" onClick="NoteCliente();">COMPLETA L'ACQUISTO <i class="fa fa-angle-right"></i></a>
                    </div>
                </div>
								<%end if%>

								<div class="clearfix"></div>
								<div class="panel panel-default" style="margin: 10px 0px 30px 0px;">
									<a data-fancybox data-src="#hidden-content" href="javascript:;" class="btn launch btn-warning btn-block" style="white-space: normal; padding: 10px 0px;"><i class="fa fa-info-circle"></i>   Domande e dubbi? Contattaci!!!</a>
								</div>
								<div class="clearfix"></div>
								<div class="banner_2 banner_a">
									<img src="/images/sconto_extra.png">

								</div>
								<div class="banner_2 banner_b">
									<img src="/images/spedizione_gratuita.png">
								</div>
								<div class="banner_2 banner_c">
									<img src="/images/sconto_bonifico.png">
								</div>

            </div>
        </div>

				<div class="col-md-8">
					<div class="col-md-6" style="clear: both;">
						<div class="panel panel-default payment-list">
							<div class="panel-heading">
								<h5>Spedizioni</h5>
							</div>
							<ul class="list-group">
								<li class="list-group-item"><strong>SPEDIZIONE ASSICURATA IN TUTTA ITALIA</strong></li>
								<li class="list-group-item"><i class="fa fa-check"></i> <em>Per ordini superiori a 250&euro;:</em><div style="float: right;"><em><strong>0&euro;</strong></em></div></li>
								<li class="list-group-item"><i class="fa fa-check"></i> <em>Per ordini fino a  250&euro;:</em><div style="float: right;"><em><strong>10&euro;</strong></em></div></li>
								<li class="list-group-item"><i class="fa fa-check"></i> <em>Ritiro in sede:</em><div style="float: right;"><em><strong>0&euro;</strong></em></div></li>
							</ul>
						</div>
						<div class="panel panel-default payment-list">
							<div class="panel-heading">
								<h5>Condizioni di recesso</h5>
							</div>
							<ul class="list-group">
								<li class="list-group-item"><strong>Diritto di recesso entro 14 giorni come da legge</strong></li>
							</ul>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-default payment-list">
							<div class="panel-heading">
								<h5>Pagamenti</h5>
							</div>
							<ul class="list-group">
								<li class="list-group-item"><strong>PAGAMENTI SICURI E PROTETTI</strong></li>
								<li class="list-group-item"><i class="fa fa-check"></i> <em>Bonifico:</em><div style="float: right;"><em><strong>-2%</strong></em></div></li>
								<li class="list-group-item"><i class="fa fa-check"></i> <em>Carte di credito, Prepagate e PostePay:</em><div style="float: right;"><em><strong>0&euro;</strong></em></div></li>
								<li class="list-group-item"><i class="fa fa-check"></i> <em>Contrassegno (ordine inferiore a 500&euro;):</em><div style="float: right;"><em><strong>6&euro;</strong></em></div></li>
							</ul>
						</div>
						<div class="panel panel-default payment-list">
							<div class="panel-heading">
								<h5>Preventivi personalizzati</h5>
							</div>
							<ul class="list-group">
								<li class="list-group-item"><strong>Per importi oltre 1500&euro; preventivi e sconti personalizzati</strong></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<!--#include virtual="/inc_box_contatti.asp"-->
				</div>
		</div>
		<%
		ss.close
		rs.close
		%>
    <!--#include file="inc_footer.asp"-->
</body>
<!--#include file="inc_strClose.asp"-->
