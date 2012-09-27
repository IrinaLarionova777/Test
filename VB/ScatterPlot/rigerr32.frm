VERSION 5.00
Begin VB.Form frmRigErr 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "(vb/rig)"
   ClientHeight    =   5235
   ClientLeft      =   3450
   ClientTop       =   3210
   ClientWidth     =   7365
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5235
   ScaleWidth      =   7365
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtAnnotate 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   330
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   4
      Top             =   1560
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.CommandButton cmdAnnotate 
      Caption         =   "Annotate"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   330
      TabIndex        =   3
      Top             =   1200
      Width           =   855
   End
   Begin VB.CommandButton cmdButton 
      Caption         =   "(caption)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   2
      Left            =   5880
      TabIndex        =   2
      Top             =   1140
      Width           =   1335
   End
   Begin VB.CommandButton cmdButton 
      Caption         =   "(caption)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   5880
      TabIndex        =   1
      Top             =   660
      Width           =   1335
   End
   Begin VB.TextBox txtCascade 
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   1380
      MultiLine       =   -1  'True
      TabIndex        =   14
      Top             =   3840
      Width           =   5835
   End
   Begin VB.ListBox lstCascade 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Left            =   1380
      TabIndex        =   6
      Top             =   4080
      Width           =   5835
   End
   Begin VB.TextBox txtStack 
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   1380
      MultiLine       =   -1  'True
      TabIndex        =   11
      Top             =   1800
      Width           =   5835
   End
   Begin VB.CommandButton cmdButton 
      Caption         =   "(caption)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   5880
      TabIndex        =   0
      Top             =   180
      Width           =   1335
   End
   Begin VB.ListBox lstStack 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1230
      Left            =   1380
      MultiSelect     =   1  'Simple
      TabIndex        =   5
      Top             =   2040
      Width           =   5835
   End
   Begin VB.Label lblCascade2 
      Alignment       =   1  'Right Justify
      Caption         =   "Errors"
      Height          =   195
      Left            =   60
      TabIndex        =   16
      Top             =   4260
      Width           =   1095
   End
   Begin VB.Label lblCascade1 
      Alignment       =   1  'Right Justify
      Caption         =   "Cascaded"
      Height          =   195
      Left            =   60
      TabIndex        =   15
      Top             =   4080
      Width           =   1095
   End
   Begin VB.Label lblStack2 
      Alignment       =   1  'Right Justify
      Caption         =   "Stack"
      Height          =   195
      Left            =   60
      TabIndex        =   13
      Top             =   2220
      Width           =   1155
   End
   Begin VB.Label lblStack1 
      Alignment       =   1  'Right Justify
      Caption         =   "Procedure"
      Height          =   195
      Left            =   60
      TabIndex        =   12
      Top             =   2040
      Width           =   1155
   End
   Begin VB.Label lblErrMsg 
      Caption         =   "(error message)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1035
      Left            =   1380
      TabIndex        =   10
      Top             =   480
      Width           =   4335
   End
   Begin VB.Label lblErr 
      Caption         =   "(error number)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   1380
      TabIndex        =   8
      Top             =   180
      Width           =   1035
   End
   Begin VB.Label lblExplanation 
      Alignment       =   1  'Right Justify
      Caption         =   "Explanation:"
      Height          =   195
      Left            =   60
      TabIndex        =   9
      Top             =   480
      Width           =   1155
   End
   Begin VB.Label lblError 
      Alignment       =   1  'Right Justify
      Caption         =   "Error:"
      Height          =   195
      Left            =   60
      TabIndex        =   7
      Top             =   180
      Width           =   1155
   End
End
Attribute VB_Name = "frmRigErr"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'==================================================
'VB/Rig 3.0 - Copyright 1997, Compuware Corporation
'==================================================

'RIGERR32.FRM (VB 32-bit)

'This form module must be included in every VB
'project that has been rigged for error trapping.
'It is used to display the text of error messages
'and the state of the procedure stack when a runtime
'error occurs.

