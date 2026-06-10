Attribute VB_Name = "Module3"
Dim NumOfPlanets As Integer
Dim Gravlist(4, 300) As Single
Sub Meep()

Form1.FillStyle = 0
Dim e As Integer
Dim r As Integer

Form1.ScaleMode = 3
Limit = 9
Randomize Timer
NumOfPlanets = 30
InitStuff
e = Form1.ScaleWidth
r = Form1.ScaleHeight
For ji = 1 To 3000
    If Rnd(1) > 0.3 Then DoEvents
    For a = 0 To NumOfPlanets
        For b = 0 To NumOfPlanets
            If a = b Then GoTo DizietSma
            Call DoGrav(a, b)
DizietSma:
        Next b
        Form1.PSet (Gravlist(0, a), Gravlist(1, a)), QBColor(0)
        If Gravlist(0, a) <= 0 Then Gravlist(2, a) = Gravlist(2, a) * -1
        If Gravlist(1, a) <= 0 Then Gravlist(3, a) = Gravlist(3, a) * -1
        If Gravlist(0, a) >= e Then Gravlist(2, a) = Gravlist(2, a) * -1
        If Gravlist(1, a) >= r Then Gravlist(3, a) = Gravlist(3, a) * -1
        Gravlist(0, a) = Gravlist(0, a) + Gravlist(2, a)
        Gravlist(1, a) = Gravlist(1, a) + Gravlist(3, a)
        z = Int((Gravlist(2, a) ^ 2 + Gravlist(3, a) ^ 2) * 100)
        If z > 255 Then z = 255
        x = 255 - z
        Form1.FillColor = RGB(z, 0, x)
        Form1.Circle (Gravlist(0, a), Gravlist(1, a)), 4, RGB(z, 0, x)
        Form1.Circle (Gravlist(0, a), Gravlist(1, a)), 4, QBColor(0)
    Next a
Next ji
Form1.FillStyle = 1
End Sub
Sub DoGrav(a, b)
Dim Hypotenuse As Single
Dim Dx As Single
Dim Dy As Single
Dim Grav As Single
Dim Sine As Single
Dim Cosine As Single
Dx = Gravlist(0, a) - Gravlist(0, b)
Dy = Gravlist(1, a) - Gravlist(1, b)
If Dx < 0 Then Dx = Dx * -1
If Dy < 0 Then Dy = Dy * -1
Hypotenuse = Sqr(Dx ^ 2 + Dy ^ 2)
If Hypotenuse < 19 Then Hypotenuse = 19
Sine = Dy / Hypotenuse
Cosine = Dx / Hypotenuse
Grav = (6.667 / 10 * Gravlist(4, a) * Gravlist(4, b)) / (Hypotenuse ^ 2)
Grav = Grav / Gravlist(4, a)
Dy = Sine * Grav
Dx = Cosine * Grav
If Gravlist(0, a) >= Gravlist(0, b) Then Gravlist(2, a) = Gravlist(2, a) - Dx Else Gravlist(2, a) = Gravlist(2, a) + Dx
If Gravlist(1, a) >= Gravlist(1, b) Then Gravlist(3, a) = Gravlist(3, a) - Dy Else Gravlist(3, a) = Gravlist(3, a) + Dy
End Sub
Sub InitStuff()

Form1.Cls
For i = 0 To NumOfPlanets / 2
    Gravlist(0, i) = Rnd(1) * Form1.ScaleWidth
    Gravlist(1, i) = Rnd(1) * Form1.ScaleHeight
    Gravlist(2, i) = 0
    Gravlist(3, i) = 0
    Gravlist(4, i) = Rnd(1) * 30000
Next i
For i = 0 To NumOfPlanets / 2 + (NumOfPlanets / 2)
    Gravlist(0, i) = Rnd(1) * Form1.ScaleWidth
    Gravlist(1, i) = Rnd(1) * Form1.ScaleHeight
    Gravlist(2, i) = 0
    Gravlist(3, i) = 0
    Gravlist(4, i) = Rnd(1) * 10
