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
'Public currNumberInArray As Integer
'Public ListObject As Object
'Public allmandatoryFields As String


Public Sub formshow()
    
    Dim curUser As String
    Dim error As String
    Dim keyParam As String
    Dim stringParam As String
    Dim globParamsForm As String
    Dim ret As String
    Dim typeControl As String
    Dim c As Control
    Dim cDuble As Control
    Dim cornerx As Integer
    Dim cornery As Integer
    Dim maxWidthForm As Integer
    Dim maxHeightForm As Integer
    Dim defaultValue As String
    Dim controlWidth As Integer
    Dim controlHeight As Integer
    Dim vspstr As String
    Dim vspint As Integer
    Dim ok As Integer
    Dim cControl As Control
    Dim cControl1 As Control
    Dim typeArrangeButtons As String
    Dim cols As Integer
    Dim controlText As String
    Dim tabIndex As Integer
    Dim tag As String
    Dim ii As Integer
    Dim okMandatoryFields As Boolean  ' флаг , все ли обязательные поля определены
    
    Dim countDates As Integer
    Dim countTimes As Integer
    Dim countTexts As Integer
    Dim countListBoxes As Integer
    Dim countListBoxesCB As Integer
    Dim countComboBoxes As Integer
    Dim countComboBoxesL As Integer
    
    Dim allparams() As String
    Dim countElements As Integer
        
    Dim colorMandatoryField As ColorConstants
    colorMandatoryField = &HFFFF00
    
    Dim flagMandatoryField As String
    
    Dim delimeter As String
    
    delimeter = Chr(0)
    
    frmReportVB.parameters.Text = ""
        
    ' user
    'MsgBox (m_UserName)
    curUser = mvbAccess("$$getUser^TCLEx.VBReport()", sBuffer, "", "", "", "", "", "", "", "", "", "")
    
    If curUser = "" Then
          Cancel = True
          MsgBox ("Не определен пользователь")
          Exit Sub
    End If
     
    ' проверка доступа пользователя к данному отчету
    vspstr = mvbAccess("$$TestAccessUserToReport^TCLEx.VBReport(P0)", sBuffer, curUser, "", "", "", "", "", "", "", "", "")
    If (Piece(vspstr, 1, Chr(1)) = 0) Then
       MsgBox (Piece(vspstr, 2, Chr(1)))
       Cancel = True
       Exit Sub
    End If
     
    'get glob with description of parameters and screen
    globParamsForm = mvbAccess("$$FORM^REPORTSPB(P0,P1)", sBuffer, "", curUser, "", "", "", "", "", "", "", "")
    If (globParamsForm = "") Then
          Cancel = True
          MsgBox ("Ошибка при создании формы ввода параметров")
          Exit Sub
    End If
    frmReportVB.iii_globTemp.Caption = globParamsForm
         
    maxWidthForm = 0
    maxHeightForm = 0
    ' get description of each parameter and make relative control
    ' первый проход
    tabIndex = 0
    countElements = 0
    
    countDates = 0 ' count elements DateText
    countTimes = 0 ' count elements TimeText
    countTexts = 0 ' count elements Text
    countComboBoxes = 0 ' count elements ComboBox (Standart)
    countComboBoxesL = 0 ' count elements ComboBox (List)
    countListBoxesCB = 0 ' count elements ListBox (CheckBox)
    countListBoxes = 0  ' count elements ListBox (Standart)
    
    okMandatoryFields = True ' флаг , все ли обязательные поля определены
        
    keyParam = ""
    Do
        ret = mvbAccess("$$getKey^REPORTSPB(P0,P1)", sBuffer, keyParam, globParamsForm, "", "", "", "", "", "", "", "")
        keyParam = Piece(sBuffer, 1, "^")
         If (keyParam <> "") Then
           ret = mvbAccess("$$getParam^REPORTSPB(P0,P1,P2)", sBuffer, keyParam, "", globParamsForm, "", "", "", "", "", "", "")
           stringParam = Piece(sBuffer, 1, "^")
            
           'для второго прохода
           countElements = countElements + 1
           ReDim Preserve allparams(countElements)
           allparams(countElements - 1) = keyParam & Chr(1) & stringParam
           
           'MsgBox ("keyParam=" & keyParam & " stringParam=" & stringParam)
           typeControl = Replace(Piece(UCase(stringParam), 1, delimeter), " ", "")
           cornerx = Val(Replace(Piece(stringParam, 2, delimeter), " ", ""))
           cornery = Val(Replace(Piece(stringParam, 3, delimeter), " ", ""))
           controlWidth = Val(Replace(Piece(stringParam, 4, delimeter), " ", ""))
           controlHeight = Val(Replace(Piece(stringParam, 5, delimeter), " ", ""))
           controlText = Trim(Piece(stringParam, 6, delimeter))
           flagMandatoryField = UCase(Replace(Piece(stringParam, 7, delimeter), " ", ""))
           defaultValue = Replace(Piece(stringParam, 8, delimeter), " ", "")
          ' max width and height
          If Not (keyParam = "form") Then
           'count maxWidthForm, maxHeightForm
           vspint = cornerx + controlWidth
           If (vspint > maxWidthForm) Then
              maxWidthForm = vspint
           End If
           vspint = cornery + controlHeight
           If (vspint > maxHeightForm) Then
              maxHeightForm = vspint
           End If
           
           ' ok=0 - control is not created, ok=1 - control create with use Array of Controls, ok=2 - control create with use rmReportVB.Controls.Add
           ok = 1
           
           Select Case typeControl
           
            Case "DATETEXT"
               countDates = countDates + 1
               Load frmReportVB.iii_DateArray(countDates)
               tag = "dat" + keyParam
               If (flagMandatoryField = "TRUE") Then
                  tag = tag + Chr(1) + "1"
               End If
               With frmReportVB.iii_DateArray(countDates)
                    .tag = tag
                    .Visible = True
                    .Left = cornerx
                    .Top = cornery
                    .width = controlWidth
                    .height = controlHeight
                    If (controlText <> "") Then
                       .Text = controlText
                       '.Text = clstkFormat.FormatGenDate(controlText, "dd.mm.yyyy") вызов метода класса из dll (прописана в references)
                    Else
                       If (defaultValue <> "") Then
                          .Text = defaultValue
                          '.Text = Format(defaultValue, "dd.mm.yyyy")
                          '.Text = clstkFormat.FormatGenDate(defaultValue, "dd.mm.yyyy")
                       End If
                    End If
                    If ((flagMandatoryField = "TRUE") And (.Text = "")) Then
                       .BackColor = colorMandatoryField
                       okMandatoryFields = False
                    End If
               End With
               
            Case "TIMETEXT"
               countTimes = countTimes + 1
               Load frmReportVB.iii_TimeArray(countTimes)
               tag = "tim" + keyParam
               If (flagMandatoryField = "TRUE") Then
                  tag = tag + Chr(1) + "1"
               End If
               'MsgBox ("tag=" & tag & " stringParam=" & stringParam)
               With frmReportVB.iii_TimeArray(countTimes)
                    .tag = tag
                    .Visible = True
                    .Left = cornerx
                    .Top = cornery
                    .width = controlWidth
                    .height = controlHeight
                    If (controlText <> "") Then
                       .Text = controlText
                       '.Text = clstkFormat.FormatGenDate(controlText, "dd.mm.yyyy") вызов метода класса из dll (прописана в references)
                    Else
                       If (defaultValue <> "") Then
                          .Text = defaultValue
                          '.Text = Format(defaultValue, "dd.mm.yyyy")
                          '.Text = clstkFormat.FormatGenDate(defaultValue, "dd.mm.yyyy")
                       End If
                    End If
                    If ((flagMandatoryField = "TRUE") And (.Text = "")) Then
                       .BackColor = colorMandatoryField
                       okMandatoryFields = False
                    End If
               End With
                              
            Case "LABEL"
               Set c = frmReportVB.Controls.Add("VB.Label", "lbl" + keyParam)
               c.Caption = controlText
               ok = 2
               
            Case "TEXT"
               countTexts = countTexts + 1
               Load frmReportVB.iii_TextArray(countTexts)
               tag = "txt" + keyParam
               If (flagMandatoryField = "TRUE") Then
                  tag = tag + Chr(1) + "1"
               End If
               With frmReportVB.iii_TextArray(countTexts)
                    .tag = tag
                    .Visible = True
                    .Left = cornerx
                    .Top = cornery
                    .width = controlWidth
                    .height = controlHeight
                  
                    If (controlText <> "") Then
                       .Text = controlText
                    'Else
                    '   If (defaultValue <> "") Then
                    '      .text = defaultValue
                    '   End If
                    End If
                    If ((flagMandatoryField = "TRUE") And (.Text = "")) Then
                       .BackColor = colorMandatoryField
                       okMandatoryFields = False
                    End If
               End With

               
            Case "CHECKBOX"
               Set c = frmReportVB.Controls.Add("VB.CheckBox", "chb" + keyParam)
               vspint = 0
               If (defaultValue <> "") Then
                  vspint = Val(defaultValue)
               End If
               If (vspint = 0) Then
                  c.Value = 0
               Else
                  c.Value = 1
               End If
               ok = 2
               
           Case "LISTBOX"
               'control- duble for keep codes
               Set cDuble = frmReportVB.Controls.Add("VB.ListBox", "cDuble_" + keyParam)
               cDuble.Visible = False
               tag = "lst" + keyParam
               If (flagMandatoryField = "TRUE") Then
                  tag = tag + Chr(1) + "1"
               End If
               ' listbox view checkbox (style=1 not set at run time)
               If (UCase(Replace(Piece(stringParam, 9, delimeter), " ", "")) = "CHECKBOX") Then
                  countListBoxesCB = countListBoxesCB + 1
                  Load frmReportVB.iii_ListArrayCB(countListBoxesCB)
                  ' fill
                  Call fillListBox(countListBoxesCB, cDuble, keyParam, globParamsForm, defaultValue, "LC")
                  With frmReportVB.iii_ListArrayCB(countListBoxesCB)
                    .tag = tag
                    .Visible = True
                    .Left = cornerx
                    .Top = cornery
                    .width = controlWidth
                    .height = controlHeight
                    If ((flagMandatoryField = "TRUE") And (.SelCount = 0)) Then
                       .BackColor = colorMandatoryField
                       okMandatoryFields = False
                    End If
                  End With
               ' listbox standart view
               Else
                  countListBoxes = countListBoxes + 1
                  Load frmReportVB.iii_ListArray(countListBoxes)
                  ' fill
                  Call fillListBox(countListBoxes, cDuble, keyParam, globParamsForm, defaultValue, "LS")
                  With frmReportVB.iii_ListArray(countListBoxes)
                    .tag = tag
                    .Visible = True
                    .Left = cornerx
                    .Top = cornery
                    .width = controlWidth
                    .height = controlHeight
                    .Visible = True
                    If ((flagMandatoryField = "TRUE") And (.SelCount = 0)) Then
                       .BackColor = colorMandatoryField
                       okMandatoryFields = False
                    End If
                  End With
               End If
               
           Case "COMBOBOX"
               'control- duble for keep codes
               Set cDuble = frmReportVB.Controls.Add("VB.ComboBox", "cDuble_" + keyParam)
               cDuble.Visible = False
               tag = "cbo" + keyParam
               If (flagMandatoryField = "TRUE") Then
                  tag = tag + Chr(1) + "1"
               End If
             If (UCase(Replace(Piece(stringParam, 9, delimeter), " ", "")) = "LIST") Then
               countComboBoxesL = countComboBoxesL + 1
               Load frmReportVB.iii_ComboArrayL(countComboBoxesL)
               ' fill
               Call fillListBox(countComboBoxesL, cDuble, keyParam, globParamsForm, defaultValue, "CL")
               With frmReportVB.iii_ComboArrayL(countComboBoxesL)
                    .tag = tag
                    .Visible = True
                    .Left = cornerx
                    .Top = cornery
                    .width = controlWidth
                    .Visible = True
                    'MsgBox ("keyParam=" & keyParam & " flagMandatoryField=" & flagMandatoryField & " .ListIndex=" & .ListIndex)
                    If ((flagMandatoryField = "TRUE") And (.ListIndex = -1)) Then
                       .BackColor = colorMandatoryField
                       okMandatoryFields = False
                    End If
               End With
             Else
               countComboBoxes = countComboBoxes + 1
               Load frmReportVB.iii_ComboArray(countComboBoxes)
               ' fill
               Call fillListBox(countComboBoxes, cDuble, keyParam, globParamsForm, defaultValue, "CS")
               With frmReportVB.iii_ComboArray(countComboBoxes)
                    .tag = tag
                    .Visible = True
                    .Left = cornerx
                    .Top = cornery
                    .width = controlWidth
                    .Visible = True
                    If ((flagMandatoryField = "TRUE") And (.ListIndex = -1)) Then
                       .BackColor = colorMandatoryField
                       okMandatoryFields = False
                    End If
               End With
             End If
             
           Case "RADIOBUTTON"
               Set c = frmReportVB.Controls.Add("VB.Frame", "rbn" + keyParam)
               Call fillRadioButton(c, keyParam, globParamsForm, controlWidth, controlHeight, defaultValue)
               ok = 2
               
           Case Else
               ok = 0
           End Select
           ' ok=0 - control is not created
           ' ok=1 - control create with use Array of Controls
           ' ok=2 - control create with use rmReportVB.Controls.Add
           If (ok <> 0) Then
               tabIndex = tabIndex + 1
               If (typeControl <> "LABEL") Then
                   frmReportVB.parameters.Text = frmReportVB.parameters.Text & keyParam & "^"
               End If
               If (ok = 2) Then
                   c.Left = cornerx
                   c.Top = cornery
                   c.width = controlWidth
                   If (typeControl <> "COMBOBOX") Then
                      c.height = controlHeight
                   End If
                   c.Visible = True
                   c.tabIndex = tabIndex
               End If
           End If
          End If
        End If
        'MsgBox (keyParam & "*" & flagMandatoryField)
    Loop While (keyParam <> "")

    'второй проход - for form (чтобы были уже опредеелены max width and max height) and flexgrid (чтобы уже были сформированы элементы, по которым будет заполняться Flex_grid1, для определения ширины столбцов)
    For ii = 1 To UBound(allparams)
       vspstr = allparams(ii - 1)
       keyParam = Piece(vspstr, 1, Chr(1))
       If (keyParam <> "") Then
           stringParam = Piece(vspstr, 2, Chr(1))
           typeControl = Replace(Piece(UCase(stringParam), 1, delimeter), " ", "")
           cornerx = Val(Replace(Piece(stringParam, 2, delimeter), " ", ""))
           cornery = Val(Replace(Piece(stringParam, 3, delimeter), " ", ""))
           controlWidth = Val(Replace(Piece(stringParam, 4, delimeter), " ", ""))
           controlHeight = Val(Replace(Piece(stringParam, 5, delimeter), " ", ""))
           controlText = Piece(stringParam, 6, delimeter)
           'flagMandatoryField = Replace(Piece(stringParam, 7, delimeter), " ", "")
           'defaultValue = Replace(Piece(stringParam, 8, delimeter), " ", "")
          'form
          If (keyParam = "form") Then
              frmReportVB.Left = cornerx
              frmReportVB.Top = cornery
              If ((cornerx + controlWidth) > maxWidthForm) Then
                  maxWidthForm = cornerx + controlWidth
              End If
              frmReportVB.width = maxWidthForm + 100
              If ((cornery + controlHeight) > maxHeightForm) Then
                  maxHeightForm = cornery + controlHeight
              End If
              frmReportVB.height = maxHeightForm + 1000  '900 for buttons
              frmReportVB.Move (Screen.width - frmReportVB.width) / 2, (Screen.height - frmReportVB.height) / 2
              frmReportVB.Caption = Piece(stringParam, 1, delimeter)
              
              frmReportVB.cmd_OK.Top = maxHeightForm + 100
              frmReportVB.cmd_OK.Left = maxWidthForm - 2900
              frmReportVB.cmd_OK.Caption = Piece(stringParam, 4, delimeter)
              'MsgBox ("stringParam=" + stringParam + " delimeter=" + delimeter + "piece=" + Piece(stringParam, 4, delimeter))
        
              frmReportVB.cmd_Cancel.Top = maxHeightForm + 100
              frmReportVB.cmd_Cancel.Left = maxWidthForm - 1400
              frmReportVB.cmd_Cancel.Caption = Piece(stringParam, 5, delimeter)
          Else
           If (typeControl = "FLEXGRID") Then
               vspstr = ""
               ' кол-во столбцов в таблице
               cols = mLength(controlText, ",")
               If (cols > 1) Then
                  cols = cols - 1
               End If
               ' тип - где расположены кнопки Add and Delete
               typeArrangeButtons = Trim(Piece(controlText, 1, ","))
               If (typeArrangeButtons = "") Then
                  typeArrangeButtons = "3"
               End If
               ' Flex_info1.text
               vspint = mLength(controlText, ",")
               If (vspint > 1) Then
                            vspstr = (vspint - 1) & Chr(1) & "Flex_grid1" & Chr(1) & keyParam
                            For i = 2 To vspint
                               vspstr = vspstr & Chr(1) & Piece(controlText, i, ",")
                            Next
                            frmReportVB.Flex_info1.Caption = vspstr
               End If
               ' arrange Flex_grid1
               Call adjustElementGrid(typeArrangeButtons, cornerx, cornery, controlWidth, controlHeight, cols, controlText)
               ' arrange Flex_cmdAdd1,  Flex_cmdDel1
               Call adjustButtonsAddDel(typeArrangeButtons, cornerx, cornery, controlWidth, controlHeight)
               '
               frmReportVB.parameters.Text = frmReportVB.parameters.Text & "x_grid1" & "^"
            End If
          End If
        End If
        
    Next
    
    'MsgBox ("parameters=" & frmReportVB.parameters.Text)
    'If (frmReportVB.testAllMandatoryFieldsOn() = True) Then
    'MsgBox (" 1 okMandatoryFields=" & okMandatoryFields)
    frmReportVB.cmd_OK.Enabled = False
    If (okMandatoryFields = True) Then
       frmReportVB.cmd_OK.Enabled = True
    End If
    
    frmReportVB.Show vbModal
    Buffer = frmReportVB.sBuffer
    Cancel = frmReportVB.bCancel
  
