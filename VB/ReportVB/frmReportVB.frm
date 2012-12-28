VERSION 5.00
Object = "{1F09289B-86F2-4D12-9525-A2FE485BC3A7}#1.0#0"; "tkLTDateTime.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmReportVB 
   Caption         =   "Form1"
   ClientHeight    =   2775
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8355
   LinkTopic       =   "Form1"
   ScaleHeight     =   2775
   ScaleWidth      =   8355
   Begin tkLTDateTime.ctlTime iii_TimeArray 
      Height          =   315
      Index           =   0
      Left            =   7200
      TabIndex        =   14
      Top             =   240
      Visible         =   0   'False
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   556
   End
   Begin VB.ComboBox iii_ComboArrayL 
      Height          =   315
      Index           =   0
      Left            =   6840
      Style           =   2  'Dropdown List
      TabIndex        =   12
      Top             =   2040
      Visible         =   0   'False
      Width           =   1215
   End
   Begin tkLTDateTime.ctlDate iii_DateArray 
      Height          =   315
      Index           =   0
      Left            =   3000
      TabIndex        =   11
      Top             =   120
      Visible         =   0   'False
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   556
   End
   Begin VB.ComboBox iii_ComboArray 
      Height          =   315
      Index           =   0
      Left            =   6840
      TabIndex        =   10
      Top             =   1440
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox iii_TextArray 
      Height          =   495
      Index           =   0
      Left            =   6840
      TabIndex        =   9
      Top             =   720
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.ListBox iii_ListArray 
      Height          =   450
      Index           =   0
      Left            =   5880
      TabIndex        =   8
      Top             =   120
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.ListBox iii_ListArrayCB 
      Height          =   285
      Index           =   0
      Left            =   4440
      Style           =   1  'Checkbox
      TabIndex        =   7
      Top             =   120
      Visible         =   0   'False
      Width           =   1215
   End
   Begin MSFlexGridLib.MSFlexGrid Flex_grid1 
      Height          =   855
      Left            =   120
      TabIndex        =   3
      Top             =   1320
      Visible         =   0   'False
      Width           =   5055
      _ExtentX        =   8916
      _ExtentY        =   1508
      _Version        =   393216
      Rows            =   1
      FixedRows       =   0
      FixedCols       =   0
   End
   Begin VB.CommandButton Flex_btnDel1 
      Caption         =   "Удалить"
      Height          =   300
      Left            =   5520
      TabIndex        =   1
      Top             =   2400
      Visible         =   0   'False
      Width           =   970
   End
   Begin VB.CommandButton Flex_btnAdd1 
      Caption         =   "Добавить"
      Height          =   300
      Left            =   5520
      TabIndex        =   2
      Top             =   2040
      Visible         =   0   'False
      Width           =   970
   End
   Begin VB.TextBox parameters 
      Height          =   495
      Left            =   120
      TabIndex        =   4
      Top             =   720
      Visible         =   0   'False
      Width           =   6375
   End
   Begin VB.CommandButton cmd_OK 
      Caption         =   "Формир-е"
      Enabled         =   0   'False
      Height          =   380
      Left            =   120
      MaskColor       =   &H00808080&
      TabIndex        =   6
      Top             =   120
      Width           =   1335
   End
   Begin VB.CommandButton cmd_Cancel 
      Caption         =   "Выход"
      Height          =   380
      Left            =   1680
      TabIndex        =   5
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label iii_globTemp 
      Caption         =   "iii_globTemp"
      Height          =   495
      Left            =   3240
      TabIndex        =   13
      Tag             =   "0"
      Top             =   2280
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Label Flex_info1 
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   2160
      Visible         =   0   'False
      Width           =   2175
   End
End
Attribute VB_Name = "frmReportVB"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Public bCancel  As Boolean
Public sBuffer  As String

Public colorBase As ColorConstants
Public colorMandatoryField As ColorConstants


