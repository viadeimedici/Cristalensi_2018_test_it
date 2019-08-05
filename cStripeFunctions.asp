<!--#include file="aspJSON.asp"-->
<!--#include file="Log.asp"-->

<%

dim responseCharge,stripeURLCharge,stripeURLToken,returnMessage,Risultato

stripeURLPaymentMethods = "https://api.stripe.com/v1/payment_methods"
stripeURLPaymentIntent = "https://api.stripe.com/v1/payment_intents"
stripeURLCharge = "https://api.stripe.com/v1/charges"
stripeURLToken = "https://api.stripe.com/v1/tokens"

Class cStripeFunctions
Sub Class_Initialize()
    ApiKeyVar=""
End Sub

Sub Class_Terminate()
End Sub

private ApiKeyVar

'Read the current ID value
Public Property Get ApiKey()
    ApiKey = ApiKeyVar
End Property
'store a new ISBN value
Public Property Let ApiKey(p_Data)
    ApiKeyVar = p_Data
End Property

Function createWindowsGUID()
  createWindowsGUID = createGUID(8) & "-" & _
    createGUID(4) & "-" & _
    createGUID(4) & "-" & _
    createGUID(4) & "-" & _
    createGUID(12)
End Function

Function createGUID(tmpLength)
  Randomize Timer
  Dim tmpCounter,tmpGUID
  Const strValid = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  For tmpCounter = 1 To tmpLength
    tmpGUID = tmpGUID & Mid(strValid, Int(Rnd(1) * Len(strValid)) + 1, 1)
  Next
  createGUID = tmpGUID
End Function

Private Function makeStripeAPICall(url,requestBody,idempotencyKey)


    Set oJSON = New aspJSON

    Dim objXmlHttpMain,val

    aspLog(apikey)
    Set objXmlHttpMain = CreateObject("Msxml2.ServerXMLHTTP")

    'Set objXmlHttpMain = CreateObject("Msxml2.XMLHTTP")
    On Error Resume Next
    objXmlHttpMain.open "POST", url, False
    objXmlHttpMain.setRequestHeader "Authorization", "Bearer "& apikey
    objXmlHttpMain.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"	
	if (idempotencyKey<>"") Then
		objXmlHttpMain.setRequestHeader "Idempotency-Key", idempotencyKey
	End If
    objXmlHttpMain.send requestBody

	'Load JSON string
	val=objXmlHttpMain.responseText
	val = Replace(val, "\", "\\")
		val = Replace(val, """", "\""")
		'val = Replace(val, "/", "\/")
		val = Replace(val, Chr(8), "\b")
		val = Replace(val, Chr(12), "\f")
		val = Replace(val, Chr(10), "\n")
		val = Replace(val, Chr(13), "\r")
		val = Replace(val, Chr(9), "\t")
	aspLog(val)
		
	oJSON.loadJSON(objXmlHttpMain.responseText)
		
	'aspLog(Replace(objXmlHttpMain.responseText, "'", " "))
	
	
	
	id = oJSON.data("id")
	'aspLog("id=" & id)	
	aspLog("len=" & len(id))	
	Wscript.Echo(err.Number)
	if (len(id) = 0) Then 
		
		aspLog(Replace(oJSON.data("error")("message"),"'"," "))
		set makeStripeAPICall = Nothing		
	Else
		set makeStripeAPICall = oJSON
	End If
	
	
	
    'If err.Number <> 0 Then : showError() : End If

    'aspLog(objXmlHttpMain.responseText)
    'Load JSON string
    'oJSON.loadJSON(objXmlHttpMain.responseText)

    'Wscript.Echo objXmlHttpMain.responseText

    'Wscript.Echo oJSON.data("error")("message")

    'if (oJSON.data("error")) Then
	    'Stdout.WriteLine "error"
	    'aspLog(oJSON.data("error")("message"))
		'Risultato = "KO"
	    'WScript.Quit
    'Else
	    'set makeStripeAPICall = oJSON
      'Risultato = "OK"
    'End If


End Function

public Function createToken(month, year, cvc, number)
    Dim cardDetails, requestBody,result

    'set result= new aspJSON
    cardDetails = "card[exp_month]="& month &"&card[exp_year]="& year &"&card[number]="& number &"&card[cvc]="& cvc
    requestBody = "card[object]=card&"& cardDetails

    set result = makeStripeAPICall(stripeURLToken,requestBody,"")

    'Wscript.Echo result
    'Load JSON string
    'oJSON.loadJSON(result)

    'Stdout.WriteLine result
    'Stdout.WriteLine oJSON.data("error")("message")

    If (result is Nothing) Then 
		createToken="KO"
	else
		createToken = result.data("id")
	End If
End Function

public Function createPaymentMethods(typeCard, month, year, cvc, number)
    Dim cardDetails,typeDetails, requestBody,result

    typeDetails = "type="& typeCard
    cardDetails = "&card[exp_month]="& month &"&card[exp_year]="& year &"&card[number]="& number &"&card[cvc]="& cvc
    requestBody = typeDetails & cardDetails
	
	
    set result = makeStripeAPICall(stripeURLPaymentMethods,requestBody,"")

    If (result is Nothing) Then 
		createPaymentMethods="KO"
	else
		createPaymentMethods = result.data("id")
	End If
End Function

public Function chargeCardWithToken(token, cost,curr,orderId)
    Dim requestBody,metaDataDetails
    metaDataDetails = "&metadata[orderId]="& orderId
    requestBody = "currency="& curr &"&amount="& cost &"&source="& token & metaDataDetails


    'set chargeCardWithToken = makeStripeAPICall(stripeURLCharge,requestBody)
	set result = makeStripeAPICall(StripeURLCharge,requestBody,"")
	
	If (result is Nothing) Then
		chargeCardWithToken="KO"
	else
		chargeCardWithToken = result.data("metadata")("orderId")
	End If
End Function

public Function paymentIntent(methodId, cost,curr,orderId)
    Dim requestBody,metaDataDetails
    
	metaDataDetails = "&metadata[orderId]="& orderId
    requestBody = "confirm=true&" &"confirmation_method=automatic&" &"currency="& curr &"&amount="& cost &"&payment_method="& methodId & metaDataDetails
	
    set result = makeStripeAPICall(stripeURLPaymentIntent,requestBody,orderId)
	
	If (result is Nothing) Then
		paymentIntent="KO"
	else
		paymentIntent = result.data("metadata")("orderId")
	End If
End Function



End Class

%>
