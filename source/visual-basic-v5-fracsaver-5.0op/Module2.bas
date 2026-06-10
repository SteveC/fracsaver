Attribute VB_Name = "Module2"
Public rect(11, 5000) As Single
Dim x
Dim y
Public Sub Mandel(xa, ya, xb, yb)

Dim ymine As Single
Dim xmine As Single
Dim q As Single
Dim x As Single
Dim y As Single
Dim HeightRef As Long
Dim WidthRef As Long
yu = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleMode = 3
HeightRef = Form1.ScaleWidth
WidthRef = Form1.ScaleWidth
pixx = Form1.ScaleWidth
pixy = Form1.ScaleHeight
If xa < 0 Then xmine = Sqr(xa ^ 2) Else xmine = -xa
ymine = Sqr(yb ^ 2)
xdiv = xb - xa
ydiv = ya - yb
Form1.ScaleWidth = xdiv
Form1.ScaleHeight = ydiv
For y = ya To yb Step -(ydiv / pixy)
    If Rnd(1) > 0.8 Then DoEvents
    For x = xa To xb Step xdiv / pixx
        q = Int(Iterate(y, x)) / 42
        q = q * yu ''* 256 * 256
        Form1.PSet (x + xmine, y + ymine), q
     Next x
Next y
End Sub
Private Function Iterate(imag, real)
Dim y As Single
Dim x As Single
Dim i As Integer
Dim dissqr As Single
Dim xsqr As Single
Dim ysqr As Single
For i = 1 To 20
    y = 2 * x * y - imag
    x = xsqr - ysqr - real
    xsqr = x ^ 2
    ysqr = y ^ 2
    If xsqr + ysqr > 50 Then GoTo jim
Next i
jim:
    Iterate = i
End Function
Sub carpet()

QBRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleWidth = 640
Form1.ScaleHeight = 480
x = 320
y = 240
Size = 100
'form1.line (x - (Size / 2), y - Size / 2)-(x + (Size / 2), y + (Size / 2)), QBColor(15), BF
Main:
gimp = gimp + 1
If gimp = 50000 Then Exit Sub
If Rnd(1) > 0.98 Then DoEvents
d = d + 1
If d = 6 Then x = 320
If d = 6 Then y = 240
If d = 6 Then Size = 100
If d = 6 Then d = 1

q = Rnd(1)
If q < 0.25 Then GoTo UP
If q < 0.5 Then GoTo DOWN
If q < 0.75 Then GoTo LEFT
GoTo RIGHT

UP:
y = y - Size
Size = Size / 2
Form1.Line (x - (Size / 2), y - Size / 2)-(x + (Size / 2), y + (Size / 2)), QBRef, BF
GoTo Main

DOWN:
y = y + Size
Size = Size / 2
Form1.Line (x - (Size / 2), y - Size / 2)-(x + (Size / 2), y + (Size / 2)), QBRef, BF
GoTo Main

LEFT:
x = x - Size
Size = Size / 2
Form1.Line (x - (Size / 2), y - Size / 2)-(x + (Size / 2), y + (Size / 2)), QBRef, BF
GoTo Main

RIGHT:
x = x + Size
Size = Size / 2
Form1.Line (x - (Size / 2), y - Size / 2)-(x + (Size / 2), y + (Size / 2)), QBRef, BF
GoTo Main
End Sub
Sub Coast()

Dim QBRef As Long
Form1.ScaleWidth = 2.5
Form1.ScaleHeight = 2
x = 1
y = 2
J = 1
QBRef = Int(Rnd(1) * 256 * 256 * 256)

Main:
For i = 1 To 400
gimp = gimp + 1
If gimp = 70000 Then Exit Sub
If Rnd(1) > 0.98 Then DoEvents
 If i = 2 Then
 J = J + 0.005
 x = 1
 y = 2
 r = 0
 End If
r = y
y = (Cos(x) + Sin(y) + Sin(r)) * 0.5
x = r ^ x
Form1.PSet (x, y + 0.5), QBRef
x = x ^ J
y = y ^ J
 If J > 1.4 Then J = 1
 Next i
