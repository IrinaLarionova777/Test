Attribute VB_Name = "modPRTCLNRUS"
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
   



