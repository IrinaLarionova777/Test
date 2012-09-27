VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form frmScatterPlot 
   AutoRedraw      =   -1  'True
   ClientHeight    =   5055
   ClientLeft      =   3495
   ClientTop       =   2505
   ClientWidth     =   4995
   ClipControls    =   0   'False
   Icon            =   "ScatterPlot.frx":0000
   LinkMode        =   1  'Source
   LinkTopic       =   "ScatterPlot"
   ScaleHeight     =   5055
   ScaleWidth      =   4995
   Begin ComctlLib.Toolbar toolBar 
      Align           =   1  'Align Top
      Height          =   840
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4995
      _ExtentX        =   8811
      _ExtentY        =   1482
      ButtonWidth     =   979
      ButtonHeight    =   1323
      AllowCustomize  =   0   'False
      Appearance      =   1
      _Version        =   327682
      BeginProperty Buttons {0713E452-850A-101B-AFC0-4210102A8DA7} 
         NumButtons      =   9
         BeginProperty Button1 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Lmne"
            Key             =   "DIFF"
            Description     =   "Scatter Plot"
            Object.ToolTipText     =   "Scatter Plot"
            Object.Tag             =   "DIFF"
            Style           =   1
            Object.Width           =   1e-4
            Value           =   1
         EndProperty
         BeginProperty Button2 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "V-hist"
            Key             =   "V"
            Description     =   "V-Histogram"
            Object.ToolTipText     =   "V-Histogram"
            Object.Tag             =   "V"
            Style           =   1
         EndProperty
         BeginProperty Button3 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "PLT"
            Key             =   "PLTH"
            Description     =   "PLT-Histogram"
            Object.ToolTipText     =   "PLT-Histogram"
            Object.Tag             =   "PLTH"
            Style           =   1
         EndProperty
         BeginProperty Button4 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "PLTF"
            Key             =   "PLTF"
            Description     =   "PLTF-Histogram"
            Object.ToolTipText     =   "PLTF-Histogram"
            Object.Tag             =   "PLTF"
            Style           =   1
         EndProperty
         BeginProperty Button5 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "RBC"
            Key             =   "RBCH"
            Description     =   "RBC-Histogram"
            Object.ToolTipText     =   "RBC-Histogram"
            Object.Tag             =   "RBCH"
            Style           =   1
         EndProperty
         BeginProperty Button6 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Baso"
            Key             =   "S"
            Description     =   "S-Histogram"
            Object.ToolTipText     =   "S-Histogram"
            Object.Tag             =   "S"
            Style           =   1
         EndProperty
         BeginProperty Button7 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "C"
            Key             =   "C"
            Description     =   "C-Histogram"
            Object.ToolTipText     =   "C-Histogram"
            Object.Tag             =   "C"
            Style           =   1
         EndProperty
         BeginProperty Button8 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Enabled         =   0   'False
            Key             =   "SEPARATOR"
            Object.Tag             =   "SEPARATOR"
            Style           =   4
            Object.Width           =   560
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button9 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Exit"
            Key             =   "EXIT"
            Description     =   "Exit"
            Object.ToolTipText     =   "Exit Program"
            Object.Tag             =   "EXIT"
         EndProperty
      EndProperty
   End
   Begin VB.PictureBox picGraph 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      Height          =   7695
      Left            =   0
      ScaleHeight     =   7635
      ScaleWidth      =   10635
      TabIndex        =   1
      Top             =   840
      Width           =   10695
   End
   Begin VB.TextBox txtDDE 
      Height          =   310
      Left            =   0
      TabIndex        =   2
      Text            =   "DDE"
      Top             =   720
      Visible         =   0   'False
      Width           =   495
   End
   Begin ComctlLib.ImageList imageList 
      Left            =   0
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   30
      ImageHeight     =   30
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   8
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "ScatterPlot.frx":000C
            Key             =   "V"
            Object.Tag             =   "V"
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "ScatterPlot.frx":006A
            Key             =   "DIFF"
            Object.Tag             =   "DIFF"
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "ScatterPlot.frx":00C8
            Key             =   "PLTH"
            Object.Tag             =   "PLTH"
         EndProperty
         BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "ScatterPlot.frx":0126
            Key             =   "PLTF"
            Object.Tag             =   "PLTF"
         EndProperty
         BeginProperty ListImage5 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "ScatterPlot.frx":0184
            Key             =   "RBCH"
            Object.Tag             =   "RBCH"
         EndProperty
         BeginProperty ListImage6 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "ScatterPlot.frx":01E2
            Key             =   "S"
            Object.Tag             =   "S"
         EndProperty
         BeginProperty ListImage7 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "ScatterPlot.frx":0240
            Key             =   "C"
            Object.Tag             =   "C"
         EndProperty
         BeginProperty ListImage8 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "ScatterPlot.frx":029E
            Key             =   "NONE"
            Object.Tag             =   "NONE"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuOption 
      Caption         =   "O&ption"
      Begin VB.Menu mnuShowCaption 
         Caption         =   "&Show Icon Description"
      End
   End
   Begin VB.Menu mnuAdmin 
      Caption         =   "Admin"
      Begin VB.Menu mnuTrans 
         Caption         =   "Translation"
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "&Help"
      Begin VB.Menu mnuHelpContents 
         Caption         =   "&Contents"
      End
      Begin VB.Menu mnuHelpOnHelp 
         Caption         =   "&How to use Help"
      End
      Begin VB.Menu mnuHelpLine 
         Caption         =   "-"
      End
      Begin VB.Menu mnuHelpAbout 
         Caption         =   "&About"
      End
   End
End
Attribute VB_Name = "frmScatterPlot"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
 
Const FORM_FILE = "HIC"

Const BUTTON_INDEX_DIF = 1
Const BUTTON_INDEX_VH = 2
Const BUTTON_INDEX_PLT = 3
Const BUTTON_INDEX_PLTF = 4
Const BUTTON_INDEX_RBC = 5
Const BUTTON_INDEX_SH = 6
Const BUTTON_INDEX_CH = 7

