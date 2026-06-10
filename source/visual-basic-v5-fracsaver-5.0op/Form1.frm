VERSION 5.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   10515
   ClientLeft      =   4635
   ClientTop       =   2385
   ClientWidth     =   10845
   FillStyle       =   0  'Solid
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   12
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H00FFFFFF&
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MousePointer    =   99  'Custom
   ScaleHeight     =   10515
   ScaleWidth      =   10845
   ShowInTaskbar   =   0   'False
   Begin VB.Image Image5 
      Height          =   4920
      Left            =   4200
      Picture         =   "Form1.frx":030A
      Top             =   4440
      Visible         =   0   'False
      Width           =   4875
   End
   Begin VB.Image Image4 
      Height          =   2850
      Left            =   8160
      Picture         =   "Form1.frx":4E5CC
      Top             =   0
      Visible         =   0   'False
      Width           =   3780
   End
   Begin VB.Image Image1 
      Height          =   720
      Left            =   0
      Picture         =   "Form1.frx":71726
      Top             =   0
      Visible         =   0   'False
      Width           =   720
   End
   Begin VB.Image Image2 
      Height          =   720
      Left            =   120
      Picture         =   "Form1.frx":73268
      Top             =   720
      Visible         =   0   'False
      Width           =   720
   End
   Begin VB.Image Image3 
      Height          =   720
      Left            =   240
      Picture         =   "Form1.frx":74DAA
      Top             =   1440
      Visible         =   0   'False
      Width           =   720
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'3158 lines of code
Private Sub Form_Click()
escape = True
'log "MouseClick detected"
End
End Sub
Private Sub Form_DblClick()
escape = True
'log "DoubleClick Detected"
End
End Sub
Private Sub Form_KeyPress(KeyAscii As Integer)
escape = True
'log "KeyPress Detected"
End
End Sub
Public Sub Form_Load()

'''log "system detect and run at "
'''log "Command line " + Command$
Randomize Timer
If App.PrevInstance Then End
a = LEFT$(UCase$(Command$), 2)
If a = "/P" Then End
If a = "/C" Then
    Form1.Hide
    Form3.Hide
    Form2.Show
    Exit Sub
End If
RunMode = 0

'Kill GetWinDir + "\FracSaver.INI"
Form1.Hide
Form3.Hide
'Form2.Show
'Exit Sub
STARTUP = True
Me.LEFT = 0
Me.Top = 0
Me.Height = Screen.Height
Me.Width = Screen.Width
Form3.Show
Form3.LEFT = 0
Form3.Top = 0
Form3.Height = Screen.Height
Form3.Width = Screen.Width
Form1.Show
Call SetCursorPos(Screen.Width, Screen.Height)
DoEvents
Form1.Show
''log "Init Successful..."
Main
End Sub
Private Sub Timer1_Timer()
Timer1.Enabled = False
DoEvents
Form1.Show
DoEvents
Main
End Sub
Sub Main()

'log "Main"
On Error GoTo bimp
GoTo kip
bimp:
'log "Damned be the gods! An error occured! " + Err.Description + " Code: " + Str$(Err.Number)
MsgBox "An error occured. In all probability the 'fracsaver.ini' file is missing:  run the config box which creates the setup file. Error description: " + Err.Description + " Code: " + Str$(Err.Number)
End
kip:
Dim ListOfModules(60, 5)
'log "Opening INI File"
Open GetWinDir + "\FracSaver.INI" For Input As #1
Do While Not EOF(1)
    For i = 0 To 60
        For y = 0 To 5
            If EOF(1) Then Exit Do
            Input #1, a
            ListOfModules(i, y) = a
        Next y
    Next i