' Вспомогательные элементы
' iii_ListArray(0) - control ListBox (property Index=0) (view Standart) c method iii_ListArray_Click(Index As Integer) for test mandatory fields and enable/disable cmd_OK
'                    all elements with type ListBox (view <> CheckBox) in this array
' iii_ListArrayCB(0) - control ListBox (property Index=0) (view CheckBox) c method iii_ListArrayCB_Click(Index As Integer) for test mandatory fields and enable/disable cmd_OK
'                    all elements with type ListBox (view = CheckBox) in this array (Style=1)
' iii_DateArray(0) - control ctlDate (property Index=0) c method iii_DateArray_Change(Index As Integer) for test mandatory fields and enable/disable cmd_OK
'                    all elements with type DateText in this array
' iii_TimeArray(0) - control ctlTime (property Index=0) c method iii_TimeArray_Change(Index As Integer) for test mandatory fields and enable/disable cmd_OK
'                    all elements with type TimeText in this array
' iii_ComboArray(0) - control ComboBox (property Index=0) c method iii_ComboArray_Click(Index As Integer),iii_ComboArray_Change(Index As Integer) for test mandatory fields and enable/disable cmd_OK
'                    all elements with type ComboBox (subtype Standart) in this array
' iii_ComboArrayL(0) - control ComboBox (property Index=0) c method iii_ComboArray_Click(Index As Integer),iii_ComboArray_Change(Index As Integer) for test mandatory fields and enable/disable cmd_OK
'                    all elements with type ComboBox (subtype List) in this array (Style=2)
' Flex_grig1 type MSFlexGrid
' Flex_btnAdd1 type Button
' Flex_btnDel1 type Button
' Flex_info1 type TextBox
'      Flex_info1 text (delimeter Chr(1))
                     ' 1 - кол-во столбцов
                     ' 2 - имя элемента с grid
                     ' 3 - имя параметра (пользовательское)
                     ' 4 - .... - параметры источники через $char(1)
'
' parameters type Label - visible=false - for strings of parameters

Private Sub Flex_btnAdd1_Click()
' button Add for element FlexGrid
' auxiliary elements: frmReportVB.Flex_info1, frmReportVB.Flex_grid11, frmReportVB.Flex_btnAdd1, frmReportVB.Flex_btnDel1
   Dim info As String
   Dim nameSource As String
   Dim cColumns As Integer
   Dim sourceElement As Control
   Dim i As Integer
   Dim Value As String
   Dim values As String
   Dim col As Integer
   Dim tag As String
      
   info = frmReportVB.Flex_info1.Caption
   cColumns = Val(Piece(info, 1, Chr(1))) ' кол-во столбцов
   'nameGrid = Piece(info, 2, Chr(1)) ' имя элемента grid (frmReportVB.Flex_grid11)
   If (cColumns > 0) Then
         frmReportVB.Flex_grid1.cols = cColumns
         values = ""
         For col = 1 To cColumns
            nameSource = Piece(info, 3 + col, Chr(1))
            If (nameSource <> "") Then
               Value = ""
               For Each sourceElement In frmReportVB.Controls
                  tag = Piece(sourceElement.tag, 1, Chr(1))
                  'MsgBox (" tag=" & tag & " sourceElement.Name=" & sourceElement.Name)
                  If ((sourceElement.Name = nameSource) Or (tag = nameSource)) Then
                     If ((TypeOf sourceElement Is ListBox) Or (TypeOf sourceElement Is ComboBox)) Then
                        i = sourceElement.ListIndex
                        If (i <> -1) Then
                           Value = sourceElement.List(i)
                           sourceElement.ListIndex = -1
                         End If
                     End If
                     If ((TypeOf sourceElement Is TextBox) Or (TypeOf sourceElement Is ctlDate) Or (TypeOf sourceElement Is ctlTime)) Then
                        Value = sourceElement.Text
                        sourceElement.Text = ""
                      End If
                     If (TypeOf sourceElement Is Label) Then
                        Value = sourceElement.Caption
                     End If
                     If (col > 1) Then
                         values = values & vbTab
                     End If
                     values = values & Value
                     Exit For
                  End If
               Next sourceElement
            End If
         Next
         If (Replace(values, vbTab, "") <> "") Then
            ' test such string already is
            If testValueIs(frmReportVB.Flex_grid1, values) Then
               MsgBox ("Строка с такими значениями уже существует.")
            Else
               frmReportVB.Flex_grid1.AddItem values
            End If
         End If
   End If
   
