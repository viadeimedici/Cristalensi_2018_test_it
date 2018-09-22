<!--#include virtual="/inc_strConn.asp"-->
<%
if FkProduttore="" then FkProduttore=0

Set az_rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM Produttori WHERE PKId="&FkProduttore
az_rs.open sql,conn, 1, 1
if az_rs.recordcount>0 then
  titolo_produttore=az_rs("titolo")
  descrizione_produttore=az_rs("descrizione")
  file_img=NoLettAcc(az_rs("logo"))
end if
az_rs.close

%>
<!DOCTYPE html>
<html>

<head>
    <title><%=titolo_produttore%> catalogo prodotti illuminazione vendita online Cristalensi</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Catalogo prodotti di <%=titolo_produttore%>, vendita online prodotti illuminazione su Cristalensi">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:description" content="Catalogo prodotti di <%=titolo_produttore%>, vendita online prodotti illuminazione su Cristalensi">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png">
    <link rel="icon" type="image/png" href="../favicon-32x32.png" sizes="32x32">
    <link rel="icon" type="image/png" href="../android-chrome-192x192.png" sizes="192x192">
    <link rel="icon" type="image/png" href="../favicon-16x16.png" sizes="16x16">
    <link rel="manifest" href="../manifest.json">
    <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#2790cf">
    <meta name="msapplication-TileColor" content="#2790cf">
    <meta name="msapplication-TileImage" content="/mstile-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <link href="/stylesheets/styles.css" media="screen" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/stylesheets/customization.css" shim-shadowdom>
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,400i,500,600,700" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/webcomponentsjs/0.7.5/webcomponents.min.js"></script>
    <style type="text/css">
        .clearfix:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }
    </style>
    <link rel="canonical" href="https://www.cristalensi.it/produttori-illuminazione/<%=toUrl%>"/>
    <script language="javascript">
    function CambiaPagina()
    {
       document.modulopaginazione.method = "post";
       document.modulopaginazione.action = "/produttori-illuminazione/<%=toUrl%>?cat=<%=cat%>&FkProduttore=<%=FkProduttore%>&order=<%=order%>#inizioelenco";
       document.modulopaginazione.submit();
    }
    </script>
    <!--#include virtual="/inc_funzioni_head.asp"-->
</head>

