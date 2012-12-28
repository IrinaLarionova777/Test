VERSION 5.00
Begin VB.UserControl ctlTime 
   AutoRedraw      =   -1  'True
   ClientHeight    =   315
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1095
   ScaleHeight     =   315
   ScaleWidth      =   1095
   Begin VB.TextBox txtTime 
      Height          =   315
      Left            =   0
      TabIndex        =   0
      Text            =   "hh:mm"
      Top             =   0
      Width           =   1095
   End
End
Attribute VB_Name = "ctlTime"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Dim m_Mandatory     As Boolean
Dim bChanged        As Boolean

Public Enum TimeType
    en_ANY = 0
    en_PAST = 1
    en_FUTURE = 2
End Enum

Private m_TimeType      As TimeType
Private m_TimeSep       As String
Private m_TimeSepFound  As Boolean

Public Event KeyDown(KeyCode As Integer, Shift As Integer)
Public Event KeyPress(KeyAscii As Integer)
Public Event Change()
Public Event ValidateText(Cancel As Boolean)
Public Event MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

Private Sub txtTime_Change()
    
    If m_Mandatory Then
        CheckMandatoryField txtTime
    End If
    With txtTime
        .ForeColor = gValidFieldColor
        If .Text = "" Then
            .ForeColor = gValidFieldColor
        Else
            If IsValidTime(.Text, gTimeNormal, GetTimeType) <> "" Then
                .ForeColor = gValidFieldColor
            Else
                .ForeColor = gInvalidFieldColor
            End If
        End If
    End With
    bChanged = True
    RaiseEvent Change
End Sub

Private Function GetTimeType() As String
    Select Case m_TimeType
        Case en_ANY:    GetTimeType = "ANY"
        Case en_PAST:   GetTimeType = "PAST"
        Case en_FUTURE: GetTimeType = "FUTURE"
    End Select
End Function

Private Sub txtTime_KeyDown(KeyCode As Integer, Shift As Integer)
    RaiseEvent KeyDown(KeyCode, Shift)
End Sub

Private Sub txtTime_KeyPress(KeyAscii As Integer)
    AllowTime KeyAscii
    If KeyAscii > 0 Then
        RaiseEvent KeyPress(KeyAscii)
    End If
End Sub

Private Sub txtTime_LostFocus()
    Dim Cancel As Boolean
    txtTime_Validate Cancel
End Sub

Private Sub txtTime_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    RaiseEvent MouseDown(Button, Shift, txtTime.Left + X, txtTime.Top + Y)
End Sub

Public Property Get SelStart() As Integer
    SelStart = txtTime.SelStart
End Property

Public Property Let SelStart(ByVal iNewValue As Integer)
    txtTime.SelStart = iNewValue
End Property

Public Property Get SelLength() As Integer
    SelLength = txtTime.SelLength
End Property

Public Property Let SelLength(ByVal iNewValue As Integer)
    txtTime.SelLength = iNewValue
End Property

Public Property Get Mandatory() As Boolean
    Mandatory = m_Mandatory
End Property

Public Property Let Mandatory(ByVal bNewValue As Boolean)
    m_Mandatory = bNewValue
    If m_Mandatory Then
        CheckMandatoryField txtTime
    Else
        txtTime.BackColor = gMandatoryFieldNotBlankColor
    End If
End Property

Public Property Get BackColor() As Long
    BackColor = txtTime.BackColor
End Property

Public Property Let BackColor(ByVal lNewValue As Long)
    txtTime.BackColor = lNewValue
End Property

Public Property Get ForeColor() As Long
    ForeColor = txtTime.ForeColor
End Property

Public Property Let ForeColor(ByVal lNewValue As Long)
    txtTime.ForeColor = lNewValue
End Property

Public Property Get Text() As String
    Text = txtTime.Text
End Property

Public Property Let Text(ByVal lNewValue As String)
    txtTime.Text = lNewValue
    DoEvents
    txtTime_Validate False
    DoEvents
    UserControl.Refresh