End Sub

Private Sub Flex_btnDel1_Click()
   ' button Delete for element FlexGrid
   With frmReportVB.Flex_grid1
       If (.Rows - .FixedRows = 1) Then
          .Rows = .Rows - 1
       Else
          Call .RemoveItem(.Row)
       End If
   End With
End Sub

Private Function testValueIs(c As Control, Value As String) As Boolean
' test if the same string is element c (MSFlexGrid)
   Dim Row As Integer
   Dim col As Integer
   Dim vspstr As String
   Dim cols As Integer
   Dim Index As Integer
   
   testValueIs = False
   
   cols = c.cols
   For Row = 0 To c.Rows - 1
     vspstr = ""
      For col = 0 To cols - 1
          If (vspstr <> "") Then
             vspstr = vspstr & vbTab
          End If
          Index = Row * cols + col
          vspstr = vspstr & c.TextArray(Index)
      Next
      If (vspstr = Value) Then
          testValueIs = True
          Exit Function
      End If
   Next
End Function

Private Sub Form_Load()
   colorBase = vbWhite
   colorMandatoryField = &HFFFF00
   'frmReportVB.VisM1.Connect ("CN_IPTCP:127.0.0.1[1972]")
End Sub

' all actions in method Form_QueryUnload
Private Sub cmd_Cancel_Click()
    'sBuffer = ""
    'bCancel = True
    'ret = mvbAccess("$$KillTemp^REPORTSPB(P0)", sBuffer, frmReportVB.iii_globTemp.Caption, "", "", "", "", "", "", "", "", "")
    Unload Me
End Sub
 'Unload form
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    'MsgBox ("QueryUnload")
    sBuffer = ""
    bCancel = True
    ' kill temp globs (transfer name temp glob - unuselessly - suppose ^TEMP($j) bacause job)
    ret = mvbAccess("$$KillTemp^REPORTSPB(P0)", sBuffer, frmReportVB.iii_globTemp.Caption, "", "", "", "", "", "", "", "", "")
End Sub

