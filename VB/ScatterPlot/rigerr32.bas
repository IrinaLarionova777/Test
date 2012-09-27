Attribute VB_Name = "modRigErr"
'==================================================
'VB/Rig 3.0 - Copyright 1997, Compuware Corporation
'==================================================

'RIGERR32.BAS (VB 32-bit)

'This code module must be included in every VB
'project that has been rigged for error trapping.
'It contains the CALLed procedures that support the
'error trapping subsystem.

'You are welcome to customize this module for
'your own needs, but you are NOT licensed to
're-distribute this source code -- either in
'its original form or in modified form.

'+++ VB/Rig Skip +++

Option Explicit

' Public symbols

Public Type VBRigPublic
   AnnotateEnabled As Boolean
   MonitorEnabled  As Boolean
   RunUnAttended   As Boolean
   HideWarnings    As Boolean
   HideListBox     As Boolean
   LogFileSpec     As String
   WindowCaption   As String
   ButtonCaptions  As String
   ButtonSelected  As Integer
   LastErrLog      As String
   LastErrApp      As String
   LastErrNumber   As Long
   LastErrMessage  As String
   LastErrOrigin   As String
   LastErrTrap     As String
   LastErrStack    As String
   LastErrDateTime As Variant
End Type

Public Const VBRIG_TITLE = "VB/Rig"
Public Const VBRIG_VERSION = "3.0"

Public Const VBRIG_BUTTON_CAPTION_DIVIDER = "|"
Public Const VBRIG_BUTTON_CAPTION_DISABLE = "#"

Public Const VBRIG_SHOW_ERROR = 1
Public Const VBRIG_LOG_ERROR = 2
Public Const VBRIG_SHOWLOG_ERROR = 3
Public Const VBRIG_NOP_ERROR = 4
Public Const VBRIG_PUSH_PROC_STACK = 5
Public Const VBRIG_POP_PROC_STACK = 6
Public Const VBRIG_FIXUP_PROC_STACK = 7
Public Const VBRIG_FIXPOP_PROC_STACK = 8
Public Const VBRIG_GET_PROC_STACK = 9
Public Const VBRIG_GET_BOOKMARK_STACK = 10
Public Const VBRIG_SET_BOOKMARK = 11


Public VbRig As VBRigPublic


' Private symbols

Private Const VBRIG_MONITOR_PUSH = 1
Private Const VBRIG_MONITOR_POP = 2
Private Const VBRIG_MONITOR_BOOKMARK = 3
Private Const VBRIG_ERROR_TABLE_SET = 1
Private Const VBRIG_ERROR_TABLE_GET = 2

Private Const VBRIG_DEFAULT_LOG_NAME = "ERRORLOG"
Private Const VBRIG_DEFAULT_LOG_EXT = ".ERR"

Private Const VBRIG_INTERNAL_ERROR = 999
Private Const VBRIG_BEEP_SLEEP = 500

Private Const VBRIG_STACK_INCREMENT = 8
Private Const VBRIG_CUSTOM_INCREMENT = 40

Private VBRigPopupWindowInUse As Boolean


' ======================
' Win32 API declarations
' ======================
#If Win32 Then
Private Const LB_SETTABSTOPS = &H192
Private Const LB_SETHORIZONTALEXTENT = &H194
Private Const EM_SETTABSTOPS = &HCB

Private Declare Sub vbrig_Sleep Lib "kernel32" Alias "Sleep" (ByVal dwMilliseconds As Long)
Private Declare Function vbrig_SetTabstops Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Long) As Long
Private Declare Function vbrig_SetHorizScrollBar Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Long) As Long
#End If

Private Static Sub priVBRig_ErrorTable(nAction As Integer, _
                                       nlErrNbr As Long, _
                                       sErrMsg As String)
'+++ VB/Rig Skip +++

'This procedure maintains a table of custom error messages.


Dim tfCustomFound    As Boolean
Dim nSub             As Integer
Dim nCustomCount     As Integer
Dim nlCustomErrNbr() As Long
Dim sCustomErrMsg()  As String


On Error GoTo priVBRig_ErrorTable_Err


Select Case nAction
   Case VBRIG_ERROR_TABLE_SET
      If nlErrNbr < 0 Then
         nCustomCount = 0
      End If
      
   Case Else
End Select

If nCustomCount = 0 Then
   ReDim nlCustomErrNbr(VBRIG_CUSTOM_INCREMENT)
   ReDim sCustomErrMsg(UBound(nlCustomErrNbr))
End If

