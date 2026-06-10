Attribute VB_Name = "Module4"
Dim Entropy(100, 100) As Integer
Dim Gimps(1000, 1) As Integer
Dim NumOfGimps As Integer
Dim boids(3, 200)
Dim Dis As Single
Dim QBBRef As Long
Dim QBWRef As Long
Dim NumOfBoids As Integer '50
Dim RandNess As Single '.5
Dim BoidAcc As Single '.4
Dim Nodes(60, 60)
Dim Typ(60, 60)
Dim InAx(60, 60)
Dim InAy(60, 60)
Dim InBx(60, 60)
Dim InBy(60, 60)
Dim Xgrid(240, 240)
Dim list(32400, 1)
Sub GoPixel()
InitThings
For x = 0 To 240
    For y = 0 To 240
        Call IteratePoint(x, y)
    Next y
Next x
End Sub
Sub InitThings()

Form1.BackColor = QBColor(0)
Randomize Timer
For e = 0 To 240
    For r = 0 To 240
        DoEvents
        Xgrid(e, r) = Int(Rnd(1) * 4) + 1
    Next r
Next e
End Sub
Sub IteratePoint(f, g)

x = f
y = g
list(0, 0) = -1
q = Form1.ScaleWidth / 241
w = Form1.ScaleHeight / 241

Do
    If Xgrid(x, y) = 1 Then
        x = x - 1
    ElseIf Xgrid(x, y) = 2 Then
        x = x + 1
    ElseIf Xgrid(x, y) = 3 Then
        y = y - 1
    ElseIf Xgrid(x, y) = 4 Then
        y = y + 1
    End If
    If x = 241 Then x = 0
    If y = 241 Then y = 0
    If x = -1 Then x = 240
    If y = -1 Then y = 240
    For i = 0 To 3000
        If list(i, 0) = x And list(i, 1) = y Then
            Form1.Line (q * f, w * g)-((q * f) + q, (w * g) + w), QBColor(i Mod 15), BF
            Exit Sub
        ElseIf list(i, 0) = -1 Then
            list(i + 1, 0) = -1
            list(i, 0) = x
            list(i, 1) = y
            Exit For
        End If
    Next i
Loop
End Sub
Sub RndBool()

DoEvents
q = Form1.ScaleWidth / 60
w = Form1.ScaleHeight / 60
For x = 0 To 60
    For y = 0 To 60
        If Rnd(1) > 0.5 Then Nodes(x, y) = 1 Else Nodes(x, y) = 0
    Next y
Next x
For x = 0 To 60
    For y = 0 To 60
        If Rnd(1) > 0 Then Nodes(x, y) = 1
        Typ(x, y) = Int(Rnd(1) * 2)
        InAx(x, y) = Int(Rnd(1) * 60)
        InAy(x, y) = Int(Rnd(1) * 60)
        InBx(x, y) = Int(Rnd(1) * 60)
        InBy(x, y) = Int(Rnd(1) * 60)
    Next y
Next x
For i = 1 To 15
    For x = 0 To 60
        For y = 0 To 60
            If Typ(x, y) = 0 Then
                If Nodes(InAx(x, y), InAy(x, y)) = 0 Then Nodes(x, y) = 1 Else Nodes(x, y) = 0
            ElseIf Typ(x, y) = 1 Then
                If Nodes(InAx(x, y), InAy(x, y)) = 1 Or Nodes(InBx(x, y), InBy(x, y)) = 1 Then Nodes(x, y) = 1 Else Nodes(x, y) = 0
            Else
                If Nodes(InAx(x, y), InAy(x, y)) = 1 And Nodes(InBx(x, y), InBy(x, y)) = 1 Then Nodes(x, y) = 1 Else Nodes(x, y) = 0
            End If
            If Nodes(x, y) = 1 Then Form1.Line (x * q, y * w)-((x * q) + q, (y * w) + w), QBColor(15), BF Else Form1.Line (x * q, y * w)-((x * q) + q, (y * w) + w), QBColor(0), BF
            DoEvents
        Next y
    Next x
Next i
End Sub
Sub Main()

For i = 0 To NumOfBoids
    Call DrawBoid(i, QBBRef)
    N = FindNearestBoid(i)
    If Dis < 20 Then
        Call AccAway(i, N)
    ElseIf Dis < 25 Then
        boids(2, i) = boids(2, N) + (RandNess - (Rnd(1) * RandNess))
        boids(3, i) = boids(3, N) + (RandNess - (Rnd(1) * RandNess))
    Else
        Call AccToward(i, N)
    End If
    Call CheckBoid(i)
    Call UpdateBoid(i)
    Call DrawBoid(i, QBWRef)
Next i
End Sub
Sub CheckBoid(BoidNum)

