<% Response.Expires = 0 %>
<% Response.Buffer = true %>

<!--#include file="Log.asp"-->
<!--#include file="cStripeFunctions.asp"-->
<%
aspLog("Payment Intent = " & Request.QueryString("payment_intent"))

'Response.Write Request.QueryString("payment_intent") & vbCrLf

Set stripe = New cStripeFunctions
'stripe.ApiKey = "sk_test_gy4Z9LsaI1Tt2kBo4KCgYsKk"
'stripe.ApiKey = "sk_test_hBlKI17SjkRsanqUQEZBT0Qe"

'>>>>>mettele il codice ApiKey LIVE prima di pubblicarlo!!!!!<<<<<
stripe.ApiKey = ""


if (Request.QueryString("payment_intent") = "") then
	Dim number,cvc,month,year,orderId
	number = Request.Form("card-number")
	cvc = Request.Form("card-cvc")
	month = Request.Form("card-month")
	year = Request.Form("card-year")
	orderId = Request.Form("orderId")
	totale_da_pagare = Request.Form("totale_da_pagare")

	'aspLog("number=" & number)
	'aspLog("cvc=" & cvc)
	'aspLog("month=" & month)
	'aspLog("year=" & year)
	aspLog("orderId=" & orderId)

	Dim result,paymentId

	paymentId=stripe.createWindowsGUID()

	aspLog("paymentId=" & paymentId)	
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

else
	result = stripe.retrievePaymentIntent(Request.QueryString("payment_intent"))
	
End If

aspLog(result)

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
