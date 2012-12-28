VERSION 5.00
Begin VB.UserControl ctlDate 
   AutoRedraw      =   -1  'True
   ClientHeight    =   315
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1095
   ScaleHeight     =   315
   ScaleWidth      =   1095
   Begin VB.TextBox txtDate 
      Height          =   315
      Left            =   0
      TabIndex        =   0
      Text            =   "dd/mm/yyyy"
      Top             =   0
      Width           =   1095
   End
End
Attribute VB_Name = "ctlDate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Dim m_Mandatory     As Boolean
Dim bChanged        As Boolean

Public Enum DateType
    en_ANY = 0
    en_PAST = 1
    en_FUTURE = 2
End Enum

Private m_DateType  As DateType

Public Event KeyDown(KeyCode As Integer, Shift As Integer)
Public Event KeyPress(KeyAscii As Integer)
Public Event Change()
Public Event ValidateText(Cancel As Boolean)
Public Event MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

Private Sub txtDate_Change()
    
    If m_Mandatory Then
        CheckMandatoryField txtDate
    End If
    With txtDate
        .ForeColor = gValidFieldColor
        If .Text = "" Then
            .ForeColor = gValidFieldColor
        Else
            If IsValidDate(.Text, gDateNormal, GetDateType) <> "" Then
                .ForeColor = gValidFieldColor
            Else
                .ForeColor = gInvalidFieldColor
            End If
        End If
    End With
    bChanged = True
    RaiseEvent Change
End Sub

Private Function GetDateType() As String
    Select Case m_DateType
        Case en_ANY:    GetDateType = "ANY"
        Case en_PAST:   GetDateType = "PAST"
        Case en_FUTURE: GetDateType = "FUTURE"
    End Select
End Function

Private Sub txtDate_KeyDown(KeyCode As Integer, Shift As Integer)
    RaiseEvent KeyDown(KeyCode, Shift)
End Sub

Private Sub txtDate_KeyPress(KeyAscii As Integer)
    AllowDate txtDate, KeyAscii
    If KeyAscii > 0 Then
        RaiseEvent KeyPress(KeyAscii)
    End If
End Sub

Private Sub txtDate_LostFocus()
    Dim Cancel As Boolean
    txtDate_Validate Cancel
End Sub

Private Sub txtDate_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    RaiseEvent MouseDown(Button, Shift, txtDate.Left + X, txtDate.Top + Y)
End Sub

Public Property Get SelStart() As Integer
    SelStart = txtDate.SelStart
End Property

Public Property Let SelStart(ByVal iNewValue As Integer)
    txtDate.SelStart = iNewValue
End Property

Public Property Get SelLength() As Integer
    SelLength = txtDate.SelLength
End Property

Public Property Let SelLength(ByVal iNewValue As Integer)
    txtDate.SelLength = iNewValue
End Property

Public Property Get Mandatory() As Boolean
    Mandatory = m_Mandatory
End Property

Public Property Let Mandatory(ByVal bNewValue As Boolean)
    m_Mandatory = bNewValue
    If m_Mandatory Then
        CheckMandatoryField txtDate
    Else
        txtDate.BackColor = gMandatoryFieldNotBlankColor
    End If
End Property

Public Property Get BackColor() As Long
    BackColor = txtDate.BackColor
End Property

Public Property Let BackColor(ByVal lNewValue As Long)
    txtDate.BackColor = lNewValue
End Property

Public Property Get ForeColor() As Long
    ForeColor = txtDate.ForeColor
End Property

Public Property Let ForeColor(ByVal lNewValue As Long)
    txtDate.ForeColor = lNewValue
End Property

Public Property Get Text() As String
    Text = txtDate.Text
End Property

Public Property Let Text(ByVal lNewValue As String)
    txtDate.Text = lNewValue
    DoEvents
    txtDate_Validate False
    DoEvents
    UserControl.Refresh
End Property

Public Property Get Enabled() As Boolean
    Enabled = txtDate.Enabled
End Property

Public Property Let Enabled(ByVal bNewValue As Boolean)
    txtDate.Enabled = bNewValue
    UserControl.Enabled = bNewValue
End Property

Public Property Get Font() As Object
    Set Font = txtDate.Font
End Property

Public Property Set Font(ByVal lNewValue As Object)
    Set txtDate.Font = lNewValue
    UserControl_Resize
End Property

Private Sub txtDate_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    RaiseEvent MouseMove(Button, Shift, txtDate.Left + X, txtDate.Top + Y)
End Sub

Private Sub txtDate_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    RaiseEvent MouseUp(Button, Shift, txtDate.Left + X, txtDate.Top + Y)
End Sub

Private Sub txtDate_Validate(Cancel As Boolean)
    
    If bChanged Then
        bChanged = False
        With txtDate
            If .Text <> "" And .ForeColor = gValidFieldColor Then
                .Text = IsValidDate(.Text, gDateNormal, GetDateType)
            End If
        End With
        RaiseEvent ValidateText(Cancel)
    End If
    
End Sub

Private Sub UserControl_Initialize()
    txtDate.Text = ""
    UserControl_Resize
    UserControl.Width = 1095
End Sub

Private Sub UserControl_Resize()
    txtDate.Width = UserControl.Width
    txtDate.Height = 315
    UserControl.Height = txtDate.Height
End Sub

Private Sub UserControl_Terminate()
    ''
End Sub

Public Sub SetFocus()
    txtDate.SetFocus
End Sub

Private Sub AllowDate(Ctrl As Control, iKey As Integer)
    
    Dim sChr        As String
    Dim bContinue   As Boolean
    
    sChr = Chr$(iKey)
    
    With Ctrl
        If iKey <> vbKeyBack Then
            bContinue = IsNumeric(sChr) Or sChr = gDateSep
            If Not bContinue Then
                'If UCase(sChr) = "T" Then
                If UCase(sChr) = UCase(gSysDefault.TodayNominator) Then
                    bContinue = InStr(1, UCase(Ctrl.Text), UCase(sChr)) = 0
                End If
                If sChr = "+" Or sChr = "-" Then
                    bContinue = InStr(1, UCase(Ctrl.Text), "-") = 0 And _
                                InStr(1, UCase(Ctrl.Text), "+") = 0
                End If
            End If
            If bContinue Then
                AllowNumericDate Ctrl, iKey, gDateSep
            Else
                iKey = 0
            End If
        End If
    End With
        
End Sub

Public Property Get Visible() As Boolean
    Visible = txtDate.Visible
End Property

Public Property Let Visible(ByVal bNewValue As Boolean)
    txtDate.Visible = bNewValue
End Property

Public Property Get enDateType() As DateType
    enDateType = m_DateType
End Property

Public Property Let enDateType(ByVal enNewValue As DateType)
    m_DateType = enNewValue
End Property
