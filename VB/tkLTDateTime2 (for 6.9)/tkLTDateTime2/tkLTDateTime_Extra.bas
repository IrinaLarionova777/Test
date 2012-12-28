Attribute VB_Name = "tkLTDateTime_Extra"
Option Explicit

Const PLUS_OPERAND = "+"
Const MINUS_OPERAND = "-"

Const TODAY_IDENTIFIER = "T"
Const WEEKSTART_IDENTIFIER = "WS"
Const WEEKEND_IDENTIFIER = "WE"
Const MONTHSTART_IDENTIFIER = "MS"
Const MONTHEND_IDENTIFIER = "ME"
Const YEARSTART_IDENTIFIER = "YS"
Const YEAREND_IDENTIFIER = "YE"
Const FINANCIALSTART_IDENTIFIER = "FS"
Const FINANCIALEND_IDENTIFIER = "FE"

Public Function StartBeforeEnd(sStartDate As String, sEndDate As String) As Boolean
'Checks to see if the start date is logically before the end date
'Inputs - the start date and end date
'Outputs - whether the start date and end date are valid - i.e. start date before end date
    StartBeforeEnd = True
    sStartDate = IsValidDate(sStartDate, gDateNormal, "ANY")
    sEndDate = IsValidDate(sEndDate, gDateNormal, "ANY")
    If (sStartDate <> "") And (sEndDate <> "") Then
        If Val(tkDateDiff("d", sStartDate, sEndDate)) < 0 Then
            StartBeforeEnd = False
        End If
    End If
End Function

Private Function FormatDateRepresentationString(strDate As String, IdentifierLength As Integer) As String
'Purpose - Determnines if a date string is a valid date representation
'Inputs - The date representation format
'Outputs - A valid date representation format or an empty string

    If Len(strDate) > IdentifierLength + 1 Then
        ' Process Date plus x days (e.g. ME+2)
        If (Mid$(strDate, IdentifierLength + 1, 1) = PLUS_OPERAND) Then
            FormatDateRepresentationString = Left$(strDate, IdentifierLength) & PLUS_OPERAND & Val(Mid$(strDate, IdentifierLength + 2))
        ' Process Date minus x days (e.g. ME-3)
        ElseIf (Mid$(strDate, IdentifierLength + 1, 1) = MINUS_OPERAND) Then
            FormatDateRepresentationString = Left$(strDate, IdentifierLength) & MINUS_OPERAND & Val(Mid$(strDate, IdentifierLength + 2))
        Else
            FormatDateRepresentationString = ""
        End If
    Else
        FormatDateRepresentationString = Left$(strDate, IdentifierLength)
    End If
End Function

Public Function IsValidDateRepresentation(strDate As String) As String
'Purpose - To determine if a string is a valid date or date representation format
'Inputs - A date or date representation format
'Outputs - A valid date or date representation format
'The valid representation formats are define as
'   WS = The start of the current week
'   WE = The end of the current week
'   MS = The start of the current month
'   ME = The end of the current month
'   YS = The start of the current year
'   YE = The end of the current year
'   FS = The start of the current financial year
'   FE = The end of the current financial year
'Uses the same format as with T (Today's date)
'i.e. ME+1 is the end of next month
'  or YS-1 is the begining of last year

    If (Left$(strDate, 1) = gToday) Or (UCase(Left$(strDate, 1)) = UCase(gSysDefault.TodayNominator)) Then
        IsValidDateRepresentation = FormatDateRepresentationString(strDate, 1)
    ElseIf (UCase(Left$(strDate, 2)) = WEEKSTART_IDENTIFIER) Then
        IsValidDateRepresentation = FormatDateRepresentationString(strDate, 2)
    ElseIf (UCase(Left$(strDate, 2)) = WEEKEND_IDENTIFIER) Then
        IsValidDateRepresentation = FormatDateRepresentationString(strDate, 2)
    ElseIf (UCase(Left$(strDate, 2)) = MONTHSTART_IDENTIFIER) Then
        IsValidDateRepresentation = FormatDateRepresentationString(strDate, 2)
    ElseIf (UCase(Left$(strDate, 2)) = MONTHEND_IDENTIFIER) Then
        IsValidDateRepresentation = FormatDateRepresentationString(strDate, 2)
    ElseIf (UCase(Left$(strDate, 2)) = YEARSTART_IDENTIFIER) Then
        IsValidDateRepresentation = FormatDateRepresentationString(strDate, 2)
    ElseIf (UCase(Left$(strDate, 2)) = YEAREND_IDENTIFIER) Then
        IsValidDateRepresentation = FormatDateRepresentationString(strDate, 2)
    ElseIf (UCase(Left$(strDate, 2)) = FINANCIALSTART_IDENTIFIER) Then
        IsValidDateRepresentation = FormatDateRepresentationString(strDate, 2)
    ElseIf (UCase(Left$(strDate, 2)) = FINANCIALEND_IDENTIFIER) Then
        IsValidDateRepresentation = FormatDateRepresentationString(strDate, 2)
    Else
        IsValidDateRepresentation = IsValidDate(strDate, gDateLong, "")
    End If
End Function


