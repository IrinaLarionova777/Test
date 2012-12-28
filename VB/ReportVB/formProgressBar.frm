VERSION 5.00
Begin VB.Form formProgressBar 
   ClientHeight    =   1740
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7140
   LinkTopic       =   "Form1"
   ScaleHeight     =   1740
   ScaleWidth      =   7140
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   3240
      Top             =   120
   End
   Begin VB.Label flagNormalClose 
      Caption         =   "no"
      Height          =   495
      Left            =   360
      TabIndex        =   1
      Top             =   1200
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Label label1 
      Alignment       =   2  'Center
      Caption         =   "Подождите, пожалуйста, отчет формируется."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   0
      TabIndex        =   0
      Top             =   600
      Width           =   7095
   End
End
Attribute VB_Name = "FormProgressBar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
   Me.flagNormalClose.Caption = "no"
  'MsgBox ("Load : FormProgressBar.Visible=" & FormProgressBar.Visible & " FormProgressBar.Timer1.Enabled=" & FormProgressBar.Timer1.Enabled & " FormProgressBar.Timer1.Interval=" & FormProgressBar.Timer1.Interval & " FormProgressBar.WindowState=" & FormProgressBar.WindowState)
End Sub



Private Sub Timer1_Timer()
   Dim fileDestination As String
   Dim executableFile As String
   Dim vspbool As Boolean
   Dim vspint As Integer
   Dim ret As String
   Dim browserReport As String
   Dim file As String
  
    ret = mvbAccess("$$TestProcessEnd^REPORTSPB()", sBuffer, "", "", "", "", "", "", "", "", "", "")
    'MsgBox ("ret=" & ret & " flagTurnOnTimer=" & flagTurnOnTimer)
    'MsgBox ("FormProgressBar.Timer1.Interval =" & FormProgressBar.Timer1.Interval)
    If ((ret <> "") And (FormProgressBar.Timer1.Enabled = True) And (FormProgressBar.Timer1.Interval > 0)) Then
       FormProgressBar.Timer1.Enabled = False
       FormProgressBar.Timer1.Interval = 0
       Me.flagNormalClose.Caption = "yes"
       Unload Me
       'FormProgressBar.Hide '.Visible = False
       
       ' browse the file with report
       'return error - просто выводим сообщение (из экрана не выходим)
    If (Piece(ret, 1, "^") <> "0") Then
        MsgBox (Piece(ret, 2, "^"))
        bCancel = False
        GoTo exitline
    Else
        browserReport = UCase(Piece(ret, 4, "^")) 'browser for report
        file = Piece(ret, 3, "^") ' file with report
        ' test file is specified
        If (Trim(file) = "") Then
           MsgBox ("Файл не указан")
           GoTo exitline
        End If
        ' test exist of file
        If (Dir(file) = "") Then
           MsgBox ("Файл " & file & " не найден.")
           GoTo exitline
        End If
        vspbool = False  'flag use of particular browser
        ' find path to executive for browser
      On Error GoTo ErrorHandler      ' when use particular browser error was - so try to use auto browser
        fileDestination = file
        vspint = mLength(file, ".")
        fileExtension = Piece(file, vspint, ".")
        'MsgBox ("file=" & file)
        ' if browser is winword, but file is not doc -> copy file ti file.doc. This needs because FileExecutablePath demands existed file
        If ((browserReport = "WINWORD") And (UCase(fileExtension) <> "DOC")) Then
            fileDestination = putPiece(file, vspint, "doc", ".")
            FileCopy file, fileDestination
        End If
        ' if browser is excel, but file is not xls -> copy file ti file.xls. This needs because FileExecutablePath demands existed file
        If ((browserReport = "EXCEL") And (UCase(fileExtension) <> "XLS")) Then
            fileDestination = putPiece(file, vspint, "xls", ".")
            FileCopy file, fileDestination
        End If
        ' find path to executive for browser
        executableFile = FileExecutablePath(fileDestination, "c:\")
        ' если был создан файл для определения обработчика, то надо его удалить
        If (fileDestination <> file) Then
            'My.Computer.FileSystem.DeleteFile (fileDestination)
            Kill fileDestination
        End If
        'executableFile is found
        If (executableFile <> "") Then
             vspbool = True
             Shell executableFile & " " & file, vbNormalFocus
        Else  ' else auto find browser
            ErrorLevel = ShellExecute(vbNull, "open", file, vbNull, vbNull, 1)
        End If
    End If
    
exitline:
    'Unload Me
    Exit Sub
ErrorHandler:
     ' when use particular browser error was - so try to use auto browser
     'If (browserReport <> "EXPLORER") Then
     If (vspbool = True) Then
         ErrorLevel = ShellExecute(vbNull, "open", file, vbNull, vbNull, 1)
     End If
     FormProgressBar.Timer1.Enabled = False
     FormProgressBar.Timer1.Interval = 0
     Unload Me
     Exit Sub
    End If
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    ' kill prosess if press X in frmProgressBar
    If (Me.flagNormalClose.Caption = "no") Then
          ' удаление процесса, запущенного как job , удаление временных глобалей этого процесса
          ret = mvbAccess("$$KillProcess^REPORTSPB()", sBuffer, "", "", "", "", "", "", "", "", "", "")
    End If
End Sub

