Attribute VB_Name = "Module1"
Public RunMode As Integer '1 is config, 0 as screensave
Public escape As Boolean
Public OldX
Public OldY
Declare Function GetWindowsDirectory& Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long)
Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Declare Sub SetCursorPos Lib "User32" (ByVal x As Integer, ByVal y As Integer)
Public Function GetWinDir()
Dim wWinDir As String
Dim wRet As Long
wWinDir = "                    "
wRet = GetWindowsDirectory(wWinDir, 20)
GetWinDir = LEFT$(Trim(wWinDir), wRet)
End Function
Public Sub Ross(it)

Dim a As Single
Dim b As Single
Dim c As Single
Dim x As Single
Dim y As Single
Dim z As Single
Dim Dx As Single
Dim Dy As Single
Dim dz As Single
Dim delta As Single
Dim i As Long
Dim QBColRef As Long
QBColRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleWidth = 30
Form1.ScaleHeight = 90
delta = 0.005
a = 0.2
b = 0.2
c = 5.7
x = -10
y = -1
z = -1
For i = 1 To it
    If Rnd(1) > 0.995 Then
        If escape Then Exit Sub
        DoEvents
    End If
    Dx = -(y + z)
    Dy = x + y * a
    dz = b + z * (x - c)
    x = x + delta * Dx
    y = y + delta * Dy
    z = z + delta * dz
    Form1.Line -(x + 15, (70 - (y + z + z))), QBColRef
Next i
End Sub
Public Sub Henon(it)

Dim x As Single
Dim y As Single
Dim r As Single
Dim i As Long
Dim QBRef As Long
QBRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleWidth = 640
Form1.ScaleHeight = 480
x = 1
y = 1

For i = 1 To it
    If Rnd(1) > 0.995 Then
        If escape Then Exit Sub
        DoEvents
    End If
    r = y
    y = 0.3 * x
    x = r + 1 - (1.4 * (x ^ 2))
    Form1.PSet (x * 250 + 300, 480 - (y * 600 + 200)), QBRef
Next i
End Sub
Public Sub OneDCA()

Form1.ScaleMode = 3
Form1.PSet (0, 5), QBColor(15)
For y = 6 To Form1.ScaleHeight
    DoEvents
    For x = 0 To y
        If Form1.Point(x - 1, y - 1) = QBColor(15) Then a$ = "1" Else a$ = "0"
        If Form1.Point(x, y - 1) = QBColor(15) Then a$ = a$ + "1" Else a$ = a$ + "0"
        If a$ = "00" Then Form1.PSet (x, y), QBColor(0)
        If a$ = "01" Then Form1.PSet (x, y), QBColor(15)
        If a$ = "10" Then Form1.PSet (x, y), QBColor(15)
        If a$ = "11" Then Form1.PSet (x, y), QBColor(0)
    Next x
Next y
End Sub
Public Sub OneDCA3()

Dim x As Integer
Dim y As Integer
Dim m As Integer
Dim l As Integer
Dim r As Integer
Dim QBRef As Long
QBRef = Int(Rnd(1) * 256 * 256 * 256)
Dim Cells(60 * 60 / 3, 1) As Integer

Form1.ScaleMode = 3
For i = 0 To Form1.ScaleWidth
    If Rnd(1) > 0.5 Then Cells(i, 0) = 1 Else Cells(i, 0) = 0
Next i

For y = 0 To Form1.ScaleHeight
    If Rnd(1) > 0.9 Then DoEvents
    If Rnd(1) > 0.5 Then l = 1 Else l = 0
    m = Cells(1, 0)
    r = Cells(2, 0)
    For x = 1 To Form1.ScaleWidth - 1
        a = l + m + r
        If a = 2 Or a = 1 Then
            Cells(x, 1) = 1
            Form1.PSet (x, y), QBRef
        Else
            Cells(x, 1) = 0
        End If
        l = m
        m = r
        r = Cells(x + 1, 0)
    Next x
    For x = 0 To Form1.ScaleWidth
        Cells(x, 0) = Cells(x, 1)
    Next x
Next y
End Sub
Sub Feigenbaum()

On Error GoTo FRED
Dim i As Integer
Dim x As Single
Dim y As Single
Dim QBRef As Long
Dim lamb As Single
QBRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleWidth = 1024
Form1.ScaleHeight = 1
y = 0
x = 0.3
lamb = 2.4

Do
    lamb = lamb + 0.0015
    If Rnd(1) > 0.95 Then
        If escape Then End
        DoEvents
    End If
    For i = 1 To 100
        x = lamb * x * (1 - x)
        Form1.PSet (y, x), QBRef
    Next i
    y = y + 1
