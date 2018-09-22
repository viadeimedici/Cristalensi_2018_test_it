<%
Set conn = Server.CreateObject("ADODB.Connection")
	'conn.open = "DRIVER={Microsoft Access Driver (*.mdb)};dbq="& Server.MapPath("/mdb-database/db_cristalensi_2016.mdb")
	conn.open = "Provider = SQLOLEDB; Data Source = 62.149.153.60; Database = MSSql147541; User ID = MSSql147541; Password=gaa52jp052"

response.ContentType = "text/xml"
response.write "<?xml version='1.0' encoding='UTF-8'?>"
response.write "<urlset xmlns='http://www.google.com/schemas/sitemap/0.9' xmlns:image='http://www.google.com/schemas/sitemap-image/1.1'>"

Set prod_rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT PkId, NomePagina FROM Prodotti"
prod_rs.open sql,conn, 1, 1

Do While not prod_rs.EOF

nomepagina=prod_rs("NomePagina")
pkid=prod_rs("PkId")

if InStr(nomepagina, "&")>0 then

else

	response.write "<url><loc>https://www.cristalensi.it/public/pagine/"&nomepagina&"</loc>"

		Set img_rs = Server.CreateObject("ADODB.Recordset")
		sql = "SELECT * FROM Immagini WHERE Record="&pkid&" AND Tabella='Prodotti' Order by PkId_Contatore ASC"
		img_rs.open sql,conn, 1, 1
		if img_rs.recordcount>0 then

		Do While not img_rs.EOF
			file_img=img_rs("file")
			if InStr(file_img, "&")>0 or InStr(file_img, "+")>0 then
			Else
				response.write "<image:image><image:loc>https://www.cristalensi.it/public/"&file_img&"</image:loc></image:image>"
			end if
		img_rs.movenext
		loop

		end if
		img_rs.close


	response.Write "</url>"

end if

prod_rs.movenext
loop


prod_rs.close

response.write "</urlset>"

conn.close
set conn = nothing
%>