GoTo Main
End Sub
Sub SquareFrac(it)

Form1.ScaleWidth = 640
Form1.ScaleHeight = 480
x = 20
y = 20
QBRef = Int(Rnd(1) * 256 * 256 * 256)
START:
Form1.PSet (x, y), QBRef
gimp = gimp + 1
If gimp = it Then Exit Sub
If Rnd(1) > 0.98 Then DoEvents
a! = Rnd(1)
If a! < 0.25 Then GoTo a
If a! < 0.5 Then GoTo b
If a! < 0.75 Then GoTo c
GoTo d
a:
y = y / 4
x = x / 4
GoTo START
b:
x = ((640 - x) / 3) + x
y = y / 2
GoTo START
c:
y = ((480 - y) / 2) + y
x = x / 2
GoTo START
d:
x = ((640 - x) / 2) + x
y = ((480 - y) / 2) + y
GoTo START
End Sub
Sub WaveFrac()

On Error GoTo FRED
Form1.ScaleMode = 3
Form1.ScaleHeight = 1
Dim x As Double
f = Form1.ScaleWidth
GoTo jim
Main:
For z = 1 To 20
    DoEvents
    y = y * Sqr(7)
    s$ = Str$(x)
    For i = 1 To Len(s$)
        If Mid$(s$, i, 1) = "." Then Exit For
    Next i
    y = Val(Mid$(s$, i, Len(s$) - i))
    y = Sin(y)
    Form1.PSet (x, 1 - y), QBColor(15)
    If x > Form1.ScaleWidth Then Exit Sub
Next z
jim:
x = x + 1
w = w + 1 / f
y = w
GoTo Main

FRED:
Resume Next
End Sub
Sub CircFrac()

QBRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleMode = 3
Dim a(650, 2) As Double
Dim b(650, 2) As Double
a(0, 0) = Form1.ScaleHeight / 2 - 10
a(0, 1) = Form1.ScaleWidth / 2
a(0, 2) = Form1.ScaleHeight / 2
a(1, 0) = -1
b(0, 0) = -1
For i = 1 To 7
    For x = 0 To 650
        If a(x, 0) = -1 Then Exit For
            For y = 0 To 649
                If b(y, 0) = -1 Then
                    Form1.Circle (a(x, 1), a(x, 2)), a(x, 0), QBRef
                    b(y, 0) = a(x, 0) / 2
                    b(y, 1) = a(x, 1) - b(y, 0)
                    b(y, 2) = a(x, 2)
                    b(y + 1, 0) = a(x, 0) / 2
                    b(y + 1, 1) = a(x, 1) + b(y + 1, 0)
                    b(y + 1, 2) = a(x, 2)
                    b(y + 2, 0) = -1
                    Exit For
                End If
            Next y
    Next x
    For x = 0 To 150
        a(x, 0) = b(x, 0)
        a(x, 1) = b(x, 1)
        a(x, 2) = b(x, 2)
        b(0, 0) = -1
    Next x
Next i
For i = 0 To 649
    If Not a(i, 0) = -1 Then Form1.Circle (a(i, 1), a(i, 2)), a(i, 0), QBRef
    If Not b(i, 0) = -1 Then Form1.Circle (b(i, 1), b(i, 2)), b(i, 0), QBRef
Next i
End Sub
Sub CantorBars()