<body>
    <!--#include virtual="/inc_header_1.asp"-->
    <!--#include virtual="/inc_header_2.asp"-->
    <div class="container content">
        <div class="row hidden">
            <div class="col-md-12 parentOverflowContainer">
            </div>
        </div>
        <div class="col-xl-12">
            <ol class="breadcrumb" itemtype="http://schema.org/BreadcrumbList">
                <li itemprop="itemListElement" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item" title="Cristalensi Vendita lampadari online"><span itemprop="name"><i class="fa fa-home"></i></span></a><meta itemprop="position" content="1" /></li>
                <li itemprop="itemListElement" itemtype="http://schema.org/ListItem"><a href="/produttori.asp" itemprop="item" title="Produttori articoli illuminazione"><span itemprop="name">Elenco produttori</span></a><meta itemprop="position" content="2" /></li>
                <li class="active" itemprop="itemListElement" itemtype="http://schema.org/ListItem"><span itemprop="name"><%=titolo_produttore%></span><meta itemprop="position" content="3" /></li>
            </ol>
            <h1 class="title"><%=titolo_produttore%></h1>
            <div class="description">
              <div class="readmore">
                <img src="/public/<%=file_img%>" class="hidden-xs" style="float: left; background: #ccc; margin-right: 10px;" alt="Catalogo prodotti illuminazione <%=titolo_produttore%>" />
                <h2>Selezione di prodotti illuminazione dal catalogo di <%=titolo_produttore%></h2>
                <p>
                <%if Len(descrizione_produttore)>0 then%>
                  <%=NoLettAccDescrizioni(descrizione_produttore)%>
                <%else%>
                Dal catalogo di <%=titolo_produttore%> abbiamo selezionato i seguenti prodotti da illuminazione. I produttori hanno spesso molte varianti dello stesso articolo che magari non abbiamo inserito, quindi, se conoscete un prodotto di <%=titolo_produttore%> e non &egrave; qui presente, potete contattare il nostro staff. Noi abbiamo preferito dar spazio a tante marche, dalle pi&ugrave; famose e pi&ugrave; grandi alle realt&agrave; pi&ugrave; piccole dove potete trovare prodotti pi&ugrave; artigianali in modo tale da fornirvi un'ampia variet&agrave; di modelli, design e non ultimo, prezzi.
                <%end if%>
                </p>
              </div>
            </div>
            <a name="inizioelenco"></a>
        </div>
        <div class="col-md-3">
            <div class=" top-buffer">
                <nav class="navbar">
                    <!-- menu - normal collapsible navbar markup -->
                    <%
                    Set tip_rs = Server.CreateObject("ADODB.Recordset")
                    sql = "SELECT * FROM Produttori ORDER BY Titolo ASC"
                    tip_rs.open sql,conn, 1, 1
                    if tip_rs.recordcount>0 then
                    %>
                    <ul class="list-unstyled side-list">
                        <%
                        Do While not tip_rs.EOF
                          PkId_pr_menu=tip_rs("PkId")
                          Titolo_pr_menu=tip_rs("Titolo")
                          url_pr_menu="/produttori-illuminazione/"&ConvertiTitoloInUrlProduttore(Titolo_pr_menu, PkId_pr_menu)
                        %>
                        <li><a href="<%=url_pr_menu%>" title="<%=Titolo_pr_menu%>"><%=Titolo_pr_menu%></a></li>
                        <%
                        tip_rs.movenext
                        loop
                        %>
                    </ul>
                    <%
                    end if
                    tip_rs.close
                    %>
                </nav>
            </div>
        </div>
        <div class="col-md-9">
            <div class="row top-buffer">
                <%
                p=request("p")
                if p="" then p=1

                order=request("order")
                if order="" then order=1
                if order>4 then order=1

                if order=1 then ordine="Titolo ASC"
                if order=2 then ordine="Titolo DESC"
                if order=3 then ordine="PrezzoProdotto ASC, PrezzoListino ASC"
                if order=4 then ordine="PrezzoProdotto DESC, PrezzoListino DESC"

                Set prod_rs = Server.CreateObject("ADODB.Recordset")
                sql = "SELECT * FROM Prodotti WHERE (FkProduttore="&FkProduttore&" and (Offerta=0 or Offerta=2)) ORDER BY "&ordine&""
                prod_rs.open sql,conn, 1, 1
                if prod_rs.recordcount>0 then

                  prod_rs.PageSize = 30
                  if prod_rs.recordcount > 0 then
                    prod_rs.AbSolutePage = p
                    maxPage = prod_rs.PageCount
                  End if
                %>
                <div class="col-xs-12">
                    <nav class="navbar navbar-default">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="#">Ordina per:</a>
                            </div>
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <p class="navbar-text">prezzo</p>
                                <ul class="nav navbar-nav">
                                    <li <%if order=3 then%>class="active"<%end if%>><a style="border: solid 1px #e7e7e7; border-top: none; border-bottom: none;" href="/produttori-illuminazione/<%=toUrl%>?order=3"><i class="glyphicon glyphicon-eur"></i> - </a></li>
                                    <li <%if order=4 then%>class="active"<%end if%>><a style="border: solid 1px #e7e7e7; border-top: none; border-bottom: none;" href="/produttori-illuminazione/<%=toUrl%>?order=4"><i class="glyphicon glyphicon-eur"></i> + </a></li>
                                </ul>
                                <p class="navbar-text">ordine alfabetico</p>
                                <ul class="nav navbar-nav">
                                    <li <%if order=1 then%>class="active"<%end if%>><a style="border: solid 1px #e7e7e7; border-top: none; border-bottom: none;" href="/produttori-illuminazione/<%=toUrl%>?order=1">A/Z</a></li>
                                    <li <%if order=2 then%>class="active"<%end if%>><a style="border: solid 1px #e7e7e7; border-top: none; border-bottom: none;" href="/produttori-illuminazione/<%=toUrl%>?order=2">Z/A</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
                <%
                Do while not prod_rs.EOF and rowCount < prod_rs.PageSize
                RowCount = RowCount + 1

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
                      'file_img=img_rs("file")
                    end if
                    img_rs.close
                %>
                <div class="col-xs-12 col-sm-4 col-md-4">
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
            <%if prod_rs.recordcount>30 then%>
            <form name="modulopaginazione" id="modulopaginazione">
            <div class="row top-buffer">
                <div class="col-lg-12">
                    <nav aria-label="Page navigation center-block">
                        <ul class="pagination">
                            <li class="active"><a href="#" aria-label="Previous">Pagina <%=p%> di <%=prod_rs.PageCount%></a></li>

                            <%if p > 2 then%>
                            <li><a href="/produttori-illuminazione/<%=toUrl%>?p=1&cat=<%=cat%>&FkProduttore=<%=FkProduttore%>&order=<%=order%>#inizioelenco">Prima pagina</a></li>
                            <%end if%>
                            <% if p > 1 then %>
                            <li>
                                <a href="/produttori-illuminazione/<%=toUrl%>?p=<%=p-1%>&cat=<%=cat%>&FkProduttore=<%=FkProduttore%>&order=<%=order%>#inizioelenco" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <%end if%>
                            <% for page = p+1 to p+4 %>
                            <%if not page>maxPage then%>
                            <li><a href="/produttori-illuminazione/<%=toUrl%>?p=<%=Page%>&cat=<%=cat%>&FkProduttore=<%=FkProduttore%>&order=<%=order%>#inizioelenco"><%=page%></a></li>
                            <%end if%>
                            <% if page >= prod_rs.PageCount then
                               page = p+4
                              end if
                              next
                            %>
                            <% if cInt(p) < maxPage then %>
                            <li>
                                <a href="/produttori-illuminazione/<%=toUrl%>?p=<%=p+1%>&cat=<%=cat%>&FkProduttore=<%=FkProduttore%>&order=<%=order%>#inizioelenco" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <%end if%>
                            <%if maxPage>5 and cInt(p)<>prod_rs.PageCount then%>
                            <li><a href="/produttori-illuminazione/<%=toUrl%>?p=<%=prod_rs.PageCount%>&cat=<%=cat%>&FkProduttore=<%=FkProduttore%>&order=<%=order%>#inizioelenco">Ultima pagina</a></li>
                            <%end if%>
                            <li class="active"><a href="#"> Vai alla pagina</a>
                            <select class="selectpicker show-menu-arrow show-tick" data-size="7" data-width="63px" data-dropAuto="true" name="p" id="p" data-size="5" onChange="CambiaPagina();">
          									<%
          									For i=1 To prod_rs.PageCount
          									%>
          									<option value="<%=i%>" <%if cInt(i)=cInt(p) then%> selected<%end if%>><%=i%></option>
          									<%
          									Next
          									%>
          									</select>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            </form>
            <%end if%>
            <%else%>
              <%richiesta_produttore=1%>
              <div class="row top-buffer">
                <div class="col-lg-12">
                  <div class="panel panel-default user-comment">
                      <!-- Default panel contents -->
                      <div class="panel-heading">
                          <h5><i class="glyphicon glyphicon-warning-sign"></i> Nessun articolo di <%=titolo_Produttore%> &egrave; presente in questo momento nel catalogo online.</h5>
                      </div>
                      <ul class="list-group">
                          <li class="list-group-item">
                          In questo momento non sono esposti sul sito internet prodotti di <%=titolo_Produttore%>, ma abbiamo comunque a disposizione il loro catalogo e vendiamo i loro prodotti nel nostro negozio. <br />Se conosci un articolo di questo produttore e vuoi avere un <strong>preventivo</strong> riempi il modulo indicandoci il <strong>nome del prodotto</strong> oppure il <strong>codice</strong>,
verrai contattato il prima possibile: il nostro staff sar&agrave; a Tua disposizione per qualsiasi chiarimento.
                            <br />
                          </li>
                      </ul>
                      <div class="panel-footer"><a data-fancybox data-src="#hidden-content-produttori" href="javascript:;" class="btn launch btn-warning btn-block">Contatta lo staff <i class="fa fa-angle-right"></i></a></div>
                  </div>
                </div>
              </div>
            <%
            end if
            prod_rs.close
            %>
        </div>
    </div>
    </div>
    <!--#include virtual="/inc_footer.asp"-->
    <script>
        $(document).ready(function() {
            $('.readmore').readmore({
                speed: 200,
                collapsedHeight: 160,
                moreLink: '<a href="#" style="text-align: right; margin-top: 10px;">Leggi di pi&ugrave; <i class="fa fa-chevron-down"></i></a>',
                lessLink: '<a href="#" style="text-align: right">Chiudi <i class="fa fa-chevron-up"></i></a>'
            });
        });
    </script>
</body>
<!--#include virtual="/inc_strClose.asp"-->