Const BUTTON_KEY_VH = "V"
Const BUTTON_KEY_DIF = "DIFF"
Const BUTTON_KEY_PLT = "PLTH"
Const BUTTON_KEY_PLTF = "PLTF"
Const BUTTON_KEY_RBC = "RBCH"
Const BUTTON_KEY_SH = "S"
Const BUTTON_KEY_CH = "C"
Const BUTTON_KEY_SEPARATOR = "SEPARATOR"
Const BUTTON_KEY_EXIT = "EXIT"

Dim msMachineSample     As String
Dim msVisTestRowID      As String
Dim FormCaption         As String

Dim mButtonKey          As String

Dim InhibitOn           As Boolean
Dim FormActivatedOnce   As Boolean
Dim Translation As New clsTranslation '

Public Function VisTestScatterPlotTypeGet(TypeCodes As String, ByVal sVisTestRowID As String) As Boolean
    'Reference Table - MIF_MachineResultsScatterPlot
    Dim sReturnCode   As String
    Dim sBuffer       As String

    sReturnCode = mvbAccess("$$type^LVBVISTP(P0)", sBuffer, sVisTestRowID, "", "", "", "", "", "", "", "", "")

    Select Case sReturnCode
    Case "0"
        VisTestScatterPlotTypeGet = True
        TypeCodes = sBuffer
    Case "100"
        VisTestScatterPlotTypeGet = False
    End Select

End Function


Public Function MachineResultScatterPlotTypeGet(TypeCodes As String, ByVal MachineSpecimen As String) As Boolean
    'Reference Table - MIF_MachineResultsScatterPlot
    Dim sReturnCode   As String
    Dim sBuffer       As String

    sReturnCode = mvbAccess("$$type^LVBMIRS(P0)", sBuffer, MachineSpecimen, "", "", "", "", "", "", "", "", "")

    Select Case sReturnCode
    Case "0"
        MachineResultScatterPlotTypeGet = True
        TypeCodes = sBuffer
    Case "100"
        MachineResultScatterPlotTypeGet = False
    End Select

End Function

Public Function MachineResultScatterPlotDataGet(DataBuffer As String, ByVal MachineSpecimen As String, ByVal TypeCodes As String) As Boolean
    'Reference Table - MIF_MachineResultsScatterPlot
    Dim sReturnCode   As String

    sReturnCode = mvbAccess("$$getall^LVBMIRS(P0,P1)", DataBuffer, MachineSpecimen, TypeCodes, "", "", "", "", "", "", "", "")

    Select Case sReturnCode
    Case "0"
        MachineResultScatterPlotDataGet = True
    Case "100"
        MachineResultScatterPlotDataGet = False
    End Select

End Function

Public Function VisTestScatterPlotDataGet(DataBuffer As String, ByVal sVisTestRowID As String, ByVal TypeCodes As String) As Boolean
    'Reference Table - MIF_MachineResultsScatterPlot
    Dim sReturnCode   As String

    sReturnCode = mvbAccess("$$getall^LVBVISTP(P0,P1)", DataBuffer, sVisTestRowID, TypeCodes, "", "", "", "", "", "", "", "")

    Select Case sReturnCode
    Case "0"
        VisTestScatterPlotDataGet = True
    Case "100"
        VisTestScatterPlotDataGet = False
    End Select

End Function

Private Sub ScatterPlotHistogramButtonInit()
    Dim i          As Integer
    Dim sTypeCodes As String
    Dim bOK        As Boolean

    If msMachineSample <> "" Then
        bOK = MachineResultScatterPlotTypeGet(sTypeCodes, msMachineSample)
    ElseIf msVisTestRowID <> "" Then
        bOK = VisTestScatterPlotTypeGet(sTypeCodes, msVisTestRowID)
    Else
        Exit Sub
    End If
    If bOK Then
        toolBar.Buttons(BUTTON_INDEX_DIF).Enabled = (InStr(1, sTypeCodes, BUTTON_KEY_DIF) > 0)
        toolBar.Buttons(BUTTON_INDEX_VH).Enabled = (InStr(1, sTypeCodes, BUTTON_KEY_VH) > 0)
        toolBar.Buttons(BUTTON_INDEX_PLT).Enabled = (InStr(1, sTypeCodes, BUTTON_KEY_PLT) > 0)
        toolBar.Buttons(BUTTON_INDEX_PLTF).Enabled = (InStr(1, sTypeCodes, BUTTON_KEY_PLTF) > 0)
        toolBar.Buttons(BUTTON_INDEX_RBC).Enabled = (InStr(1, sTypeCodes, BUTTON_KEY_RBC) > 0)
        toolBar.Buttons(BUTTON_INDEX_SH).Enabled = (InStr(1, sTypeCodes, BUTTON_KEY_SH) > 0)
        toolBar.Buttons(BUTTON_INDEX_CH).Enabled = (InStr(1, sTypeCodes, BUTTON_KEY_CH) > 0)
    Else
        toolBar.Buttons(BUTTON_INDEX_VH).Enabled = False
        toolBar.Buttons(BUTTON_INDEX_DIF).Enabled = False
        toolBar.Buttons(BUTTON_INDEX_PLT).Enabled = False
        toolBar.Buttons(BUTTON_INDEX_PLTF).Enabled = False
        toolBar.Buttons(BUTTON_INDEX_RBC).Enabled = False
        toolBar.Buttons(BUTTON_INDEX_SH).Enabled = False
        toolBar.Buttons(BUTTON_INDEX_CH).Enabled = False
    End If

    'activate first available button
    For i = 1 To 7
        If toolBar.Buttons(i).Enabled Then
            InhibitOn = True
            toolBar.Buttons(i).Value = tbrPressed
            InhibitOn = False
            Screen.MousePointer = vbHourglass
            mButtonKey = toolBar.Buttons(i).Key
            ScatterPlotHistogramDataDisplay toolBar.Buttons(i).Key
            Screen.MousePointer = vbDefault
            Exit For
        End If
    Next