Loop
FRED:
End Sub
Sub Lorentz(it)

Dim a As Single
Dim b As Single
Dim c As Single
Dim x As Single
Dim y As Single
Dim z As Single
Dim Dx As Single
Dim Dy As Single
Dim dz As Single
Dim delta As Single
Dim QBRef As Long
QBRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleWidth = 60
Form1.ScaleHeight = 100
a = 10
b = 28
c = 8 / 3
x = 1
y = 1
z = 1
delta = 0.01

For i = 1 To it
    If Rnd(1) > 0.995 Then
        DoEvents
        If escape Then End
    End If
    Dx = a * (y - x)
    Dy = b * x - y - x * z
    dz = x * y - c * z
    x = x + delta * Dx
    y = y + delta * Dy
    z = z + delta * dz
    Form1.Line -(x + 30, z + 30), QBRef
Next i
End Sub
Sub Organic(it)

Dim i As Long
Dim QBRef As Long
QBRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleWidth = 520
Form1.ScaleHeight = 510
xold = 0
yold = 0
a = -137
b = 17
c = -4

For i = 1 To it
    If Rnd(1) > 0.995 Then
        If escape Then Exit Sub
        DoEvents
    End If
    Form1.PSet (xold + 305, yold + 310), QBRef
    If xold = 0 Then xnew = yold - 0 * Sqr(Abs(b * xold - c))
    If xold > 0 Then xnew = yold - 1 * Sqr(Abs(b * xold - 1))
    If xold < 0 Then xnew = yold + 1 * Sqr(Abs(b * xold - c))
    ynew = a - xold
    xold = xnew
    yold = ynew
Next i

End Sub
Sub Bird()

Dim aa As Single
Dim b As Single
Dim c As Single
Dim x As Single
Dim y As Single
Dim w As Single
Dim N As Long
Dim p As Long
Dim u As Single
Dim QBRef As Long
QBRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleWidth = 20
Form1.ScaleHeight = 16
aa = -0.48
b = 0.93
p = 90000
c = 2 - 2 * aa
x = 3
y = 0
w = aa * x + c * (x * x) / (1 + x * x)
For N = 0 To p
    If Rnd(1) > 0.995 Then
        If escape Then Exit Sub
        DoEvents
    End If
    Form1.PSet (x + 8, y + 10), QBRef
    z = x
    x = b * y + w
    u = x * x
    w = aa * x + c * u / (1 + u)
    y = w - z
Next N
End Sub
Sub Rnd1DCA()

Form1.ScaleMode = 3
gimp = Rnd(1)
For i = 0 To Form1.ScaleWidth
    If Rnd(1) > gimp Then Form1.PSet (i, 5), QBColor(15)
Next i
For y = 6 To Form1.ScaleHeight
    DoEvents
    For x = 0 To Form1.ScaleWidth
        If Form1.Point(x - 1, y - 1) = QBColor(15) Then s$ = "1" Else s$ = "0"
        If Form1.Point(x, y - 1) = QBColor(15) Then s$ = s$ + "1" Else s$ = s$ + "0"
        If s$ = "00" Then Form1.PSet (x, y), 0
        If s$ = "11" Then Form1.PSet (x, y), 0
        If s$ = "01" Then If Rnd(1) > 0.2 Then Form1.PSet (x, y), QBColor(15)
        If s$ = "10" Then If Rnd(1) > 0.2 Then Form1.PSet (x, y), QBColor(15)
    Next x
Next y
End Sub
Sub PascalsTriangle()

Form1.ScaleMode = 3
QBRef = Int(Rnd(1) * 256 * 256 * 256)
a = Form1.ScaleWidth
Dim c(1024), lut(3)
w = Form1.ScaleWidth
If Rnd(1) > 0.5 Then gimp = 1 Else gimp = 0
For x = 1 To w / 2
    c(x) = 0
Next x
N = Rnd(1) * 40
N = N - 40
N = Int(N)
c(1) = 1: c(10) = 1
c(6) = 1
If N < 2 Then GoTo 100
For y = 2 To Form1.ScaleHeight
    c0 = 0
    DoEvents
    For x = 1 To Form1.ScaleWidth
        c1 = c(x)
        c(x) = (c0 + c1) Mod N
        c0 = c1
        If c(x) <> 0 Then Form1.PSet (x, y), QBRef
    Next x
Next y
Exit Sub
100
lut(0) = 1: lut(1) = 0
lut(2) = 0: lut(3) = 1
For y = 2 To Form1.ScaleHeight
    DoEvents
    c0 = 0
    For x = 1 To Form1.ScaleWidth
        c1 = c(x)
        c(x) = lut(2 * c0 + c1)
        c0 = c1
        If c(x) <> 0 Then Form1.PSet (x, y), QBRef
    Next x
