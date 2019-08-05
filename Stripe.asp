<% Response.Expires = 0 %>
<% Response.Buffer = true %>

<!--#include file="Log.asp"-->
<!--#include file="cStripeFunctions.asp"-->
<%
Dim number,cvc,month,year,orderId
number = Request.Form("card-number")
cvc = Request.Form("card-cvc")
month = Request.Form("card-month")
year = Request.Form("card-year")
orderId = Request.Form("orderId")
paymentId = Request.Form("paymentId")
totale_da_pagare = Request.Form("totale_da_pagare")

'aspLog("number=" & number)
'aspLog("cvc=" & cvc)
'aspLog("month=" & month)
'aspLog("year=" & year)
aspLog("orderId=" & orderId)

Set stripe = New cStripeFunctions

stripe.ApiKey = "sk_test_gy4Z9LsaI1Tt2kBo4KCgYsKk"

'Response.Write "<pre>Ordine OK - OrderId: " & responseCharge.data("metadata")("orderId") & "</pre>"

Dim result

'''------------- Vecchio metodo ---------------- '''
'result = stripe.createToken(month, year, cvc, number)

''' ------------- Nuovo metodo ----------------- '''
result = stripe.createPaymentMethods("card", month, year, cvc, number)

aspLog(result)

if (result<>"KO") then
	'Wscript.Echo("passo dal chargeCardWithToken")
	'''------------- Vecchio metodo ---------------- '''
	'result = stripe.chargeCardWithToken(result, totale_da_pagare, "eur", orderId)
	''' ------------- Nuovo metodo ----------------- '''
	result = stripe.paymentIntent(result, totale_da_pagare, "eur", orderId,paymentId)
End If

if (result<>"KO") then
	'response.Write "OK " & result
	session("ordine_shop")=result
	response.redirect("/pagamento_cc_ok.asp")
else
	'response.Write result & " " & orderId
	session("ordine_shop")=orderId
	response.redirect("/pagamento_cc_ko.asp")
End If


set stripe=nothing
set responseCharge=nothing

%>