End Sub

Private Sub ScatterPlotHistogramDataDisplay(ByVal sKey As String)
    Dim sDataBuffer   As String
    Dim sReturnCode   As String
    Dim bOK           As Boolean
    Dim typeScatterPlot As Integer
    Dim typeHistogram As Integer

    picGraph.Cls

    If msMachineSample <> "" Then
        bOK = MachineResultScatterPlotDataGet(sDataBuffer, msMachineSample, sKey)
    ElseIf msVisTestRowID <> "" Then
        bOK = VisTestScatterPlotDataGet(sDataBuffer, msVisTestRowID, sKey)
    Else
        Exit Sub
    End If

    If bOK Then
        If Len(sDataBuffer) > 0 Then
            Select Case sKey
            Case BUTTON_KEY_DIF
                typeScatterPlot = GetScatterPlotType(sDataBuffer)
                Select Case typeScatterPlot
                Case 1
                    DisplayScatterPlotType1 sDataBuffer
                Case 2
                    DisplayScatterPlotType2 sDataBuffer
                Case 3
                    DisplayScatterPlotType3 sDataBuffer
                End Select
            Case BUTTON_KEY_VH, BUTTON_KEY_PLT, BUTTON_KEY_PLTF, BUTTON_KEY_RBC, BUTTON_KEY_SH, BUTTON_KEY_CH
                typeHistogram = GetHistogramType(sDataBuffer)
                Select Case typeHistogram
                Case 1
                     HistogramDataDisplay sDataBuffer
                Case 3
                     HistogramDataDisplayType3 sDataBuffer
                End Select
            End Select
        Else
            MsgBox "No Data to Display ..."
        End If
    End If
End Sub