Select Case nAction
   Case VBRIG_ERROR_TABLE_SET
      If nlErrNbr > 0 Then
         tfCustomFound = False
         
         For nSub = 1 To nCustomCount
            If nlErrNbr = nlCustomErrNbr(nSub) Then
               sCustomErrMsg(nSub) = sErrMsg
               
               tfCustomFound = True
               Exit For
            End If
         Next
         
         If tfCustomFound Then
            'do nothing
         Else
            nCustomCount = nCustomCount + 1
   
            If nCustomCount > UBound(nlCustomErrNbr) Then
               ReDim Preserve nlCustomErrNbr(UBound(nlCustomErrNbr) + VBRIG_CUSTOM_INCREMENT)
               ReDim Preserve sCustomErrMsg(UBound(nlCustomErrNbr))
            End If
            
            nlCustomErrNbr(nCustomCount) = nlErrNbr
            sCustomErrMsg(nCustomCount) = sErrMsg
         End If
      End If

   Case VBRIG_ERROR_TABLE_GET
      For nSub = 1 To nCustomCount
         If nlErrNbr = nlCustomErrNbr(nSub) Then
            If Len(sCustomErrMsg(nSub)) > 0 Then
               sErrMsg = sCustomErrMsg(nSub)
            End If
            
            Exit For
         End If
      Next
      
      If Len(sErrMsg) = 0 Then
         sErrMsg = "<none>"
      End If
      
   Case Else
End Select

Exit Sub


'=======================
priVBRig_ErrorTable_Err:
'=======================
Call priVBRig_InternalError(Err.Number, Err.Description, "ErrorTable", -1, "", "", "")
Resume Next

End Sub

Private Sub priVBRig_GetErrorOriginAndTrap(sModID As String, _
                                           sProcID As String, _
                                           sProcStack() As String, _
                                           nStackErrorOrigin As Integer, _
                                           nStackErrorTrap As Integer)
'+++ VB/Rig Skip +++

'Identify the error's origin, and where it
'was actually trapped.


Dim nSub        As Integer
Dim sStackEntry As String


nStackErrorOrigin = UBound(sProcStack)
nStackErrorTrap = 0

sStackEntry = VBRig_sFormatStack(sModID, sProcID)

For nSub = UBound(sProcStack) To 1 Step -1
   If sProcStack(nSub) = sStackEntry Then
      nStackErrorTrap = nSub
      Exit For
   End If
Next

End Sub

Private Sub priVBRig_InternalError(nlIntErrNbr As Long, _
                                   sIntErrMsg As String, _
                                   sIntProcID As String, _
                                   nlAppErrNbr As Long, _
                                   sAppErrMsg As String, _
                                   sAppModID As String, _
                                   sAppProcID As String)
'+++ VB/Rig Skip +++

'This procedure is invoked if a runtime error
'occurs within this module.  Please contact
'PC HELP-LINE if an "internal error" occurs
'in your application.


Dim sMsg As String


sMsg = VBRIG_TITLE & vbLf
sMsg = sMsg & String$(50, "-") & vbLf
sMsg = sMsg & "Error: " & CStr(nlIntErrNbr) & vbLf & vbLf
sMsg = sMsg & "Explanation: " & sIntErrMsg & vbLf & vbLf
sMsg = sMsg & "Procedure: " & sIntProcID & vbLf & vbLf & vbLf & vbLf
sMsg = sMsg & "Application" & vbLf
sMsg = sMsg & String$(50, "-") & vbLf

If nlAppErrNbr >= 0 Then
   sMsg = sMsg & "Error: " & CStr(nlAppErrNbr) & vbLf & vbLf
   sMsg = sMsg & "Explanation: " & sAppErrMsg & vbLf & vbLf
Else
   sMsg = sMsg & "Error: N/A" & vbLf & vbLf
   sMsg = sMsg & "Explanation: N/A" & vbLf & vbLf
End If

If Len(sAppProcID) > 0 Then
   sMsg = sMsg & "Procedure: " & VBRig_sFormatStack(sAppModID, sAppProcID)
End If


If VbRig.RunUnAttended Then
   VbRig.LastErrApp = VBRIG_TITLE
   VbRig.LastErrNumber = VBRIG_INTERNAL_ERROR
   VbRig.LastErrMessage = sMsg
   
   Beep
   Call vbrig_Sleep(VBRIG_BEEP_SLEEP)
   Beep
Else
   Beep
   MsgBox sMsg, vbExclamation, "- " & VBRIG_TITLE & " Internal Error -"
End If

End Sub

Private Sub priVBRig_LogError(sModID As String, _
                              sProcID As String)
'+++ VB/Rig Skip +++

'Write a record to the "error log" file.