End Sub
 
 Private Sub fillListBox(Index As Integer, listDuble As Control, param As String, globParamsForm As String, defaultValue As String, view As String)
 ' index - index in array iii_ListArray()
 ' listDuble - invisible ListBox or ComboBox with keyItem
 ' view = "LS" (ListBox Standart (Style=0)), ="LC" (ListBox Checkbox (Style=1)), ="CS" (ComboBox Standart (Style=0)),="CL" (CombpBox List (Style=2))

    Dim ret As String
    Dim keyItem As String
    Dim stringItem As String
    Dim iCounter As Integer
    Dim vspstring As String
    Dim values() As String
    Dim valuesParam() As String
    Dim i As Integer
    Dim Continue As String
    
    ' get data from cache
    Continue = ""
    iCounter = -1
    Do
     ret = mvbAccess("$$getValueOfParamByList^REPORTSPB(P0,P1,P2)", sBuffer, param, globParamsForm, Continue, "", "", "", "", "", "", "")
     If ((sBuffer = "") Or (ret = 0)) Then
        Continue = ""
     End If
     If (sBuffer <> "") Then
       
       If ret = 100 Then
          Continue = "Y"
       End If
       
       'MsgBox ("param=" & param & " sBuffer=" & sBuffer)
       Erase values
       values = Split(sBuffer, Chr(28))
       
       For i = 0 To UBound(values) - 1
            'keyItem = Piece(values(i), 1, Chr(1))
          If (values(i) <> "") Then
            iCounter = iCounter + 1
            'If i > 0 Then
               ReDim Preserve valuesParam(iCounter + 1)
            'End If
            valuesParam(iCounter) = values(i)
            'MsgBox ("iCounter=" & iCounter & " valuesParam(iCounter)" & valuesParam(iCounter))
          End If
       Next
     End If
    Loop While (Continue <> "")
    
    If (iCounter > -1) Then
     ' fill controls
     keyItem = ""
     iCounter = -1
     For i = 0 To UBound(valuesParam) - 1
        keyItem = Piece(valuesParam(i), 1, Chr(1))
        stringItem = Piece(valuesParam(i), 2, Chr(1))
        'MsgBox ("param=" & param & " keyItem=" & keyItem & " stringItem=" & stringItem)
        If ((keyItem <> "") And (stringItem <> "")) Then
           iCounter = iCounter + 1
           
           Select Case view
              Case "LS" 'ListBox Standart (Style=0)
                  frmReportVB.iii_ListArray(Index).AddItem stringItem
                  If (keyItem = defaultValue) Then
                     frmReportVB.iii_ListArray(Index).ListIndex = iCounter
                  End If
              Case "LC" 'ListBox CheckBox (Style=1)
                  frmReportVB.iii_ListArrayCB(Index).AddItem stringItem
                  If (keyItem = defaultValue) Then
                     frmReportVB.iii_ListArrayCB(Index).ListIndex = iCounter
                  End If
              Case "CS" 'ComboBox Standart (Style=0)
                  frmReportVB.iii_ComboArray(Index).AddItem stringItem
                  If (keyItem = defaultValue) Then
                     frmReportVB.iii_ComboArray(Index).ListIndex = iCounter
                  End If
              Case "CL" 'ComboBox List (Style=2)
                  'MsgBox ("param=" & param & " keyItem=" & keyItem & " stringItem=" & stringItem)
                  frmReportVB.iii_ComboArrayL(Index).AddItem stringItem
                  If (keyItem = defaultValue) Then
                     frmReportVB.iii_ComboArrayL(Index).ListIndex = iCounter
                  End If
           End Select
           
           listDuble.AddItem keyItem
           
        End If
     Next
    End If
 End Sub
    
    
 Private Sub fillListBoxOld(Index As Integer, listDuble As Control, param As String, globParamsForm As String, defaultValue As String, view As String)
 ' index - index in array iii_ListArray()
 ' listDuble - invisible ListBox or ComboBox with keyItem
 ' view = "LS" (ListBox Standart (Style=0)), ="LC" (ListBox Checkbox (Style=1)), ="CS" (ComboBox Standart (Style=0)),="CL" (CombpBox List (Style=2))

    Dim ret As String
    Dim keyItem As String
    Dim stringItem As String
    Dim iCounter As Integer
    Dim vspstring As String
    
    keyItem = ""
    iCounter = -1
    Do
        ret = mvbAccess("$$getItem^REPORTSPB(P0,P1,P2)", sBuffer, param, keyItem, globParamsForm, "", "", "", "", "", "", "")
        keyItem = Piece(sBuffer, 1, "^")
        stringItem = ""
        If (keyItem <> "") Then
            ret = mvbAccess("$$getParam^REPORTSPB(P0,P1,P2)", sBuffer, param, keyItem, globParamsForm, "", "", "", "", "", "", "")
            stringItem = Piece(sBuffer, 1, "^")
        End If
        If ((keyItem <> "") And (stringItem <> "")) Then
           iCounter = iCounter + 1
           
           Select Case view
              Case "LS" 'ListBox Standart (Style=0)
                  frmReportVB.iii_ListArray(Index).AddItem stringItem
                  If (keyItem = defaultValue) Then
                     frmReportVB.iii_ListArray(Index).ListIndex = iCounter
                  End If
              Case "LC" 'ListBox CheckBox (Style=1)
                  frmReportVB.iii_ListArrayCB(Index).AddItem stringItem
                  If (keyItem = defaultValue) Then
                     frmReportVB.iii_ListArrayCB(Index).ListIndex = iCounter
                  End If
              Case "CS" 'ComboBox Standart (Style=0)
                  frmReportVB.iii_ComboArray(Index).AddItem stringItem
                  If (keyItem = defaultValue) Then
                     frmReportVB.iii_ComboArray(Index).ListIndex = iCounter
                  End If
              Case "CL" 'ComboBox List (Style=2)
                  frmReportVB.iii_ComboArrayL(Index).AddItem stringItem
                  If (keyItem = defaultValue) Then
                     frmReportVB.iii_ComboArrayL(Index).ListIndex = iCounter
                  End If
           End Select
           
           listDuble.AddItem keyItem
           
        End If
    Loop While (keyItem <> "")
 End Sub
    
 
 Private Sub fillBoxOldOld(List As Control, listDuble As Control, param As String, globParamsForm As String, defaultValue As String)
 ' list - visible ListBox or ComboBox with stringItem
 ' listDuble - invisible ListBox or ComboBox with keyItem

    Dim ret As String
    Dim keyItem As String
    Dim stringItem As String
    Dim iCounter As Integer
    Dim vspstring As String
    
    keyItem = ""
    iCounter = -1
    Do
        ret = mvbAccess("$$getItem^REPORTSPB(P0,P1,P2)", sBuffer, param, keyItem, globParamsForm, "", "", "", "", "", "", "")
        keyItem = Piece(sBuffer, 1, "^")
        stringItem = ""
        If (keyItem <> "") Then
            ret = mvbAccess("$$getParam^REPORTSPB(P0,P1,P2)", sBuffer, param, keyItem, globParamsForm, "", "", "", "", "", "", "")
            stringItem = Piece(sBuffer, 1, "^")
        End If
        If ((keyItem <> "") And (stringItem <> "")) Then
           'MsgBox ("keyItem=" + keyItem + " stringItem=" + stringItem)
           iCounter = iCounter + 1
           List.AddItem stringItem
           If (keyItem = defaultValue) Then
               List.ListIndex = iCounter
           End If
      
           listDuble.AddItem keyItem
           
        End If
    Loop While (keyItem <> "")
 End Sub

 Private Sub fillRadioButton(frame As Control, param As String, globParamsForm As String, controlWidth As Integer, controlHeight As Integer, defaultValue As String)

    Dim ret As String
    Dim keyItem As String
    Dim stringItem As String
    Dim iCounter As Integer
    Dim vspstring As String
    Dim c As Control
    Dim leftMargin As Integer
    Dim heightElement As Integer
    Dim countElements As Integer
        
    ' count elements
    keyItem = ""
    countElements = 0
    Do
        ret = mvbAccess("$$getItem^REPORTSPB(P0,P1,P2)", sBuffer, param, keyItem, globParamsForm, "", "", "", "", "", "", "")
        keyItem = Piece(sBuffer, 1, "^")
        If (keyItem <> "") Then
           countElements = countElements + 1
        End If
    Loop While (keyItem <> "")
    
    leftMargin = 100
    heightElement = controlHeight - 10
    If (countElements <> 0) Then
        heightElement = (controlHeight - 230) \ countElements
    End If
    'MsgBox (countElements & " " & heightElement)
    keyItem = ""
    iCounter = -1
    Do
        ret = mvbAccess("$$getItem^REPORTSPB(P0,P1,P2)", sBuffer, param, keyItem, globParamsForm, "", "", "", "", "", "", "")
        keyItem = Piece(sBuffer, 1, "^")
        stringItem = ""
        If (keyItem <> "") Then
            ret = mvbAccess("$$getParam^REPORTSPB(P0,P1,P2)", sBuffer, param, keyItem, globParamsForm, "", "", "", "", "", "", "")
            stringItem = Piece(sBuffer, 1, "^")
        End If
        If (keyItem <> "") Then
           'MsgBox ("keyItem=" + keyItem + " stringItem=" + stringItem)
           iCounter = iCounter + 1
           Set c = frmReportVB.Controls.Add("VB.OptionButton", "rbn" + param + "_" + keyItem, frame)
           c.Caption = stringItem
           c.Left = 1
           c.Top = 130 + (iCounter * (heightElement + 1))
           c.width = controlWidth
           If (controlWidth > (leftMargin + 50)) Then
               c.Left = leftMargin
               c.width = controlWidth - leftMargin - 50
           End If
           c.height = heightElement
           c.Visible = True
           If (keyItem = defaultValue) Then
              c.Value = True
           End If
           
        End If
    Loop While (keyItem <> "")
 End Sub