Private Sub DisplayScatterPlotType1(ByVal InData As String)
    Dim eData      As New DATAEXTRACT
    Dim i          As Integer
    Dim j          As Integer
    Dim k          As Integer
    Dim v(1 To 5)  As Integer
    Dim SCALE_X    As Double
    Dim SCALE_Y    As Double
    Dim tmpVal     As String

    SCALE_X = CDbl((Me.ScaleWidth / 5000) * Screen.TwipsPerPixelX)
    SCALE_Y = CDbl((Me.ScaleHeight / 5000) * Screen.TwipsPerPixelY)

    eData.Init InData, DELIM_STD, 0

    For i = 1 To eData.MaxFields
        If i = 1 Then
            For j = 1 To 5
                v(j) = Val(mPiece((eData.Data(i)), "\", j))
            Next
            v(3) = 256 - v(3)
            v(4) = 256 - v(4)
            v(5) = 256 - v(5)
            v(1) = v(1) + 5
            v(2) = v(2) + 5

            picGraph.Line (5 * SCALE_X, v(5) * SCALE_Y)-(261 * SCALE_X, v(5) * SCALE_Y), QBColor(15)
            picGraph.Line (5 * SCALE_X, v(3) * SCALE_Y)-(v(1) * SCALE_X, v(3) * SCALE_Y), QBColor(15)
            picGraph.Line (v(1) * SCALE_X, v(4) * SCALE_Y)-(261 * SCALE_X, v(4) * SCALE_Y), QBColor(15)
            picGraph.Line (v(1) * SCALE_X, 0)-(v(1) * SCALE_X, v(5) * SCALE_Y), QBColor(15)
            picGraph.Line (v(2) * SCALE_X, 0)-(v(2) * SCALE_X, v(4) * SCALE_Y), QBColor(15)
        Else
            For j = 1 To Len(eData.Data(i))
                k = Asc(Mid$((eData.Data(i)), j, 1)) - 48
                If k > 9 Then
                    k = k - 6
                End If
                ' get colour
                If k = 1 Then
                    k = 9
                ElseIf k > 1 And k < 5 Then
                    k = 10
                ElseIf k > 4 And k < 11 Then
                    k = 12
                ElseIf k > 10 Then
                    k = 14
                End If

                If k > 0 Then
                    If k = 14 Then
                        picGraph.Line ((i * 4 - 2) * SCALE_X, (259 - j * 4) * SCALE_Y)-((i * 4) * SCALE_X, (257 - j * 4) * SCALE_Y), QBColor(14), BF
                    ElseIf k = 9 Then
                        picGraph.Line ((i * 4 - 2) * SCALE_X, (259 - j * 4) * SCALE_Y)-((i * 4) * SCALE_X, (257 - j * 4) * SCALE_Y), &H800000, BF
                    ElseIf k = 10 Then
                        picGraph.Line ((i * 4 - 2) * SCALE_X, (259 - j * 4) * SCALE_Y)-((i * 4) * SCALE_X, (257 - j * 4) * SCALE_Y), &H8000&, BF
                    ElseIf k = 12 Then
                        picGraph.Line ((i * 4 - 2) * SCALE_X, (259 - j * 4) * SCALE_Y)-((i * 4) * SCALE_X, (257 - j * 4) * SCALE_Y), &HC0&, BF
                    End If
                End If

            Next
        End If
    Next

    Set eData = Nothing
    
End Sub

Private Sub DisplayScatterPlotType2(ByVal InData As String)
    Dim eData       As New DATAEXTRACT
    Dim i           As Integer
    Dim j           As Integer
    Dim SCALE_X     As Double
    Dim SCALE_Y     As Double
    Dim sColor      As String
    Dim x1          As Long
    Dim y1          As Long
    Dim x2          As Long
    Dim y2          As Long

    SCALE_X = CDbl((Me.ScaleWidth / 5000) * Screen.TwipsPerPixelX)
    SCALE_Y = CDbl((Me.ScaleHeight / 5000) * Screen.TwipsPerPixelY)

    eData.Init InData, DELIM_STD, 0
    
    SCALE_X = CDbl(picGraph.Width / (eData.MaxFields - 1)) / 5
    SCALE_Y = CDbl(picGraph.Height / (Len(eData.Data(2)) / 2)) / 10

    For j = 2 To eData.MaxFields Step 1
        For i = 1 To Len(eData.Data(j)) Step 2
            sColor = Mid$(eData.Data(j), i, 2)
            
'            x1 = ((i * 4) - 2) * SCALE_X
'            y1 = (259 - (j * 4)) * SCALE_Y
'            x2 = (i * 4) * SCALE_X
'            y2 = (257 - (j * 4)) * SCALE_Y
            
            y1 = ((j * 4) - 2) * SCALE_X
            x1 = ((i * 4) - 2) * SCALE_Y
            y2 = ((j * 4)) * SCALE_X
            x2 = ((i * 4)) * SCALE_Y
            
            picGraph.Line (x1, y1)-(x2, y2), GetColor(sColor), BF
        Next i
    Next j

    Set eData = Nothing
    
End Sub


Private Sub DisplayScatterPlotType3(ByVal InData As String)
'               v(2) v(4)     v(3)     v(11) v(5)
'       ------------------------------------------------------
'       |                      |                             |
'       |                      |                             |
'       |                      |                             |
'       |                      |                             |
'       |                      |                             |
'       |         -------------------------------------------- v(15)
'       |         |   |                               |      |
'       |         |   |                               |      |
'       |         |   |                               |      |
'       |         |   |                               |      |
'       |         |   |                    *-------------    | v(16)
'       |         |   |                  *              |    |
' v(14) |      ------------------------*----            |    |
'       |      |   |                    |   *           |    |
'       |      |   |                    |    *          |    |
'       |      |   |                    |     *         |    |
'       |      |   |                    |      *        |    |
'       ----------------------------------------*------------
'             v(1)v(7)                v(8)v(9)  v(10)   v(13)
    Dim eData      As New DATAEXTRACT
    Dim i          As Integer
    Dim j          As Integer
    Dim k          As Integer
    Dim m          As Integer
    Dim v(1 To 16)  As Integer
    Dim SCALE_X    As Double
    Dim SCALE_Y    As Double
    Dim x1         As Long
    Dim y1         As Long
    Dim x2         As Long
    Dim y2         As Long
    Dim marginX    As Integer
    Dim marginY    As Integer
    Dim pointsX    As Integer
    Dim pointsY    As Integer
    'for other lines y=kx+b
    Dim k1         As Long
    Dim k2         As Long
    Dim b1         As Long
    Dim b2         As Long
    '
    Dim colorNum   As Integer
    Dim color      As ColorConstants
    Dim bitStr         As String
    Dim bit         As String
          
    'SCALE_X = CDbl((Me.ScaleWidth / 5000) * Screen.TwipsPerPixelX)
    'SCALE_Y = CDbl((Me.ScaleHeight / 5000) * Screen.TwipsPerPixelY)
    
    eData.Init InData, DELIM_STD, 0
    
    marginX = 1
    marginY = 1
    pointsX = eData.MaxFields - 1 '128 - strings
    pointsY = Len(eData.Data(2)) * 4 '32 (transfer to 128)
    SCALE_X = CDbl(picGraph.Width / (pointsX + (marginX * 2)) / 1.1)
    SCALE_Y = CDbl(picGraph.Height / (pointsY + (marginY * 2)) / 1.1)
    
    For j = 1 To eData.MaxFields
        i = 0
        If j = 1 Then
            For k = 1 To 16
                v(k) = Val(mPiece((eData.Data(j)), "\", k))
            Next
            v(12) = v(10)
            For k = 14 To 16
               v(k) = 128 - v(k)
            Next
                        
            k1 = ((v(16) - v(14)) * SCALE_Y) / ((v(12) - v(11)) * SCALE_X)
            b1 = ((v(14) + marginY) * SCALE_Y) - (k1 * (v(11) + marginX) * SCALE_X)
            
            k2 = ((pointsY - v(14)) * SCALE_Y) / ((v(10) - v(9)) * SCALE_X)
            b2 = ((v(14) + marginY) * SCALE_Y) - (k2 * (v(9) + marginX) * SCALE_X)
            
            'y1 = k1 * (v(11) + marginX) * SCALE_X + b1
            'MsgBox "f=" + Str(y1) + " v14=" + Str((v(14) + marginX) * SCALE_X)
           
        Else
            For k = 1 To Len(eData.Data(j))
              bitStr = Mid$((eData.Data(j)), k, 1)
              bitStr = HexToBit(bitStr)
              If (Len(bitStr) > 0) Then
                For m = 1 To Len(bitStr)
                    bit = Mid$(bitStr, m, 1)
                    i = i + 1
                    'coordinates
                    x1 = (i - 0.7 + marginX) * SCALE_X
                    y1 = (j - 0.7 + marginY) * SCALE_Y
                    x2 = (i + marginX) * SCALE_X
                    y2 = (j + marginY) * SCALE_Y
                    'color
                    colorNum = 6 'black
                    'red
                    If (i >= v(3)) And (i <= pointsX) And (j > 0) And (j < v(15)) Then
                       colorNum = 1
                    End If
                    'green
                    If (i >= v(2)) And (i <= v(11)) And (j >= v(15)) And (j <= v(14)) Then
                       colorNum = 2
                    End If
                    If (i >= v(12)) And (i <= v(5)) And (j >= v(15)) And (j <= v(16)) Then
                       colorNum = 2
                    End If
                    If (i >= v(11)) And (i <= v(12)) And (j >= v(15)) And (y2 <= (k1 * x2 + b1)) Then
                       colorNum = 2
                    End If
                    'blue
                    If (i >= v(1)) And (i <= v(8)) And (j >= v(14)) And (j <= pointsY) Then
                       colorNum = 3
                    End If
                    'yellow
                    If (i >= v(11)) And (i <= v(9)) And (y2 >= (k1 * x2 + b1)) And (j <= v(14)) Then
                       colorNum = 4
                    End If
                    If (i >= v(9)) And (i <= v(10)) And (y2 >= (k1 * x2 + b1)) And (y2 <= (k2 * x2 + b2)) Then
                       colorNum = 4
                    End If
                    If (i >= v(10)) And (i <= v(13)) And (j >= v(16)) And (j <= pointsY) Then
                       colorNum = 4
                    End If
                    'blue light - cyan
                    If (i >= v(8)) And (i <= v(9)) And (j >= v(14)) And (j <= pointsY) Then
                       colorNum = 5
                    End If
                    If (i >= v(9)) And (i <= v(10)) And (y2 > (k2 * x2 + b2)) And (j <= pointsY) Then
                       colorNum = 5
                    End If
                     
                    Select Case colorNum
                      Case 1
                         color = vbRed 'Val("&HFF0000")
                      Case 2
                         color = vbGreen 'Val("&H00FF00")
                      Case 3
                         color = vbBlue 'Val("&H0000FF")
                      Case 4
                         color = vbYellow 'Val("&HC0C0C0")
                      Case 5
                         color = vbCyan
                      Case 6
                         color = vbWhite
                    End Select
                                        
                    If bit = "0" Then
                       color = vbBlack '"&H000000"
                    End If
                                        
                    picGraph.Line (x1, y1)-(x2, y2), color, BF
                  
                Next 'i
             End If
            Next 'k
        End If
    Next 'j
    If i > 0 Then
            'horisontal lines
            picGraph.Line ((v(1) + marginX) * SCALE_X, (v(14) + marginY) * SCALE_Y)-((v(9) + marginX) * SCALE_X, (v(14) + marginY) * SCALE_Y), QBColor(15)
            picGraph.Line ((v(2) + marginX) * SCALE_X, (v(15) + marginY) * SCALE_Y)-((pointsX + marginX) * SCALE_X, (v(15) + marginY) * SCALE_Y), QBColor(15)
            picGraph.Line ((v(12) + marginX) * SCALE_X, (v(16) + marginY) * SCALE_Y)-((pointsX + marginX) * SCALE_X, (v(16) + marginY) * SCALE_Y), QBColor(15)
            'vertical lines
            picGraph.Line ((v(1) + marginX) * SCALE_X, (v(14) + marginY) * SCALE_Y)-((v(1) + marginX) * SCALE_X, (pointsY + marginY) * SCALE_Y), QBColor(15)
            picGraph.Line ((v(2) + marginX) * SCALE_X, (v(15) + marginY) * SCALE_Y)-((v(2) + marginX) * SCALE_X, (v(14) + marginY) * SCALE_Y), QBColor(15)
            picGraph.Line ((v(3) + marginX) * SCALE_X, (0 + marginY) * SCALE_Y)-((v(3) + marginX) * SCALE_X, (v(15) + marginY) * SCALE_Y), QBColor(15)
            picGraph.Line ((v(5) + marginX) * SCALE_X, (v(15) + marginY) * SCALE_Y)-((v(5) + marginX) * SCALE_X, (v(16) + marginY) * SCALE_Y), QBColor(15)
            picGraph.Line ((v(13) + marginX) * SCALE_X, (v(16) + marginY) * SCALE_Y)-((v(13) + marginX) * SCALE_X, (pointsY + marginY) * SCALE_Y), QBColor(15)
            picGraph.Line ((pointsX + marginX) * SCALE_X, (0 + marginY) * SCALE_Y)-((pointsX + marginX) * SCALE_X, (pointsY + marginY) * SCALE_Y), QBColor(15)
            'other lines
            picGraph.Line ((v(11) + marginX) * SCALE_X, (v(14) + marginY) * SCALE_Y)-((v(12) + marginX) * SCALE_X, (v(16) + marginY) * SCALE_Y), QBColor(15)
            picGraph.Line ((v(9) + marginX) * SCALE_X, (v(14) + marginY) * SCALE_Y)-((v(10) + marginX) * SCALE_X, (pointsY + marginY) * SCALE_Y), QBColor(15)
            'dashed lines
            drawDashedVerticalLine (v(7) + marginX) * SCALE_X, (v(14) + marginY) * SCALE_Y, (pointsY + marginY) * SCALE_Y
            drawDashedVerticalLine (v(4) + marginX) * SCALE_X, (v(15) + marginY) * SCALE_Y, (v(14) + marginY) * SCALE_Y
            drawDashedVerticalLine (v(8) + marginX) * SCALE_X, (v(14) + marginY) * SCALE_Y, (pointsY + marginY) * SCALE_Y
    End If
    Set eData = Nothing
    
End Sub

Private Function HexToBit(ByVal InData As String) As String
    HexToBit = ""
    Select Case InData
      Case "0"
         HexToBit = "0000"
      Case "1"
         HexToBit = "0001"
      Case "2"
         HexToBit = "0010"
      Case "3"
         HexToBit = "0011"
      Case "4"
         HexToBit = "0100"
      Case "5"
         HexToBit = "0101"
      Case "6"
         HexToBit = "0110"
      Case "7"
         HexToBit = "0111"
      Case "8"
         HexToBit = "1000"
      Case "9"
         HexToBit = "1001"
      Case "A"
         HexToBit = "1010"
      Case "B"
         HexToBit = "1011"
      Case "C"
         HexToBit = "1100"
      Case "D"
         HexToBit = "1101"
      Case "E"
         HexToBit = "1110"
      Case "F"
         HexToBit = "1111"
   End Select

End Function


Private Sub drawDashedVerticalLine(ByVal x As Long, ByVal y1 As Long, ByVal y2 As Long)
Dim widthDash As Long
widthDash = (y2 - y1) / 10
'MsgBox "y1=" + Str(y1) + " y2=" + Str(y2) + " widthDash=" + Str(widthDash) + " y1 + (3 * widthDash)=" + Str(y1 + (3 * widthDash))
If (widthDash > 1) Then
    picGraph.Line (x, y1)-(x, y1 + widthDash), QBColor(15) 'first dash
    picGraph.Line (x, y1 + (1.5 * widthDash))-(x, y1 + (2.5 * widthDash)), QBColor(15) 'second dash
    picGraph.Line (x, y1 + (3 * widthDash))-(x, y1 + (4 * widthDash)), QBColor(15) '3 dash
    picGraph.Line (x, y1 + (4.5 * widthDash))-(x, y1 + (5.5 * widthDash)), QBColor(15) '4 dash
    picGraph.Line (x, y1 + (6 * widthDash))-(x, y1 + (7 * widthDash)), QBColor(15)
    picGraph.Line (x, y1 + (7.5 * widthDash))-(x, y1 + (8.5 * widthDash)), QBColor(15)
    picGraph.Line (x, y1 + (9 * widthDash))-(x, y2), QBColor(15)
End If
   
End Sub

Private Sub HistogramDataDisplay(ByVal InData As String)
    Dim eData      As New DATAEXTRACT
    Dim i          As Integer
    Dim j          As Integer
    Dim k          As Integer
    Dim l          As Integer
    Dim v(1 To 5)  As Integer
    Dim SCALE_X    As Integer
    Dim SCALE_Y    As Integer
    Dim tmpVal     As String
    Dim iBlack     As Integer

    SCALE_X = CInt((Me.ScaleWidth / 5000) * Screen.TwipsPerPixelX)
    SCALE_Y = CInt((Me.ScaleHeight / 5000) * Screen.TwipsPerPixelY)

    picGraph.Line (5, 0)-(5, picGraph.ScaleHeight), QBColor(15)
    picGraph.Line (5, picGraph.ScaleHeight - 5)-(picGraph.ScaleWidth, picGraph.ScaleHeight - 5), QBColor(15)

    eData.Init InData, DELIM_STD, 0

    For i = 1 To eData.MaxFields Step 1
        For j = 1 To Len(eData.Data(i)) Step 2
            'convert hex to dec
            k = Asc(Mid$((eData.Data(i)), j, 1)) - 48
            If k > 10 Then
                k = k - 7
            End If
            l = Asc(Mid$((eData.Data(i)), j + 1, 1)) - 48
            If l > 10 Then
                l = l - 7
            End If
            k = 256 - (k * 16 + l) * 1.5
            If k > 0 Then
                If iBlack = 0 Then
                    picGraph.Line -((i * 32 + (j + 1) / 2 + 5) * SCALE_X, k * SCALE_Y), vbBlack
                    iBlack = 1
                Else
                    picGraph.Line -((i * 32 + (j + 1) / 2 + 5) * SCALE_X, k * SCALE_Y), QBColor(15)
                End If
            End If
        Next j
    Next i

End Sub
'for analisators: pentra 60, micros 60 (type=3)
Private Sub HistogramDataDisplayType3(ByVal InData As String)
    Dim eData      As New DATAEXTRACT
    Dim i          As Integer
    Dim j          As Integer
    Dim k          As Integer
    Dim l          As Integer
    Dim v(1 To 5)  As Double
    Dim SCALE_X    As Double
    Dim SCALE_Y    As Double
    Dim tmpVal     As String
    Dim iBlack     As Integer
    Dim maxX       As Integer
    Dim maxY       As Integer
    Dim marginX    As Integer
    Dim marginY    As Integer
    Dim x          As Integer
    Dim xpred      As Double
    Dim ypred      As Double
    Dim xcurr      As Double
    Dim ycurr      As Double
    Dim s  As String
               
    eData.Init InData, DELIM_STD, 0
 
    ' find maxX,maxY
    maxX = 0
    maxY = 0
    For i = 1 To eData.MaxFields Step 1
        'threasholds
        If (i = 1) And (eData.MaxFields > 1) Then
           tmpVal = eData.Data(i)
           For k = 3 To 7
                v(k - 2) = Val(mPiece(tmpVal, "\", k))
           Next
        Else
          tmpVal = eData.Data(i)
          For j = 1 To Len(tmpVal) Step 2
              k = Asc(Mid$(tmpVal, j, 1)) - 48
              l = Asc(Mid$(tmpVal, j + 1, 1)) - 48
              'convert hex to dec
              If k > 10 Then
                 k = k - 7
              End If
              If l > 10 Then
                 l = l - 7
              End If
              k = k * 16 + l
              If k > maxY Then
                 maxY = k
              End If
              maxX = maxX + 1
          Next
        End If
    Next i
    'MsgBox "maxX=" + Str(maxX) + " maxY=" + Str(maxY)
    xpred = 0
    ypred = (maxY + marginY) * SCALE_Y
    If (maxX > 0) And (maxY > 0) Then
       'scale X Y
       marginX = 0
       marginY = 0
       SCALE_X = CDbl(picGraph.ScaleWidth / (maxX + (marginX * 2)))
       SCALE_Y = CDbl(picGraph.ScaleHeight / (maxY + (marginY * 2)) / 1.2)
       ' MsgBox "SCALE_X=" + Str(SCALE_X) + " SCALE_Y=" + Str(SCALE_Y) + " maxX=" + Str(maxX) + " maxY=" + Str(maxY)
       
       'histogram
       x = 0
       iBlack = 0
       For i = 2 To eData.MaxFields Step 1
        tmpVal = eData.Data(i)
        For j = 1 To Len(tmpVal) Step 2
            k = Asc(Mid$(tmpVal, j, 1)) - 48
            l = Asc(Mid$(tmpVal, j + 1, 1)) - 48
            'convert hex to dec
            If k > 10 Then
                k = k - 7
            End If
            If l > 10 Then
                l = l - 7
            End If
            k = maxY - (k * 16 + l)
            x = x + 1
            If k > 0 Then
                If iBlack = 0 Then
                    picGraph.Line -((x + marginX) * SCALE_X, (k + marginY) * SCALE_Y), vbBlack
                    iBlack = 1
                Else
                    picGraph.Line -((x + marginX) * SCALE_X, (k + marginY) * SCALE_Y), QBColor(15)
                End If
            End If
        Next j
       Next i
       
       'recount threasholds v(1)-v(5) and draw threasholds
       For k = 1 To 5
          If v(k) > 0 Then
             v(k) = 128 * v(k) / maxX
             drawDashedVerticalLine (v(k) + marginX) * SCALE_X, marginY * SCALE_Y, (maxY + marginY) * SCALE_Y
             'picGraph.Line ((v(k) + marginX) * SCALE_X, marginY * SCALE_Y)-((v(k) + marginX) * SCALE_X, (maxY + marginY) * SCALE_Y), QBColor(15)
          End If
       Next
        
       'axes
       picGraph.Line (marginX * SCALE_X, marginY * SCALE_Y)-(marginX * SCALE_X, (maxY + marginY) * SCALE_Y), QBColor(15)
       picGraph.Line (marginX * SCALE_X, (maxY + marginY) * SCALE_Y)-((maxX + marginX) * SCALE_X, (maxY + marginY) * SCALE_Y), QBColor(15)
    
    End If
End Sub

Private Sub Form_Activate()
    If Not FormActivatedOnce Then
    
        DoEvents
        
        If Not ComponentInitialise(gMenuOptions, App, Command) Then
            Unload Me
            Exit Sub
        End If

        DoEvents

        ApplicationLoad Me, App.EXEName

        Me.Caption = gAppDescr
        ' This MUST stay here, and form SHOULD have design time property ClipControls=False
        FormActivatedOnce = True

        'Enable/Disable menu options and load translated captions
        Call Translation.trnLoad_Trans(Me, FORM_FILE, gMenuOptions)
        FormCaption = Me.Caption
        'The rest of the 'Form_Load" code should go in here

        msMachineSample = mPiece(Command, DELIM_STD, 7)
        msVisTestRowID = mPiece(Command, DELIM_STD, 10)

        If Len(msMachineSample) = 0 And Len(msVisTestRowID) = 0 Then
            Unload Me
            Exit Sub
        End If

        'Do near the end of Form_Activate
        LabUserLogIn

        picGraph.Cls

        Me.Caption = FormCaption & " (" & mPiece(msMachineSample, "||", 1) & " - " & mPiece(msMachineSample, "||", 2) & ")"
        ScatterPlotHistogramButtonInit
    End If

End Sub

Private Sub Form_LinkExecute(CmdStr As String, Cancel As Integer)
    Dim tmpVal  As String
    Dim tmpVTRowID   As String
    Dim i       As Integer

    If CmdStr <> "" Then
        tmpVal = mPiece(CmdStr, DELIM_STD, 1)
        tmpVTRowID = mPiece(CmdStr, DELIM_STD, 4)

        If Len(tmpVal) > 0 Or Len(tmpVTRowID) > 0 Then
            If UCase$(tmpVal) = "CLOSE" Then
                Unload Me
                Exit Sub
            Else
                If Me.WindowState = vbMinimized Then
                    Me.WindowState = vbNormal
                End If
                Me.ZOrder

                msMachineSample = tmpVal
                msVisTestRowID = tmpVTRowID

                picGraph.Cls

                InhibitOn = True
                For i = 1 To 7
                    toolBar.Buttons(i).Value = tbrUnpressed
                Next
                InhibitOn = False
                Me.Caption = FormCaption & " (" & mPiece(msMachineSample, "||", 1) & " - " & mPiece(msMachineSample, "||", 2) & ")"
                ScatterPlotHistogramButtonInit
            End If
        End If
    End If
End Sub

Private Sub Form_Load()
    Me.Height = 5745
    'Align a form
    ApplicationJustify Me
    'Perform standard form load code
    ApplicationLoad Me, App.EXEName
    'Initialise flag used in form activate
    FormActivatedOnce = False

    ' All other 'form_load' code MUST go in 'Form_Activate" event

End Sub

Private Sub Form_Resize()
    On Error Resume Next
    If Me.WindowState = vbNormal Then
        If Me.Width < 5115 Then
            Me.Width = 5115
        End If
        If Me.Height < (5115 + toolBar.Height) Then
            Me.Height = (5115 + toolBar.Height)
        End If
    End If
    If Me.WindowState = vbNormal Or Me.WindowState = vbMaximized Then
        picGraph.Left = 0
        picGraph.Width = Me.Width
        picGraph.Top = toolBar.Top + toolBar.Height
        picGraph.Height = Me.Height - picGraph.Top

        Screen.MousePointer = vbHourglass
        picGraph.Cls
        DoEvents
        ScatterPlotHistogramDataDisplay mButtonKey
        Screen.MousePointer = vbDefault

    End If

End Sub

Private Sub Form_Unload(Cancel As Integer)
    'Unload frmMVB
    LabUserLogOut
End Sub

Private Sub mnuHelpAbout_Click()
    ' Show About form
    AboutShow
End Sub

Private Sub mnuHelpContents_Click()
    ' Display MedTrak Help
    HelpGet Me.hWnd, HELP_INDEX, App.EXEName
End Sub

Private Sub mnuHelpOnHelp_Click()
    ' Display help on help form
    HelpGet Me.hWnd, HELP_HELPONHELP, App.EXEName
End Sub

Private Sub mnuShowCaption_Click()
    Dim i As Integer
    mnuShowCaption.Checked = Not mnuShowCaption.Checked

    If mnuShowCaption.Checked Then
        For i = 1 To 7
            toolBar.Buttons(i).Caption = toolBar.Buttons(i).Description
        Next
    Else
        For i = 1 To 7
            toolBar.Buttons(i).Caption = ""
        Next
    End If
    If Me.WindowState = vbNormal Then
        If mnuShowCaption.Checked Then
            If Me.Width < 10560 Then
                Me.Width = 10560
            End If
            If Me.Height < 8000 Then
                Me.Height = 8000
            End If
        Else
            Me.Width = 8115
            DoEvents
            Me.Height = 7260
            DoEvents
        End If
        Me.Left = (Screen.Width / 2) - (Me.Width / 2)
        Me.Top = (Screen.Height / 2) - (Me.Height / 2)
    End If

    Screen.MousePointer = vbHourglass
    picGraph.Cls
    DoEvents
    ScatterPlotHistogramDataDisplay mButtonKey
    Screen.MousePointer = vbDefault

End Sub

Private Sub mnuTrans_Click()
    ' Allow user to maintain caption translations
    Call Translation.trnSet_Trans(Me, FORM_FILE)
End Sub

Private Sub toolBar_ButtonClick(ByVal Button As ComctlLib.Button)
    Dim i As Integer
    If Button.Key = BUTTON_KEY_EXIT Then
        Unload Me
        Exit Sub
    Else
        If Not InhibitOn Then
            If Button.Value = tbrPressed Then
                For i = 1 To 7
                    If toolBar.Buttons(i).Value = tbrPressed Then
                        If toolBar.Buttons(i).Key <> Button.Key Then
                            InhibitOn = True
                            toolBar.Buttons(i).Value = tbrUnpressed
                            InhibitOn = False
                        End If
                    End If
                Next
                Screen.MousePointer = vbHourglass
                mButtonKey = Button.Key
                ScatterPlotHistogramDataDisplay Button.Key
                Screen.MousePointer = vbDefault
            Else
                picGraph.Cls
            End If
        End If
    End If
End Sub



Private Function IsScatterPlotType2(ByVal InData As String) As Boolean

    Dim cData   As New DATAEXTRACT
    

    cData.Init InData, DELIM_STD, 0
    IsScatterPlotType2 = (mPiece(cData.Data(1), "\", 6) = "2")
    
    Set cData = Nothing

End Function
' get type of Scatter Plot
Private Function GetScatterPlotType(ByVal InData As String) As Integer

    Dim cData   As New DATAEXTRACT
    Dim typeScatterPlot As String

    cData.Init InData, DELIM_STD, 0
    
    typeScatterPlot = mPiece(cData.Data(1), "\", 6)
    GetScatterPlotType = 1
    If (typeScatterPlot = "2") Then GetScatterPlotType = 2
    If (typeScatterPlot = "3") Then GetScatterPlotType = 3
    
    Set cData = Nothing

End Function
' get type of histogram
'type=2 for analisators: pentra 60, micros 60
Private Function GetHistogramType(ByVal InData As String) As Integer

    Dim cData   As New DATAEXTRACT
    Dim typeHistogram As String

    cData.Init InData, DELIM_STD, 0
    
    GetHistogramType = 1
    
    If cData.MaxFields > 1 Then
        typeHistogram = mPiece(cData.Data(1), "\", 2)
        If typeHistogram = "3" Then
           GetHistogramType = 3
        End If
    End If
    
    Set cData = Nothing

End Function

Private Function GetColor(ByVal sColor As String) As Long

    Select Case sColor
    
        Case "00"
            GetColor = vbBlack 'Black
        Case "01"
            GetColor = vbWhite
        Case "02"
            GetColor = vbWhite
        Case "03"
            GetColor = vbWhite
        Case "04"
            GetColor = vbWhite
        Case "08"
            GetColor = vbWhite 'White
        Case "10"
            GetColor = vbYellow     'Yellow
        Case "11"
            GetColor = vbYellow     'Yellow
        Case "15"
            GetColor = vbBlack
        Case "16"
            GetColor = vbBlack
        Case "17"
            GetColor = vbRed        'Red
        Case "18"
            GetColor = vbRed        'Red
        Case "19"
            GetColor = vbRed        'Red
        Case "20"
            GetColor = &H808000     'Teal
        Case "21"
            GetColor = &H808000     'Teal
        Case "22"
            GetColor = &H8000&      'Medium Green
        Case "23"
            GetColor = &HC000&      'Light Green
        Case "24"
            GetColor = &HC000&      'Light Green
        Case "25"
            GetColor = &HC000&      'Light Green
        Case "29"
            GetColor = &HC00000     'Light Blue
        Case "1A"
            GetColor = vbRed        'Red
        Case "1B"
            GetColor = vbRed        'Red
        Case "1C"
            GetColor = vbRed        'Red
        Case "1D"
            GetColor = vbRed        'Red
        Case "1F"
            GetColor = vbBlack
        Case "0B"
            GetColor = vbYellow     'Yellow
        Case "0C"
            GetColor = vbYellow     'Yellow
        Case "0D"
            GetColor = vbYellow     'Yellow
        Case "0E"
            GetColor = vbYellow     'Yellow
        Case "0F"
            GetColor = vbYellow     'Yellow
        Case "2A"
            GetColor = &HC00000     'Light Blue
        Case "2B"
            GetColor = &HC00000     'Light Blue
        Case "2C"
            GetColor = &HC00000     'Light Blue
        Case "2D"
            GetColor = &HC00000     'Light Blue
        Case "2E"
            GetColor = &HC00000     'Light Blue
        Case "2F"
            GetColor = &HC00000     'Light Blue
        Case "30"
            GetColor = &HC00000     'Light Blue
        Case "33"
            GetColor = vbRed
        Case "34"
            GetColor = vbWhite
        Case Else
            GetColor = vbRed
    End Select


'    Select Case sColor
'
'        Case "000000"
'            GetColor = vbBlack
'        Case "FFFFFF"
'            GetColor = vbWhite
'        Case "606060"
'            GetColor = &H404040 'Dark Grey
'        Case "FF0000"
'            GetColor = vbRed 'Red
'        Case "FFFF00"
'            GetColor = vbYellow 'Yellow
'        Case "FF00FF"
'            GetColor = &HC000C0 'Light Purple
'        Case "800080"
'            GetColor = &H800080 'Dark Purple
'        Case "00FFFF"
'            GetColor = vbCyan 'Cyan
'        Case "00FF00"
'            GetColor = &HFF00& 'Light Green
'        Case "008000"
'            GetColor = &H8000& 'Dark Green
'        Case "0000FF"
'            GetColor = &HFF0000 'Light Blue
'        Case "000080"
'            GetColor = &H800000 'Dark Blue
'        Case "800000"
'            GetColor = &H80& 'Maroon
'        Case "808080"
'            GetColor = &H808080 'Medium Grey
'    End Select
    
End Function


