Attribute VB_Name = "functions"
Public sBuffer As String
'Used in ApplicationInitialise
Global gMenuOptions As String
Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

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