Private Sub cmd_OK_Click()
 ' button Формирование отчета
    Dim parameters As String
    Dim controlName As String
    Dim parameterName As String
    Dim parameterValue As String
    Dim cControl As Control
    Dim i As Integer
    Dim controlDuble As Control
    Dim cControl1 As Control
    Dim controlDubleName As String
    Dim ret As String
    Dim browserReport As String
    Dim file As String
    Dim curUser As String
    Dim typeControl As String
            
    Dim vspdate As ctlDate
    Dim vspstr As String
    Dim vspint As Integer
    Dim vspbool As Boolean
    
    Dim fileExtension As String
    Dim fileDestination As String
    Dim executableFile As String
    Dim paramslist As String
    
    Dim col As Integer
    Dim Row As Integer
    Dim cols As Integer
    
    Dim selectedItems() As String
        
    sBuffer = ""
    bCancel = True 'no need start SPRINQ
    
    'frmReportVB.hwnd
    
    'test
    'Dim Thisprocess As Process
    'For Each Thisprocess In Processes
    '        With Thisprocess
    '            MsgBox (Thisprocess.SystemID)  '& " process.hWnd=" & .hWnd)
    '        End With
    'Next Thisprocess
    'test
    
    ' user
    curUser = mvbAccess("$$getUser^TCLEx.VBReport()", sBuffer, "", "", "", "", "", "", "", "", "", "")

    If curUser = "" Then
          Cancel = True
          MsgBox ("Не определен пользователь")
          Unload Me
          Exit Sub
    End If
    
    paramslist = frmReportVB.parameters.Text  ' список имен параметров
    ' create string of parameters
    parameters = "" ' список параметров со значениями для передачи в START^routine

    For Each cControl In frmReportVB.Controls
      
      controlName = cControl.Name
      typeControl = TypeName(cControl)
      'MsgBox ("controlName =" & controlName & " type=" & TypeName(cControl))
      ' for controls which were created with use Array - name of control is in property Tag
      If (Mid(controlName, 1, 4) = "iii_") Then
         controlName = Piece(cControl.tag, 1, Chr(1))
      End If

      parameterName = Mid(controlName, 4)
      If (TypeOf cControl Is OptionButton) Then
          parameterName = Piece(parameterName, 1, "_")
      End If
      
      If (typeControl <> "VisM") Then
      If ((parameterName <> "") And (InStr(paramslist, parameterName) <> 0) And (cControl.Visible = True)) Then
        parameterValue = ""
        'MsgBox ("controlName=" & controlName & " parameterName=" & parameterName & " typename=" & TypeName(cControl))
        
        typeControl = TypeName(cControl)
        
        Select Case typeControl
        
        'add on form invisible control ctlDate - then work cControl.Text
        'MsgBox (VarType(cControl) & "*" & TypeName(cControl))
          Case "ctlDate"
             parameterValue = DatePut(cControl.Text)
        
          Case "ctlTime"
             parameterValue = cControl.Text
      
          Case "TextBox"
             parameterValue = cControl.Text
        
          Case "CheckBox"
             parameterValue = cControl.Value
        
          Case "ListBox"
             'i = cControl.ListIndex
             controlDubleName = "cDuble_" & parameterName
             'If ((cControl.ListCount > 0) And (i <> -1)) Then
             If (cControl.SelCount > 0) Then
                  'selectedItems = cControl.Selected
                 'MsgBox (UBound(selectedItems))
                 'vspint = UBound(selectedItems) - 1
                 
                 ' find duble element
                 For Each cControl1 In frmReportVB.Controls
                     If (cControl1.Name = controlDubleName) Then
                         For i = 0 To cControl.ListCount - 1
                            If (cControl.Selected(i) = True) Then
                                If (parameterValue <> "") Then
                                   parameterValue = parameterValue & Chr(1)
                                End If
                                parameterValue = parameterValue & cControl1.List(i)
                            End If
                         Next
                     End If
                 Next cControl1
             End If
        
          Case "ComboBox"
             i = cControl.ListIndex
             controlDubleName = "cDuble_" & parameterName
             ' find duble element
             If ((cControl.ListCount > 0) And (i <> -1)) Then
                 For Each cControl1 In frmReportVB.Controls
                     If (cControl1.Name = controlDubleName) Then
                         parameterValue = cControl1.List(i)
                         Exit For
                     End If
                 Next cControl1
             End If
        
       
          Case "OptionButton"
             If (cControl.Value = True) Then
                 parameterValue = Piece(controlName, 2, "_")
             End If
        
          Case "MSFlexGrid"
            parameterName = Piece(frmReportVB.Flex_info1.Caption, 3, Chr(1)) ' here save real name of parameter
            If (parameterName <> "") Then
               parameterValue = ""
               cols = cControl.cols
               For Row = 0 To cControl.Rows - 1
                  If (parameterValue <> "") Then
                     parameterValue = parameterValue & Chr(4) 'delimeter of rows
                  End If
                  vspstr = ""
                  For col = 0 To cols - 1
                     If (vspstr <> "") Then
                        vspstr = vspstr & Chr(1) 'delimeter of cols
                     End If
                     vspint = Row * cols + col
                     vspstr = vspstr & cControl.TextArray(vspint)
                  Next
                  parameterValue = parameterValue & vspstr
               Next
             End If
        
        End Select
        
        If ((typeControl <> "OptionButton") And (typeControl <> "Frame")) Then
            parameters = parameters & parameterName & Chr(3) & parameterValue & Chr(2)
        Else
            If (parameterValue <> "") Then
               parameters = parameters & parameterName & Chr(3) & parameterValue & Chr(2)
            End If
        End If
      End If
      End If
    Next cControl
        
    'if parameter is not defined
    'vspstr = Piece(frmReportVB.Flex_info1.Caption, 3, Chr(1))
    For i = 1 To (mLength(paramslist, "^") + 1)
        parameterName = Piece(paramslist, i, "^")
        If ((parameterName <> "") And (parameterName <> "x_grid1")) Then
          If (InStr(parameters, parameterName) = 0) Then
             parameters = parameters & parameterName & Chr(3) & Chr(2)
          End If
        End If
    Next
    'MsgBox ("parameters=" & parameters)
    
    ' create file with report
    'ret = cacheExecute("$$START^REPORTSPB(P0,P1,P2)", sBuffer, "", curUser, parameters, "", "", "", "", "", "", "")
    ret = mvbAccess("$$STARTjob^REPORTSPB(P0,P1,P2)", sBuffer, "", curUser, parameters, "", "", "", "", "", "", "")
    If (ret = "1") Then
       FormProgressBar.Move (Screen.width - FormProgressBar.width) / 2, (Screen.height - FormProgressBar.height) / 2
       FormProgressBar.Timer1.Interval = 1000
       FormProgressBar.Timer1.Enabled = True
       FormProgressBar.Show (vbModal)
       'MsgBox ("After : FormProgressBar.Visible=" & FormProgressBar.Visible & " FormProgressBar.Timer1.Enabled=" & FormProgressBar.Timer1.Enabled & " FormProgressBar.Timer1.Interval=" & FormProgressBar.Timer1.Interval & " FormProgressBar.WindowState=" & FormProgressBar.WindowState)
       ' kill prosess if press X in frmProgressBar
       ret = mvbAccess("$$KillProcess^REPORTSPB()", sBuffer, "", "", "", "", "", "", "", "", "", "")
    End If
        
