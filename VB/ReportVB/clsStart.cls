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
    
    Dim curUser As String
    Dim error As String
    Dim keyParam As String
    Dim stringParam As String
    Dim globParamsForm As String
    Dim ret As String
    Dim tagname As String
    Dim c As control
    Dim cornerx As Integer
    Dim cornery As Integer
    Dim maxWidthForm As Integer
    Dim maxHeightForm As Integer
    Dim vspint As Integer
    Dim controlWidth As Integer
    Dim controlHeight As Integer
    Dim vspstring As String
    Dim ok As Integer
    Dim counterListBox As Integer
    Dim counterComboBox As Integer
    
    Dim boxDataArray() As String
    Dim currDimBoxDataArray As Integer
    currDimBoxDataArray = -1
                
    Dim aaa As String
    Dim bbb As String
    aaa = "123^456"
    MsgBox ("bbb=" + putPiece(aaa, 3, "bbb", "^"))
                
    curUser = mvbAccess("$$getUser^TCLEx.VBReport()", sBuffer, "", "", "", "", "", "", "", "", "", "")
    
    If curUser = "" Then
          Cancel = True
          MsgBox ("Не определен пользователь")
          Exit Sub
    End If
     
     MsgBox ("user=" + curUser)
    globParamsForm = mvbAccess("$$FORM^REPORTSPB(P0,P1)", sBuffer, "Привет!", curUser, "", "", "", "", "", "", "", "")
    If (globParamsForm = "") Then
          Cancel = True
          MsgBox ("Ошибка при создании формы ввода параметров")
          Exit Sub
    End If
        
    maxWidthForm = 0
    maxHeightForm = 0
    counterListBox = 0
    counterComboBox = 0
    keyParam = ""
    Do
        ret = mvbAccess("$$getKey^REPORTSPB(P0,P1)", sBuffer, keyParam, globParamsForm, "", "", "", "", "", "", "", "")
        keyParam = Piece(sBuffer, 1, "^")
        If (keyParam <> "") Then
           ret = mvbAccess("$$getParam^REPORTSPB(P0,P1,P2)", sBuffer, keyParam, "", globParamsForm, "", "", "", "", "", "", "")
           stringParam = Piece(sBuffer, 1, "^")
           tagname = Replace(Piece(stringParam, 1, ":"), " ", "")
           cornerx = Val(Replace(Piece(stringParam, 2, ":"), " ", ""))
           cornery = Val(Replace(Piece(stringParam, 3, ":"), " ", ""))
           controlWidth = Val(Replace(Piece(stringParam, 4, ":"), " ", ""))
           controlHeight = Val(Replace(Piece(stringParam, 5, ":"), " ", ""))
           controlText = Piece(stringParam, 6, ":")
           'last param
           If (keyParam = "form") Then
              frmReportVB.left = cornerx
              frmReportVB.Top = cornery
              frmReportVB.Width = maxWidthForm + 100
              frmReportVB.Height = maxHeightForm + 900 '900 for buttons
            'MsgBox (maxWidthForm)
            'MsgBox (frmReportVB.Height)
              frmReportVB.Move (Screen.Width - frmReportVB.Width) / 2, (Screen.Height - frmReportVB.Height) / 2
              frmReportVB.Caption = Piece(stringParam, 1, ":")
              
              frmReportVB.cmdOK.Top = maxHeightForm
              frmReportVB.cmdOK.left = maxWidthForm - 2900
              frmReportVB.cmdOK.Caption = Piece(stringParam, 4, ":")
        
              frmReportVB.cmdCancel.Top = maxHeightForm
              frmReportVB.cmdCancel.left = maxWidthForm - 1400
              frmReportVB.cmdCancel.Caption = Piece(stringParam, 5, ":")
        
              Exit Do
           End If
           'count maxWidthForm, maxHeightForm
           vspint = cornerx + controlWidth
           If (vspint > maxWidthForm) Then
              maxWidthForm = vspint
           End If
           vspint = cornery + controlHeight
           If (vspint > maxHeightForm) Then
              maxHeightForm = vspint
           End If
           ok = 1
           Select Case tagname
           Case "Label"
               Set c = frmReportVB.Controls.Add("VB.Label", "control" + keyParam)
               c.Caption = controlText
            Case "Text"
               Set c = frmReportVB.Controls.Add("VB.TextBox", "control" + keyParam)
               c.Text = controlText
            Case "CheckBox"
               Set c = frmReportVB.Controls.Add("VB.CheckBox", "control" + keyParam)
               vspint = Val(Replace(Piece(stringParam, 8, ":"), " ", ""))
               If (vspint = 0) Then
                  c.Value = 0
               Else
                  c.Value = 1
               End If
           Case "ListBox"
               Set c = frmReportVB.Controls.Add("VB.ListBox", "control" + keyParam)
               'Call fillBox(c, keyParam, globParamsForm, keyParam + "List")
           Case "ComboBox"
               counerComboBox = counerComboBox + 1
               Set c = frmReportVB.Controls.Add("VB.ComboBox", "comboBox" + counerComboBox)
                
               'Call fillBox(c, keyParam, globParamsForm, boxDataArray, currDimBoxDataArray, counerComboBox)
               'ReDim Preserve comboBoxArray(counerComboBox)
               'For vrint = 1 To comboBoxVrArray.length()
               'Next
               
    'keyItem = ""
    'Do
    '    ret = mvbAccess("$$getItem^REPORTSPB(P0,P1,P2)", sBuffer, keyParam, keyItem, globParamsForm, "", "", "", "", "", "", "")
    '    keyItem = Piece(sBuffer, 1, "^")
    '    MsgBox (keyItem)
    '    stringItem = ""
    '    If (keyItem <> "") Then
    '        ret = mvbAccess("$$getParam^REPORTSPB(P0,P1,P2)", sBuffer, keyParam, keyItem, globParamsForm, "", "", "", "", "", "", "")
    '        stringItem = Piece(sBuffer, 1, "^")
    '    End If
    '    If ((keyItem <> "") And (stringItem <> "")) Then
    '       MsgBox ("keyItem=" + keyItem + " stringItem=" + stringItem)
    '       c.AddItem (stringItem)
    '       c.ItemData(c.NewIndex) = keyItem
    '    End If
    'Loop While (keyItem <> "")
           Case Else
               ok = 0
           End Select
           If (ok = 1) Then
               c.Visible = True
               c.left = cornerx
               c.Top = cornery
               c.Width = controlWidth
               If (tagname <> "ComboBox") Then
                  c.Height = controlHeight
               End If
           End If
        End If
        
    Loop While (keyParam <> "")
    
        'MsgBox (globParamsForm)
      
        frmReportVB.Show vbModal
        Buffer = frmReportVB.sBuffer
        Cancel = frmReportVB.bCancel
    
  