If RunMode = 0 Then Form1.ScaleMode = 3
Dim a(650, 3) As Double
Dim b(650, 3) As Double
levels = 5
div = 60
a(0, 0) = 0
a(0, 1) = Form1.ScaleHeight / 4
a(0, 2) = Form1.ScaleWidth
a(0, 3) = Form1.ScaleHeight / 4
a(1, 0) = -1
b(0, 0) = -1
For i = 1 To levels
    For x = 0 To 650
        If a(x, 0) = -1 Then Exit For
            For y = 0 To 649
                If b(y, 0) = -1 Then
                    Form1.Line (a(x, 0), a(x, 1))-(a(x, 2), a(x, 3)), QBColor(15)
                    b(y, 0) = a(x, 0)
                    b(y, 1) = a(x, 1) + div
                    b(y, 2) = ((a(x, 2) - b(y, 0)) / 3) + b(y, 0)
                    b(y, 3) = a(x, 3) + div
                    b(y + 1, 0) = ((a(x, 2) - a(x, 0)) / 3 * 2) + a(x, 0)
                    b(y + 1, 1) = a(x, 1) + div
                    b(y + 1, 2) = a(x, 2)
                    b(y + 1, 3) = a(x, 3) + div
                    b(y + 2, 0) = -1
                    Exit For
                End If
            Next y
    Next x
    For x = 0 To 150
        a(x, 0) = b(x, 0)
        a(x, 1) = b(x, 1)
        a(x, 2) = b(x, 2)
        a(x, 3) = b(x, 3)
        b(0, 0) = -1
    Next x
Next i
End Sub
Public Sub SierpinskyGasket(it)

Dim QBRef As Long
QBRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleHeight = 300
Form1.ScaleWidth = 300
Dim xleft(10), xright(10), XTop(10), yleft(10), yright(10), YTop(10)
Dim a(3), b(3), c(3), d(3), e(3), f(3)
Level = it
w = 300
wl = w
xleft(Level) = 0
yleft(Level) = 0
xright(Level) = w
yright(Level) = 0
XTop(Level) = 0.5 * w
YTop(Level) = w
a(1) = 0.5: a(2) = 0.5: a(3) = 0.5
d(1) = 0.5: d(2) = 0.5: d(3) = 0.5
e(1) = 0: e(2) = 0.5 * w: e(3) = 0.25 * w
f(1) = 0: f(2) = 0: f(3) = 0.5 * w
GoSub 100
Exit Sub

50
    xleft(Level) = a(map) * xleft(Level + 1) + e(map)
    yleft(Level) = d(map) * yleft(Level + 1) + f(map)
    xright(Level) = a(map) * xright(Level + 1) + e(map)
    yright(Level) = d(map) * yright(Level + 1) + f(map)
    XTop(Level) = a(map) * XTop(Level + 1) + e(map)
    YTop(Level) = d(map) * YTop(Level + 1) + f(map)
100
    If Level > 1 Then GoTo 200
    Form1.Line (xleft(1), wl - yleft(1))-(xright(1), wl - yright(1)), QBRef
    Form1.Line -(XTop(1), wl - YTop(1)), QBRef
    Form1.Line -(xleft(1), wl - yleft(1)), QBRef
    DoEvents
    GoTo 300
    
200
    Level = Level - 1
    map = 1
    GoSub 50
    map = 2
    GoSub 50
    map = 3
    GoSub 50
    
Level = Level + 1
300 Return
End Sub
Sub fern(it)

Dim w As Integer
Dim x As Single
Dim y As Single
Dim xn As Single
Dim yn As Single
Dim e1 As Single
Dim e2 As Single
Dim e3 As Single
Dim e4 As Single
Dim f1 As Single
Dim f2 As Single
Dim f3 As Single
Dim f4 As Single
Dim i As Long
Dim wl As Integer
Dim QBRef As Long
QBRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleHeight = 325
Form1.ScaleWidth = 150
imax = it
w = 300
wl = w
e1 = 0.5 * w: e2 = 0.57 * w: e3 = 0.408 * w: e4 = 0.1075 * w
f1 = 0 * w: f2 = -0.036 * w: f3 = 0.0893 * w: f4 = 0.27 * w

x = e1
y = 0
For i = 1 To imax
    r = Rnd
50
    If r > 0.02 Then GoTo 100
        xn = 0 * x + 0 * y + e1
        yn = 0 * x + 0.27 * y + f1
        GoTo 400
100
    If r > 0.17 Then GoTo 200
        xn = -0.139 * x + 0.263 * y + e2
        yn = 0.246 * x + 0.224 * y + f2
        GoTo 400
200
    If r > 0.3 Then GoTo 300
        xn = 0.17 * x - 0.215 * y + e3
        yn = 0.222 * x + 0.176 * y + f3
        GoTo 400