Dim nSub         As Integer
Dim nChar        As Integer
Dim hLogFile     As Integer
Dim nlStringLen  As Long
Dim sTitle       As String
Dim sChar        As String
Dim sTempPath    As String
Dim sTempName    As String
Dim sLogFileSpec As String
Dim sLogMsg      As String
Dim sLogRec      As String

Const sQUOTE = """"
Const sCOMMA = ","


On Error GoTo priVBRig_LogError_Err


'Filter characters that might interfere
'with comma-delimited record format

sLogMsg = VbRig.LastErrMessage

For nSub = 1 To Len(sLogMsg)
   nChar = Asc(Mid$(sLogMsg, nSub, 1))
   
   Select Case nChar
      Case Is < 32  'noise
         Mid$(sLogMsg, nSub, 1) = " "
         
      Case 34       'quote
         Mid$(sLogMsg, nSub, 1) = "~"
         
      Case Else     'do nothing
   End Select
Next


'Generate a usable log filespec

sLogFileSpec = VbRig.LogFileSpec

If Len(sLogFileSpec) > 0 Then
   'do nothing
Else
   sTempPath = App.Path
   
   If Len(sTempPath) > 0 Then
      If Right$(sTempPath, 1) <> "\" Then
         sTempPath = sTempPath & "\"
      End If
   End If

   sTempName = ""
   sTitle = UCase$(App.Title)

   For nSub = 1 To Len(sTitle)
      sChar = Mid$(sTitle, nSub, 1)

      Select Case sChar
         Case "0" To "9", "A" To "Z"
            sTempName = sTempName & sChar

         Case Else
            sTempName = sTempName & "_"

      End Select
   Next

   sTempName = Left$(sTempName, 8)

   If Len(sTempName) > 0 Then
      'do nothing
   Else
      sTempName = VBRIG_DEFAULT_LOG_NAME
   End If

   sLogFileSpec = sTempPath & sTempName & VBRIG_DEFAULT_LOG_EXT
End If

If Len(sLogFileSpec) > 0 Then
   'sLogRec = sQUOTE & VbRig.LastErrApp & sQUOTE & sCOMMA
   'sLogRec = sLogRec & CStr(VbRig.LastErrNumber) & sCOMMA
   'sLogRec = sLogRec & sQUOTE & gsLogMs & sQUOTE & sCOMMA
   'sLogRec = sLogRec & sQUOTE & VbRig.LastErrOrigin & sQUOTE & sCOMMA
   'sLogRec = sLogRec & sQUOTE & VbRig.LastErrTrap & sQUOTE & sCOMMA
   'sLogRec = sLogRec & sQUOTE & VbRig.LastErrStack & sQUOTE & sCOMMA
   'sLogRec = sLogRec & sQUOTE & Format$(VbRig.LastErrDateTime, "yyyymmdd") & sQUOTE & sCOMMA
   'sLogRec = sLogRec & sQUOTE & Format$(VbRig.LastErrDateTime, "hhnnss") & sQUOTE
   sLogRec = sQUOTE & App.ExeName & sQUOTE & sCOMMA
   sLogRec = sLogRec & " Vsn " & App.Major & "." & App.Minor & "." & App.Revision & " " & sCOMMA
   sLogRec = sLogRec & sQUOTE & gComputerName & sQUOTE & sCOMMA
   sLogRec = sLogRec & CStr(VbRig.LastErrNumber) & sCOMMA
   sLogRec = sLogRec & sQUOTE & sLogMsg & sQUOTE & sCOMMA
   sLogRec = sLogRec & sQUOTE & VbRig.LastErrOrigin & sQUOTE & sCOMMA
   sLogRec = sLogRec & sQUOTE & VbRig.LastErrTrap & sQUOTE & sCOMMA
   sLogRec = sLogRec & sQUOTE & VbRig.LastErrStack & sQUOTE & sCOMMA
   sLogRec = sLogRec & sQUOTE & Format$(VbRig.LastErrDateTime, "dd/mm/yyyy") & sQUOTE & sCOMMA
   sLogRec = sLogRec & sQUOTE & Format$(VbRig.LastErrDateTime, "hh:nn:ss") & sQUOTE

   'Additions for TRAK
   'Start Time
   sLogRec = sLogRec & sQUOTE & "Start Time - " & TimeStarted & sQUOTE & sCOMMA
   'Command line show all but password
   Dim i          As Integer
   Dim j          As Integer
   Dim StartPos   As Integer
   Dim EndPos     As Integer
   If DELIM_STD <> "" Then
      i = 0
      j = 0
      StartPos = 0
      EndPos = 0
      Do While i < 4
         i = i + 1
         j = InStr(j + 1, Command, DELIM_STD)
         If i = 2 Then
            StartPos = j
         ElseIf i = 3 Then
            If j = 0 Then
               j = Len(Command)
            End If
            EndPos = j
            Exit Do
         End If
      Loop
      If (StartPos > 0 And EndPos > 0) And (EndPos - StartPos - 1 > 0) Then
         sLogRec = sLogRec & sQUOTE & Mid$(Command, 1, StartPos) & String$(EndPos - StartPos - 1, "*") & Mid$(Command, EndPos) & sQUOTE & sCOMMA
      End If
   Else
      sLogRec = sLogRec & sQUOTE & Command & sQUOTE & sCOMMA
   End If
   'End of TRAK additions

   VbRig.LastErrLog = sLogFileSpec

   hLogFile = FreeFile
   Open VbRig.LastErrLog For Append As #hLogFile
   Print #hLogFile, sLogRec
   Close #hLogFile
   'End      'TerminateProgram
End If

Exit Sub


'=====================
priVBRig_LogError_Err:
'=====================
Call priVBRig_InternalError(Err.Number, Err.Description, "LogError", VbRig.LastErrNumber, VbRig.LastErrMessage, sModID, sProcID)
Resume Next

End Sub

Private Sub priVBRig_MakeStackString(sProcStack() As String, _
                                     sBookmarkStack() As String, _
                                     sStackString As String)
'+++ VB/Rig Skip +++

'Create a single-string representation
'of the combined procedure/bookmark stacks.


Dim nSub As Integer


sStackString = ""

For nSub = 1 To UBound(sProcStack)
   If nSub > 1 Then
      sStackString = sStackString & ","
   End If

   sStackString = sStackString & sProcStack(nSub) & sBookmarkStack(nSub)
Next

End Sub

Private Sub priVBRig_MonitorStack(nAction As Integer, _
                                  nProcStackPointer As Integer, _
                                  sProcStack() As String, _
                                  sBookmarkStack() As String)
'+++ VB/Rig Skip +++

'This procedure allows you to monitor the state
'of the procedure stack in the debug window,
'while your application is running.


Dim sMonitor As String


Select Case nAction
   Case VBRIG_MONITOR_PUSH
      sMonitor = Space$(nProcStackPointer * 2) & sProcStack(nProcStackPointer) & " <enter>"

   Case VBRIG_MONITOR_POP
      sMonitor = Space$(nProcStackPointer * 2) & sProcStack(nProcStackPointer) & " <exit> "

   Case VBRIG_MONITOR_BOOKMARK
      sMonitor = Space$((nProcStackPointer + 1) * 2) & sBookmarkStack(nProcStackPointer) & " <mark> "

   Case Else
End Select

Debug.Print Format$(Now, "hh:mm:ss"); "  "; Right$(Space$(3) & CStr(nProcStackPointer), 2); sMonitor

End Sub

Private Static Sub priVBRig_ProcStack(nVBRig_Command As Integer, _
                                      sModID As String, _
                                      sProcID As String, _
                                      sStack() As String)
'+++ VB/Rig Skip +++

'This procedure provides the routines used to
'maintain your application's "procedure stack".


Dim tfStacksAllocated As Boolean
Dim nSub              As Integer
Dim nProcStackPointer As Integer
Dim sMsg              As String
Dim sStackEntry       As String
Dim sStackString      As String
Dim sProcStack()      As String
Dim sBookmarkStack()  As String


On Error GoTo priVBRig_ProcStack_Err


Select Case nVBRig_Command
   Case VBRIG_PUSH_PROC_STACK
      If Not tfStacksAllocated Then
         ReDim sProcStack(VBRIG_STACK_INCREMENT)
         ReDim sBookmarkStack(UBound(sProcStack))
         nProcStackPointer = 0

         tfStacksAllocated = True
      End If
      
      nProcStackPointer = nProcStackPointer + 1

      If nProcStackPointer > UBound(sProcStack) Then
         ReDim Preserve sProcStack(UBound(sProcStack) + VBRIG_STACK_INCREMENT)
         ReDim Preserve sBookmarkStack(UBound(sProcStack))
      End If
      
      sProcStack(nProcStackPointer) = VBRig_sFormatStack(sModID, sProcID)
      sBookmarkStack(nProcStackPointer) = ""

      If VbRig.MonitorEnabled Then
         Call priVBRig_MonitorStack(VBRIG_MONITOR_PUSH, nProcStackPointer, sProcStack(), sBookmarkStack())
      End If

   Case VBRIG_POP_PROC_STACK
      sStackEntry = VBRig_sFormatStack(sModID, sProcID)
      
      If nProcStackPointer >= 1 Then
         If sStackEntry = sProcStack(nProcStackPointer) Then
            If VbRig.MonitorEnabled Then
               Call priVBRig_MonitorStack(VBRIG_MONITOR_POP, nProcStackPointer, sProcStack(), sBookmarkStack())
            End If

            nProcStackPointer = nProcStackPointer - 1
         Else
            sMsg = "VB/Rig's procedure stack is out of sync.  Check the following procedures "
            sMsg = sMsg & "for improperly paired PUSH_PROC and POP_PROC commands." & vbLf & vbLf
            sMsg = sMsg & "Last Push:" & vbLf
            sMsg = sMsg & sProcStack(nProcStackPointer) & vbLf & vbLf
            sMsg = sMsg & "This Pop:" & vbLf
            sMsg = sMsg & sStackEntry & vbLf & vbLf
            sMsg = sMsg & "A re-sync will be attempted."

            If VbRig.RunUnAttended Or VbRig.HideWarnings Then
               VbRig.LastErrApp = VBRIG_TITLE
               VbRig.LastErrNumber = VBRIG_INTERNAL_ERROR
               VbRig.LastErrMessage = sMsg
               VbRig.LastErrOrigin = ""
               VbRig.LastErrTrap = ""
               VbRig.LastErrStack = ""
               VbRig.LastErrDateTime = ""
               
               Beep
               Call vbrig_Sleep(VBRIG_BEEP_SLEEP)
               Beep
            Else
               Beep
               MsgBox sMsg, vbExclamation, "- " & VBRIG_TITLE & " Warning -"
            End If
            
            For nSub = nProcStackPointer To 1 Step -1
               If sStackEntry = sProcStack(nSub) Then
                  If VbRig.MonitorEnabled Then
                     Call priVBRig_MonitorStack(VBRIG_MONITOR_POP, nSub, sProcStack(), sBookmarkStack())
                  End If
                  
                  nProcStackPointer = nSub - 1
                  Exit For
               End If
            Next
         End If
      Else
         nProcStackPointer = 0
      End If

   Case VBRIG_FIXUP_PROC_STACK
      sStackEntry = VBRig_sFormatStack(sModID, sProcID)
      
      For nSub = nProcStackPointer To 1 Step -1
         If sStackEntry = sProcStack(nSub) Then
            nProcStackPointer = nSub
            Exit For
         End If
      Next

   Case VBRIG_GET_PROC_STACK
      ReDim sStack(nProcStackPointer)
      sStackString = ""

      For nSub = 1 To nProcStackPointer
         If nSub > 1 Then
            sStackString = sStackString & ","
         End If

         sStackString = sStackString & sProcStack(nSub)
         sStack(nSub) = sProcStack(nSub)
      Next

      sProcID = sStackString

   Case VBRIG_SET_BOOKMARK
      If nProcStackPointer >= 1 Then
         sBookmarkStack(nProcStackPointer) = "." & sProcID

         If VbRig.MonitorEnabled Then
            Call priVBRig_MonitorStack(VBRIG_MONITOR_BOOKMARK, nProcStackPointer, sProcStack(), sBookmarkStack())
         End If
      End If

   Case VBRIG_GET_BOOKMARK_STACK
      ReDim sStack(nProcStackPointer)
      sStackString = ""

      For nSub = 1 To nProcStackPointer
         If nSub > 1 Then
            sStackString = sStackString & ","
         End If

         sStackString = sStackString & sBookmarkStack(nSub)
         sStack(nSub) = sBookmarkStack(nSub)
      Next

      sProcID = sStackString

   Case Else
End Select

Exit Sub


'======================
priVBRig_ProcStack_Err:
'======================
Call priVBRig_InternalError(Err.Number, Err.Description, "ProcStack", -1, "", sModID, sProcID)
Resume Next

End Sub

Private Sub priVBRig_ShowError(sModID As String, _
                               sProcID As String)
'+++ VB/Rig Skip +++

'Popup the "error" form.


Dim tfSelected        As Boolean
Dim nSub              As Integer
Dim nDivPos           As Integer
Dim nStackErrorOrigin As Integer
Dim nStackErrorTrap   As Integer
Dim nMousePointerSave As Integer
Dim nlRC              As Long
Dim nlTabstop()       As Long
Dim sTempCaption      As String
Dim sStackEntry       As String
Dim sProcOrigin       As String
Dim sProcTrap         As String
Dim sProcStack()      As String
Dim sBookmarkStack()  As String


On Error GoTo priVBRig_ShowError_Err


If VBRigPopupWindowInUse Then
   GoSub priVBRig_ShowError_DisplayCascade
Else
   VBRigPopupWindowInUse = True
   
   Load frmRigErr
         
   With frmRigErr
      If VbRig.HideListBox Then
         .Height = (.Height - .ScaleHeight) + .txtStack.Top
      Else
         .Height = (.Height - .ScaleHeight) + .txtCascade.Top
      End If
      
      .Move (Screen.Width - .Width) / 2, (Screen.Height - .Height) / 2
      
      If Len(VbRig.WindowCaption) > 0 Then
         .Caption = VbRig.WindowCaption
      Else
         .Caption = "- " & VBRIG_TITLE & " -"
      End If
      
      .lblErr.Caption = CStr(VbRig.LastErrNumber)
      .lblErrMsg.Caption = VbRig.LastErrMessage
      
      .cmdAnnotate.Visible = VbRig.AnnotateEnabled
   End With
   
   GoSub priVBRig_ShowError_RenderButtons
   GoSub priVBRig_ShowError_DisplayProcStack
   
   nMousePointerSave = Screen.MousePointer
   Screen.MousePointer = vbDefault
   
   frmRigErr.Show vbModal
   Unload frmRigErr
   Set frmRigErr = Nothing
   
   Screen.MousePointer = nMousePointerSave
   
   VBRigPopupWindowInUse = False
End If

Exit Sub


'===================================
priVBRig_ShowError_DisplayProcStack:
'===================================
Call priVBRig_ProcStack(VBRIG_GET_PROC_STACK, "", "", sProcStack())
Call priVBRig_ProcStack(VBRIG_GET_BOOKMARK_STACK, "", "", sBookmarkStack())
Call priVBRig_GetErrorOriginAndTrap(sModID, sProcID, sProcStack(), nStackErrorOrigin, nStackErrorTrap)

With frmRigErr
   .lstStack.Clear
   
   For nSub = 1 To UBound(sProcStack)
      sStackEntry = sProcStack(nSub) & sBookmarkStack(nSub)
   
      tfSelected = False
   
      If nSub = nStackErrorOrigin Then
         sProcOrigin = ">>"
         tfSelected = True
      Else
         sProcOrigin = Space$(1)
      End If
   
      If nSub = nStackErrorTrap Then
         sProcTrap = ">>"
         tfSelected = True
      Else
         sProcTrap = Space$(1)
      End If
   
      .lstStack.AddItem sProcOrigin & vbTab & sProcTrap & vbTab & sStackEntry
      .lstStack.ItemData(.lstStack.NewIndex) = tfSelected
   Next
   
   If nStackErrorTrap > 0 Then
      .lstStack.TopIndex = nStackErrorTrap - 1
   End If
   If .lstStack.ListCount > 0 Then
      .lstStack.Selected(0) = True  'trigger .Selected refresh
   End If
   
   
   'format listbox columns and headings
   
   .txtStack.Text = "Origin" & vbTab & "Trap" & vbTab & "Procedure"
   
   ReDim nlTabstop(1)
   nlTabstop(0) = 22
   nlTabstop(1) = 50
   
   nlRC = vbrig_SetTabstops(.txtStack.hwnd, EM_SETTABSTOPS, UBound(nlTabstop) + 1, nlTabstop(0))
   nlRC = vbrig_SetTabstops(.lstStack.hwnd, LB_SETTABSTOPS, UBound(nlTabstop) + 1, nlTabstop(0))
   nlRC = vbrig_SetHorizScrollBar(.lstStack.hwnd, LB_SETHORIZONTALEXTENT, (.lstStack.Width * 2) \ Screen.TwipsPerPixelX, 0)
End With

Return


'=================================
priVBRig_ShowError_DisplayCascade:
'=================================
With frmRigErr
   sStackEntry = VBRig_sFormatStack(sModID, sProcID)
   
   .lstCascade.AddItem CStr(VbRig.LastErrNumber) & vbTab & sStackEntry
   
   If .lstCascade.ListCount = 1 Then
      If VbRig.HideListBox Then
         .Height = (.Height - .ScaleHeight) + .txtStack.Top
      Else
         .Height = (.Height - .ScaleHeight) + (.lstCascade.Top + .lstCascade.Height) + (.txtCascade.Top - (.lstStack.Top + .lstStack.Height))
      End If
   
      .Move .Left, (Screen.Height - .Height) / 2
   
   
      'format listbox columns and headings
      
      .txtCascade.Text = "Error" & vbTab & "Procedure"
      
      ReDim nlTabstop(0)
      nlTabstop(0) = 35
      
      nlRC = vbrig_SetTabstops(.txtCascade.hwnd, EM_SETTABSTOPS, UBound(nlTabstop) + 1, nlTabstop(0))
      nlRC = vbrig_SetTabstops(.lstCascade.hwnd, LB_SETTABSTOPS, UBound(nlTabstop) + 1, nlTabstop(0))
      nlRC = vbrig_SetHorizScrollBar(.lstCascade.hwnd, LB_SETHORIZONTALEXTENT, (.lstCascade.Width * 2) \ Screen.TwipsPerPixelX, 0)
   
      .txtCascade.Refresh
   End If
End With

Return


'================================
priVBRig_ShowError_RenderButtons:
'================================
With frmRigErr.cmdButton(0)
   .Cancel = True
   .Default = True
   .Enabled = True
   .Visible = True
End With
With frmRigErr.cmdButton(1)
   .Cancel = False
   .Default = False
   .Enabled = True
   .Visible = False
End With
With frmRigErr.cmdButton(2)
   .Cancel = False
   .Default = False
   .Enabled = True
   .Visible = False
End With

If Len(VbRig.ButtonCaptions) > 0 Then
   sTempCaption = VbRig.ButtonCaptions
Else
   sTempCaption = "&Close"
End If

With frmRigErr
   nDivPos = InStr(sTempCaption, VBRIG_BUTTON_CAPTION_DIVIDER)
   If nDivPos > 0 Then
      .cmdButton(0).Cancel = False
      .cmdButton(0).Default = False
      .cmdButton(0).Caption = Left$(sTempCaption, nDivPos - 1)
      .cmdButton(1).Visible = True
      sTempCaption = Mid$(sTempCaption, nDivPos + Len(VBRIG_BUTTON_CAPTION_DIVIDER))
   
      nDivPos = InStr(sTempCaption, VBRIG_BUTTON_CAPTION_DIVIDER)
      If nDivPos > 0 Then
         .cmdButton(1).Caption = Left$(sTempCaption, nDivPos - 1)
         .cmdButton(2).Visible = True
         .cmdButton(2).Caption = Mid$(sTempCaption, nDivPos + Len(VBRIG_BUTTON_CAPTION_DIVIDER))
      Else
         .cmdButton(1).Caption = sTempCaption
      End If
   Else
      .cmdButton(0).Caption = sTempCaption
   End If
   
   For nSub = 0 To 2
      sTempCaption = .cmdButton(nSub).Caption
   
      If Left$(sTempCaption, Len(VBRIG_BUTTON_CAPTION_DISABLE)) = VBRIG_BUTTON_CAPTION_DISABLE Then
         .cmdButton(nSub).Caption = Mid$(sTempCaption, Len(VBRIG_BUTTON_CAPTION_DISABLE) + 1)
         .cmdButton(nSub).Enabled = False
      End If
   Next
End With

Return


'======================
priVBRig_ShowError_Err:
'======================
Call priVBRig_InternalError(Err.Number, Err.Description, "ShowError", VbRig.LastErrNumber, VbRig.LastErrMessage, sModID, sProcID)
Resume Next

End Sub

Public Sub VBRig_Bookmark(sBookmark As String)
'+++ VB/Rig Skip +++

'Set a bookmark for the current procedure.


Dim sDummy() As String


ReDim sDummy(0)

If Len(sBookmark) > 0 Then
   Call priVBRig_ProcStack(VBRIG_SET_BOOKMARK, "", sBookmark, sDummy())
End If

End Sub

Public Sub VBRig_Error(nVBRig_Command As Integer, _
                       nlErrNbr As Long, _
                       sErrMsg As String, _
                       sModID As String, _
                       sProcID As String)
'+++ VB/Rig Skip +++

'This procedure is the central "entry point"
'for all the error-handling functions.


Dim nStackErrorOrigin As Integer
Dim nStackErrorTrap   As Integer
Dim sStackString      As String
Dim sProcStack()      As String
Dim sBookmarkStack()  As String
Dim sDummy()          As String


ReDim sProcStack(0)
ReDim sBookmarkStack(0)
ReDim sDummy(0)

Select Case nVBRig_Command
   Case VBRIG_SHOW_ERROR, VBRIG_LOG_ERROR, VBRIG_SHOWLOG_ERROR, VBRIG_NOP_ERROR
      Call priVBRig_ProcStack(VBRIG_GET_PROC_STACK, "", "", sProcStack())
      Call priVBRig_ProcStack(VBRIG_GET_BOOKMARK_STACK, "", "", sBookmarkStack())
      Call priVBRig_GetErrorOriginAndTrap(sModID, sProcID, sProcStack(), nStackErrorOrigin, nStackErrorTrap)
      Call priVBRig_MakeStackString(sProcStack(), sBookmarkStack(), sStackString)
      
      VbRig.LastErrApp = App.Title
      VbRig.LastErrNumber = nlErrNbr
      VbRig.LastErrMessage = sErrMsg
      Call priVBRig_ErrorTable(VBRIG_ERROR_TABLE_GET, VbRig.LastErrNumber, VbRig.LastErrMessage)
      
      VbRig.LastErrOrigin = sProcStack(nStackErrorOrigin) & sBookmarkStack(nStackErrorOrigin)
      VbRig.LastErrTrap = sProcStack(nStackErrorTrap) & sBookmarkStack(nStackErrorTrap)
      VbRig.LastErrStack = sStackString
      
      VbRig.LastErrDateTime = Now

   Case Else
End Select

Select Case nVBRig_Command
   Case VBRIG_SHOW_ERROR, VBRIG_SHOWLOG_ERROR
      If VbRig.RunUnAttended Then
         Beep
         Call vbrig_Sleep(VBRIG_BEEP_SLEEP)
         Beep
      Else
         Call priVBRig_ShowError(sModID, sProcID)
      End If

   Case Else
End Select

Select Case nVBRig_Command
   Case VBRIG_LOG_ERROR, VBRIG_SHOWLOG_ERROR
      Call priVBRig_LogError(sModID, sProcID)

   Case VBRIG_NOP_ERROR
      'do nothing

   Case Else
End Select

Select Case nVBRig_Command
   Case VBRIG_SHOW_ERROR, VBRIG_LOG_ERROR, VBRIG_SHOWLOG_ERROR, VBRIG_NOP_ERROR
      Call priVBRig_ProcStack(VBRIG_FIXUP_PROC_STACK, sModID, sProcID, sDummy())

   Case VBRIG_FIXPOP_PROC_STACK
      Call priVBRig_ProcStack(VBRIG_FIXUP_PROC_STACK, sModID, sProcID, sDummy())
      Call priVBRig_ProcStack(VBRIG_POP_PROC_STACK, sModID, sProcID, sDummy())

   Case VBRIG_PUSH_PROC_STACK, VBRIG_POP_PROC_STACK, VBRIG_FIXUP_PROC_STACK
      Call priVBRig_ProcStack(nVBRig_Command, sModID, sProcID, sDummy())

   Case VBRIG_GET_PROC_STACK
      Call priVBRig_ProcStack(nVBRig_Command, "", sStackString, sProcStack())
      Call priVBRig_GetErrorOriginAndTrap(sModID, sProcID, sProcStack(), nStackErrorOrigin, nStackErrorTrap)

      sErrMsg = sStackString
      sModID = sProcStack(nStackErrorOrigin)
      sProcID = sProcStack(nStackErrorTrap)

   Case VBRIG_GET_BOOKMARK_STACK
      Call priVBRig_ProcStack(nVBRig_Command, "", sStackString, sBookmarkStack())

      sErrMsg = sStackString

   Case Else
End Select

End Sub

Public Sub VBRig_SetCustomMessage(nlErrNbr As Long, _
                                  sErrMsg As String)
'+++ VB/Rig Skip +++

'Register a custom error message.


Call priVBRig_ErrorTable(VBRIG_ERROR_TABLE_SET, nlErrNbr, sErrMsg)

End Sub

Public Function VBRig_sFormatStack(sModID As String, _
                                   sProcID As String) _
                                   As String
'+++ VB/Rig Skip +++

'Arrange the Module ID and Procedure ID in a
'consistent format, for placement on the stack.


VBRig_sFormatStack = sModID & "(" & sProcID & ")"

End Function

Public Sub VBRig_UnFormatStack(sStackEntry As String, _
                               sModID As String, _
                               sProcID As String, _
                               sBookmark As String)
'+++ VB/Rig Skip +++

'Parse a stack entry back into its component parts.


Dim nPos As Integer


nPos = InStr(sStackEntry, "(")

If nPos > 0 Then
   sModID = Left$(sStackEntry, nPos - 1)
   sProcID = Mid$(sStackEntry, nPos + 1)
   
   nPos = InStr(sProcID, ")")
   
   If nPos > 0 Then
      If nPos < Len(sProcID) Then
         sBookmark = Mid$(sProcID, nPos + 2)
      Else
         sBookmark = ""
      End If
   
      sProcID = Left$(sProcID, nPos - 1)
   Else
      sBookmark = ""
   End If
Else
   sModID = ""
   sProcID = ""
   sBookmark = ""
End If

End Sub