Next y
End Sub
Sub GameOfLife()

Form1.ScaleMode = 3
gimp = Rnd(1)
For i = 0 To 10000
    Form1.PSet (Rnd(1) * Form1.ScaleWidth, Rnd(1) * Form1.ScaleHeight), QBColor(15)
Next i
For i = 1 To 4
    For y = 0 To Form1.ScaleHeight
        DoEvents
        For x = 0 To Form1.ScaleWidth
            c = 0
            If Form1.Point(x - 1, y - 1) = QBColor(15) Then c = c + 1
            If Form1.Point(x, y - 1) = QBColor(15) Then c = c + 1
            If Form1.Point(x + 1, y - 1) = QBColor(15) Then c = c + 1
            If Form1.Point(x - 1, y) = QBColor(15) Then c = c + 1
            If Form1.Point(x + 1, y) = QBColor(15) Then c = c + 1
            If Form1.Point(x + 1, y + 1) = QBColor(15) Then c = c + 1
            If Form1.Point(x, y + 1) = QBColor(15) Then c = c + 1
            If Form1.Point(x - 1, y + 1) = QBColor(15) Then c = c + 1
            If c = 2 Or c = 3 Then Form1.PSet (x, y), QBColor(15) Else Form1.PSet (x, y), QBColor(0)
        Next x
    Next y
Next i
End Sub
Sub OneIn8(rule, pcent)

rule = 4
Dim HeightRef As Long
Dim WidthRef As Long
Dim QBRef As Long
Dim tl As Integer
Dim t As Integer
Dim tr As Integer
Dim l As Integer
Dim m As Integer
Dim r As Integer
Dim bl As Integer
Dim b As Integer
Dim br As Integer
QBRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleMode = 3
HeightRef = Form1.ScaleHeight
WidthRef = Form1.ScaleWidth
gimp = Rnd(1)
DoEvents
For i = 1 To WidthRef * HeightRef * pcent
    If i / 100 = Int(i / 100) Then DoEvents
    Form1.PSet (WidthRef * Rnd(1), HeightRef * Rnd(1)), QBRef
Next i
For y = 0 To HeightRef
    If Rnd(1) > 0.7 Then DoEvents
    For x = 0 To WidthRef
        tl = t
        t = tr
        bl = b
        b = br
        l = m
        m = r
        If Form1.Point(x + 1, y - 1) = 0 Then tr = 0 Else tr = 1
        If Form1.Point(x + 1, y) = 0 Then r = 0 Else r = 1
        If Form1.Point(x + 1, y + 1) = 0 Then br = 0 Else br = 1
        If tl + t + tr + l + r + bl + b + br + m > rule Then
            Form1.PSet (x, y), QBRef
        Else
            Form1.PSet (x, y), 0
        End If
    Next x
Next y
End Sub
Sub Dendritic()

Form1.Cls
Dim e As Integer
Dim i As Integer
Dim c As Integer
Dim x As Integer
Dim y As Integer
Dim QBRef As Long
Dim HeightRef As Integer
Dim WidthRef As Integer
Dim MaxWidth As Integer
Dim MinWidth As Integer
deviation = 512
Form1.ScaleMode = 3
HeightRef = Form1.ScaleHeight
WidthRef = Form1.ScaleWidth
MaxWidth = WidthRef / 2 + deviation
MinWidth = WidthRef / 2 - deviation
QBRef = QBColor(Int(Rnd(1) * 14) + 1) 'Int(Rnd(1) * 256 * 256 * 256)

Form1.Line (0, Form1.ScaleHeight - 20)-(Form1.ScaleWidth, Form1.ScaleHeight - 20), QBRef
For e = 1 To HeightRef
    For i = 1 To WidthRef / 4
            y = HeightRef - 23 - e
            If y > Form1.ScaleHeight + 1 Then Exit Sub
            x = Rnd(1) * WidthRef
        Do
            c = 0
            If Form1.Point(x - 1, y - 1) = QBRef Then c = c + 1
            If Form1.Point(x, y - 1) = QBRef Then c = c + 1
            If Form1.Point(x + 1, y - 1) = QBRef Then c = c + 1
            If Form1.Point(x - 1, y) = QBRef Then c = c + 1
            If Form1.Point(x + 1, y) = QBRef Then c = c + 1
            If Form1.Point(x + 1, y + 1) = QBRef Then c = c + 1
            If Form1.Point(x, y + 1) = QBRef Then c = c + 1
            If Form1.Point(x - 1, y + 1) = QBRef Then c = c + 1
            If Form1.Point(x, y) = QBRef Then c = c + 1
            If c > 0 Then
                Form1.PSet (x, y), QBRef
                DoEvents
                Exit Do
            End If
            If Rnd(1) > 0.5 Then x = x + 1 Else x = x - 1
            If x < 0 Then x = WidthRef
            If x > WidthRef Then x = 0
            y = y + 1
        Loop
    Next i