If boids(0, BoidNum) < 0 Then boids(0, BoidNum) = Form1.ScaleWidth
If boids(0, BoidNum) > Form1.ScaleWidth Then boids(0, BoidNum) = 0
If boids(1, BoidNum) < 0 Then boids(1, BoidNum) = Form1.ScaleHeight
If boids(1, BoidNum) > Form1.ScaleHeight Then boids(1, BoidNum) = 0
End Sub
Sub UpdateBoid(BoidNum)
boids(0, BoidNum) = boids(0, BoidNum) + boids(2, BoidNum)
boids(1, BoidNum) = boids(1, BoidNum) + boids(3, BoidNum)
End Sub
Sub DrawBoid(BoidNum, Colour)

Form1.Line (boids(0, BoidNum), boids(1, BoidNum))-(boids(0, BoidNum) + boids(2, BoidNum), boids(1, BoidNum) + boids(3, BoidNum)), Colour
End Sub
Sub AccToward(a, b)
If boids(2, a) > 8 Or boids(2, a) < -8 Then boids(2, a) = boids(2, a) * 0.9
If boids(3, a) > 8 Or boids(3, a) < -8 Then boids(3, a) = boids(3, a) * 0.9
If boids(0, a) < boids(0, b) Then
    boids(2, a) = boids(2, a) + BoidAcc
Else
    boids(2, a) = boids(2, a) - BoidAcc
End If

If boids(1, a) < boids(1, b) Then
    boids(3, a) = boids(3, a) + BoidAcc
Else
    boids(3, a) = boids(3, a) - BoidAcc
End If
End Sub
Sub AccAway(a, b)
If boids(2, a) > 8 Or boids(2, a) < -8 Then boids(2, a) = boids(2, a) * 0.5
If boids(3, a) > 8 Or boids(3, a) < -8 Then boids(3, a) = boids(3, a) * 0.5
If boids(0, a) < boids(0, b) Then
    boids(2, a) = boids(2, a) - 0.2
Else
    boids(2, a) = boids(2, a) + 0.2
End If

If boids(1, a) < boids(1, b) Then
    boids(3, a) = boids(3, a) - 0.2
Else
    boids(3, a) = boids(3, a) + 0.2
End If
End Sub
Sub Initialize(N)

NumOfBoids = N
QBWRef = QBColor(15)
QBBRef = QBColor(0)
Form1.ScaleMode = 3
For i = 0 To NumOfBoids
    boids(0, i) = Rnd(1) * Form1.ScaleWidth
    boids(1, i) = Rnd(1) * Form1.ScaleHeight
    boids(2, 1) = 20 - (Rnd(1) * 20)
    boids(3, 1) = 20 - (Rnd(1) * 20)
Next i
End Sub
Function FindNearestBoid(BoidNum)
Dis = 1000
num = -1
For i = 0 To NumOfBoids
    If i = BoidNum Then GoTo poo
    tmpdis = Sqr(((boids(0, BoidNum) - boids(0, i)) ^ 2) + ((boids(1, BoidNum) - boids(1, i)) ^ 2))
    If tmpdis < Dis Then
        Dis = tmpdis
        num = i
    End If
poo:
Next i
FindNearest = num
End Function
Sub DoBoid(sec, boids, Acc, rand)
BoidAcc = Acc
RandNess = rand
Initialize (boids)
tmp = Timer
Do
    DoEvents
    If Timer > tmp + sec Then Exit Sub
    Main
Loop
End Sub
Sub DoGimps()
InitializeGimps
For i = 1 To 300
    UpdateEntropy
    DoEvents
    UpdateGimps
    DoEvents
Next i
End Sub
Sub InitializeGimps()

Form1.ScaleWidth = 101
Form1.ScaleHeight = 101
NumOfGimps = 50
For i = 0 To NumOfGimps
    Gimps(i, 0) = Int(Rnd(1) * 101)
    Gimps(i, 1) = Int(Rnd(1) * 101)
Next i
End Sub
Sub UpdateEntropy()

For x = 0 To 100
    For y = 0 To 100
        If Entropy(x, y) > 0 Then Form1.Line (x, y)-(x + 1, y + 1), RGB(Entropy(x, y) * 100, 0, 0), BF
        If Entropy(x, y) > 0 Then Entropy(x, y) = Entropy(x, y) - 1
    Next y