300
    xn = 0.781 * x + 0.034 * y + e4
    yn = -0.032 * x + 0.739 * y + f4
400
    Form1.PSet (xn - 80, Form1.ScaleHeight - yn), QBRef
    DoEvents
    x = xn
    y = yn
Next i
End Sub
Sub KochCurve(it)

Dim QBRef As Long
QBRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleHeight = 200
Form1.ScaleWidth = 300
Dim xleft(10), xright(10), yleft(10), yright(10)
r = 0.29
Level = it
xleft(Level) = 0
xright(Level) = 300
yleft(Level) = 190
yright(Level) = 190
GoSub 100
Exit Sub
100
    If Level > 1 Then GoTo 200
    Form1.Line (xleft(1), yleft(1))-(xright(1), yright(1)), QBRef
    GoTo 300
200
    Level = Level - 1
    xleft(Level) = xleft(Level + 1)
    yleft(Level) = yleft(Level + 1)
    xright(Level) = 0.333 * xright(Level + 1) + 0.667 * xleft(Level + 1)
    yright(Level) = 0.333 * yright(Level + 1) + 0.667 * yleft(Level + 1)
    GoSub 100
    
    xleft(Level) = xright(Level)
    yleft(Level) = yright(Level)
    xright(Level) = 0.5 * xright(Level + 1) + 0.5 * xleft(Level + 1) - r * (yleft(Level + 1) - yright(Level + 1))
    yright(Level) = 0.5 * yright(Level + 1) + 0.5 * yleft(Level + 1) + r * (xleft(Level + 1) - xright(Level + 1))
    GoSub 100
    
    xleft(Level) = xright(Level)
    yleft(Level) = yright(Level)
    xright(Level) = 0.667 * xright(Level + 1) + 0.333 * xleft(Level + 1)
    yright(Level) = 0.667 * yright(Level + 1) + 0.333 * yleft(Level + 1)
    GoSub 100
    
    xleft(Level) = xright(Level)
    yleft(Level) = yright(Level)
    xright(Level) = xright(Level + 1)
    yright(Level) = yright(Level + 1)
    GoSub 100
    
Level = Level + 1
300 Return
End Sub
Sub SnowFlake4(it)

Dim i As Long
Dim r As Single
Dim e As Single
Dim w As Integer
Dim q As Integer
Dim x As Single
Dim y As Single
Dim xa As Single
Dim ya As Single
Dim QBRef As Long
QBRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleWidth = 640
Form1.ScaleHeight = 480

For i = 1 To it
Excession:
    r = Int(Rnd(1) * 5)
    If e = r Then GoTo DizietSma
    If r < 1 Then
        w = 320
        q = 479
        GoTo GCUShootThemLater
     ElseIf r < 2 Then
        w = 81
        q = 240
        GoTo GCUShootThemLater
     ElseIf r < 3 Then
        w = 559
        q = 240
        GoTo GCUShootThemLater
     ElseIf r < 4 Then
        w = 320
        q = 1
        GoTo GCUShootThemLater
    End If
GoTo Excession
GCUShootThemLater:
    If y < q Then ya = (q - y) / 2 + y
    If y > q Then ya = (y - q) / 2 + q
    If x < w Then xa = (w - x) / 2 + x
    If x > w Then xa = (x - w) / 2 + w
    x = xa
    y = ya
    Form1.PSet (x, y), QBRef
    DoEvents
    e = r
DizietSma:
Next i
End Sub
Sub SnowFlake5(it)

Form1.ScaleWidth = 640
Form1.ScaleHeight = 480

For i = 1 To it
Excession:
    r = Int(Rnd(1) * 6)
    If e = r Then GoTo DizietSma
    If r < 1 Then
        w = 460
        q = 433
        GoTo GCUShootThemLater
     ElseIf r < 2 Then
        w = 180
        q = 433
        GoTo GCUShootThemLater
     ElseIf r < 3 Then
        w = 93
        q = 166
        GoTo GCUShootThemLater
     ElseIf r < 4 Then
        w = 320
        q = 1
        GoTo GCUShootThemLater
         ElseIf r < 5 Then
        w = 547
        q = 166
        GoTo GCUShootThemLater