End Sub
    
 Private Sub fillBox(controlBox As control, param As String, globParamsForm As String, ByRef uArray() As String, ByRef currDimBoxDataArray As Integer, numBox As Integer)
    Dim ret As String
    Dim keyItem As String
    Dim stringItem As String
    Dim iCounter As Integer
    Dim vspstring As String
    
    ReDim uArray(0)
    controlBox.Clear
    
    keyItem = ""
    iCounter = -1
    Do
        'MsgBox ("param=" + param)
        'MsgBox ("glob=" + globParamsForm)
        ret = mvbAccess("$$getItem^REPORTSPB(P0,P1,P2)", sBuffer, param, keyItem, globParamsForm, "", "", "", "", "", "", "")
        keyItem = Piece(sBuffer, 1, "^")
        'MsgBox (keyItem)
        stringItem = ""
        If (keyItem <> "") Then
            ret = mvbAccess("$$getParam^REPORTSPB(P0,P1,P2)", sBuffer, param, keyItem, globParamsForm, "", "", "", "", "", "", "")
            stringItem = Piece(sBuffer, 1, "^")
        End If
        If ((keyItem <> "") And (stringItem <> "")) Then
           MsgBox ("keyItem=" + keyItem + " stringItem=" + stringItem)
           iCounter = iCounter + 1
           controlBox.AddItem (stringItem)
           controlBox.ItemData(controlBox.NewIndex) = iCounter
           If (iCounter > currDimBoxDataArray) Then
              ReDim Preserve uArray(iCounter)
              currDimBoxDataArray = iCounter
              uArray(iCounter) = putPiece("", numBox, keyItem, "^")
           Else
              vspstring = uArray(iCounter)
              uArray(iCounter) = putPiece(vspstring, numBox, keyItem, "^")
           End If
        End If
    Loop While (keyItem <> "")
 End Sub

Private Sub Class_Initialize()
    'Needs to be called to create link to Cache
    'Remember to have an invisible menu option, activated for the user.
    'четвертый параметр - какая-то программа cache , похоже, на пумтоту ругается
    Call ApplicationInitialise(gMenuOptions, App, "", "aaaa")
End Sub