Next e
End Sub
Sub Binary()

QBRef = Int(Rnd(1) * 256 * 256 * 256)
Form1.ScaleWidth = 2048
Form1.ScaleHeight = 2048
Dim q As Double
Dim y As Double
p% = 2
w% = 2
Main:
gimp = gimp + 1
If Rnd(1) > 0.98 Then DoEvents
If gimp = 400000 Then Exit Sub
p% = Int(Rnd(1) * 256)
w% = Int(Rnd(1) * 256)
a = p%
b = w%
        If p% / 128 >= 1 Then
        t = t + 1
        p% = p% - 128
        End If

        If p% / 64 >= 1 Then
        t = t + 1
        p% = p% - 64
        End If

        If p% / 32 >= 1 Then
        t = t + 1
        p% = p% - 32
        End If
      
        If p% / 16 >= 1 Then
        t = t + 1
        p% = p% - 16
        End If

        If p% / 8 >= 1 Then
        t = t + 1
        p% = p% - 8
        End If

        If p% / 4 >= 1 Then
        t = t + 1
        p% = p% - 4
        End If
      
        If p% / 2 >= 1 Then
        t = t + 1
        p% = p% - 2
        End If
      
        If p% / 1 >= 1 Then
        t = t + 1
        p% = p% - 1
        End If
If a = 0 Then a = 100
If t = 0 Then t = 5
q = (a + t) * t
t = 0
       
        If w% / 128 >= 1 Then
        t = t + 1
        w% = w% - 128
        End If

        If w% / 64 >= 1 Then
        t = t + 1
        w% = w% - 64
        End If

        If w% / 32 >= 1 Then
        t = t + 1
        w% = w% - 32
        End If
     
        If w% / 16 >= 1 Then
        t = t + 1
        w% = w% - 16
        End If

        If w% / 8 >= 1 Then
        t = t + 1
        w% = w% - 8
        End If

        If w% / 4 >= 1 Then
        t = t + 1
        w% = w% - 4
        End If
     
        If w% / 2 >= 1 Then
        t = t + 1
        w% = w% - 2
        End If
     
        If w% / 1 >= 1 Then
        t = t + 1
        w% = w% - 1
        End If

If b = 0 Then b = 100
If t = 0 Then t = 5
y = (b + t) * t
Form1.PSet (q, y), QBRef
t = 0
GoTo Main
End Sub
Sub OneIn8Pageflip(ip)

Dim QBRef As Long
Dim c As Integer
Dim WidthRef As Integer
Dim HeightRef As Integer
Dim it As Integer
Dim x As Integer
Dim y As Integer
Dim i As Integer
QBRef = QBColor(Int(Rnd(1) * 14) + 1) 'Int(Rnd(1) * 256 * 256 * 256)
it = ip
Form1.ScaleMode = 3
Form3.ScaleMode = 3
WidthRef = Form3.ScaleWidth / 2
HeightRef = Form3.ScaleHeight / 2
Form3.Cls
Form3.PSet (Form3.ScaleWidth / 2, Form3.ScaleHeight / 2), QBRef
DoEvents
For i = 2 To ip
    DoEvents
    For y = HeightRef - i To HeightRef + i
        For x = WidthRef - i To WidthRef + i
            If Form3.Point(x - 1, y - 1) = QBRef Then c = 1 Else c = 0
            If Form3.Point(x, y - 1) = QBRef Then c = c + 1
            If Form3.Point(x + 1, y - 1) = QBRef Then c = c + 1
            If Form3.Point(x - 1, y) = QBRef Then c = c + 1
            If Form3.Point(x + 1, y) = QBRef Then c = c + 1
            If Form3.Point(x + 1, y + 1) = QBRef Then c = c + 1
            If Form3.Point(x, y + 1) = QBRef Then c = c + 1
            If Form3.Point(x - 1, y + 1) = QBRef Then c = c + 1
            If Form3.Point(x, y) = QBRef Then c = c + 1
            If c = 1 Then Form1.PSet (x, y), QBRef
        Next x
    Next y
    For y = HeightRef - i To HeightRef + i
        For x = WidthRef - i To WidthRef + i
            Form3.PSet (x, y), Form1.Point(x, y)
        Next x
    Next y
Next i
End Sub
