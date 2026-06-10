Attribute VB_Name = "Module5"
Dim trees(99, 99) As Integer
Dim BurnIndex(99, 99) As Integer
Function TestBurn(x, y)
TestBurn = False
If x = 0 Or y = 0 Or x = 49 Or y = 49 Then Exit Function
If trees(x - 1, y - 1) = 2 And BurnIndex(x - 1, y - 1) > 1 Then TestBurn = True
If trees(x, y - 1) = 2 And BurnIndex(x, y - 1) > 1 Then TestBurn = True
If trees(x + 1, y - 1) = 2 And BurnIndex(x + 1, y - 1) > 1 Then TestBurn = True
If trees(x - 1, y) = 2 And BurnIndex(x - 1, y) > 1 Then TestBurn = True
If trees(x + 1, y) = 2 And BurnIndex(x + 1, y) > 1 Then TestBurn = True
If trees(x - 1, y + 1) = 2 And BurnIndex(x - 1, y + 1) > 1 Then TestBurn = True
If trees(x, y + 1) = 2 And BurnIndex(x, y + 1) > 1 Then TestBurn = True
If trees(x + 1, y + 1) = 2 And BurnIndex(x + 1, y + 1) > 1 Then TestBurn = True
End Function
Sub Forest()

Randomize Timer
Form1.BackColor = QBColor(15)
If RunMode = 0 Then
    Form1.ScaleMode = 3
Else
    Form1.ScaleWidth = 1024
    Form1.ScaleHeight = 768
End If
For x = 0 To 99
    For y = 0 To 99
        If Rnd(1) < 0.5927 Then trees(x, y) = 1
        If x = 0 And trees(x, y) = 1 Then trees(x, y) = 2
    Next y
Next x
For i = 0 To 69
    For x = 0 To 25
        For y = 0 To 20
            If Rnd(1) > 0.5 Then DoEvents
            If trees(x, y) = 1 Then
                Form1.PaintPicture Form1.Image1.Picture, (x * 48) - 48, (y * 48) - 48
                If TestBurn(x, y) Then
                    trees(x, y) = 2
                End If
            ElseIf trees(x, y) = 2 Then
                BurnIndex(x, y) = BurnIndex(x, y) + 1
                Form1.PaintPicture Form1.Image2.Picture, (x * 48) - 48, (y * 48) - 48
                If BurnIndex(x, y) > 2 Then trees(x, y) = 3
            ElseIf trees(x, y) = 3 Then Form1.PaintPicture Form1.Image3.Picture, (x * 48) - 48, (y * 48) - 48
            End If
        Next y
    Next x
Next i
Form1.BackColor = QBColor(0)
End Sub
Sub CoolBag()
Randomize Timer
Form1.ScaleWidth = 758
Form1.ScaleHeight = 565
QBColRef = Int(Rnd(1) * 256 * 256 * 256)
Dim a(25), b(25)
pi = 3.141592
x = 1
y = 1
c = 0
s1 = 200
s2 = (s1) * 565 / 785
m = 3
s = Log(m) / Log(2)
ds = 1 - Log(2) / Log(m)
For i = 1 To m
    a(i) = Cos(2 * pi * i / m)
    b(i) = Sin(2 * pi * i / m)
Next i
For i = 1 To 100000
    c = Rnd(1)
    If c > 0.5 Then DoEvents
    l = 1 + Int(c * m)
    x = x / 2 + a(l)
    y = y / 2 + b(l)
    y3 = (y * ds - x * (1 - ds)) / (x * x + y * y)
    x3 = -y * y3 / x + ds / x
    Form1.PSet (785 / 2 + s1 * x3, 565 / 2 + s2 * y3), QBColRef
Next i
End Sub