End If
GoTo Excession
GCUShootThemLater:
    If y < q Then ya = (q - y) / 2 + y
    If y > q Then ya = (y - q) / 2 + q
    If x < w Then xa = (w - x) / 2 + x
    If x > w Then xa = (x - w) / 2 + w
    x = xa
    y = ya
    Form1.PSet (x, y), QBColor(15)
    DoEvents
    e = r
DizietSma:
Next i
End Sub
Sub SnowFlake6(it)

Form1.ScaleWidth = 640
Form1.ScaleHeight = 480
QBRef = Int(Rnd(1) * 256 * 256 * 256)
For i = 1 To it
Excession:
    r = Int(Rnd(1) * 7)
    If e = r Then GoTo DizietSma
    If r < 1 Then
        w = 527
        q = 360
        GoTo GCUShootThemLater
    ElseIf r < 2 Then
        w = 320
        q = 479
        GoTo GCUShootThemLater
    ElseIf r < 3 Then
        w = 113
        q = 121
        GoTo GCUShootThemLater
    ElseIf r < 4 Then
        w = 320
        q = 1
        GoTo GCUShootThemLater
    ElseIf r < 5 Then
        w = 527
        q = 121
        GoTo GCUShootThemLater
    ElseIf r < 6 Then
        w = 113
        q = 360
        GoTo GCUShootThemLater
End If
GoTo Excession
GCUShootThemLater:
    If y < q Then ya = (q - y) / 2 + y
    If y > q Then ya = (y - q) / 2 + q
    If x < w Then xa = (w - x) / 2 + x
    If x > w Then xa = (x - w) / 2 + w
    x = xa
    y = ya
    Form1.PSet (x, y), QBRef
    DoEvents
    e = r
DizietSma:
Next i
End Sub
Sub Gasket5(it)

Dim x As Single
Dim y As Single
Dim w As Single
Dim q As Single
Dim r As Single
Dim i As Long
Dim ya As Single
Dim xa As Single
Dim QBRef As Long
QBRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleWidth = 640
Form1.ScaleHeight = 480

For i = 1 To it
Excession:
    r = Int(Rnd(1) * 6)
    If r < 1 Then
        w = 460
        q = 433
        GoTo GCUShootThemLater
     ElseIf r < 2 Then
        w = 180
        q = 433
        GoTo GCUShootThemLater
     ElseIf r < 3 Then
        w = 93
        q = 166
        GoTo GCUShootThemLater
     ElseIf r < 4 Then
        w = 320
        q = 1
        GoTo GCUShootThemLater
         ElseIf r < 5 Then
        w = 547
        q = 166
        GoTo GCUShootThemLater
End If
GoTo Excession
GCUShootThemLater:
    If y < q Then ya = (q - y) / 2 + y
    If y > q Then ya = (y - q) / 2 + q
    If x < w Then xa = (w - x) / 2 + x
    If x > w Then xa = (x - w) / 2 + w
    x = xa
    y = ya
    Form1.PSet (x, y), QBRef
    DoEvents
DizietSma:
Next i
End Sub
Sub Tree(depth)

'Dim qbref As Long
QBRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleHeight = 1000
Form1.ScaleWidth = 1000
Dim xs(15), dxs(15), ys(15), dys(15)
H = 1000
stack = 0
For stage = 0 To 12
    xturtle = H / 2: yturtle = H
    Dx = 0: Dy = -22 * (stage + 1)
    Form1.Cls
    GoSub 100
Next stage
Exit Sub
100
    If stage > 0 Then GoTo 150
        Form1.Line (xturtle, yturtle)-Step(Dx, Dy), QBRef
        DoEvents
        xturtle = xturtle + Dx: yturtle = yturtle + Dy
        Return