Next i
End Sub
Sub Bagula2(it, m)

Dim x As Single
Dim y As Single
Dim x1 As Single
Dim s1 As Single
Dim s2 As Single
Dim pi As Single
Dim c As Single
Dim d As Single
Dim a(25) As Single, b(25) As Single
Dim r As Single
Dim QBRef As Single
Dim i As Integer
Dim l As Long
QBRef = Int(Rnd(1) * 256 * 256 * 256)
pi = 3.141592
Form1.ScaleWidth = 785
Form1.ScaleHeight = 565
x = 1
y = 1
c = 0
s1 = 75 * 2
s2 = (s1) * 565 / 785
For i = 1 To m
    a(i) = Cos(2 * pi * i / m)
    b(i) = Sin(2 * pi * i / m)
Next i
Randomize Timer
b1 = 1 / (Sqr(3))
r = Sqr(2) * Sqr(m)
For N = 1 To it
    If Rnd(1) > 0.95 Then DoEvents
    c = Rnd
    d = Int(2 * c * m)
    s = 1
    For l = 1 To m
        If c >= (l - 1) / m And c < l / m Then
            If l Mod 2 = 1 Then
                x1 = x / (r ^ s) - y / (r ^ s) + a(l)
                Y1 = x / (r ^ s) + y / (r ^ s) + b(l)
            Else
                x1 = x / (r ^ s) + y / (r ^ s) + a(l)
                Y1 = -x / (r ^ s) + y / (r ^ s) + b(l)
            End If
        End If
    Next l
    x = x1
    y = Y1
    If N > 10 Then Form1.PSet (785 / 2 + s1 * x, 565 / 2 + s2 * y), QBRef
Next N
End Sub
Sub Life(it)

Dim x As Integer
Dim y As Integer
Dim a As Integer
Dim HeightRef As Integer
Dim WidthRef As Integer
Dim QBRef As Long
Dim Cells(60 * 60 / 3, 4) As Integer
QBRef = QBColor(15) 'Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleMode = 3
HeightRef = Form1.ScaleHeight
WidthRef = Form1.ScaleWidth
Form1.ForeColor = QBRef
Form1.BackColor = 0
num = 30000
If RunMode = 1 Then num = num / 10
For i = 1 To num
    Form1.PSet (Rnd(1) * WidthRef, Rnd(1) * HeightRef), QBRef
Next i
For y = 0 To 2
    For x = 1 To Form1.ScaleWidth - 1
        If Form1.Point(x, y) = QBRef Then Cells(x, y) = 1 Else Cells(x, y) = 0
    Next x
Next y
For i = 1 To it
    For y = 1 To HeightRef - 1
        DoEvents
        For x = 1 To WidthRef - 1
            a = Cells(x - 1, 0) + Cells(x, 0) + Cells(x + 1, 0) + Cells(x - 1, 1) + Cells(x + 1, 1) + Cells(x - 1, 2) + Cells(x, 2) + Cells(x + 1, 2)
            If a = 3 Or a = 2 Then
                Form1.PSet (x, y), QBRef
            Else
                Form1.PSet (x, y), QBColor(0)
            End If
        Next x
        For x = 1 To WidthRef - 1
            Cells(x, 0) = Cells(x, 1)
            Cells(x, 1) = Cells(x, 2)
            If Form1.Point(x, y + 2) = QBRef Then Cells(x, 2) = 1 Else Cells(x, 2) = 0
        Next x
    Next y
Next i
End Sub
'Sub RunAnother(Path, Time)
'Shell (Path + " /S")
'tmp = Timer
'Do
'    DoEvents
'    If (Timer - tmp) > Time Then
'        SendKeys "q"
'        FracDisp.Show
'        Exit Sub
'    End If
'Loop
'End Sub
'Sub log(msg)
'Open "C:\FracSaver.log" For Append As #1
'Write #1, msg + "    Timed at " + time$ + " Dated at: " + Date$
'Close #1
'End Sub
Sub ThrowPic(PicName, time)