'You are welcome to customize this module for
'your own needs, but you are NOT licensed to
're-distribute this source code -- either in
'its original form or in modified form.

'+++ VB/Rig Skip +++

Option Explicit

Private tfAnnotateMode As Boolean

Private Sub cmdAnnotate_Click()
'+++ VB/Rig Skip +++

Dim nSub As Integer
Static tfCancelSave As Boolean
Static tfDefaultSave As Boolean
Static sCaptionSave As String


On Error Resume Next

tfAnnotateMode = Not tfAnnotateMode

If tfAnnotateMode Then
   txtAnnotate.Move lblErrMsg.Left, lblErrMsg.Top, lblErrMsg.Width, lblErrMsg.Height
   txtAnnotate.Text = VbRig.LastErrMessage
   txtAnnotate.SelStart = Len(txtAnnotate.Text)

   tfCancelSave = cmdButton(0).Cancel
   cmdButton(0).Cancel = False
   tfDefaultSave = cmdButton(0).Default
   cmdButton(0).Default = False
   sCaptionSave = cmdAnnotate.Caption
   cmdAnnotate.Caption = "Done"

   lblErrMsg.Visible = False
   txtAnnotate.Visible = True
   
   txtAnnotate.SetFocus
Else
   VbRig.LastErrMessage = Trim$(txtAnnotate.Text)
   lblErrMsg.Caption = VbRig.LastErrMessage

   cmdButton(0).Cancel = tfCancelSave
   cmdButton(0).Default = tfDefaultSave
   cmdAnnotate.Caption = sCaptionSave
   
   txtAnnotate.Visible = False
   lblErrMsg.Visible = True
   
   cmdButton(0).SetFocus
End If

End Sub


Private Sub cmdButton_Click(Index As Integer)
'+++ VB/Rig Skip +++

If tfAnnotateMode Then
   cmdAnnotate.Value = True  'force click
End If

VbRig.ButtonSelected = Index
Hide

End Sub


Private Sub Form_Load()
'+++ VB/Rig Skip +++

Beep

End Sub

Private Sub lstCascade_Click()
'+++ VB/Rig Skip +++
         
'The following code is used to short-circuit any
'attempts to change the .Selected state of the
'procedure names displayed in the listbox.  It would
'have been simpler to just disable the listbox, but
'that would have disabled the scroll bars, as well.

Static tfRecursion As Boolean
Dim nSub As Integer
Dim nTop As Integer


If tfRecursion Then
Else
   tfRecursion = True

   nTop = lstCascade.TopIndex

   For nSub = 0 To lstCascade.ListCount - 1
      lstCascade.Selected(nSub) = False
   Next

   lstCascade.ListIndex = -1
   lstCascade.TopIndex = nTop

   tfRecursion = False
End If

End Sub

Private Sub lstCascade_GotFocus()
'+++ VB/Rig Skip +++

On Error Resume Next

cmdButton(0).SetFocus

End Sub

Private Sub lstStack_Click()
'+++ VB/Rig Skip +++

'The following code is used to short-circuit any
'attempts to change the .Selected state of the
'procedure names displayed in the listbox.  It would
'have been simpler to just disable the listbox, but
'that would have disabled the scroll bars, as well.

Static tfRecursion As Boolean
Dim nSub As Integer
Dim nTop As Integer


If tfRecursion Then
Else
   tfRecursion = True

   nTop = lstStack.TopIndex

   For nSub = 0 To lstStack.ListCount - 1
      If lstStack.ItemData(nSub) = True Then
         lstStack.Selected(nSub) = True
      Else
         lstStack.Selected(nSub) = False
      End If
   Next

   lstStack.ListIndex = -1
   lstStack.TopIndex = nTop

   tfRecursion = False
End If

End Sub

Private Sub lstStack_GotFocus()
'+++ VB/Rig Skip +++

On Error Resume Next
   
cmdButton(0).SetFocus

End Sub