End Sub

Private Sub iii_ComboArray_Change(Index As Integer)
   'MsgBox (iii_ComboArray(Index).tag)
   If (Piece(iii_ComboArray(Index).tag, 2, Chr(1)) = "1") Then
      If (iii_ComboArray(Index).ListIndex <> -1) Then
         iii_ComboArray(Index).BackColor = colorBase 'white
      Else
         iii_ComboArray(Index).BackColor = colorMandatoryField 'blue
      End If
      Call OnOffButtonOK
   End If
End Sub

Private Sub iii_ComboArray_Click(Index As Integer)
   If (Piece(iii_ComboArray(Index).tag, 2, Chr(1)) = "1") Then
      If (iii_ComboArray(Index).ListIndex <> -1) Then
         iii_ComboArray(Index).BackColor = colorBase 'white
      Else
         iii_ComboArray(Index).BackColor = colorMandatoryField 'blue
      End If
      Call OnOffButtonOK
   End If
End Sub

Private Sub iii_ComboArrayL_Change(Index As Integer)
   If (Piece(iii_ComboArrayL(Index).tag, 2, Chr(1)) = "1") Then
      If (iii_ComboArrayL(Index).ListIndex <> -1) Then
         iii_ComboArrayL(Index).BackColor = colorBase 'white
      Else
         iii_ComboArrayL(Index).BackColor = colorMandatoryField 'blue
      End If
      Call OnOffButtonOK
   End If