End Property

Public Property Get Enabled() As Boolean
    Enabled = txtTime.Enabled
End Property

Public Property Let Enabled(ByVal bNewValue As Boolean)
    txtTime.Enabled = bNewValue
    UserControl.Enabled = bNewValue
End Property

Public Property Get Font() As Object
    Set Font = txtTime.Font
End Property

Public Property Set Font(ByVal lNewValue As Object)
    Set txtTime.Font = lNewValue
    UserControl_Resize
End Property

Private Sub txtTime_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    RaiseEvent MouseMove(Button, Shift, txtTime.Left + X, txtTime.Top + Y)
End Sub

Private Sub txtTime_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    RaiseEvent MouseUp(Button, Shift, txtTime.Left + X, txtTime.Top + Y)
End Sub

Private Sub txtTime_Validate(Cancel As Boolean)
    
    On Error GoTo Continue
    
    If bChanged Then
        bChanged = False
        With txtTime
            If .Text <> gSysDefault.NoTimeIndicator Then
                If .Text <> "" And .ForeColor = gValidFieldColor Then
                    .Text = IsValidTime(.Text, gTimeNormal, GetTimeType)
                End If
            End If
        End With
        RaiseEvent ValidateText(Cancel)
    End If
    
Continue:

End Sub

Private Sub UserControl_Initialize()
    txtTime.Text = ""
    UserControl_Resize
    UserControl.Width = 1095
    m_TimeSepFound = False
End Sub

Private Sub UserControl_Resize()
    txtTime.Width = UserControl.Width
    txtTime.Height = 315
    UserControl.Height = txtTime.Height
End Sub

Private Sub UserControl_Terminate()
    ''
End Sub

Public Sub SetFocus()
    txtTime.SetFocus
End Sub

Private Sub AllowTime(iKey As Integer)
    
    Dim sChr As String
    
    sChr = Chr$(iKey)
    
    GetTimeSep
    
    With txtTime
        If iKey <> vbKeyBack Then
'            If IsNumeric(sChr) Or sChr = m_TimeSep Or _
'               UCase(sChr) = "N" Or sChr = "+" Or sChr = "-" Or _
'               UCase(sChr) = "A" Or UCase(sChr) = "P" Then
            If IsNumeric(sChr) Or sChr = m_TimeSep Or _
               UCase(sChr) = UCase(gSysDefault.NowNominator) Or sChr = "+" Or sChr = "-" Or _
               UCase(sChr) = "A" Or UCase(sChr) = "P" Then
               
                AllowNumericTime iKey
            Else
                iKey = 0
            End If
        End If
    End With
        
End Sub

Public Property Get Visible() As Boolean
    Visible = txtTime.Visible
End Property

Public Property Let Visible(ByVal bNewValue As Boolean)
    txtTime.Visible = bNewValue
End Property

Public Property Get enTimeType() As TimeType
    enTimeType = m_TimeType
End Property

Public Property Let enTimeType(ByVal enNewValue As TimeType)
    m_TimeType = enNewValue
End Property

Private Sub GetTimeSep()
    Dim i   As Integer
    
    If Not m_TimeSepFound Then
        m_TimeSep = IsValidTime("n", gTimeNormal, "ANY")
        
        For i = 1 To Len(m_TimeSep) Step 1
            If Not (IsNumeric(Mid$(m_TimeSep, i, 1))) Then
                m_TimeSep = Mid$(m_TimeSep, i, 1)
                m_TimeSepFound = True
                Exit For
            End If
        Next i
    End If
End Sub

Public Sub AllowNumericTime(ByVal KeyAscii As Integer)
        
    With txtTime
        If IsNumeric(Right(.Text, 1)) And Chr(KeyAscii) >= "0" And Chr(KeyAscii) <= "9" Then
            If Len(.Text) = 2 And IsNumeric(.Text) Then
                .Text = .Text & m_TimeSep
                .SelStart = 3
            End If
        End If
    End With
    
End Sub
