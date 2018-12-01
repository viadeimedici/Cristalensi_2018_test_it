
<!--#include file="inc_strConn.asp"-->
<%
	Call Visualizzazione("",0,"carrello3.asp")

	mode=request("mode")
	if mode="" then mode=0

	'se la session &eacute; gi&agrave; aperta sfrutto il pkid dell'ordine, altrimenti ne apro una
	IdOrdine=session("ordine_shop")
	if IdOrdine="" then IdOrdine=0
	if idOrdine=0 then response.redirect("/carrello1.asp")

	if idsession=0 then response.Redirect("/iscrizione.asp?prov=1")

	'inserisco il costo del pagamento. se nn ne &eacute; stato scelto uno, perch&eacute; sono appena entrato adesso in questa pagina, prendo il primo costo dal db

	TipoPagamentoScelto=request("TipoPagamentoScelto")
	if TipoPagamentoScelto="" then TipoPagamentoScelto=0

	Set trasp_rs = Server.CreateObject("ADODB.Recordset")
	if TipoPagamentoScelto=0 then
		sql = "SELECT * FROM CostiPagamento ORDER BY Nome ASC"
	else
		sql = "SELECT * FROM CostiPagamento where PkId="&TipoPagamentoScelto
	end if
	trasp_rs.Open sql, conn, 1, 1
	if trasp_rs.recordcount>0 then
		PkIdPagamentoScelto=trasp_rs("PkId")
		NomePagamentoScelto=trasp_rs("Nome")
		CostoPagamentoScelto=trasp_rs("Costo")
		TipoCostoPagamentoScelto=trasp_rs("TipoCosto")
	end if
	trasp_rs.close

	'**********modifica temporanea
	'if TipoPagamentoScelto=10 then
	'PkIdPagamentoScelto=10
	'NomePagamentoScelto="Bonifico Scontato"
	'CostoPagamentoScelto=2
	'TipoCostoPagamentoScelto=10
	'end if
	'**********modifica temporanea

	Set os1 = Server.CreateObject("ADODB.Recordset")
	sql = "SELECT * FROM Ordini where PkId="&idOrdine
	os1.Open sql, conn, 3, 3

	TotaleCarrello=os1("TotaleCarrello")
	Sconto=os1("Sconto")
	CostoSpedizione=os1("CostoSpedizione")

	if TipoCostoPagamentoScelto=1 or TipoCostoPagamentoScelto=4 then
		CostoPagamento=CostoPagamentoScelto
	end if
	if TipoCostoPagamentoScelto=2 or TipoCostoPagamentoScelto=5 then
		CostoPagamento=((TotaleCarrello-Sconto+CostoSpedizione)*CostoPagamentoScelto)/100
	end if
	if TipoCostoPagamentoScelto=3 then
		CostoPagamento=0
	end if



	os1("FkPagamento")=PkIdPagamentoScelto
	os1("TipoPagamento")=NomePagamentoScelto
	os1("CostoPagamento")=CostoPagamento
	'TotaleGnerale_AG=TotaleCarrello+CostoSpedizione+CostoPagamento
	if TipoCostoPagamentoScelto=4 or TipoCostoPagamentoScelto=5 then
		os1("TotaleGenerale")=TotaleCarrello-Sconto+CostoSpedizione-CostoPagamento
	else
		os1("TotaleGenerale")=TotaleCarrello-Sconto+CostoSpedizione+CostoPagamento
	end if
	os1("FkCliente")=idsession

	Nominativo_sp=os1("Nominativo_sp")
	Telefono_sp=os1("Telefono_sp")
	Indirizzo_sp=os1("Indirizzo_sp")
	CAP_sp=os1("CAP_sp")
	Citta_sp=os1("Citta_sp")
	Provincia_sp=os1("Provincia_sp")
	Nazione_sp=os1("Nazione_sp")

	if mode=0 then
		os1("stato")=2
		if Nazione_sp<>"IT" then os1("stato")=22
	else
		os1("stato")=3
	end if

	Nominativo=request("Nominativo")
	Rag_Soc=request("Rag_Soc")

	if Nominativo="" and Rag_Soc="" then
		Nominativo=os1("Nominativo")
		Rag_Soc=os1("Rag_Soc")
		Cod_Fisc=os1("Cod_Fisc")
		PartitaIVA=os1("PartitaIVA")
		Indirizzo=os1("Indirizzo")
		CAP=os1("CAP")
		Citta=os1("Citta")
		Provincia=os1("Provincia")
	else
		Cod_Fisc=request("Cod_Fisc")
		PartitaIVA=request("PartitaIVA")
		Indirizzo=request("Indirizzo")
		CAP=request("CAP")
		Citta=request("Citta")
		Provincia=request("Provincia")
	end if

	os1("Nominativo")=Nominativo
	os1("Rag_Soc")=Rag_Soc
	os1("Cod_Fisc")=Cod_Fisc
	os1("PartitaIVA")=PartitaIVA
	os1("Indirizzo")=Indirizzo
	os1("CAP")=CAP
	os1("Citta")=Citta
	os1("Provincia")=Provincia

	os1("DataAggiornamento")=now()
	os1("IpOrdine")=Request.ServerVariables("REMOTE_ADDR")
	os1.update

	os1.close

	if mode=1 then response.Redirect("/ordine.asp")
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
    <script language="javascript">
    function Cambia()
    {
        document.modulocarrello.method = "post";
        document.modulocarrello.action = "/carrello3.asp";
        document.modulocarrello.submit();
    }
    </script>
    <script language="javascript">
    function Continua()
    {
        document.modulocarrello.method = "post";
        document.modulocarrello.action = "/carrello3.asp?mode=1";
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
  	sql = "SELECT PkId, FkOrdine, FkProdotto, PrezzoProdotto, Quantita, TotaleRiga, Titolo, CodiceArticolo, Colore, Lampadina FROM RigheOrdine WHERE FkOrdine="&idOrdine&""
  	rs.Open sql, conn, 1, 1
  	num_prodotti_carrello=rs.recordcount

  	Set ss = Server.CreateObject("ADODB.Recordset")
  	sql = "SELECT * FROM Ordini where pkid="&idOrdine
  	ss.Open sql, conn, 1, 1

  	if ss.recordcount>0 then
  		TotaleCarrello=ss("TotaleCarrello")
			Sconto=ss("Sconto")
  		CostoSpedizioneTotale=ss("CostoSpedizione")
  		TipoTrasporto=ss("TipoTrasporto")
  		'DatiSpedizione=ss("DatiSpedizione")
  		Nominativo_sp=ss("Nominativo_sp")
  		Telefono_sp=ss("Telefono_sp")
  		Indirizzo_sp=ss("Indirizzo_sp")
  		CAP_sp=ss("CAP_sp")
  		Citta_sp=ss("Citta_sp")
  		Provincia_sp=ss("Provincia_sp")
  		Nazione_sp=ss("Nazione_sp")
  		CostoPagamentoTotale=ss("CostoPagamento")
			if CostoPagamentoTotale="" or isNull(CostoPagamentoTotale) then CostoPagamentoTotale=0
  		TotaleGenerale=ss("TotaleGenerale")
  		NoteCliente=ss("NoteCliente")

  		NominativoOrdine=ss("Nominativo")
  		Rag_SocOrdine=ss("Rag_Soc")
  		Cod_FiscOrdine=ss("Cod_Fisc")
  		PartitaIVAOrdine=ss("PartitaIVA")
  		IndirizzoOrdine=ss("Indirizzo")
  		CAPOrdine=ss("CAP")
  		CittaOrdine=ss("Citta")
  		ProvinciaOrdine=ss("Provincia")
  	end if
  %>
    <div class="container content">
        <div class="row hidden">
            <div class="col-md-12 parentOverflowContainer">
            </div>
        </div>
        <div class="col-sm-12 hidden-xs">
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
                <div class="col-sm-5 bs-wizard-step active">
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
        <div class="col-md-12">
            <div class="title">
                <h4><span class="visible-xs" style="padding-top: 20px;">Modalit&agrave; di pagamento - Passo 4 di 5</span></h4>
            </div>
            <div class="col-md-12">
                <div class="top-buffer">
                    <table id="cart" class="table table-hover table-condensed table-cart">
											<thead>
												<tr>
														<th style="width:60%">Prodotto</th>
														<th style="width:10%" class="text-center">Quantit&agrave;</th>
														<th style="width:15%" class="text-right">Prezzo</th>
														<th style="width:15%" class="text-right hidden-xs">Totale Prodotto</th>
												</tr>
											</thead>
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
																<td data-th="Quantity" class="text-center"><%=quantita%></td>
                                <td data-th="Price" class="text-right"><%=FormatNumber(rs("PrezzoProdotto"),2)%>&nbsp&euro;</td>
                                <td data-th="Subtotal" class="text-right hidden-xs"><%=FormatNumber(rs("TotaleRiga"),2)%>&nbsp&euro;</td>
                            </tr>
														<%
														rs.movenext
														loop
														%>
                        </tbody>
												<%end if%>
												<%if ss.recordcount>0 then%>
												<tfoot>
													<tr>
															<td class="hidden-xs"></td>
															<td class="text-right" colspan="2">Totale Carrello</td>
															<td class="text-right"><%if ss("TotaleCarrello")<>0 then%>
															<%=FormatNumber(ss("TotaleCarrello"),2)%><%else%>0<%end if%>&nbsp&euro;</td>
													</tr>
													<tr>
															<td class="hidden-xs"></td>
															<td class="text-right" colspan="2"><strong>Sconto Extra</strong></td>
															<td class="text-right"><strong><%if ss("Sconto")<>0 then%>
															-<%=FormatNumber(ss("Sconto"),2)%><%else%>0,00<%end if%>&nbsp&euro;</strong></td>
													</tr>
                          <tr>
                              <td colspan="4">
                                  <h5>Eventuali annotazioni</h5>
                                  <textarea class="form-control" rows="3" readonly style="font-size: 12px;"><%=NoteCliente%></textarea>
                              </td>
                          </tr>
                        </tfoot>
												<%end if%>
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
        </div>
				<form name="modulocarrello" id="modulocarrello" class="form-horizontal">
        <div class="col-md-12">
            <div class="row top-buffer">
                <div class="col-md-6">
										<%
										Set trasp_rs = Server.CreateObject("ADODB.Recordset")
										if Nazione_sp="IT" then
											sql = "SELECT * FROM CostiPagamento WHERE IT=1 ORDER BY Nome ASC"
											'sql = "SELECT * FROM CostiPagamento ORDER BY Nome ASC"
										else
											sql = "SELECT * FROM CostiPagamento WHERE COM=1 ORDER BY Nome ASC"
										end if
										trasp_rs.Open sql, conn, 1, 1
										if trasp_rs.recordcount>0 then
										%>
										<div class="title">
                        <h4>Modalit&agrave; di pagamento</h4>
                    </div>
                    <div class="col-md-12 top-buffer">
                        <table id="cart" class="table table-hover table-condensed table-cart">
                            <thead>
                                <tr>
                                    <th style="width:70%">Modalit&agrave; di pagamento</th>
                                    <th style="width:15%">Tariffa</th>
                                    <th style="width:15%">Totale</th>
                                </tr>
                            </thead>
                            <tbody>
																<%
																Do while not trasp_rs.EOF
																PkIdPagamento=trasp_rs("pkid")
																NomePagamento=trasp_rs("nome")
																DescrizionePagamento=NoLettAccDescrizioni(trasp_rs("descrizione"))
																CostoPagamento=trasp_rs("costo")

																TipoCosto=trasp_rs("TipoCosto")
																if TipoCosto="" then TipoCosto=3
																%>
																<tr>
                                    <td data-th="Product" class="cart-product">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="radio">
                                                    <label><input type="radio" name="TipoPagamentoScelto" id="TipoPagamentoScelto" value="<%=PkIdPagamento%>" <%if PkIdPagamento=PkIdPagamentoScelto then%> checked="checked"<%end if%> onClick="Cambia();"> <b><%=NomePagamento%></b></label>
                                                </div>
                                                <p style="color: #666; font-size: .85em;"><%=DescrizionePagamento%></p>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Price" style=""><%if TipoCosto=4 or TipoCosto=5 then%>-<%end if%><%=FormatNumber(CostoPagamento,2)%><%if TipoCosto=1 or TipoCosto=4 then%>&#8364;<%end if%><%if TipoCosto=2 or TipoCosto=5 then%>%<%end if%></td>
                                    <td data-th="Subtotal"><%if PkIdPagamento=PkIdPagamentoScelto then%><%if TipoCosto=4 or TipoCosto=5 then%>-<%end if%><%=FormatNumber(CostoPagamentoTotale,2)%>&#8364;<%else%>-<%end if%></td>
                                </tr>
																<%
																trasp_rs.movenext
																loop
																%>

                                <tr>
                                    <td data-th="Product"><h5>costo pagamento:</h5></td>
                                    <td data-th="Price"></td>
                                    <td data-th="Subtotal"><h5><%if PkIdPagamentoScelto>0 then%><%if TipoCostoPagamentoScelto=4 or TipoCostoPagamentoScelto=5 then%>-<%end if%><%end if%><%=FormatNumber(CostoPagamentoTotale,2)%>&#8364;</h5></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
										<%end if%>
										<%trasp_rs.close%>
                </div>
                <div class="col-md-6">
                    <div class="title">
                        <h4>Dati fatturazione</h4>
                    </div>
                    <div class="col-md-12">
                        <p class="description">Per coloro che hanno la necessit&agrave; della fattura inserire i dati correttamente, altrimenti verr&agrave; emesso regolare scontrino fiscale.<br>La fattura &egrave; emessa su richiesta sia per le aziende che per privati.</p>
						<div class="form-group clearfix">
								<label for="nominativo" class="col-sm-4 control-label">Nome e Cognome</label>
								<div class="col-sm-8">
										<input type="text" class="form-control" name="nominativo" id="nominativo" value="<%=NominativoOrdine%>" maxlength="50">
								</div>
						</div>
						<div class="form-group clearfix">
								<label for="rag_soc" class="col-sm-4 control-label">Ragione Sociale<br />(solo per Aziende)</label>
								<div class="col-sm-8">
										<input type="text" class="form-control" name="rag_soc" id="rag_soc" value="<%=Rag_SocOrdine%>" maxlength="50">
								</div>
						</div>
						<div class="form-group clearfix">
								<label for="cod_fisc" class="col-sm-4 control-label">Codice Fiscale</label>
								<div class="col-sm-8">
										<input type="text" class="form-control" name="cod_fisc" id="cod_fisc" value="<%=Cod_fiscOrdine%>" maxlength="20">
								</div>
						</div>
						<div class="form-group clearfix">
								<label for="PartitaIVA" class="col-sm-4 control-label">Partita IVA<br />(solo per Aziende)</label>
								<div class="col-sm-8">
										<input type="number" class="form-control" name="PartitaIVA" id="PartitaIVA" value="<%=PartitaIVAOrdine%>" maxlength="20">
								</div>
						</div>
						<div class="form-group clearfix">
								<label for="indirizzo" class="col-sm-4 control-label">Indirizzo</label>
								<div class="col-sm-8">
										<input type="text" class="form-control" name="indirizzo" id="indirizzo" value="<%=IndirizzoOrdine%>" maxlength="100">
								</div>
						</div>
						<div class="form-group clearfix">
								<label for="citta" class="col-sm-4 control-label">Citt&agrave;</label>
								<div class="col-sm-8">
										<input type="text" class="form-control" name="citta" id="citta" value="<%=CittaOrdine%>" maxlength="50">
								</div>
						</div>

						<div class="form-group">
								<label for="cap" class="col-sm-4 control-label">CAP</label>
								<div class="col-sm-8">
										<input type="text" class="form-control" name="cap" id="cap" value="<%=CAPOrdine%>" maxlength="5">
								</div>
						</div>
						<div class="form-group">
								<label for="provincia" class="col-sm-4 control-label">Provincia</label>
								<div class="col-sm-8">
										<input type="text" class="form-control" name="provincia" id="provincia" value="<%=ProvinciaOrdine%>" maxlength="2">
								</div>
						</div>

                    </div>
                </div>
            </div>
						<%if ss.recordcount>0 then%>
            <div class="col-md-12">
                <div class="bg-primary">
                    <p style="font-size: 1.2em; text-align: right; padding: 10px 15px; color: #000;">Totale carrello: <b>
										<%if ss("TotaleGenerale")<>0 then%>
											<%=FormatNumber(ss("TotaleGenerale"),2)%>
										<%else%>
											0,00
										<%end if%>
										&#8364;&nbsp;
										</b></p>
                </div>
                <a href="/carrello2.asp" class="btn btn-danger pull-left" style="margin-top: 10px;"><i class="glyphicon glyphicon-chevron-left"></i> Passo precedente</a>
                <%if TipoPagamentoScelto>0 then%><a href="#" class="btn btn-danger pull-right" onClick="Continua();" style="margin-top: 10px;">Concludi l'acquisto <i class="glyphicon glyphicon-chevron-right"></i></a><%end if%>
            </div>
						<%end if%>
        </div>
				</form>
    </div>
		<%
		ss.close
		rs.close
		%>
    <!--#include file="inc_footer.asp"-->
</body>