Private Sub adjustElementGrid(typeArrangeButtons As String, cornerx As Integer, cornery As Integer, controlWidth As Integer, controlHeight As Integer, cols As Integer, controlText As String)
' typeArrangeButtons=1 - buttons up right
' typeArrangeButtons=2 - buttons up left
' typeArrangeButtons=3 - buttons right up
' typeArrangeButtons=4 - buttons right down
' typeArrangeButtons=5 - buttons down right
' typeArrangeButtons=6 - buttons down left
' typeArrangeButtons=7 - buttons left up
' typeArrangeButtons=8 - buttons left down

  Dim nameControl As String
  Dim cc As Control
  Dim j As Integer
  Dim x As Integer, y As Integer, width As Integer, height As Integer
  Dim tag As String
  
  x = cobnerx
  y = cornery
  width = controlWidth
  height = controlHeight
  
  If ((typeArrangeButtons = 3) Or (typeArrangeButtons = 4) Or (typeArrangeButtons = 7) Or (typeArrangeButtons = 8)) And (controlWidth > 1000) Then
      width = width - 1000
      If ((typeArrangeButtons = 7) Or (typeArrangeButtons = 8)) Then
          x = x + 1000
      End If
  End If
  If ((typeArrangeButtons = 1) Or (typeArrangeButtons = 2) Or (typeArrangeButtons = 5) Or (typeArrangeButtons = 6)) And (controlHeight > 350) Then
       height = height - 350
       If ((typeArrangeButtons = 1) Or (typeArrangeButtons = 2)) Then
          y = y + 350
       End If
  End If
 
  With frmReportVB.Flex_grid1
     .width = width
     .height = height
     .Visible = True
  .Left = x
  .Top = y
  .cols = cols
  .Rows = 0
  ' widths of columns
  If (cols = 1) Then
      .ColWidth(0) = width
  Else
      For j = 1 To cols
          nameControl = Piece(controlText, j + 1, ",")
          If (nameControl <> "") Then
              For Each cc In frmReportVB.Controls
                  tag = Piece(cc.tag, 1, Chr(1))
                  If ((cc.Name = nameControl) Or (tag = nameControl)) Then
                      .ColWidth(j - 1) = cc.width
                  End If
              Next
          End If
      Next
  End If
  End With