Form1.Picture = LoadPicture(PicName)
'form1.picture = form1.picture1.Picture
tmp = Timer
Do
    DoEvents
    If tmp + time < Timer Then Exit Sub
Loop
End Sub
Sub Contin()

'Continuous 1-D CA. Program Copyright (c) 1998 Stephen Coast
Form1.ScaleMode = 1
Randomize Timer
Dim WidthRef As Integer
Dim HeightRef As Integer
Dim x As Integer
Dim y As Integer
Dim mine(3600, 1) As Single
Dim ColourScheme As Single
ColourScheme = Int(Rnd(1) * 256 * 256 * 256)
    Form1.ScaleMode = 1
    WidthRef = Form1.ScaleWidth / 15
    HeightRef = Form1.ScaleHeight / 15
    Form1.ScaleWidth = WidthRef
    Form1.BackColor = QBColor(0)
For x = 0 To WidthRef 'initialize array with random stuff
    mine(x, 0) = Rnd(1) * Int(Rnd(1) * 100)
Next x
For y = 0 To HeightRef * 15 'loop to bottom of screen
    If y / 20 = Int(y / 20) Then DoEvents 'every twenty lines DoEvents
    For x = 1 To WidthRef - 1 'do all the bottom cells in the array
        pop = mine(x - 1, 0) + mine(x, 0) + mine(x + 1, 0) + mine(x - 1, 1) + mine(x + 1, 1) 'find population of three above
        If pop <= 1 Or pop >= 1 Then mine(x, 1) = pop / 5 Else mine(x, 1) = pop 'if it is between 1 and 2 then average of pop else 0
    Next x
    If y / 15 = Int(y / 15) Then 'every 15 lines draw the array
        For x = 0 To WidthRef
            Form1.PSet (x, y), mine(x, 0) * ColourScheme
        Next x
    End If
    For x = 0 To WidthRef 'copy bottom row to top row of array
        mine(x, 0) = mine(x, 1)
    Next x
Next y
End Sub
Sub PropSier(it)

Form1.ScaleMode = 3
Call SierCarpet(0, 0, Form1.ScaleWidth, Form1.ScaleHeight, it)
End Sub
Function SierCarpet(xa, ya, xb, yb, it)

DoEvents
If it = 0 Then Exit Function
Form1.Line (((xb - xa) / 3) + xa, ((yb - ya) / 3) + ya)-(((xb - xa) / 3 * 2) + xa, ((yb - ya) / 3 * 2) + ya), QBColor(15), BF
Call SierCarpet(xa, ya, ((xb - xa) / 3) + xa, ((yb - ya) / 3) + ya, it - 1)
Call SierCarpet(((xb - xa) / 3) + xa, ya, ((xb - xa) / 3 * 2) + xa, ((yb - ya) / 3) + ya, it - 1)
Call SierCarpet(((xb - xa) / 3 * 2) + xa, ya, xb, ((yb - ya) / 3) + ya, it - 1)

Call SierCarpet(xa, ((yb - ya) / 3) + ya, ((xb - xa) / 3) + xa, ((yb - ya) / 3 * 2) + ya, it - 1)
Call SierCarpet(((xb - xa) / 3 * 2) + xa, ((yb - ya) / 3) + ya, xb, ((yb - ya) / 3 * 2) + ya, it - 1)

Call SierCarpet(xa, ((yb - ya) / 3 * 2) + ya, ((xb - xa) / 3) + xa, yb, it - 1)
Call SierCarpet(((xb - xa) / 3) + xa, ((yb - ya) / 3 * 2) + ya, ((xb - xa) / 3 * 2) + xa, yb, it - 1)
Call SierCarpet(((xb - xa) / 3 * 2) + xa, ((yb - ya) / 3 * 2) + ya, xb, yb, it - 1)
End Function

