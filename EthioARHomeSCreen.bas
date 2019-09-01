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
	
	AR_Interface.addJavascriptInterface(EthioAREngine, "AR_Interface")
	AR_Interface.addWebChromeClient(EthioAREngine,"EthioARChrome")
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub
