VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsStart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Public Buffer As String
Public Cancel As Boolean

Public Sub formshow()
    
    Dim reportURLanswer As String
    Dim reportURL As String
    Dim errorString As String
    Dim ErrorLevel As Integer
    
    Buffer = frmPRTCLNRUS.sBuffer
    Cancel = frmPRTCLNRUS.bCancel
    
    reportURLanswer = mvbAccess("$$getReportURL^TCLEx.VBReport()", sBuffer, "", "", "", "", "", "", "", "", "", "")
    reportURL = Piece(reportURLanswer, 1)
    errorString = Piece(reportURLanswer, 2)
    'MsgBox ("reportURL=" & reportURL)
    'MsgBox ("errorString=" & errorString)
    
    If errorString = "" Then
        ErrorLevel = ShellExecute(vbNull, "open", reportURL, vbNull, vbNull, 1)
        Cancel = True 'если False, то после запуска отчета в каше запускается процесс job START^SSPRINQ
    Else
        MsgBox errorString
        Cancel = True
    End If
End Sub

Private Sub Class_Initialize()
    'Needs to be called to create link to Cache
    'Remember to have an invisible menu option, activated for the user.
    'четвертый параметр - какая-то программа cache , похоже, на пумтоту ругается
    'Call ApplicationInitialise(gMenuOptions, App, "", "demo")
End Sub

