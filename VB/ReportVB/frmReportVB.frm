VERSION 5.00
Begin VB.Form frmReportVB 
   Caption         =   "Form1"
   ClientHeight    =   2775
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6615
   LinkTopic       =   "Form1"
   ScaleHeight     =   2775
   ScaleWidth      =   6615
   Begin VB.CommandButton cmdOK 
      Caption         =   "Формир-е"
      Height          =   380
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   1335
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Выход"
      Height          =   380
      Left            =   1680
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "frmReportVB"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Public bCancel  As Boolean
Public sBuffer  As String

Private Sub cmdCancel_Click()
    sBuffer = ""
    bCancel = True
    Unload Me
End Sub