150
    stage = stage - 1
    GoSub 100: GoSub 500: GoSub 300: GoSub 100: GoSub 600
    GoSub 500: GoSub 400: GoSub 100: GoSub 600
    stage = stage + 1
    Return
300
    dx1 = Dx
    Dx = 0.707 * dx1 - 0.707 * Dy
    Dy = 0.707 * dx1 + 0.707 * Dy
    Return
400
    dx1 = Dx
    Dx = 0.866 * dx1 + 0.5 * Dy
    Dy = -0.5 * dx1 + 0.866 * Dy
    Return
500
    stack = stack + 1
    xs(stack) = xturtle: ys(stack) = yturtle
    dxs(stack) = Dx: dys(stack) = Dy
    Dx = Dx * 0.7: Dy = Dy * 0.7
    Return
600
    xturtle = xs(stack): yturtle = ys(stack)
    Dx = dxs(stack): Dy = dys(stack)
    stack = stack - 1
    Return
End Sub
Sub Julia(it)

Dim QBRef As Long
QBRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleHeight = 300
Form1.ScaleWidth = 300
w = 300
s = w / 3
orig = w / 2
xc = -1
yc = 0

xn = 0.25
yn = 0
For i = 1 To it
    a = xn - xc
    b = yn - yc
    If a > 0 Then GoTo 100
    If a < 0 Then GoTo 150
    xn = Sqr(Abs(b) / 2)
    If xn > 0 Then yn = b / (2 * xn) Else yn = 0
    GoTo 200
100
    xn = Sqr((Sqr(a * a + b * b) + a) / 2)
    yn = b / (2 * xn)
    GoTo 200
150
    yn = Sqr((Sqr(a * a + b * b) - a) / 2)
    If b < 0 Then yn = -yn
    xn = b / (2 * yn)
200
    If i = 1 Then xn = xn + 0.5
    If Rnd < 0.5 Then GoTo 300
    xn = -xn
    yn = -yn
300
    DoEvents
    Form1.PSet (xn * s + orig, -yn * s + orig), QBRef
Next i
End Sub
Sub rndpoints(it)

Dim x As Single
Dim y As Single
Dim QBRef As Long
QBRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleWidth = 640
Form1.ScaleHeight = 480
x = 20
y = 20

For gimp = 1 To it
    Form1.PSet (x, y), QBRef
    If Rnd(1) > 0.98 Then DoEvents
    a! = Rnd(1)
    If a! < 0.25 Then GoTo a
    If a! < 0.5 Then GoTo b
    If a! < 0.75 Then GoTo c
    GoTo d
a:
    y = y / 2
    x = x / 2
    GoTo poo
b:
    x = ((640 - x) / 2) + x
    y = y / 2
    GoTo poo
c:
    y = ((480 - y) / 2) + y
    x = x / 2
    GoTo poo
d:
    x = ((640 - x) / 2) + x
    y = ((480 - y) / 2) + y
poo:
Next gimp
End Sub
Sub Landscape()

QBRef = QBColor(15) 'Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleHeight = 2.1
Form1.ScaleWidth = 2.1
Randomize Timer
Dim i As Integer
Dim scalefactor As Single
Dim displace As Single
scalefactor = 0.3

