B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Activity
Version=9.3
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.
End Sub

Sub Globals
	Private AR_Interface As WebViewExtras
	Private EthioAREngine As WebView
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.LoadLayout("EthioARHome")
	
	AR_Interface.Initialize(EthioAREngine)
	
	Dim JavascriptInterface1 As DefaultJavascriptInterface
	JavascriptInterface1.Initialize
	AR_Interface.AddJavascriptInterface(JavascriptInterface1, "B4A")

	Dim WebChromeClient1 As DefaultWebChromeClient
	WebChromeClient1.Initialize("EthioARChrome")
	AR_Interface.SetWebChromeClient(WebChromeClient1)
	AR_Interface.JavaScriptEnabled = True
	
	EthioAREngine.LoadUrl("file:///android_asset/ethioar.html")
	
	Dim t As ColorDrawable
	t.Initialize(Colors.Transparent,0)
	EthioAREngine.Background = t
	
'	Dim Javascript As String
'	Javascript="alert('Hello World!')"
'	AR_Interface.executeJavascript(EthioAREngine, Javascript)
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Sub show_ARMsg(Value As String)
'	Log(Value)
	Msgbox(Value,"EthioAR")
End Sub

Sub EthioARChrome_ConsoleMessage(ConsoleMessage1 As ConsoleMessage) As Boolean
	Dim Message As StringBuilder
   
	Message.Initialize
	Message.Append("WebChromeClient1_ConsoleMessage: ")
	Select ConsoleMessage1.MessageLevel
		Case ConsoleMessage1.DEBUG
			Message.Append("DEBUG")
		Case ConsoleMessage1.ERROR
			Message.Append("ERROR")
		Case ConsoleMessage1.Log   '   the compiler insists on changing LOG to Log!
			Message.Append("LOG")
		Case ConsoleMessage1.TIP
			Message.Append("TIP")
		Case ConsoleMessage1.WARNING
			Message.Append("WARNING")
	End Select
	Log(Message.ToString)
   
	Message.Initialize
	Message.Append(ConsoleMessage1.Message)
	Message.Append(" in ")
	Message.Append(ConsoleMessage1.SourceId)
	Message.Append(" (Line: ")
	Message.Append(ConsoleMessage1.LineNumber)
	Message.Append(")")
   
	Log(Message.ToString)
   
	Return True
End Sub