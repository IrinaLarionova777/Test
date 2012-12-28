Attribute VB_Name = "tkLTDateTime_Temp"
Option Explicit

Public Sub AllowNumericDate(Control As Control, ByVal KeyAscii As Integer, Optional ByVal DateDelimiter As String = "")
    
    If DateDelimiter = "" Then
        DateDelimiter = gDateSep
    End If
    
    'Check if user is using different delimiters
    If IsNumeric(Right(Control.Text, 1)) And Chr(KeyAscii) >= "0" And Chr(KeyAscii) <= "9" Then
        If Len(Control.Text) = 2 And IsNumeric(Control.Text) Then
            Control.Text = Control.Text & DateDelimiter
            Control.SelStart = 3
        ElseIf Len(Control.Text) = 5 And Mid(Control.Text, 3, 1) = DateDelimiter And _
            IsNumeric(Mid(Control.Text, 1, 2)) And IsNumeric(Mid(Control.Text, 4, 2)) Then
            Control.Text = Control.Text & DateDelimiter
            Control.SelStart = 6
        ElseIf Len(Control.Text) = 4 And Mid(Control.Text, 2, 1) = DateDelimiter And _
            IsNumeric(Mid(Control.Text, 1, 1)) And IsNumeric(Mid(Control.Text, 3, 2)) Then
            Control.Text = Control.Text & DateDelimiter
            Control.SelStart = 5
        End If
    End If
End Sub

Public Sub CheckMandatoryField(Ctrl As Control)
    If TypeOf Ctrl Is ComboBox Then
        If Ctrl.ListIndex = -1 Or Ctrl.Text = "" Then
            Ctrl.BackColor = gMandatoryFieldBlankColor
        Else
            Ctrl.BackColor = gMandatoryFieldNotBlankColor
        End If
    Else
        If Len(Ctrl.Text) = 0 Then
            Ctrl.BackColor = gMandatoryFieldBlankColor
        Else
            Ctrl.BackColor = gMandatoryFieldNotBlankColor
        End If
    End If
End Sub