InitRect
mainbay = 0.7
displace = mainbay
For q = 1 To 350
    displace = Rnd(1) * (mainbay / (q + 1))
    If Rnd(1) > 0.2 Then displace = displace * -1
    For i = 0 To 999
        If rect(0, i) = -1 Then Exit For
        'First
        Ax = rect(0, i)
        ay = rect(1, i)
        az = rect(2, i)
        bx = (rect(3, i) + rect(0, i)) / 2
        by = (rect(4, i) + rect(1, i)) / 2
        bz = (rect(5, i) + rect(2, i)) / 2
        cx = (rect(6, i) + rect(0, i)) / 2
        cy = (rect(7, i) + rect(1, i)) / 2
        cz = ((rect(8, i) + rect(2, i)) / 2) + displace
        Dx = (rect(9, i) + rect(0, i)) / 2
        Dy = (rect(10, i) + rect(1, i)) / 2
        dz = (rect(11, i) + rect(2, i)) / 2
        Call AddRect(Ax, ay, az, bx, by, bz, cx, cy, cz, Dx, Dy, dz, QBRef)
        'Second
        mx = rect(3, i)
        my = rect(4, i)
        mz = rect(5, i)
        nx = (rect(3, i) + rect(6, i)) / 2
        ny = (rect(4, i) + rect(7, i)) / 2
        nz = (rect(5, i) + rect(8, i)) / 2
        Call AddRect(bx, by, bz, mx, my, mz, nx, ny, nz, cx, cy, cz, QBRef)
        'third
        ox = rect(6, i)
        oy = rect(7, i)
        oz = rect(8, i)
        Dx = (rect(6, i) + rect(9, i)) / 2
        Dy = (rect(7, i) + rect(10, i)) / 2
        dz = (rect(8, i) + rect(11, i)) / 2
        Call AddRect(cx, cy, cz, nx, ny, nz, ox, oy, oz, Dx, Dy, dz, QBRef)
        'fourth
        Ax = (rect(9, i) + rect(0, i)) / 2
        ay = (rect(10, i) + rect(1, i)) / 2
        az = (rect(11, i) + rect(2, i)) / 2
        px = rect(9, i)
        py = rect(10, i)
        pz = rect(11, i)
        Call AddRect(Ax, ay, az, cx, cy, cz, Dx, Dy, dz, px, py, pz, QBRef)
        Call KillRect(i)
        Exit For
    Next i
Next q
End Sub
Sub KillRect(RectNum)
Dim i As Integer
For i = RectNum To 1098
    For x = 0 To 11
        rect(x, i) = rect(x, i + 1)
    Next x
Next i
DoEvents
End Sub
Sub InitRect()
rect(0, 0) = 0
rect(1, 0) = 0
rect(2, 0) = 0

rect(3, 0) = 0
rect(4, 0) = 1
rect(5, 0) = 0

rect(6, 0) = 1
rect(7, 0) = 1
rect(8, 0) = 0

rect(9, 0) = 1
rect(10, 0) = 0
rect(11, 0) = 0

rect(0, 1) = -1
DoEvents
End Sub
Sub AddRect(Ax, ay, az, bx, by, bz, cx, cy, cz, Dx, Dy, dz, QBRef)

scalefactor = 0.3
For i = 0 To 1099
    If rect(0, i) = -1 Then
        rect(0, i + 1) = -1
        rect(0, i) = Ax
        rect(1, i) = ay
        rect(2, i) = az
        rect(3, i) = bx
        rect(4, i) = by
        rect(5, i) = bz
        rect(6, i) = cx
        rect(7, i) = cy
        rect(8, i) = cz
        rect(9, i) = Dx
        rect(10, i) = Dy
        rect(11, i) = dz
        Form1.Line (rect(0, i) + rect(1, i) * scalefactor, 1.5 - rect(1, i) + rect(2, i))-(rect(3, i) + rect(4, i) * scalefactor, 1.5 - rect(4, i) + rect(5, i)), QBRef
        Form1.Line (rect(3, i) + rect(4, i) * scalefactor, 1.5 - rect(4, i) + rect(5, i))-(rect(6, i) + rect(7, i) * scalefactor, 1.5 - rect(7, i) + rect(8, i)), QBRef
        Form1.Line (rect(6, i) + rect(7, i) * scalefactor, 1.5 - rect(7, i) + rect(8, i))-(rect(9, i) + rect(10, i) * scalefactor, 1.5 - rect(10, i) + rect(11, i)), QBRef
        Form1.Line (rect(9, i) + rect(10, i) * scalefactor, 1.5 - rect(10, i) + rect(11, i))-(rect(0, i) + rect(1, i) * scalefactor, 1.5 - rect(1, i) + rect(2, i)), QBRef
        DoEvents
        Exit Sub
    End If
Next i
End Sub
Sub RandomIFS()