End Sub
Private Sub iii_ComboArrayL_Click(Index As Integer)
   If (Piece(iii_ComboArrayL(Index).tag, 2, Chr(1)) = "1") Then
      If (iii_ComboArrayL(Index).ListIndex <> -1) Then
         iii_ComboArrayL(Index).BackColor = colorBase 'white
      Else
         iii_ComboArrayL(Index).BackColor = colorMandatoryField 'blue
      End If
      Call OnOffButtonOK
   End If
End Sub

' изменилось состояние ctlDate
Private Sub iii_DateArray_Change(Index As Integer)
   If (Piece(iii_DateArray(Index).tag, 2, Chr(1)) = "1") Then
      If (iii_DateArray(Index).Text <> "") Then
         iii_DateArray(Index).BackColor = &H80000005 'white
      Else
         iii_DateArray(Index).BackColor = &HFFFF00 'blue
      End If
      Call OnOffButtonOK
   End If
End Sub

' изменилось состояние ctlTime
Private Sub iii_TimeArray_Change(Index As Integer)
   If (Piece(iii_TimeArray(Index).tag, 2, Chr(1)) = "1") Then
      If (iii_TimeArray(Index).Text <> "") Then
         iii_TimeArray(Index).BackColor = &H80000005 'white
      Else
         iii_TimeArray(Index).BackColor = &HFFFF00 'blue
      End If
      Call OnOffButtonOK
   End If
End Sub

' изменилось состояние iii_ListArray (ListBox without CheckBox)
Private Sub iii_ListArray_Click(Index As Integer)
   If (Piece(iii_ListArray(Index).tag, 2, Chr(1)) = "1") Then
      'MsgBox ("listindex=" + iii_ListArray(Index).ListIndex)
      If (iii_ListArray(Index).SelCount > 0) Then
         iii_ListArray(Index).BackColor = colorBase 'white
      Else
         iii_ListArray(Index).BackColor = colorMandatoryField 'blue
      End If
      Call OnOffButtonOK
   End If
End Sub

'Private Sub iii_DateArray_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
'         MessageBox.Show ("Text Changed")
'    End Sub

Private Sub iii_ListArrayCB_Click(Index As Integer)
   If (Piece(iii_ListArrayCB(Index).tag, 2, Chr(1)) = "1") Then
      If (iii_ListArrayCB(Index).SelCount > 0) Then
         iii_ListArrayCB(Index).BackColor = colorBase 'white
      Else
         iii_ListArrayCB(Index).BackColor = colorMandatoryField 'blue
      End If
      Call OnOffButtonOK
   End If
End Sub

Private Sub OnOffButtonOK()
' если все обязательные поля определены, то включаем кнопку cmd_OK
' иначе - выключаем
   If (testAllMandatoryFieldsOn() = True) Then
          frmReportVB.cmd_OK.Enabled = True
      Else
          frmReportVB.cmd_OK.Enabled = False
   End If
End Sub
Public Function testAllMandatoryFieldsOn() As Boolean
   Dim cc As Control
   Dim ok As Boolean
   Dim tag As String
   Dim typeControl As String
   
   ok = True
   For Each cc In frmReportVB.Controls
      tag = cc.tag
      If (tag <> "") Then
         If (Piece(tag, 2, Chr(1)) = "1") Then
             typeControl = TypeName(cc)
             Select Case typeControl
               Case "ctlDate"
                  If (cc.Text = "") Then
                     ok = False
                  End If
               Case "ctlTime"
                  If (cc.Text = "") Then
                     ok = False
                  End If
               Case "TextBox"
                  If (cc.Text = "") Then
                     ok = False
                  End If
               Case "ListBox"
                   If (Not cc.SelCount > 0) Then
                     ok = False
                  End If
               Case "ComboBox"
                  If (cc.ListIndex = -1) Then
                     ok = False
                  End If
             End Select
         End If
     End If
   Next cc
    
   testAllMandatoryFieldsOn = ok
   
End Function


Private Sub Label1_Click()

End Sub