Next x
End Sub
Sub UpdateGimps()
Dim list(100) As Integer
Dim PointList(100) As Integer
Dim MinNum As Integer
Dim NumberOfPoints As Integer
For i = 0 To NumOfGimps
    x = Gimps(i, 0)
    y = Gimps(i, 1)
    list(1) = GetEntropy(x, y - 1)
    list(2) = GetEntropy(x + 1, y - 1)
    list(3) = GetEntropy(x - 1, y)
    list(4) = GetEntropy(x + 1, y)
    list(5) = GetEntropy(x - 1, y + 1)
    list(6) = GetEntropy(x, y + 1)
    list(7) = GetEntropy(x + 1, y + 1)
    MinNum = GetEntropy(x - 1, y - 1)
    PointList(0) = MinNum
    PointList(1) = -1
    NumberOfPoints = 0
    For q = 1 To 7
        If list(q) < MinNum Then
            MinNum = list(q)
            PointList(0) = q
            PointList(1) = -1
            NumberOfPoints = 0
        ElseIf list(q) = MinNum Then
            For w = 0 To 100
                If PointList(w) = -1 Then
                    NumberOfPoints = NumberOfPoints + 1
                    PointList(w + 1) = -1
                    PointList(w) = q
                    Exit For
                End If
            Next w
        End If
    Next q
    r = PointList(Int(Rnd(1) * NumberOfPoints))
    Entropy(x, y) = Entropy(x, y) + 6
    'form1.circle (x, y), 1, QBColor(0)
    If r = 0 Then
        x = x - 1
        y = y - 1
    ElseIf r = 1 Then
        y = y - 1
    ElseIf r = 2 Then
        x = x + 1
        y = y - 1
    ElseIf r = 3 Then
        x = x - 1
    ElseIf r = 4 Then
        x = x + 1
    ElseIf r = 5 Then
        x = x - 1
        y = y + 1
    ElseIf r = 6 Then
        y = y + 1
    ElseIf r = 7 Then
        x = x + 1
        y = y + 1
    End If
    If x > 100 Then x = 0
    If x < 0 Then x = 100
    If y > 100 Then y = 0
    If y < 0 Then y = 100
    Gimps(i, 0) = x
    Gimps(i, 1) = y
Next i
End Sub
Function GetEntropy(x, y)
If x = 101 Then x = 0
If x = -1 Then x = 100
If y = 101 Then y = 0
If y = -1 Then y = 100
GetEntropy = Entropy(x, y)
End Function
Sub JuliaM()

Form1.ScaleWidth = 3
Form1.ScaleHeight = 3
Dim a As Single
Dim b As Single
a = 0.5
b = 0.5
xDir = 3
Dim qa As Long
Dim qb As Long
qa = QBColor(15)
qb = QBColor(0)
tmpa = Timer
Do
    If Timer > tmpa + 30 Then Exit Sub
    If xDir = 1 Then
        a = a - 0.02
        b = b - 0.01
        If a < -1.5 Then xDir = 2
        If b < -1.5 Then xDir = 3
    ElseIf xDir = 2 Then
        a = a + 0.01
        b = b - 0.02
        If a > 2 Then xDir = 1
        If b < -2 Then xDir = 3
    ElseIf xDir = 3 Then
        a = a + 0.02
        b = b + 0.01
        If a > 1.5 Then xDir = 4
        If b > 1.5 Then xDir = 2
    Else
        a = a - 0.01
        b = b + 0.02
        If a < -1.5 Then xDir = 3
        If b > 1.5 Then xDir = 1
    End If
    Call jime(a, b, qa)
    DoEvents
    Call jime(a, b, qb)
Loop
End Sub
Sub jime(q, w, col)

tmp = Rnd(-1235)
Randomize 123
Dim x As Single
Dim y As Single
Dim s As Single
Dim t As Single
Dim tempx As Single
Dim tempy As Single
x = 0.50001
y = 1
s = (q ^ 2) + (w ^ 2)
lambdax = 4 * q / s
lambday = -4 * w / s

For i = 0 To 400
    tempx = x
    tempy = y
    x = 1 - (tempx * lambdax - tempy * lambday)
    y = tempx * lambday + tempy * lambdax
    t = y
    s = Sqr((x ^ 2) + (y ^ 2))
    y = (Sqr((-x + s) / 2)) / 2
    x = Sqr((x + s) / 2)
    If t < 0 Then x = -x
    If Rnd < 0.5 Then
        x = -x
        y = -y
    End If
    x = (1 - x) / 2
    Form1.PSet (x + 1, y + 1), col
Next i
End Sub
Sub ml1(m)

Form1.ScaleWidth = 500
Form1.ScaleHeight = 240
Dim a(10)
Dim b(10)
QBColRef = Int(Rnd(1) * 256 * 256 * 256)
For i = 1 To m
    a(i) = Cos(6.14 * i / m)
    b(i) = Sin(6.14 * i / m)
Next
For N = 1 To 10000
    k = Int(Rnd * m) + 1
    If N Mod 16 = 8 Then s = 4: GoTo nexxt
    If N Mod 8 = 4 Then s = 3: GoTo nexxt
    If N Mod 4 = 2 Then s = 2: GoTo nexxt
    If N Mod 2 = 1 Then s = 1: GoTo nexxt
    If N Mod 2 = 0 Then s = 4
nexxt:
    x = x / (2 ^ (s)) + a(k)
    y = y / (2 ^ (s)) + b(k)
    Form1.PSet (x * 100 + 250, y * 50 + 90), QBColRef
    If Rnd(1) > 0.5 Then DoEvents
Next
End Sub

