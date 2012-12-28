Attribute VB_Name = "functions"
Public sBuffer As String
'Used in ApplicationInitialise
'Global gMenuOptions As String
Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function FindExecutable Lib "shell32.dll" Alias "FindExecutableA" (ByVal lpFile As String, ByVal lpDirectory As String, ByVal sResult As String) As Long
'Public Declare Function clstkFormat.FormatGenDate Lib "tkLTCommon" (ByVal strMSQLDate As String, ByVal strDateFormat As String) As String

Function Piece(ByVal strIn As String, ByVal numpiece As Integer, Optional ByVal delimeter As String)

   Dim i As Integer
   Dim i1 As Integer
   Dim i2 As Integer
   If numpiece < 1 Then Piece = "": Exit Function
   i = 1
   i1 = 0
   If delimeter = "" Then delimeter = Chr(1)
   If Len(delimeter) <> 1 Then Piece = "": Exit Function
   Do
         If i >= numpiece Then Exit Do
         i1 = InStr(i1 + 1, strIn, delimeter)
         If i1 = 0 Then Exit Do
         i = i + 1
   Loop
   If i1 = 0 And i < numpiece Then Piece = "": Exit Function
   
   i2 = InStr(i1 + 1, strIn, delimeter)
   If i2 <> 0 Then Piece = Mid(strIn, i1 + 1, i2 - i1 - 1): Exit Function
   Piece = Mid(strIn, i1 + 1)
End Function

Public Function DatePut(sInDate As String) As String
    ' Dates must be passed to Cache as numerical days since 31/12/1840
    If Not IsDate(sInDate) Then
        DatePut = ""
    Else
        DatePut = DateDiff("d", "31/12/1840", sInDate)
    End If
End Function
Function mLength(ByVal fullstr As String, ByVal substr As String)
    Dim i, j, c, L As Integer
    L = Len(substr)
    c = 1: j = 1
    Do
        i = InStr(j, fullstr, substr)
        If i = 0 Then Exit Do
        j = i + L
        c = c + 1
    Loop
    mLength = c
End Function

Function putPiece(ByVal strIn As String, ByVal numpiece As Integer, ByVal subSring As String, Optional ByVal delimeter As String) As String
    If delimeter = "" Then delimeter = Chr(1)
    Dim i As Integer
    Dim i1 As Integer
    Dim i2 As Integer
    Dim j As Integer
    Dim vspstring As String
    
    i = 1
    i1 = 0
    Do
         If i = numpiece Then Exit Do
         i1 = InStr(i1 + 1, strIn, delimeter)
         If i1 = 0 Then Exit Do
         i = i + 1
    Loop
    If i1 = 0 And i < numpiece Then
         putPiece = strIn
         If numpiece - i > 0 Then
            For j = 1 To numpiece - i
               putPiece = putPiece & delimeter
            Next
         End If
         putPiece = putPiece & subSring: Exit Function
    End If
    
    i2 = InStr(i1 + 1, strIn, delimeter)
    If (i2 = 0) Then putPiece = (Mid(strIn, 1, i1) & subSring): Exit Function
    putPiece = Mid(strIn, 1, i1) & subSring & Mid(strIn, i2): Exit Function
End Function
' Add string strIn пробелами справа до lenstr
Function AjustString(ByVal strIn As String, lenstr As Integer) As String
    Dim length As Integer
    Dim i As Integer

    length = Len(strIn)
    AjustString = strIn
    MsgBox (length & "-" & lenstr)
    If Not length > lenstr Then
       Exit Function
    End If
    For i = length + 1 To lenstr
       AjustString = AjustString & " "
    Next
End Function

Public Function FormatMDateToVBDate(strMSQLDate As String) As Date
   ' Description
   ' Convert a valid MSQL internal $H style date to:
   ' to a VB date variable.
    FormatMDateToVBDate = Val(strMSQLDate) - 21548
    
End Function


Function getControlByNameMy(ByVal controlName As String, ByVal FormApp As Form) As Control
    Dim cc As Control
    'getControlByNameMy = New Control
    For Each cc In FormApp.Controls
    MsgBox (cc.Name)
      If (cc.Name = controlName) Then
          MsgBox (555)
          getControlByNameMy = cc
          Exit Function
      End If
    Next cc
End Function

Public Function FileExecutablePath(sFileName As String, sDirectory As String) As String
    Const MAX_PATH As Long = 260, ERROR_FILE_NO_ASSOCIATION As Long = 31, ERROR_FILE_NOT_FOUND As Long = 2
    Const ERROR_PATH_NOT_FOUND As Long = 3, ERROR_FILE_SUCCESS As Long = 32, ERROR_BAD_FORMAT As Long = 11
    Dim lRetVal As Long, lPos As Long
    Dim sResult As String * MAX_PATH
    
    'MsgBox ("sFileName=" & sFileName)
    
    On Error Resume Next
    lRetVal = FindExecutable(sFileName, sDirectory, sResult)
    
    FileExecutablePath = ""
    Select Case lRetVal
    
    Case ERROR_FILE_NO_ASSOCIATION
    
    Case ERROR_FILE_NOT_FOUND
        MsgBox ("Файл " & sFileName & " не найден.")
    
    Case ERROR_PATH_NOT_FOUND
        MsgBox ("Путь " & sFileName & " не найден.")
    
    Case ERROR_BAD_FORMAT
    
    Case Is >= ERROR_FILE_SUCCESS
        'Found path to executable
        lPos = InStr(sResult, Chr$(0))
        If lPos Then
           FileExecutablePath = Left$(sResult, lPos - 1)
        End If
    End Select
    On Error GoTo 0
End Function

' Пробовала использовать свой VisM на форме (если установить property TimeOut=-1 or 0, то time out не срабатывает Но тогда другая $j и нет контекста отчета.
' component VisM - надо прикрепить Project-Components- VisM ActiveX Component
'Public Function cacheExecute(Command, sBuffer, P0, P1, P2, P3, P4, P5, P6, P7, P8, P9) As String
'MsgBox ("Command=" & Command)
'    With frmReportVB.VisM1
'       .PLIST = sBuffer
'       .P0 = P0
'       .P1 = P1
'       .P2 = P2
'       .P3 = P3
'       .P4 = P4
 '      .P5 = P5
 '      .P6 = P6
'       .P7 = P7
'       .P8 = P8
'       .P9 = P9
'       .Code = Command
'       .ExecFlag = 1
'       '.Execute (Command)
'       sBuffer = .PLIST
'       cacheExecute = .Value
'       MsgBox (.PLIST)
'       MsgBox (.Value)
'    End With
'End Function