Form1.Cls
Randomize Timer
Dim Attractors(2, 50) 'As Single
Dim x As Single
Dim y As Single
Dim xa As Single
Dim ya As Single
Dim i As Integer
Dim c As Long
Dim QBRef As Long
QBRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleMode = 3
numofpoints = Int(Rnd(1) * 27) + 3
For i = 0 To numofpoints
    Attractors(0, i) = Rnd(1) * Form1.ScaleWidth
    Attractors(1, i) = Rnd(1) * Form1.ScaleHeight
    Attractors(2, i) = (Rnd(1) / 2) + 0.5
    Form1.PSet (Attractors(0, i), Attractors(2, i)), QBRef
Next i
x = Form1.ScaleWidth / 2
y = Form1.ScaleHeight / 2
For c = 1 To 400000
    If Rnd(1) > 0.95 Then DoEvents
    i = Int(Rnd(1) * (numofpoints + 1))
    xa = x - Attractors(0, i)
    ya = y - Attractors(1, i)
    xa = xa * Attractors(2, i)
    ya = ya * Attractors(2, i)
    x = x - xa
    y = y - ya
    Form1.PSet (x, y), QBRef
Next c
End Sub
Sub Bagula1(poi, it)

Dim x As Single
Dim y As Single
Dim c As Single
Dim d As Single
Dim s1 As Single
Dim s2 As Single
Dim a(120) As Single, b(120) As Single
Dim k As Single
Dim af As Single
Dim i As Integer
Dim m As Integer
Dim QBRef As Long
QBRef = Int(Rnd(1) * 256 * 256 * 256)
m = it
Form1.ScaleWidth = 785
Form1.ScaleHeight = 565
af = 1 / Sqr(6)
x = 0
y = 0
c = 0
d = 0
s1 = 320
s2 = s1 * 565 / 785
Randomize
pi = 3.14159
For i = 1 To m
    a(i) = Sin(2 * pi * i / m)
    b(i) = Cos(2 * pi * i / m)
Next i
For i = 1 To m
    a(i + m) = (a(1 + (i Mod m)) + a(1 + ((i + 1) Mod m))) / 2
    b(i + m) = (b(1 + (i Mod m)) + b(1 + ((i + 1) Mod m))) / 2
Next i
For N = 1 To poi
    c = Rnd(1)
    d = Rnd(1)
    k = 1 + Int(m * d)
    If c <= 0.5 Then
        x1 = af * (x - a(k)) + a(k)
        Y1 = af * (y - b(k)) + b(k)
    End If
If c <= 1 And c >= 0.5 Then
     x1 = (1 - 2 * af) * (x - a(m + k)) + a(m + k)
     Y1 = (1 - 2 * af) * (y - b(m + k)) + b(m + k)
End If
 x = x1
 y = Y1
    If N > 10 Then
        Form1.PSet (785 / 2 + s1 * x, 565 / 2 + s2 * y), QBRef
        If Rnd(1) > 0.99 Then DoEvents
    End If
Next N
End Sub
Sub GoHilbert()

Form1.ScaleWidth = 511
Form1.ScaleHeight = 340
Let Step = 128
Let xbase = 256 - Step
Let ybase = 170 - Step
Do While Step > 4
   x = xbase + Step / 2
   y = ybase + Step / 2
   Level = Level + 1
   Form1.Cls 'put this line in to only show complete curve
   Call hilbert(0, Step, Step, 0, Level)
   Form1.Line -(x, y), QBColor(15)
   Step = Step / 2
Loop
End Sub
Sub drawh(xs, ys)

    Form1.Line -(x, y), QBColor(15)
    x = x + xs
    y = y + ys
End Sub
Sub hilbert(xs, ys, x2, y2, lev)
    If lev = 0 Then Exit Sub
    Call hilbert(x2, y2, xs, ys, lev - 1)
    Call drawh(xs, ys)
    Call hilbert(xs, ys, x2, y2, lev - 1)
    Call drawh(x2, y2)
    Call hilbert(xs, ys, x2, y2, lev - 1)
    Call drawh(-xs, -ys)
    Call hilbert(-x2, -y2, -xs, -ys, lev - 1)
End Sub