Loop
Close #1
'log "Closeing INI File"
ListOfModules(i, 0) = "-1"
MaxFrac = i - 1
Close #1
Do
    If escape Then
        'log "Escape sequence detected"
        End
    End If
    a = Int(Rnd(1) * i)
    'log "Module Number: " + Str$(a)
    'log "Which equates to module / " + ListOfModules(a, 0) + " / with parameters: " + ListOfModules(a, 1) + ListOfModules(a, 2) + ListOfModules(a, 3) + ListOfModules(a, 4) + ListOfModules(a, 5)
    If ListOfModules(a, 0) = "Lorentz" Then
        message "Lorenz Attractor"
        Lorentz (Val(ListOfModules(a, 1)))
    ElseIf ListOfModules(a, 0) = "ross" Then
        message "Rossler Attractor"
        Ross (Val(ListOfModules(a, 1)))
    ElseIf ListOfModules(a, 0) = "Bird" Then
        message "Bird"
        Bird
        Pause
    ElseIf ListOfModules(a, 0) = "Binary" Then
        message "Binary"
        Binary
    ElseIf ListOfModules(a, 0) = "Dendritic" Then
        message "Dendritic"
        Dendritic
        Pause
    ElseIf ListOfModules(a, 0) = "Feigenbaum" Then
        message "Feigenbaum"
        Feigenbaum
        Pause
    ElseIf ListOfModules(a, 0) = "Henon" Then
        message "Henon Attractor"
        Henon (Val(ListOfModules(a, 1)))
    ElseIf ListOfModules(a, 0) = "Organic" Then
        message "Organic"
        Organic (Val(ListOfModules(a, 1)))
    ElseIf ListOfModules(a, 0) = "pascal" Then
        message "Pascals Triangle"
        PascalsTriangle
    ElseIf ListOfModules(a, 0) = "cantor" Then
        message "Cantor bars"
        CantorBars
        Pause
    ElseIf ListOfModules(a, 0) = "carpet" Then
        message "Carpet"
        carpet
    ElseIf ListOfModules(a, 0) = "circ" Then
        message "Circles"
        CircFrac
        Pause
    ElseIf ListOfModules(a, 0) = "coast" Then
        message "Coast"
        Coast
    ElseIf ListOfModules(a, 0) = "fern" Then
        message "Fern"
        fern (Val(ListOfModules(a, 1)))
    ElseIf ListOfModules(a, 0) = "gasket5" Then
        message "Pentagon Gasket"
        Gasket5 (Val(ListOfModules(a, 1)))
    ElseIf ListOfModules(a, 0) = "Julia" Then
        message "Julia set by inverse iteration"
        Julia (Val(ListOfModules(a, 1)))
    ElseIf ListOfModules(a, 0) = "Koch" Then
        message "Koch curve"
        KochCurve (Val(ListOfModules(a, 1)))
        Pause
    ElseIf ListOfModules(a, 0) = "mset" Then
        message "Mandelbrot set"
        Call Mandel(Val(ListOfModules(a, 1)), Val(ListOfModules(a, 2)), Val(ListOfModules(a, 3)), Val(ListOfModules(a, 4)))
    ElseIf ListOfModules(a, 0) = "gasket3" Then
        message "Sierpinski gasket"
        SierpinskyGasket (Val(ListOfModules(a, 1)))
        Pause
    ElseIf ListOfModules(a, 0) = "snow4" Then
        message "Snowflake 4"
        SnowFlake4 (Val(ListOfModules(a, 1)))
    ElseIf ListOfModules(a, 0) = "snow5" Then
        message "Snowflake 5"
        SnowFlake5 (Val(ListOfModules(a, 1)))
    ElseIf ListOfModules(a, 0) = "snow6" Then
        message "Snowflake 6"
        SnowFlake6 (Val(ListOfModules(a, 1)))
    ElseIf ListOfModules(a, 0) = "square" Then
        message "SquareFrac"
        SquareFrac (Val(ListOfModules(a, 1)))
    ElseIf ListOfModules(a, 0) = "tree" Then
        message "Tree"
        Tree (Val(ListOfModules(a, 1)))
    ElseIf ListOfModules(a, 0) = "majority" Then
        message "Majority rule"
        Call OneIn8(Val(ListOfModules(a, 1)), Val(ListOfModules(a, 2)))
    ElseIf ListOfModules(a, 0) = "1in8" Then
        message "2-D CA 1 in 8 rule"
        Call OneIn8Pageflip(Val(ListOfModules(a, 1)))
    ElseIf ListOfModules(a, 0) = "land" Then
        message "Fractal landscape"
        Call Landscape
        Pause
    ElseIf ListOfModules(a, 0) = "bagula1" Then
        message "Lapidus' Sierpinski"
        Call Bagula1(Val(ListOfModules(a, 1)), Val(ListOfModules(a, 2)))
    ElseIf ListOfModules(a, 0) = "levy" Then
        message "Levy Dragon"
        Call Bagula2(Val(ListOfModules(a, 1)), Val(ListOfModules(a, 2)))
    ElseIf ListOfModules(a, 0) = "rndifs" Then
        message "Random IFS pattern"
        Call RandomIFS
    ElseIf ListOfModules(a, 0) = "1dca3" Then
        message "1-D CA"
        Call OneDCA3
    ElseIf ListOfModules(a, 0) = "grav" Then
        message "Gravity"
        Call Meep
    ElseIf ListOfModules(a, 0) = "life" Then
        message "Life"
        Call Life(Val(ListOfModules(a, 1)))
    ElseIf ListOfModules(a, 0) = "wave" Then
        message "WaveFrac"
        Call WaveFrac
        Pause
    ElseIf ListOfModules(a, 0) = "ThrowPic" Then
        message "ThrowPic"
        Call ThrowPic(ListOfModules(a, 1), Val(ListOfModules(a, 2)))
    ElseIf ListOfModules(a, 0) = "Contin" Then
        message "Continuous CA"
        Call Contin
    ElseIf ListOfModules(a, 0) = "PropSier" Then
        message "Proper Sierpinski Carpet"
        Call PropSier(Val(ListOfModules(a, 1)))
        Pause
    ElseIf ListOfModules(a, 0) = "boid" Then
        message "Boids"
        Call DoBoid(Val(ListOfModules(a, 1)), Val(ListOfModules(a, 2)), Val(ListOfModules(a, 3)), Val(ListOfModules(a, 4)))
    ElseIf ListOfModules(a, 0) = "hilbert" Then
        message "Hilbert curve"
        Call GoHilbert
        Pause
    ElseIf ListOfModules(a, 0) = "Bool" Then
        message "Random Boolean network"
        Call RndBool
        Pause
    ElseIf ListOfModules(a, 0) = "Gimps" Then
        message "Gimps"
        Call DoGimps
        Pause
    ElseIf ListOfModules(a, 0) = "PG" Then
        message "Pixel game"
        Call GoPixel
        Pause
    ElseIf ListOfModules(a, 0) = "JM" Then
        message "Julia Morpher"
        Call JuliaM
    ElseIf ListOfModules(a, 0) = "ml1" Then
        message "Malformations 1"
        Call ml1(Val(ListOfModules(a, 1)))
    ElseIf ListOfModules(a, 0) = "coolbag" Then
        message "Cool Bagula"
        Call CoolBag
    ElseIf ListOfModules(a, 0) = "forest" Then
        message "Pecolation net - forest"
        Call Forest
    End If
FracMan:
Loop
End Sub
Sub message(msg)
Image5.Visible = True
msg = "   " + msg
'log "Displaying Message: " + msg
Form1.Cls
For i = 1 To Len(msg)
    tmp = Timer
    For w = 1 To 200
        DoEvents
    Next w
    Form1.Print (Mid$(msg, i, 1));
Next i
Form1.Print
DisplayMyName
Pause
If RunMode = 0 Then Form1.Cls
Image5.Visible = False
DoEvents
End Sub
Sub Pause()
'log "Pausing for 3 seconds..."
a = Timer
Do
    DoEvents
    If Timer > a + 3 Then Exit Do
Loop
End Sub
Sub DisplayMyName()

'log "Displaying SteveC stuff"
Form1.Print
msg = "     FracSaver By SteveC"
For i = 1 To Len(msg)
    tmp = Timer
    For w = 1 To 1000
        DoEvents
    Next w
    Form1.Print (Mid$(msg, i, 1));
Next i
Form1.Print
msg = "       Version 5.0op"
For i = 1 To Len(msg)
    tmp = Timer
    For w = 1 To 1000
        DoEvents
    Next w
    Form1.Print (Mid$(msg, i, 1));
Next i
Form1.Print
End Sub