End Sub

Private Sub adjustButtonsAddDel(typeArrangeButtons As String, cornerx As Integer, cornery As Integer, controlWidth As Integer, controlHeight As Integer)
' typeArrangeButtons=1 - buttons up right
' typeArrangeButtons=2 - buttons up left
' typeArrangeButtons=3 - buttons right up
' typeArrangeButtons=4 - buttons right down
' typeArrangeButtons=5 - buttons down right
' typeArrangeButtons=6 - buttons down left
' typeArrangeButtons=7 - buttons left up
' typeArrangeButtons=8 - buttons left down

  Dim Xadd As Integer, Xdel As Integer, Yadd As Integer, Ydel As Integer, width As Integer, height As Integer
  
  Xadd = cobnerx
  Xdel = cobnerx
  Yadd = cornery
  Ydel = cornery
  
  width = controlWidth
  height = controlHeight

  If ((typeArrangeButtons = 3) Or (typeArrangeButtons = 4) Or (typeArrangeButtons = 7) Or (typeArrangeButtons = 8)) And (controlWidth > 1000) Then
      width = width - 1000
  End If
  If ((typeArrangeButtons = 1) Or (typeArrangeButtons = 2) Or (typeArrangeButtons = 5) Or (typeArrangeButtons = 6)) And (controlHeight > 350) Then
       height = height - 350
  End If

  Select Case typeArrangeButtons
  Case 1
     Xadd = Xadd + width - 2100
     Xdel = Xdel + width - 1050
  Case 2
     Xdel = Xdel + 1050
  Case 3
     Xadd = Xadd + width
     Xdel = Xdel + width
     Ydel = Ydel + 350
  Case 4
     Xadd = Xadd + width
     Xdel = Xdel + width
     Yadd = Yadd + height - 700
     Ydel = Ydel + height - 350
  Case 5
     Xadd = Xadd + width - 2100
     Xdel = Xdel + width - 1050
     Yadd = Yadd + height
     Ydel = Ydel + height
  Case 6
     Xdel = Xdel + 1050
     Yadd = Yadd + height
     Ydel = Ydel + height
  Case 7
     Ydel = Ydel + 350
  Case 8
     Yadd = Yadd + height - 700
     Ydel = Ydel + height - 350
  
  End Select

  frmReportVB.Flex_btnAdd1.Visible = True
  frmReportVB.Flex_btnDel1.Visible = True
  
  frmReportVB.Flex_btnAdd1.Left = Xadd
  frmReportVB.Flex_btnDel1.Left = Xdel
  
  frmReportVB.Flex_btnAdd1.Top = Yadd
  frmReportVB.Flex_btnDel1.Top = Ydel
    
End Sub

Private Sub Class_Initialize()
    'Needs to be called to create link to Cache
    'Remember to have an invisible menu option, activated for the user.
    'четвертый параметр - ID (на пустоту ругается)
    'm_InactivityTimeOut = 0
    'm_SkipLicense = True
    'm_DBTimeTotal = 100000000
    'MsgBox ("1=" & m_InactivityTimeOut)
    'MsgBox (m_tkCacheInit.InactivityTimeOut)
    'Call ApplicationInitialise(gMenuOptions, App, "", "aaaa")
    
    'Call ApplicationInitialise("", App, "", "aaaa")
    'MsgBox (m_tkCache)
    'MsgBox ("2=" & frmCache.Connect)
    'MsgBox (m_tkCacheInit.InactivityTimeOut)
    'App.OleRequestPendingTimeout = 0
    'MsgBox (222)
    ' frmCache.InactivityTimeOut = 10000
End Sub


