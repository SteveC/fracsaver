VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form Form2 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "FracSaver - Setup"
   ClientHeight    =   5220
   ClientLeft      =   810
   ClientTop       =   330
   ClientWidth     =   11100
   Icon            =   "Form2.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5220
   ScaleWidth      =   11100
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Text36 
      BorderStyle     =   0  'None
      Height          =   1740
      Left            =   7200
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   17
      Text            =   "Form2.frx":030A
      Top             =   2880
      Width           =   2295
   End
   Begin VB.CommandButton Command47 
      Appearance      =   0  'Flat
      Caption         =   "Information"
      Height          =   255
      Left            =   6960
      TabIndex        =   16
      Top             =   2280
      Width           =   4095
   End
   Begin VB.Timer Timer1 
      Interval        =   50
      Left            =   13080
      Top             =   -120
   End
   Begin VB.CommandButton Command28 
      Caption         =   "Delete from list"
      Height          =   855
      Left            =   9840
      TabIndex        =   15
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   615
      Left            =   9840
      TabIndex        =   4
      Top             =   4560
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Save && Close"
      Height          =   855
      Left            =   9840
      TabIndex        =   3
      Top             =   3600
      Width           =   1215
   End
   Begin VB.ListBox List1 
      Height          =   2010
      Left            =   6960
      TabIndex        =   1
      Top             =   240
      Width           =   4095
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   5175
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6855
      _ExtentX        =   12091
      _ExtentY        =   9128
      _Version        =   393216
      TabOrientation  =   1
      Style           =   1
      Tabs            =   18
      TabsPerRow      =   10
      TabHeight       =   520
      TabCaption(0)   =   "About"
      TabPicture(0)   =   "Form2.frx":0311
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Label73"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "Label66"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "Label65"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "Label17"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "Label53"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).Control(5)=   "Image2"
      Tab(0).Control(5).Enabled=   0   'False
      Tab(0).Control(6)=   "Image5"
      Tab(0).Control(6).Enabled=   0   'False
      Tab(0).Control(7)=   "Label62"
      Tab(0).Control(7).Enabled=   0   'False
      Tab(0).Control(8)=   "Command52"
      Tab(0).Control(8).Enabled=   0   'False
      Tab(0).Control(9)=   "Command51"
      Tab(0).Control(9).Enabled=   0   'False
      Tab(0).Control(10)=   "Text34"
      Tab(0).Control(10).Enabled=   0   'False
      Tab(0).Control(11)=   "Text28"
      Tab(0).Control(11).Enabled=   0   'False
      Tab(0).Control(12)=   "Picture1"
      Tab(0).Control(12).Enabled=   0   'False
      Tab(0).Control(13)=   "Command53"
      Tab(0).Control(13).Enabled=   0   'False
      Tab(0).Control(14)=   "Command54"
      Tab(0).Control(14).Enabled=   0   'False
      Tab(0).ControlCount=   15
      TabCaption(1)   =   "Dynamic"
      TabPicture(1)   =   "Form2.frx":032D
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "Label25"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "Label11"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).Control(2)=   "Label2"
      Tab(1).Control(2).Enabled=   0   'False
      Tab(1).Control(3)=   "Label5"
      Tab(1).Control(3).Enabled=   0   'False
      Tab(1).Control(4)=   "Label4"
      Tab(1).Control(4).Enabled=   0   'False
      Tab(1).Control(5)=   "Label32"
      Tab(1).Control(5).Enabled=   0   'False
      Tab(1).Control(6)=   "Command35"
      Tab(1).Control(6).Enabled=   0   'False
      Tab(1).Control(7)=   "Command9"
      Tab(1).Control(7).Enabled=   0   'False
      Tab(1).Control(8)=   "Text4"
      Tab(1).Control(8).Enabled=   0   'False
      Tab(1).Control(9)=   "Command3"
      Tab(1).Control(9).Enabled=   0   'False
      Tab(1).Control(10)=   "Text1"
      Tab(1).Control(10).Enabled=   0   'False
      Tab(1).Control(11)=   "Command4"
      Tab(1).Control(11).Enabled=   0   'False
      Tab(1).Control(12)=   "Text3"
      Tab(1).Control(12).Enabled=   0   'False
      Tab(1).Control(13)=   "Command8"
      Tab(1).Control(13).Enabled=   0   'False
      Tab(1).ControlCount=   14
      TabCaption(2)   =   "Curves"
      TabPicture(2)   =   "Form2.frx":0349
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "Label26"
      Tab(2).Control(0).Enabled=   0   'False
      Tab(2).Control(1)=   "Label6"
      Tab(2).Control(1).Enabled=   0   'False
      Tab(2).Control(2)=   "Label83"
      Tab(2).Control(2).Enabled=   0   'False
      Tab(2).Control(3)=   "Text9"
      Tab(2).Control(3).Enabled=   0   'False
      Tab(2).Control(4)=   "Command19"
      Tab(2).Control(4).Enabled=   0   'False
      Tab(2).Control(5)=   "Command42"
      Tab(2).Control(5).Enabled=   0   'False
      Tab(2).ControlCount=   6
      TabCaption(3)   =   "Grid"
      TabPicture(3)   =   "Form2.frx":0365
      Tab(3).ControlEnabled=   0   'False
      Tab(3).Control(0)=   "Label18"
      Tab(3).Control(0).Enabled=   0   'False
      Tab(3).Control(1)=   "Label12"
      Tab(3).Control(1).Enabled=   0   'False
      Tab(3).Control(2)=   "Label10"
      Tab(3).Control(2).Enabled=   0   'False
      Tab(3).Control(3)=   "Label85"
      Tab(3).Control(3).Enabled=   0   'False
      Tab(3).Control(4)=   "Label59"
      Tab(3).Control(4).Enabled=   0   'False
      Tab(3).Control(5)=   "Command46"
      Tab(3).Control(5).Enabled=   0   'False
      Tab(3).Control(6)=   "Command43"
      Tab(3).Control(6).Enabled=   0   'False
      Tab(3).Control(7)=   "Command44"
      Tab(3).Control(7).Enabled=   0   'False
      Tab(3).Control(8)=   "Command55"
      Tab(3).Control(8).Enabled=   0   'False
      Tab(3).ControlCount=   9
      TabCaption(4)   =   "Binary"
      TabPicture(4)   =   "Form2.frx":0381
      Tab(4).ControlEnabled=   0   'False
      Tab(4).Control(0)=   "Label7"
      Tab(4).Control(0).Enabled=   0   'False
      Tab(4).Control(1)=   "Command6"
      Tab(4).Control(1).Enabled=   0   'False
      Tab(4).ControlCount=   2
      TabCaption(5)   =   "Randomized"
      TabPicture(5)   =   "Form2.frx":039D
      Tab(5).ControlEnabled=   0   'False
      Tab(5).Control(0)=   "Label8"
      Tab(5).Control(0).Enabled=   0   'False
      Tab(5).Control(1)=   "Label9"
      Tab(5).Control(1).Enabled=   0   'False
      Tab(5).Control(2)=   "Label49"
      Tab(5).Control(2).Enabled=   0   'False
      Tab(5).Control(3)=   "Command7"
      Tab(5).Control(3).Enabled=   0   'False
      Tab(5).Control(4)=   "Command31"
      Tab(5).Control(4).Enabled=   0   'False
      Tab(5).ControlCount=   5
      TabCaption(6)   =   "Snow"
      TabPicture(6)   =   "Form2.frx":03B9
      Tab(6).ControlEnabled=   0   'False
      Tab(6).Control(0)=   "Label35"
      Tab(6).Control(0).Enabled=   0   'False
      Tab(6).Control(1)=   "Label38"
      Tab(6).Control(1).Enabled=   0   'False
      Tab(6).Control(2)=   "Label37"
      Tab(6).Control(2).Enabled=   0   'False
      Tab(6).Control(3)=   "Label36"
      Tab(6).Control(3).Enabled=   0   'False
      Tab(6).Control(4)=   "Text15"
      Tab(6).Control(4).Enabled=   0   'False
      Tab(6).Control(5)=   "Command22"
      Tab(6).Control(5).Enabled=   0   'False
      Tab(6).Control(6)=   "Text17"
      Tab(6).Control(6).Enabled=   0   'False
      Tab(6).Control(7)=   "Command24"
      Tab(6).Control(7).Enabled=   0   'False
      Tab(6).Control(8)=   "Text16"
      Tab(6).Control(8).Enabled=   0   'False
      Tab(6).Control(9)=   "Command23"
      Tab(6).Control(9).Enabled=   0   'False
      Tab(6).ControlCount=   10
      TabCaption(7)   =   "IFS"
      TabPicture(7)   =   "Form2.frx":03D5
      Tab(7).ControlEnabled=   0   'False
      Tab(7).Control(0)=   "Label3"
      Tab(7).Control(0).Enabled=   0   'False
      Tab(7).Control(1)=   "Label48"
      Tab(7).Control(1).Enabled=   0   'False
      Tab(7).Control(2)=   "Label41"
      Tab(7).Control(2).Enabled=   0   'False
      Tab(7).Control(3)=   "Label72"
      Tab(7).Control(3).Enabled=   0   'False
      Tab(7).Control(4)=   "Label55"
      Tab(7).Control(4).Enabled=   0   'False
      Tab(7).Control(5)=   "Command15"
      Tab(7).Control(5).Enabled=   0   'False
      Tab(7).Control(6)=   "Command5"
      Tab(7).Control(6).Enabled=   0   'False
      Tab(7).Control(7)=   "Text18"
      Tab(7).Control(7).Enabled=   0   'False
      Tab(7).Control(8)=   "Command25"
      Tab(7).Control(8).Enabled=   0   'False
      Tab(7).Control(9)=   "Command33"
      Tab(7).Control(9).Enabled=   0   'False
      Tab(7).ControlCount=   10
      TabCaption(8)   =   "IFS 2"
      TabPicture(8)   =   "Form2.frx":03F1
      Tab(8).ControlEnabled=   0   'False
      Tab(8).Control(0)=   "Label19"
      Tab(8).Control(0).Enabled=   0   'False
      Tab(8).Control(1)=   "Label54"
      Tab(8).Control(1).Enabled=   0   'False
      Tab(8).Control(2)=   "Label13"
      Tab(8).Control(2).Enabled=   0   'False
      Tab(8).Control(3)=   "Label20"
      Tab(8).Control(3).Enabled=   0   'False
      Tab(8).Control(4)=   "Command32"
      Tab(8).Control(4).Enabled=   0   'False
      Tab(8).Control(5)=   "Text22"
      Tab(8).Control(5).Enabled=   0   'False
      Tab(8).Control(6)=   "Frame2"
      Tab(8).Control(6).Enabled=   0   'False
      Tab(8).Control(7)=   "Command10"
      Tab(8).Control(7).Enabled=   0   'False
      Tab(8).Control(8)=   "Text5"
      Tab(8).Control(8).Enabled=   0   'False
      Tab(8).Control(9)=   "Command16"
      Tab(8).Control(9).Enabled=   0   'False
      Tab(8).Control(10)=   "Text6"
      Tab(8).Control(10).Enabled=   0   'False
      Tab(8).ControlCount=   11
      TabCaption(9)   =   "IFS 3"
      TabPicture(9)   =   "Form2.frx":040D
      Tab(9).ControlEnabled=   0   'False
      Tab(9).Control(0)=   "Label24"
      Tab(9).Control(0).Enabled=   0   'False
      Tab(9).Control(1)=   "Label23"
      Tab(9).Control(1).Enabled=   0   'False
      Tab(9).Control(2)=   "Label51"
      Tab(9).Control(2).Enabled=   0   'False
      Tab(9).Control(3)=   "Label61"
      Tab(9).Control(3).Enabled=   0   'False
      Tab(9).Control(4)=   "Label60"
      Tab(9).Control(4).Enabled=   0   'False
      Tab(9).Control(5)=   "Label57"
      Tab(9).Control(5).Enabled=   0   'False
      Tab(9).Control(6)=   "Label58"
      Tab(9).Control(6).Enabled=   0   'False
      Tab(9).Control(7)=   "Command18"
      Tab(9).Control(7).Enabled=   0   'False
      Tab(9).Control(8)=   "Text8"
      Tab(9).Control(8).Enabled=   0   'False
      Tab(9).Control(9)=   "Command45"
      Tab(9).Control(9).Enabled=   0   'False
      Tab(9).Control(10)=   "Command36"
      Tab(9).Control(10).Enabled=   0   'False
      Tab(9).Control(11)=   "Text24"
      Tab(9).Control(11).Enabled=   0   'False
      Tab(9).Control(12)=   "Text23"
      Tab(9).Control(12).Enabled=   0   'False
      Tab(9).Control(13)=   "Command49"
      Tab(9).Control(13).Enabled=   0   'False
      Tab(9).Control(14)=   "Text2"
      Tab(9).Control(14).Enabled=   0   'False
      Tab(9).Control(15)=   "Command50"
      Tab(9).Control(15).Enabled=   0   'False
      Tab(9).ControlCount=   16
      TabCaption(10)  =   "Deterministic"
      TabPicture(10)  =   "Form2.frx":0429
      Tab(10).ControlEnabled=   0   'False
      Tab(10).Control(0)=   "Label15"
      Tab(10).Control(1)=   "Label52"
      Tab(10).Control(2)=   "Label43"
      Tab(10).Control(3)=   "Label42"
      Tab(10).Control(4)=   "Label44"
      Tab(10).Control(5)=   "Label14"
      Tab(10).Control(6)=   "Command12"
      Tab(10).Control(7)=   "Command26"
      Tab(10).Control(8)=   "Text19"
      Tab(10).Control(9)=   "Command27"
      Tab(10).Control(10)=   "Command11"
      Tab(10).Control(11)=   "Command14"
      Tab(10).ControlCount=   12
      TabCaption(11)  =   "CAs"
      TabPicture(11)  =   "Form2.frx":0445
      Tab(11).ControlEnabled=   0   'False
      Tab(11).Control(0)=   "Label40"
      Tab(11).Control(1)=   "Label50"
      Tab(11).Control(2)=   "Label39"
      Tab(11).Control(3)=   "Label64"
      Tab(11).Control(4)=   "Label34"
      Tab(11).Control(5)=   "Label56"
      Tab(11).Control(6)=   "Command30"
      Tab(11).Control(7)=   "Text21"
      Tab(11).Control(8)=   "Command38"
      Tab(11).Control(9)=   "Command37"
      Tab(11).Control(10)=   "Text25"
      Tab(11).Control(11)=   "Command34"
      Tab(11).ControlCount=   12
      TabCaption(12)  =   "Majority"
      TabPicture(12)  =   "Form2.frx":0461
      Tab(12).ControlEnabled=   0   'False
      Tab(12).Control(0)=   "Label47"
      Tab(12).Control(1)=   "Label46"
      Tab(12).Control(2)=   "Label45"
      Tab(12).Control(3)=   "Command29"
      Tab(12).Control(4)=   "Text20"
      Tab(12).Control(5)=   "Frame1"
      Tab(12).ControlCount=   6
      TabCaption(13)  =   "Mandel"
      TabPicture(13)  =   "Form2.frx":047D
      Tab(13).ControlEnabled=   0   'False
      Tab(13).Control(0)=   "Label31"
      Tab(13).Control(1)=   "Label30"
      Tab(13).Control(2)=   "Label29"
      Tab(13).Control(3)=   "Label28"
      Tab(13).Control(4)=   "Label27"
      Tab(13).Control(5)=   "Text13"
      Tab(13).Control(6)=   "Text12"
      Tab(13).Control(7)=   "Text11"
      Tab(13).Control(8)=   "Text10"
      Tab(13).Control(9)=   "Command20"
      Tab(13).ControlCount=   10
      TabCaption(14)  =   "Carpet"
      TabPicture(14)  =   "Form2.frx":0499
      Tab(14).ControlEnabled=   0   'False
      Tab(14).Control(0)=   "Label76"
      Tab(14).Control(1)=   "Label75"
      Tab(14).Control(2)=   "Label74"
      Tab(14).Control(3)=   "Label16"
      Tab(14).Control(4)=   "Text29"
      Tab(14).Control(5)=   "Command40"
      Tab(14).Control(6)=   "Command13"
      Tab(14).ControlCount=   7
      TabCaption(15)  =   "Gasket"
      TabPicture(15)  =   "Form2.frx":04B5
      Tab(15).ControlEnabled=   0   'False
      Tab(15).Control(0)=   "Label21"
      Tab(15).Control(0).Enabled=   0   'False
      Tab(15).Control(1)=   "Label22"
      Tab(15).Control(1).Enabled=   0   'False
      Tab(15).Control(2)=   "Label33"
      Tab(15).Control(2).Enabled=   0   'False
      Tab(15).Control(3)=   "Text7"
      Tab(15).Control(3).Enabled=   0   'False
      Tab(15).Control(4)=   "Command17"
      Tab(15).Control(4).Enabled=   0   'False
      Tab(15).Control(5)=   "Text14"
      Tab(15).Control(5).Enabled=   0   'False
      Tab(15).Control(6)=   "Command21"
      Tab(15).Control(6).Enabled=   0   'False
      Tab(15).ControlCount=   7
      TabCaption(16)  =   "ThrowPic"
      TabPicture(16)  =   "Form2.frx":04D1
      Tab(16).ControlEnabled=   0   'False
      Tab(16).Control(0)=   "Label70"
      Tab(16).Control(0).Enabled=   0   'False
      Tab(16).Control(1)=   "Label69"
      Tab(16).Control(1).Enabled=   0   'False
      Tab(16).Control(2)=   "Label68"
      Tab(16).Control(2).Enabled=   0   'False
      Tab(16).Control(3)=   "Label67"
      Tab(16).Control(3).Enabled=   0   'False
      Tab(16).Control(4)=   "Text27"
      Tab(16).Control(4).Enabled=   0   'False
      Tab(16).Control(5)=   "Text26"
      Tab(16).Control(5).Enabled=   0   'False
      Tab(16).Control(6)=   "Command39"
      Tab(16).Control(6).Enabled=   0   'False
      Tab(16).Control(7)=   "Drive1"
      Tab(16).Control(7).Enabled=   0   'False
      Tab(16).Control(8)=   "Dir1"
      Tab(16).Control(8).Enabled=   0   'False
      Tab(16).Control(9)=   "File1"
      Tab(16).Control(9).Enabled=   0   'False
      Tab(16).ControlCount=   10
      TabCaption(17)  =   "Boids"
      TabPicture(17)  =   "Form2.frx":04ED
      Tab(17).ControlEnabled=   0   'False
      Tab(17).Control(0)=   "Label82"
      Tab(17).Control(0).Enabled=   0   'False
      Tab(17).Control(1)=   "Label81"
      Tab(17).Control(1).Enabled=   0   'False
      Tab(17).Control(2)=   "Label80"
      Tab(17).Control(2).Enabled=   0   'False
      Tab(17).Control(3)=   "Label79"
      Tab(17).Control(3).Enabled=   0   'False
      Tab(17).Control(4)=   "Label78"
      Tab(17).Control(4).Enabled=   0   'False
      Tab(17).Control(5)=   "Label77"
      Tab(17).Control(5).Enabled=   0   'False
      Tab(17).Control(6)=   "Command41"
      Tab(17).Control(6).Enabled=   0   'False
      Tab(17).Control(7)=   "Text33"
      Tab(17).Control(7).Enabled=   0   'False
      Tab(17).Control(8)=   "Text32"
      Tab(17).Control(8).Enabled=   0   'False
      Tab(17).Control(9)=   "Text31"
      Tab(17).Control(9).Enabled=   0   'False
      Tab(17).Control(10)=   "Text30"
      Tab(17).Control(10).Enabled=   0   'False
      Tab(17).ControlCount=   11
      Begin VB.FileListBox File1 
         Height          =   1650
         Left            =   -71520
         Pattern         =   "*.jpg;*.bmp;*.gif;*.jpeg"
         TabIndex        =   192
         Top             =   1320
         Width           =   2655
      End
      Begin VB.DirListBox Dir1 
         Height          =   1440
         Left            =   -73560
         TabIndex        =   191
         Top             =   1320
         Width           =   1935
      End
      Begin VB.DriveListBox Drive1 
         Height          =   315
         Left            =   -73560
         TabIndex        =   190
         Top             =   2760
         Width           =   1935
      End
      Begin VB.CommandButton Command55 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70200
         TabIndex        =   189
         Top             =   3000
         Width           =   1215
      End
      Begin VB.CommandButton Command50 
         Caption         =   "Add to list"
         Height          =   375
         Left            =   -70080
         TabIndex        =   187
         Top             =   3120
         Width           =   1215
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   -73200
         TabIndex        =   184
         Text            =   "Text2"
         Top             =   2640
         Width           =   3015
      End
      Begin VB.CommandButton Command49 
         Caption         =   "Add to list"
         Height          =   375
         Left            =   -70080
         TabIndex        =   183
         Top             =   2640
         Width           =   1215
      End
      Begin VB.CommandButton Command54 
         Caption         =   "M. Lichtenstein"
         Height          =   255
         Left            =   3960
         TabIndex        =   180
         Top             =   3720
         Width           =   1455
      End
      Begin VB.CommandButton Command53 
         Caption         =   "Roger L. Bagula"
         Height          =   255
         Left            =   3960
         TabIndex        =   179
         Top             =   3360
         Width           =   1455
      End
      Begin VB.TextBox Text30 
         Height          =   285
         Left            =   -70440
         TabIndex        =   172
         Text            =   "45"
         Top             =   1440
         Width           =   1335
      End
      Begin VB.TextBox Text31 
         Height          =   285
         Left            =   -70440
         TabIndex        =   171
         Text            =   "40"
         Top             =   1920
         Width           =   1335
      End
      Begin VB.TextBox Text32 
         Height          =   285
         Left            =   -70440
         TabIndex        =   170
         Text            =   ".4"
         Top             =   2400
         Width           =   1335
      End
      Begin VB.TextBox Text33 
         Height          =   285
         Left            =   -70440
         TabIndex        =   169
         Text            =   ".5"
         Top             =   2880
         Width           =   1335
      End
      Begin VB.CommandButton Command41 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70200
         TabIndex        =   168
         Top             =   3840
         Width           =   1215
      End
      Begin VB.CommandButton Command39 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70080
         TabIndex        =   163
         Top             =   3840
         Width           =   1215
      End
      Begin VB.TextBox Text26 
         Height          =   285
         Left            =   -73080
         TabIndex        =   162
         Top             =   3120
         Width           =   4215
      End
      Begin VB.TextBox Text27 
         Height          =   285
         Left            =   -71280
         TabIndex        =   161
         Text            =   "10"
         Top             =   3480
         Width           =   2415
      End
      Begin VB.CommandButton Command34 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70320
         TabIndex        =   154
         Top             =   930
         Width           =   1215
      End
      Begin VB.TextBox Text25 
         Height          =   285
         Left            =   -72600
         TabIndex        =   153
         Text            =   "Text25"
         Top             =   1650
         Width           =   2175
      End
      Begin VB.CommandButton Command37 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70320
         TabIndex        =   152
         Top             =   1650
         Width           =   1215
      End
      Begin VB.CommandButton Command38 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70320
         TabIndex        =   151
         Top             =   2370
         Width           =   1215
      End
      Begin VB.TextBox Text21 
         Height          =   285
         Left            =   -72840
         TabIndex        =   150
         Text            =   "Text21"
         Top             =   3090
         Width           =   2415
      End
      Begin VB.CommandButton Command30 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70320
         TabIndex        =   149
         Top             =   3090
         Width           =   1215
      End
      Begin VB.CommandButton Command13 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70200
         TabIndex        =   144
         Top             =   1200
         Width           =   1215
      End
      Begin VB.CommandButton Command40 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70200
         TabIndex        =   143
         Top             =   2760
         Width           =   1215
      End
      Begin VB.TextBox Text29 
         Height          =   285
         Left            =   -71640
         TabIndex        =   142
         Text            =   "5"
         Top             =   2880
         Width           =   1215
      End
      Begin VB.CommandButton Command20 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70200
         TabIndex        =   136
         Top             =   3840
         Width           =   1215
      End
      Begin VB.TextBox Text10 
         Enabled         =   0   'False
         Height          =   285
         Left            =   -74520
         TabIndex        =   135
         Text            =   "Text10"
         Top             =   1200
         Width           =   2775
      End
      Begin VB.TextBox Text11 
         Enabled         =   0   'False
         Height          =   285
         Left            =   -74520
         TabIndex        =   134
         Text            =   "Text11"
         Top             =   1680
         Width           =   2775
      End
      Begin VB.TextBox Text12 
         Enabled         =   0   'False
         Height          =   285
         Left            =   -74520
         TabIndex        =   133
         Text            =   "Text12"
         Top             =   2160
         Width           =   2775
      End
      Begin VB.TextBox Text13 
         Enabled         =   0   'False
         Height          =   285
         Left            =   -74520
         TabIndex        =   132
         Text            =   "Text13"
         Top             =   2640
         Width           =   2775
      End
      Begin VB.Frame Frame1 
         Caption         =   "Stay alive if more than x number of neighbours are alive"
         Height          =   1695
         Left            =   -74880
         TabIndex        =   122
         Top             =   1680
         Width           =   4335
         Begin VB.OptionButton Option1 
            Caption         =   "1"
            Height          =   255
            Left            =   240
            TabIndex        =   128
            Top             =   360
            Width           =   2295
         End
         Begin VB.OptionButton Option2 
            Caption         =   "2"
            Height          =   375
            Left            =   240
            TabIndex        =   127
            Top             =   720
            Width           =   1695
         End
         Begin VB.OptionButton Option3 
            Caption         =   "3"
            Height          =   375
            Left            =   240
            TabIndex        =   126
            Top             =   1200
            Width           =   975
         End
         Begin VB.OptionButton Option4 
            Caption         =   "4"
            Height          =   315
            Left            =   2040
            TabIndex        =   125
            Top             =   360
            Width           =   975
         End
         Begin VB.OptionButton Option5 
            Caption         =   "5"
            Height          =   255
            Left            =   2040
            TabIndex        =   124
            Top             =   840
            Width           =   615
         End
         Begin VB.OptionButton Option6 
            Caption         =   "6"
            Height          =   375
            Left            =   2040
            TabIndex        =   123
            Top             =   1200
            Width           =   735
         End
      End
      Begin VB.TextBox Text20 
         Height          =   285
         Left            =   -72720
         TabIndex        =   121
         Text            =   "Text20"
         Top             =   1200
         Width           =   2175
      End
      Begin VB.CommandButton Command29 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -71760
         TabIndex        =   120
         Top             =   3570
         Width           =   1215
      End
      Begin VB.TextBox Text23 
         Height          =   285
         Left            =   -73200
         TabIndex        =   117
         Text            =   "Text23"
         Top             =   1890
         Width           =   3015
      End
      Begin VB.TextBox Text24 
         Height          =   285
         Left            =   -73200
         TabIndex        =   116
         Text            =   "Text24"
         Top             =   2250
         Width           =   3015
      End
      Begin VB.CommandButton Command36 
         Caption         =   "Add to list"
         Height          =   615
         Left            =   -70080
         TabIndex        =   115
         Top             =   1890
         Width           =   1215
      End
      Begin VB.CommandButton Command45 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70080
         TabIndex        =   113
         Top             =   1290
         Width           =   1215
      End
      Begin VB.TextBox Text8 
         Height          =   285
         Left            =   -73200
         TabIndex        =   110
         Text            =   "Text8"
         Top             =   810
         Width           =   3015
      End
      Begin VB.CommandButton Command18 
         Caption         =   "Add to list"
         Height          =   375
         Left            =   -70080
         TabIndex        =   109
         Top             =   810
         Width           =   1215
      End
      Begin VB.TextBox Text6 
         Height          =   285
         Left            =   -73080
         TabIndex        =   105
         Text            =   "Text6"
         Top             =   840
         Width           =   2895
      End
      Begin VB.CommandButton Command16 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70080
         TabIndex        =   104
         Top             =   810
         Width           =   1215
      End
      Begin VB.TextBox Text5 
         Height          =   285
         Left            =   -73560
         TabIndex        =   103
         Text            =   "Text5"
         Top             =   1650
         Width           =   3375
      End
      Begin VB.CommandButton Command10 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70080
         TabIndex        =   102
         Top             =   1650
         Width           =   1215
      End
      Begin VB.Frame Frame2 
         Caption         =   "Number of sides:"
         Height          =   1815
         Left            =   -71640
         TabIndex        =   93
         Top             =   2490
         Width           =   1455
         Begin VB.OptionButton Option7 
            Caption         =   "3"
            Height          =   255
            Left            =   240
            TabIndex        =   101
            Top             =   240
            Width           =   495
         End
         Begin VB.OptionButton Option8 
            Caption         =   "4"
            Height          =   375
            Left            =   240
            TabIndex        =   100
            Top             =   600
            Width           =   495
         End
         Begin VB.OptionButton Option9 
            Caption         =   "5"
            Height          =   195
            Left            =   240
            TabIndex        =   99
            Top             =   1080
            Width           =   375
         End
         Begin VB.OptionButton Option10 
            Caption         =   "6"
            Height          =   255
            Left            =   240
            TabIndex        =   98
            Top             =   1440
            Width           =   495
         End
         Begin VB.OptionButton Option11 
            Caption         =   "7"
            Height          =   255
            Left            =   840
            TabIndex        =   97
            Top             =   240
            Width           =   495
         End
         Begin VB.OptionButton Option12 
            Caption         =   "8"
            Height          =   375
            Left            =   840
            TabIndex        =   96
            Top             =   600
            Width           =   495
         End
         Begin VB.OptionButton Option13 
            Caption         =   "9"
            Height          =   255
            Left            =   840
            TabIndex        =   95
            Top             =   1080
            Width           =   495
         End
         Begin VB.OptionButton Option14 
            Caption         =   "10"
            Height          =   255
            Left            =   840
            TabIndex        =   94
            Top             =   1440
            Width           =   495
         End
      End
      Begin VB.TextBox Text22 
         Height          =   285
         Left            =   -73560
         TabIndex        =   92
         Text            =   "Text22"
         Top             =   2610
         Width           =   1815
      End
      Begin VB.CommandButton Command32 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70080
         TabIndex        =   91
         Top             =   2490
         Width           =   1215
      End
      Begin VB.CommandButton Command33 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70920
         TabIndex        =   84
         Top             =   810
         Width           =   1215
      End
      Begin VB.CommandButton Command25 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70920
         TabIndex        =   83
         Top             =   1650
         Width           =   1215
      End
      Begin VB.TextBox Text18 
         Height          =   285
         Left            =   -73200
         TabIndex        =   82
         Text            =   "Text18"
         Top             =   1650
         Width           =   2175
      End
      Begin VB.CommandButton Command5 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70920
         TabIndex        =   81
         Top             =   2490
         Width           =   1215
      End
      Begin VB.CommandButton Command15 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70920
         TabIndex        =   80
         Top             =   3210
         Width           =   1215
      End
      Begin VB.CommandButton Command14 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70320
         TabIndex        =   78
         Top             =   3720
         Width           =   1215
      End
      Begin VB.CommandButton Command11 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70320
         TabIndex        =   76
         Top             =   3000
         Width           =   1215
      End
      Begin VB.CommandButton Command27 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70320
         TabIndex        =   74
         Top             =   2280
         Width           =   1215
      End
      Begin VB.TextBox Text19 
         Height          =   285
         Left            =   -72600
         TabIndex        =   72
         Text            =   "Text19"
         Top             =   1560
         Width           =   2175
      End
      Begin VB.CommandButton Command26 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70320
         TabIndex        =   71
         Top             =   1560
         Width           =   1215
      End
      Begin VB.CommandButton Command23 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70080
         TabIndex        =   65
         Top             =   2520
         Width           =   1215
      End
      Begin VB.TextBox Text16 
         Height          =   285
         Left            =   -72600
         TabIndex        =   64
         Text            =   "Text16"
         Top             =   1920
         Width           =   3135
      End
      Begin VB.CommandButton Command24 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70080
         TabIndex        =   63
         Top             =   3810
         Width           =   1215
      End
      Begin VB.TextBox Text17 
         Height          =   285
         Left            =   -72600
         TabIndex        =   62
         Text            =   "Text17"
         Top             =   3210
         Width           =   3135
      End
      Begin VB.CommandButton Command22 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70080
         TabIndex        =   61
         Top             =   1290
         Width           =   1215
      End
      Begin VB.TextBox Text15 
         Height          =   285
         Left            =   -72600
         TabIndex        =   60
         Text            =   "Text15"
         Top             =   690
         Width           =   3135
      End
      Begin VB.CommandButton Command31 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70560
         TabIndex        =   58
         Top             =   1560
         Width           =   1215
      End
      Begin VB.CommandButton Command44 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70200
         TabIndex        =   52
         Top             =   840
         Width           =   1215
      End
      Begin VB.CommandButton Command43 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70200
         TabIndex        =   51
         Top             =   1560
         Width           =   1215
      End
      Begin VB.CommandButton Command46 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70200
         TabIndex        =   50
         Top             =   2280
         Width           =   1215
      End
      Begin VB.CommandButton Command8 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70080
         TabIndex        =   48
         Top             =   3840
         Width           =   1215
      End
      Begin VB.CommandButton Command42 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70560
         TabIndex        =   44
         Top             =   840
         Width           =   1215
      End
      Begin VB.CommandButton Command19 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70560
         TabIndex        =   43
         Top             =   1560
         Width           =   1215
      End
      Begin VB.TextBox Text9 
         Height          =   285
         Left            =   -72720
         TabIndex        =   42
         Text            =   "Text9"
         Top             =   1560
         Width           =   2055
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Left            =   -72960
         TabIndex        =   36
         Text            =   "Text3"
         Top             =   930
         Width           =   2775
      End
      Begin VB.CommandButton Command4 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70080
         TabIndex        =   35
         Top             =   930
         Width           =   1215
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Left            =   -72960
         TabIndex        =   34
         Text            =   "Text1"
         Top             =   1650
         Width           =   2775
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70080
         TabIndex        =   33
         Top             =   1650
         Width           =   1215
      End
      Begin VB.TextBox Text4 
         Height          =   285
         Left            =   -72960
         TabIndex        =   32
         Text            =   "Text4"
         Top             =   2370
         Width           =   2775
      End
      Begin VB.CommandButton Command9 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70080
         TabIndex        =   31
         Top             =   2370
         Width           =   1215
      End
      Begin VB.CommandButton Command35 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70080
         TabIndex        =   30
         Top             =   3090
         Width           =   1215
      End
      Begin VB.PictureBox Picture1 
         BackColor       =   &H00000000&
         ForeColor       =   &H00FFFFFF&
         Height          =   2895
         Left            =   120
         ScaleHeight     =   2835
         ScaleWidth      =   3675
         TabIndex        =   25
         Top             =   1320
         Width           =   3735
      End
      Begin VB.TextBox Text28 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   195
         Left            =   120
         TabIndex        =   24
         Text            =   "Text28"
         Top             =   960
         Width           =   495
      End
      Begin VB.TextBox Text34 
         Height          =   1575
         Left            =   3960
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   23
         Text            =   "Form2.frx":0509
         Top             =   1290
         Width           =   2655
      End
      Begin VB.CommandButton Command51 
         Caption         =   "Help / About FracSaver"
         Height          =   255
         Left            =   3960
         TabIndex        =   22
         Top             =   4080
         Width           =   2655
      End
      Begin VB.CommandButton Command52 
         Caption         =   "The Author"
         Height          =   255
         Left            =   3960
         TabIndex        =   21
         Top             =   3000
         Width           =   1455
      End
      Begin VB.CommandButton Command21 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70080
         TabIndex        =   19
         Top             =   1680
         Width           =   1215
      End
      Begin VB.TextBox Text14 
         Height          =   285
         Left            =   -72480
         TabIndex        =   18
         Text            =   "Text14"
         Top             =   1680
         Width           =   2295
      End
      Begin VB.CommandButton Command17 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70080
         TabIndex        =   14
         Top             =   960
         Width           =   1215
      End
      Begin VB.TextBox Text7 
         Height          =   285
         Left            =   -73320
         TabIndex        =   13
         Text            =   "Text7"
         Top             =   960
         Width           =   3135
      End
      Begin VB.CommandButton Command12 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70320
         TabIndex        =   10
         Top             =   840
         Width           =   1215
      End
      Begin VB.CommandButton Command7 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -70560
         TabIndex        =   8
         Top             =   840
         Width           =   1215
      End
      Begin VB.CommandButton Command6 
         Caption         =   "Add to list"
         Height          =   495
         Left            =   -69720
         TabIndex        =   6
         Top             =   3840
         Width           =   1215
      End
      Begin VB.Label Label62 
         Caption         =   "5.0op"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   465
         Left            =   5640
         TabIndex        =   29
         Top             =   120
         Width           =   1020
      End
      Begin VB.Image Image5 
         Height          =   960
         Left            =   5520
         Stretch         =   -1  'True
         Top             =   3000
         Width           =   1035
      End
      Begin VB.Label Label59 
         Caption         =   "Percolation network (forest)"
         Height          =   255
         Left            =   -74760
         TabIndex        =   188
         Top             =   3000
         Width           =   2055
      End
      Begin VB.Label Label58 
         Caption         =   "CoolBagula"
         Height          =   255
         Left            =   -74880
         TabIndex        =   186
         Top             =   3120
         Width           =   975
      End
      Begin VB.Label Label57 
         Caption         =   "Malformations 1 (2-10)"
         Height          =   255
         Left            =   -74880
         TabIndex        =   185
         Top             =   2640
         Width           =   1575
      End
      Begin VB.Image Image2 
         Height          =   465
         Left            =   0
         Picture         =   "Form2.frx":05E7
         Top             =   45
         Width           =   5700
      End
      Begin VB.Label Label53 
         Caption         =   "WWW.Fractalus.Com/FracSaver"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   3240
         MouseIcon       =   "Form2.frx":9035
         MousePointer    =   99  'Custom
         TabIndex        =   182
         Top             =   720
         Width           =   2655
      End
      Begin VB.Label Label17 
         Caption         =   "Steve@Fractalus.Com"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   3240
         MouseIcon       =   "Form2.frx":9187
         MousePointer    =   99  'Custom
         TabIndex        =   181
         Top             =   480
         Width           =   1695
      End
      Begin VB.Label Label77 
         Caption         =   "Boids"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   -74880
         TabIndex        =   178
         Top             =   120
         Width           =   1335
      End
      Begin VB.Label Label78 
         Caption         =   "Number of seconds to run for:"
         Height          =   255
         Left            =   -73800
         TabIndex        =   177
         Top             =   1560
         Width           =   2175
      End
      Begin VB.Label Label79 
         Caption         =   "Number of boids:"
         Height          =   255
         Left            =   -73800
         TabIndex        =   176
         Top             =   2040
         Width           =   2295
      End
      Begin VB.Label Label80 
         Caption         =   "Acceleration:"
         Height          =   255
         Left            =   -73800
         TabIndex        =   175
         Top             =   2520
         Width           =   1335
      End
      Begin VB.Label Label81 
         Caption         =   "Randomness when matching velocity:"
         Height          =   255
         Left            =   -73800
         TabIndex        =   174
         Top             =   3000
         Width           =   2775
      End
      Begin VB.Label Label82 
         Caption         =   $"Form2.frx":92D9
         Height          =   615
         Left            =   -74760
         TabIndex        =   173
         Top             =   720
         Width           =   5775
      End
      Begin VB.Label Label67 
         Caption         =   "ThrowPic"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   -74880
         TabIndex        =   167
         Top             =   120
         Width           =   2175
      End
      Begin VB.Label Label68 
         Caption         =   "Find the GIF BMP or JPG picture then type how many seconds you want it displayed for and then click ""Add to List"""
         Height          =   495
         Left            =   -74760
         TabIndex        =   166
         Top             =   720
         Width           =   5895
      End
      Begin VB.Label Label69 
         Caption         =   "Path:"
         Height          =   255
         Left            =   -73560
         TabIndex        =   165
         Top             =   3120
         Width           =   495
      End
      Begin VB.Label Label70 
         Caption         =   "Number of seconds to run for:"
         Height          =   255
         Left            =   -73560
         TabIndex        =   164
         Top             =   3480
         Width           =   2175
      End
      Begin VB.Label Label56 
         Caption         =   "CAs"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   -74880
         TabIndex        =   160
         Top             =   120
         Width           =   1935
      End
      Begin VB.Label Label34 
         Caption         =   "One Dimensional Cellular Automata"
         Height          =   255
         Left            =   -74880
         TabIndex        =   159
         Top             =   1050
         Width           =   2655
      End
      Begin VB.Label Label64 
         Caption         =   "Conways Life, Screen iterations:"
         Height          =   375
         Left            =   -74880
         TabIndex        =   158
         Top             =   1650
         Width           =   2655
      End
      Begin VB.Label Label39 
         Caption         =   "Continuous CA:"
         Height          =   255
         Left            =   -74880
         TabIndex        =   157
         Top             =   2370
         Width           =   2655
      End
      Begin VB.Label Label50 
         Caption         =   "1 in 8 rule, screen iterations:"
         Height          =   255
         Left            =   -74880
         TabIndex        =   156
         Top             =   3090
         Width           =   2055
      End
      Begin VB.Label Label40 
         Caption         =   "For Majority rule CA see the ""Majority"" tab"
         Height          =   255
         Left            =   -74760
         TabIndex        =   155
         Top             =   3930
         Width           =   3015
      End
      Begin VB.Label Label16 
         Caption         =   "Carpet"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   -74880
         TabIndex        =   148
         Top             =   120
         Width           =   1575
      End
      Begin VB.Label Label74 
         Caption         =   "Old carpet from version 2:"
         Height          =   255
         Left            =   -74280
         TabIndex        =   147
         Top             =   1200
         Width           =   2415
      End
      Begin VB.Label Label75 
         Caption         =   "Proper Sierpinsky Carpet"
         Height          =   255
         Left            =   -74280
         TabIndex        =   146
         Top             =   2640
         Width           =   1935
      End
      Begin VB.Label Label76 
         Caption         =   "Depth of iteration:"
         Height          =   255
         Left            =   -73080
         TabIndex        =   145
         Top             =   2880
         Width           =   1335
      End
      Begin VB.Label Label27 
         Caption         =   "Mandelbrot set"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   -74880
         TabIndex        =   141
         Top             =   120
         Width           =   3495
      End
      Begin VB.Label Label28 
         Caption         =   "Xa:"
         Height          =   255
         Left            =   -74880
         TabIndex        =   140
         Top             =   1200
         Width           =   375
      End
      Begin VB.Label Label29 
         Caption         =   "Ya:"
         Height          =   255
         Left            =   -74880
         TabIndex        =   139
         Top             =   1680
         Width           =   375
      End
      Begin VB.Label Label30 
         Caption         =   "Xb:"
         Height          =   255
         Left            =   -74880
         TabIndex        =   138
         Top             =   2160
         Width           =   375
      End
      Begin VB.Label Label31 
         Caption         =   "Yb:"
         Height          =   255
         Left            =   -74880
         TabIndex        =   137
         Top             =   2640
         Width           =   375
      End
      Begin VB.Label Label45 
         Caption         =   "2-D CA Majority rule."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   -74880
         TabIndex        =   131
         Top             =   120
         Width           =   4695
      End
      Begin VB.Label Label46 
         Caption         =   "Initital coverage of live sells (decimal percentage):"
         Height          =   495
         Left            =   -74880
         TabIndex        =   130
         Top             =   1080
         Width           =   2175
      End
      Begin VB.Label Label47 
         Caption         =   "(No page flipping)"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   -74880
         TabIndex        =   129
         Top             =   720
         Width           =   1935
      End
      Begin VB.Label Label60 
         Caption         =   "Levy dragon, iterations:"
         Height          =   255
         Left            =   -74880
         TabIndex        =   119
         Top             =   1890
         Width           =   1695
      End
      Begin VB.Label Label61 
         Caption         =   "Dragon number(2-12):"
         Height          =   255
         Left            =   -74880
         TabIndex        =   118
         Top             =   2250
         Width           =   1575
      End
      Begin VB.Label Label51 
         Caption         =   "Julia morpher"
         Height          =   255
         Left            =   -74880
         TabIndex        =   114
         Top             =   1290
         Width           =   975
      End
      Begin VB.Label Label23 
         Caption         =   "IFS 3"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   -74880
         TabIndex        =   112
         Top             =   120
         Width           =   1215
      End
      Begin VB.Label Label24 
         Caption         =   "Julia inverse, iterations:"
         Height          =   255
         Left            =   -74880
         TabIndex        =   111
         Top             =   810
         Width           =   1695
      End
      Begin VB.Label Label20 
         Caption         =   "Barnsleys fern, iterations:"
         Height          =   375
         Left            =   -74880
         TabIndex        =   108
         Top             =   840
         Width           =   2535
      End
      Begin VB.Label Label13 
         Caption         =   "Organic, iterations:"
         Height          =   255
         Left            =   -74880
         TabIndex        =   107
         Top             =   1650
         Width           =   1455
      End
      Begin VB.Label Label54 
         Caption         =   "Lapidus iterations:"
         Height          =   255
         Left            =   -74880
         TabIndex        =   106
         Top             =   2610
         Width           =   1455
      End
      Begin VB.Label Label19 
         Caption         =   "IFS 2"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   -74880
         TabIndex        =   90
         Top             =   120
         Width           =   1335
      End
      Begin VB.Label Label55 
         Caption         =   "IFS"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   -74880
         TabIndex        =   89
         Top             =   120
         Width           =   855
      End
      Begin VB.Label Label72 
         Caption         =   "Random IFS"
         Height          =   255
         Left            =   -74880
         TabIndex        =   88
         Top             =   930
         Width           =   1215
      End
      Begin VB.Label Label41 
         Caption         =   "SquareFrac, iterations:"
         Height          =   255
         Left            =   -74880
         TabIndex        =   87
         Top             =   1650
         Width           =   2415
      End
      Begin VB.Label Label48 
         Caption         =   "Bird"
         Height          =   255
         Left            =   -74880
         TabIndex        =   86
         Top             =   2490
         Width           =   615
      End
      Begin VB.Label Label3 
         Caption         =   "Coast:"
         Height          =   255
         Left            =   -74880
         TabIndex        =   85
         Top             =   3210
         Width           =   615
      End
      Begin VB.Label Label14 
         Caption         =   "Circles"
         Height          =   255
         Left            =   -74760
         TabIndex        =   79
         Top             =   3720
         Width           =   615
      End
      Begin VB.Label Label44 
         Caption         =   "Pascals triangle"
         Height          =   255
         Left            =   -74760
         TabIndex        =   77
         Top             =   3000
         Width           =   1215
      End
      Begin VB.Label Label42 
         Caption         =   "Wave"
         Height          =   255
         Left            =   -74760
         TabIndex        =   75
         Top             =   2280
         Width           =   495
      End
      Begin VB.Label Label43 
         Caption         =   "Tree, Depth of iteration (2-12):"
         Height          =   255
         Left            =   -74760
         TabIndex        =   73
         Top             =   1560
         Width           =   2175
      End
      Begin VB.Label Label52 
         Caption         =   "Cantor bars"
         Height          =   255
         Left            =   -74760
         TabIndex        =   70
         Top             =   840
         Width           =   855
      End
      Begin VB.Label Label36 
         Caption         =   "4,5,6 sided snow flakes"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   -74880
         TabIndex        =   69
         Top             =   120
         Width           =   6135
      End
      Begin VB.Label Label37 
         Caption         =   "Number of iterations before exit:"
         Height          =   255
         Left            =   -74880
         TabIndex        =   68
         Top             =   1920
         Width           =   2295
      End
      Begin VB.Label Label38 
         Caption         =   "Number of iterations before exit:"
         Height          =   255
         Left            =   -74880
         TabIndex        =   67
         Top             =   3210
         Width           =   2295
      End
      Begin VB.Label Label35 
         Caption         =   "Number of iterations before exit:"
         Height          =   375
         Left            =   -74880
         TabIndex        =   66
         Top             =   690
         Width           =   2295
      End
      Begin VB.Label Label49 
         Caption         =   "Fractal landscape"
         Height          =   255
         Left            =   -74760
         TabIndex        =   59
         Top             =   1560
         Width           =   1335
      End
      Begin VB.Label Label9 
         Caption         =   "Dendritic"
         Height          =   255
         Left            =   -74760
         TabIndex        =   57
         Top             =   840
         Width           =   2775
      End
      Begin VB.Label Label85 
         Caption         =   "Grid based modules"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   -74880
         TabIndex        =   56
         Top             =   120
         Width           =   4695
      End
      Begin VB.Label Label10 
         Caption         =   "Gimps"
         Height          =   255
         Left            =   -74760
         TabIndex        =   55
         Top             =   840
         Width           =   495
      End
      Begin VB.Label Label12 
         Caption         =   "Random Boolean network"
         Height          =   255
         Left            =   -74760
         TabIndex        =   54
         Top             =   1560
         Width           =   1935
      End
      Begin VB.Label Label18 
         Caption         =   "Pixel game"
         Height          =   255
         Left            =   -74760
         TabIndex        =   53
         Top             =   2280
         Width           =   855
      End
      Begin VB.Label Label32 
         Caption         =   "Feigenbaum"
         Height          =   255
         Left            =   -74880
         TabIndex        =   49
         Top             =   3840
         Width           =   1815
      End
      Begin VB.Label Label83 
         Caption         =   "Curves"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   -74880
         TabIndex        =   47
         Top             =   120
         Width           =   2775
      End
      Begin VB.Label Label6 
         Caption         =   "Hilbert"
         Height          =   255
         Left            =   -74880
         TabIndex        =   46
         Top             =   840
         Width           =   975
      End
      Begin VB.Label Label26 
         Caption         =   "Koch, Depth of iteration (1-9):"
         Height          =   255
         Left            =   -74880
         TabIndex        =   45
         Top             =   1560
         Width           =   2175
      End
      Begin VB.Label Label4 
         Caption         =   "Dynamical Systems"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   -74880
         TabIndex        =   41
         Top             =   120
         Width           =   4335
      End
      Begin VB.Label Label5 
         Caption         =   "Rossler attractor, iterations:"
         Height          =   255
         Left            =   -74880
         TabIndex        =   40
         Top             =   960
         Width           =   2295
      End
      Begin VB.Label Label2 
         Caption         =   "Lorenz attractor, iterations:"
         Height          =   255
         Left            =   -74880
         TabIndex        =   39
         Top             =   1650
         Width           =   1935
      End
      Begin VB.Label Label11 
         Caption         =   "Henon attractor, iterations:"
         Height          =   255
         Left            =   -74880
         TabIndex        =   38
         Top             =   2370
         Width           =   2535
      End
      Begin VB.Label Label25 
         Caption         =   "Gravity"
         Height          =   255
         Left            =   -74880
         TabIndex        =   37
         Top             =   3090
         Width           =   615
      End
      Begin VB.Label Label65 
         Caption         =   "FracSaver written by SteveC 20/3/99"
         Height          =   255
         Left            =   360
         TabIndex        =   28
         Top             =   480
         Width           =   2775
      End
      Begin VB.Label Label66 
         Caption         =   "FracSaver is freeware, do as you please with it!"
         Height          =   255
         Left            =   960
         TabIndex        =   27
         Top             =   960
         Width           =   5055
      End
      Begin VB.Label Label73 
         Caption         =   "Go to the Fractal Saver Web site at"
         Height          =   255
         Left            =   600
         TabIndex        =   26
         Top             =   720
         Width           =   2655
      End
      Begin VB.Label Label33 
         Caption         =   "Sierpinski, Depth of iteration (1-9):"
         Height          =   255
         Left            =   -74880
         TabIndex        =   20
         Top             =   1680
         Width           =   2415
      End
      Begin VB.Label Label22 
         Caption         =   "Pentagon, iterations:"
         Height          =   255
         Left            =   -74880
         TabIndex        =   12
         Top             =   990
         Width           =   1575
      End
      Begin VB.Label Label21 
         Caption         =   "Gaskets"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   -74880
         TabIndex        =   11
         Top             =   120
         Width           =   4575
      End
      Begin VB.Label Label15 
         Caption         =   "Deterministic fractals"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   -74880
         TabIndex        =   9
         Top             =   150
         Width           =   4455
      End
      Begin VB.Label Label8 
         Caption         =   "Randomized"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   -74880
         TabIndex        =   7
         Top             =   150
         Width           =   2775
      End
      Begin VB.Label Label7 
         Caption         =   "Binary"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   -74880
         TabIndex        =   5
         Top             =   120
         Width           =   1455
      End
   End
   Begin VB.Image Image1 
      Height          =   2595
      Left            =   6960
      Picture         =   "Form2.frx":9375
      Top             =   2640
      Width           =   2805
   End
   Begin VB.Label Label1 
      Caption         =   "List of active modules:"
      Height          =   255
      Left            =   6840
      TabIndex        =   2
      Top             =   0
      Width           =   1695
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim ListOfModules(60, 5)
Dim SierX As Single
Dim SierY As Single
Dim Points(1, 2) As Single
Dim SierRunMode As Integer
Dim SierCounter As Integer
Private Sub Command1_Click()
'log "config - Saving and closing"
SaveNow
End
End Sub
Private Sub Command10_Click()
'organic
If Val(Text5.Text) < 10 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
Call AddToList("Organic", Text5.Text, "", "", "", "")
End Sub
Private Sub Command11_Click()
'pascal
Call AddToList("pascal", "", "", "", "", "")
End Sub
Private Sub Command12_Click()
'cantor
Call AddToList("cantor", "", "", "", "", "")
End Sub
Private Sub Command13_Click()
'carpet
Call AddToList("carpet", "", "", "", "", "")
End Sub
Private Sub Command14_Click()
'circ
Call AddToList("circ", "", "", "", "", "")
End Sub
Private Sub Command15_Click()
'coast
Call AddToList("coast", "", "", "", "", "")
End Sub
Private Sub Command16_Click()
'fern
If Val(Text6.Text) < 10 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
Call AddToList("fern", Text6.Text, "", "", "", "")
End Sub
Private Sub Command17_Click()
'gasket5
If Val(Text7.Text) < 10 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
Call AddToList("gasket5", Text7.Text, "", "", "", "")
End Sub
Private Sub Command18_Click()
'julia
If Val(Text8.Text) < 10 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
Call AddToList("Julia", Text7.Text, "", "", "", "")
End Sub
Private Sub Command19_Click()
'koch
If Val(Text9.Text) < 10 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
Call AddToList("Koch", Text9.Text, "", "", "", "")
End Sub
Private Sub Command2_Click()
'log "Config - cancel button clicked"
End
End Sub
Private Sub Command20_Click()
'mset
If Val(Text10.Text) > Val(Text12.Text) Or Val(Text11.Text) < Val(Text13.Text) Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If

Call AddToList("mset", Text10.Text, Text11.Text, Text12.Text, Text13.Text, "")
End Sub
Private Sub Command21_Click()
'sierpinsky gasket 3
If Val(Text14.Text) < 10 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
Call AddToList("gasket3", Text14.Text, "", "", "", "")
End Sub
Private Sub Command22_Click()
'snow4
If Val(Text15.Text) < 10 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
Call AddToList("snow4", Text15.Text, "", "", "", "")
End Sub
Private Sub Command23_Click()
'snow5
If Val(Text16.Text) < 10 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
Call AddToList("snow5", Text16.Text, "", "", "", "")
End Sub
Private Sub Command24_Click()
'snow6
If Val(Text17.Text) < 10 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
Call AddToList("snow6", Text17.Text, "", "", "", "")
End Sub
Private Sub Command25_Click()
'square
If Val(Text18.Text) < 10 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
Call AddToList("square", Text18.Text, "", "", "", "")
End Sub
Private Sub Command26_Click()
'tree
If Val(Text19.Text) < 10 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
Call AddToList("tree", Text19.Text, "", "", "", "")
End Sub
Private Sub Command27_Click()
'wave
Call AddToList("wave", "", "", "", "", "")
End Sub
Private Sub Command28_Click()
'log "deleting item from list" + List1.Text
If List1.ListIndex = -1 Then
    MsgBox "No module selected!"
    Exit Sub
End If
For i = List1.ListIndex To 59
    ListOfModules(i, 0) = ListOfModules(i + 1, 0)
    ListOfModules(i, 1) = ListOfModules(i + 1, 1)
    ListOfModules(i, 2) = ListOfModules(i + 1, 2)
    ListOfModules(i, 3) = ListOfModules(i + 1, 3)
    ListOfModules(i, 4) = ListOfModules(i + 1, 4)
    ListOfModules(i, 5) = ListOfModules(i + 1, 5)
Next i
Displaylist
End Sub
Private Sub Command29_Click()
'majority rule
If Val(Text20.Text) > 1 Or Val(Text20.Text) < 0.01 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
If Option1.Value = True Then a = 1
If Option2.Value = True Then a = 2
If Option3.Value = True Then a = 3
If Option4.Value = True Then a = 4
If Option5.Value = True Then a = 5
If Option6.Value = True Then a = 6
If Option7.Value = True Then a = 7
Call AddToList("majority", Str$(a), Str$(a), Text20.Text, "", "")
End Sub
Private Sub Command3_Click()
'Lorentz
If Val(Text1.Text) < 10 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
Call AddToList("Lorentz", Text1.Text, "", "", "", "")
End Sub
Private Sub Command30_Click()
'1 in 8
If Val(Text21.Text) < 10 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
Call AddToList("1in8", Text21.Text, "", "", "", "")
End Sub
Private Sub Command31_Click()
'landscape
Call AddToList("land", "", "", "", "", "")
End Sub
Private Sub Command32_Click()
'bagula1
If Val(Text22.Text) < 10 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
If Option7.Value = True Then a = 3
If Option8.Value = True Then a = 4
If Option9.Value = True Then a = 5
If Option10.Value = True Then a = 6
If Option11.Value = True Then a = 7
If Option12.Value = True Then a = 8
If Option13.Value = True Then a = 9
If Option14.Value = True Then a = 10
Call AddToList("bagula1", Text22.Text, Str$(a), "", "", "")
End Sub
Private Sub Command33_Click()
'random ifs
Call AddToList("rndifs", "", "", "", "", "")
End Sub
Private Sub Command34_Click()
'1dca
Call AddToList("1dca3", "", "", "", "", "")
End Sub
Private Sub Command35_Click()
'gravity
Call AddToList("grav", "", "", "", "", "")
End Sub
Private Sub Command36_Click()
'levy
If Val(Text23.Text) < 10 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
If Val(Text24.Text) < 2 Or Val(Text24.Text) > 12 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
Call AddToList("levy", Text23.Text, Text24.Text, "", "", "")
End Sub
Private Sub Command37_Click()
'life
Call AddToList("life", Text25.Text, "", "", "", "")
If Val(Text25.Text) < 2 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
End Sub
Private Sub Command38_Click()
'continuous
Call AddToList("Contin", "", "", "", "", "")
End Sub
Private Sub Command39_Click()
'ThrowPic
On Error GoTo Bom
If Val(Text27.Text) < 10 Then
    MsgBox "Can't run for under 10 seconds."
    Exit Sub
End If
a = FileLen(Text26.Text)
Call AddToList("ThrowPic", Text26.Text, Text27.Text, "", "", "")
Exit Sub
Bom:
    MsgBox "That picture isn't found."
End Sub
Private Sub Command4_Click()
'rossler
If Val(Text3.Text) < 10 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
Call AddToList("ross", Text3.Text, "", "", "", "")
End Sub
Private Sub Command40_Click()
'properSier
If Val(Text29.Text) < 1 Then
    MsgBox "Number of iterations too low!"
    Exit Sub
End If
Call AddToList("PropSier", Text29.Text, "", "", "", "")
End Sub
Private Sub Command41_Click()
'Boids
If Val(Text30.Text) < 10 Then
    MsgBox "Must be longer than 10 seconds"
    Exit Sub
ElseIf Val(Text31.Text) < 10 Then
    MsgBox "Must have more than 10 boids!"
    Exit Sub
ElseIf Val(Text32.Text) < 0 Then
    MsgBox "Must have more than or equal to 0 for acceleration!"
    Exit Sub
ElseIf Val(Text33.Text) < 0 Then
    MsgBox "Must have more than or equal to 0 for randomness!"
    Exit Sub
End If
Call AddToList("boid", Text30.Text, Text31.Text, Text32.Text, Text33.Text, "")
End Sub
Private Sub Command42_Click()
'hilbert
Call AddToList("hilbert", "", "", "", "", "")
End Sub
Private Sub Command43_Click()
'boolean net
Call AddToList("Bool", "", "", "", "", "")
End Sub
Private Sub Command44_Click()
'Gimps
Call AddToList("Gimps", "", "", "", "", "")
End Sub
Private Sub Command45_Click()
'julia morpher
Call AddToList("JM", "", "", "", "", "")
End Sub
Private Sub Command46_Click()
'pixel game
Call AddToList("PG", "", "", "", "", "")
End Sub
Private Sub Command47_Click()
If List1.ListIndex = -1 Then
    MsgBox "No module selected!"
    Exit Sub
End If
Text36.Visible = True
modname = ListOfModules(List1.ListIndex, 0)
If modname = "snow4" Then Text36.Text = "An IFS snowflake, set up for 4 sides. Attractors move draw point to midpoint and do not allow any attractor to move the draw point more than once."
If modname = "snow5" Then Text36.Text = "An IFS snowflake, set up for 5 sides. Attractors move draw point to midpoint and do not allow any attractor to move the draw point more than once."
If modname = "snow6" Then Text36.Text = "An IFS snowflake, set up for 6 sides. Attractors move draw point to midpoint and do not allow any attractor to move the draw point more than once."
If modname = "pascal" Then Text36.Text = "Not a true Pascal triangle, but two, one on top of the other. Coloured according to odd-even IIRC."
If modname = "cantor" Then Text36.Text = "Cantor bars, strip the middle third away from each iteration. At inifinity which points remain? The end points!"
If modname = "carpet" Then Text36.Text = "A very early attempt at the Sierpinski carpet in QBasic. Terrible really. Each branch is chosen randomly as I didn't know about recursion <sigh>."
If modname = "circ" Then Text36.Text = "Nested circles."
If modname = "coast" Then Text36.Text = "Some random dynamical system I played with that looks neat."
If modname = "fern" Then Text36.Text = "Barnsleys fern. Code adapted from 'Fractals for the classroom'. Made with 3 transformations, centre, left and right leaves. This fractal is a vivid reminder of the complexity that can come from very simple laws. Created by Michael Barnsley, one inventor of Fractal compression and author of 'Fractals Everywhere'."
If modname = "gasket5" Then Text36.Text = "Based on random mid point displacement with 5 attractors. The same as the 'Chaos game' which creates the Sierpinski gasket except with 5 instead of 3 attractors."
If modname = "Julia" Then Text36.Text = "A reverse iteration Julia set, hence only the outline."
If modname = "Koch" Then Text36.Text = "The Koch curve. Made by raising the middle third of each segment into a triangle."
If modname = "mset" Then Text36.Text = "The Mandelbrot set. Discovered by Benoit Mandelbrot in 1980, exists in the complex plain. Each point in the plain is iterated as z -> z^2 + c, c being the point iterated. The point is coloured according to how z behaves, if it 'escapes' and gets very large or remains small."
If modname = "gasket3" Then Text36.Text = "The Sierpinski gasket, created by recursivly drawing a triangles. A triangle is drawn, one upside down and in the cantre of the original is drawn and then the three outer triangles are iterated. This is done to the depth you select."
If modname = "square" Then Text36.Text = "A chaos game, or IFS. Played with 4 attractors, the top right of which twice as powerful (1/4 distance) as the other three (1/2 distance)"
If modname = "tree" Then Text36.Text = "Adapted from Fractals for the classroom', Watch the tree grow."
If modname = "wave" Then Text36.Text = "An interesting dynamical system that draws waves whch have a fractal nature. The code is too complicated for an explanation here, email for details."
If modname = "majority" Then Text36.Text = "The majority rule CA. For each cell top right to bottom left, the number of live surrounding cells is counted. If this exceeds the number you define then the cell becomes alive, if not it dies. From a random initial configuration this produces cloud type structures in one iteration."
If modname = "Lorentz" Then Lorentz Text36.Text = "The Lorenz attractor, discovered by Edward Lorenz who also coined 'the butterfly effect' in his landmark paper. Deduced from weather equations, it shows the trajectory of a system in phase space almost but never quite repeating itself, swinging from one loop to the other."
If modname = "1in8" Then Text36.Text = "This CA, needing both a data sheet and a draw sheet (hence the page flip) reads the number of surrounding cells alive from the data sheet. If the total is 1 out of the eight neighbours then that cell is made alive on the draw sheet. Once an iteration is completed the draw sheet is copied to the data sheet and a new draw sheet made. Starting with one alive cell in the centre, a large crystaline square is created."
If modname = "land" Then Text36.Text = "Fractal landscapes can be created in many ways. Here a rectangle in 3D space is created, its midpoint (centre) is raised or lowered by some random amount and four new rectangles are created. These new rectangles are also iterated but their midpoints are moved up or down by a smaller amount. When iterated a three dimensional landscape is produced."
If modname = "bagula1" Then Text36.Text = "Lapidus' Sierpinski. Consider a Sierpinski gasket with each triangle spread apart such that they do not touch. This is easily done by any method of gasket creation. Then create three triangles between the gaps (you have to see it to understand) and iterate. Also done for > 3 sieded polygons."
If modname = "rndifs" Then Text36.Text = "Consisting of a random number of attractort with random strengths, a draw point whizzes round the screen in much the same way as chaos game but with differing number of attractors and strengths."
If modname = "1dca3" Then Text36.Text = "One dimensional cellular automata. Each cell's state is determined by the three cells above it."
If modname = "grav" Then Text36.Text = "The N-Body problem. A number of gravitationaly (inverse square law) attracted bodies move around a screen, colour determined by velocity. They leave trails and bounce off the walls of the screen. This is a famous problem in predicition, in that you can't predict with any accuracy what will happen in even a short time in the future. Predicting two bodies is baby school, say the Earth-Sun system. As soon and you conside three bodies, such as Earth-Moon-Sun then prediction becomes horribly complex. Sensitivity on initial conditions (i.e. the initial postions and momentums of the bodies) become very important and any inaccuracy in the measurements causes large divergence between prediction and actual events. Other wise known as the butterfly effect."
If modname = "levy" Then Text36.Text = "Levy Dragon"
If modname = "life" Then Text36.Text = "Conways life. Each cell's alive neighbours are counted. If fewer than 2 cells are alive then it dies of 'lonliness'. Greater than three and it dies of 'overcrowding'. A very complex behaviour emerges as structures such as gliders (formations of cells that propogate) and glider guns (structures that produce an infinite number of gliders) emerge."
If modname = "Contin" Then Text36.Text = "A 'continuous' one dimensional cellular automata. That is the cells do not contain discrete values but continuous variables."
If modname = "ThrowPic" Then Text36.Text = "ThrowPic is not available for config mode, it allows pictures to be displayed on the screen. BMPs, GIFs etc..."
If modname = "ross" Then Text36.Text = "The Rossler attractor, found by Otto E. Rossler in 1976 is a simple set of differential equations that produce an amazing pic."
If modname = "PropSier" Then Text36.Text = "The Sierpinski carpet implemented properly as a recursive function. Eight squares (on a 1:1 aspect ratio anyway) are drawn around each larger square. Done recursively the carpet emerges."
If modname = "boid" Then Text36.Text = "Boids are very simple automatons that produce flocking behaviour similar to sheep, birds, fish i.e. anything that flocks. Each automaton is attracted to the centre of the group, repelled if it gets too close to a neighbouring automaton and tries to match direction with said neighbour. Put 40 of the things in and complex behaviour emerges. The length of each automaton is related to its velocitly, and the angle shows its direction."
If modname = "hilbert" Then Text36.Text = "The Hilbert space filling curve."
If modname = "Bool" Then Text36.Text = "Random boolean networks consist of a number of cells whose state is a function of the cells its connected to and its operator. Each cell is connected to randomly chosen others and has a random boolean opperator (AND, OR etc) that determins its state. This is a badly implemented example that I hope to update."
If modname = "Gimps" Then Text36.Text = "I created Gimps as another facinating ALife example. Each Gimp leaves a trail of cells and as time goes on each cell decrements its value down to zero. Hence a shaded trail of bright -> dark cells follows each Gimp. Each Gimp choses the cell it will move to randomly, from those with the least value. This makes it (almost) impossible for a Gimp to double back (because there are live cells there) and usually to head in a general direction. This is because each movement makes the opposite move statistically more likely at the next time step. When a number of Gimps are implemented you get lovely red (arbitrary colout) worms going over the screen."
If modname = "JM" Then Text36.Text = "This Julia set morpher, morphs reverse iteration julia sets. It flickers a little in the config box but is much better on full screen. A better example is on http://www.fractalus.com/juliasaver/ which implements the real Julia set, not reverse iteration"
If modname = "PG" Then Text36.Text = "The pixel game consist of cells, each pointing to another cell. Following this trail for each cell leads somewhere and according to the length or loop length of the trail, each cell is coloured."
If modname = "Bird" Then Text36.Text = "It just seemed a good name for the wing like structures..."
If modname = "Binary" Then Text36.Text = "Each binary number from 0-255 number of 1's is multiplied by its decimal. e.g. 0010 means 1 times 2. or 1111 means 15 times 4. This would result in a 1D line but plotting (x,x) results in a 2D copy of the same."
If modname = "Dendritic" Then Text36.Text = "A line is drawn at the bottom of the screen. A draw point is moved randomly about the screen until it touches another lit up pixel (or cell). When this happens the draw point is halted and drawn at this point. A new draw point is iterated ad infinitum. This is not the whole story, if it were you would be sitting watching the screen for ages in Visual Basic so a number of optimizations are put it to speed things up."
If modname = "Feigenbaum" Then Text36.Text = "The quadratic iterator r = ar(1-r) for each a is iterated and an amazing amount of complexity results. Branching, periodicity, complexity, chaos and stable solutions are all seen."
If modname = "Henon" Then Text36.Text = "The Henon attractor."
If modname = "Organic" Then Text36.Text = "Organic."
If modname = "ml1" Then Text36.Text = "Malformation, by ML."
If modname = "coolbag" Then Text36.Text = "Sierpinski gasket modified by R. Bagula, it looks cool!"
If modname = "forest" Then Text36.Text = "This module does not display at all well in preview. It shows a simple percolation network, a forest burning. The probability a tree will exist at a point is .5927, the percolation threshold. The leftmost row of trees are set on fire, this fire then propagates through the forest. The forest goes offscreen, and so sometimes spurious fires may creep in."
End Sub
Private Sub Command48_Click()
If List1.ListIndex = -1 Then
    MsgBox "No module selected!"
    Exit Sub
End If
Text36.Visible = False
modname = ListOfModules(List1.ListIndex, 0)
If modname = "snow4" Then SnowFlake4 (10000)
If modname = "snow5" Then SnowFlake5 (10000)
If modname = "snow6" Then SnowFlake6 (10000)
If modname = "pascal" Then PascalsTriangle
If modname = "cantor" Then CantorBars
If modname = "carpet" Then carpet
If modname = "circ" Then CircFrac
If modname = "coast" Then Coast
If modname = "fern" Then fern (80000)
If modname = "gasket5" Then Gasket5 (200000)
If modname = "Julia" Then Julia (100000)
If modname = "Koch" Then KochCurve (7)
If modname = "mset" Then Call Mandel(-1, 1, 2, -1)
If modname = "gasket3" Then SierpinskyGasket (7)
If modname = "square" Then SquareFrac (610000)
If modname = "tree" Then Tree (10)
If modname = "wave" Then WaveFrac
If modname = "majority" Then Call OneIn8(4, 0.5)
If modname = "Lorentz" Then Lorentz (40000)
If modname = "1in8" Then OneIn8Pageflip (35)
If modname = "land" Then Landscape
If modname = "bagula1" Then Call Bagula1(1000000, 3)
If modname = "rndifs" Then RandomIFS
If modname = "1dca3" Then OneDCA3
If modname = "grav" Then Meep
If modname = "levy" Then Call Bagula2(350000, 2)
If modname = "life" Then Life (5)
If modname = "Contin" Then Contin
If modname = "ThrowPic" Then MsgBox "ThrowPic is not available for config mode"
If modname = "ross" Then Ross (80000)
If modname = "PropSier" Then PropSier (4)
If modname = "boid" Then Call DoBoid(45, 30, 0.4, 0.5)
If modname = "hilbert" Then GoHilbert
If modname = "Bool" Then RndBool
If modname = "Gimps" Then DoGimps
If modname = "JM" Then JuliaM
If modname = "PG" Then GoPixel
If modname = "Bird" Then Bird
If modname = "Binary" Then Binary
If modname = "Dendritic" Then Dendritic
If modname = "Feigenbaum" Then Feigenbaum
If modname = "Henon" Then Henon (70000)
If modname = "Organic" Then Organic (2000000)
If modname = "ml1" Then ml1 (5)
If modname = "coolbag" Then CoolBag
If modname = "forest" Then Forest
End Sub
Private Sub Command49_Click()
If Text2.Text < 2 Or Text2.Text > 10 Then
    MsgBox "Must have value between 2 and 10"
    Exit Sub
End If
Call AddToList("ml1", Text2.Text, "", "", "", "")
End Sub
Private Sub Command5_Click()
'bird
Call AddToList("Bird", "", "", "", "", "")
End Sub
Private Sub Command50_Click()
'coolbag
Call AddToList("coolbag", "", "", "", "", "")
End Sub
Private Sub Command51_Click()
Text36.Visible = True
Text36.Text = "Welcome to FracSaver Version 5.0op. This version is optimized. Why not email the author to tell him how great this piece of freeware is, or visit the FracSaver web site? Just click the buttons! To test a module or find information on it, click it and press either 'Information' or 'Preview'. This previews the module with standard options and the quality will not match that seen full screen, percolation net does not run at all weel in preview. To add a module just click 'Add to List' To delete a module select the module and click 'Delete from list'. Thanx must go to everybody at Sci.Fractals and especially to Damien M Jones, host at fractalus.com, Roger Bagula & M Lichtenstein for letting me adapt his routines."
End Sub
Private Sub Command52_Click()
Text36.Visible = True
Text36.Text = "SteveC is 18 and will be going to uni in 1999, and thats all he is going to let on. FracSaver began as throwing a lot of globs of code together that were lying around into a neat screen saver. This has taken a little while, overall the results look neat and people appear to like it. FracSaver would not have been possible save for the efforts of mathematicians everywhere writing neat books and stuff, all those people at Microsoft for VB and windows :) and all those content makers over the web writing FAQs and idiot guides for nothing. Heres my little contribution, enjoy."
End Sub
Private Sub Command53_Click()
Text36.Visible = True
Text36.Text = ""
Text36.Text = Text36.Text + "HomePage: http://home.earthlink.net/~tftn/  Thanks to Roger Bagula as portions of code in this screensaver are copyright to Roger L. Bagula, these include Lapidus' Sierpinski and Levy Dragon.       Autobiographical Sketch of Roger L. Bagula    "
Text36.Text = Text36.Text + " I was born in National City, Ca. in 1945 to Fred and Amy Bagula on Dec 7, 1945. Mom and Dad are Christian Scientists. I went to California public schools for"
Text36.Text = Text36.Text + " my primary and secondary education and graduated in 1968 from UCLA with a BS in Chemistry. While a UCLA I did research in Inorganic Chemistry as a lab"
Text36.Text = Text36.Text + " assistant to Dr. Kaesz. And was drafted out of graduate school into the US Army and became a medical corpsman. I worked for a time for the Naval Hospital"
Text36.Text = Text36.Text + " system after leaving the Army in drug screening and medical research. I have had some health problems which I won't specify here, but have had a very long time to"
Text36.Text = Text36.Text + " do independent study. I have done extensive abstract and op-art work over a long period. I have had a long term interest in particle theory and quantum group"
Text36.Text = Text36.Text + " theory, before my interest in fractals and chaos theory began. I have done original work in Mandelbrot/ Julia iterations, fuzzy logic, IFS theory, path fractals and"
Text36.Text = Text36.Text + " Weierstrass trajectories. In Chaos theory I have worked on Henon's and other dynamic systems with several original results. The realization that the dimensionality of"
Text36.Text = Text36.Text + " fractals was connected to a differential structure of real valued/ non-integer derivatives led me to formulate 'supercalculus' ideas and experiment with the iteratives"
Text36.Text = Text36.Text + " involved in fractal dimensional functions. I have done work in toral topology in string and twisted forms, number theory and general Pascal's triangle theory. My work"
Text36.Text = Text36.Text + " in generalized Sierpinski sets as IFS's lead to work in Eisenstein fraction sets, Levy Dragon and Twin dragon generalizations as well. I have published 'The Fractal"
Text36.Text = Text36.Text + " Translight Newsletter' independently for nearly five years, now, and have been called 'crazy' by some of the best minds in the world! I am also known for my poetry"
Text36.Text = Text36.Text + " and jazz/rock composition work. In actuality my essays have been more popular than my mathematics/ physics work. I have written a series of short stories for"
Text36.Text = Text36.Text + " TFTN with the 'Little Annie' series of humorous fiction being fairly well received. Most of my knowledge in many of these fields is self taught and gained by very"
Text36.Text = Text36.Text + " hard work at the computer keyboard. At one time I was one of the most well read Science fiction readers around, but I have found 'truth' even stranger than fiction"
Text36.Text = Text36.Text + " and at times more exciting in the thrill of discovery! I can give no credit for my work to government or public support and seem to be pretty well hated in those areas"
Text36.Text = Text36.Text + " locally. I credit my successes to hard work and stubborn conviction in the face of sever resistance in the scientific and mathematical community to any and all of my"
Text36.Text = Text36.Text + " ideas! I intend to put out TFTN as long as I can and even after to continue my work as long as I am able. I am heterosexual, single and a Jeffersonian Democrat in"
Text36.Text = Text36.Text + " political philosophy. I am right handed, have light brown hair that is starting to go gray, green eyes. I weight near 200 pounds (95 kilos?) and am 5 foot 7 inches"
Text36.Text = Text36.Text + " tall(1.67 meters?) and am not what you would call fat despite a slight belly of middle age. I am somewhat surprised at being in the position of being a 'light' in the"
Text36.Text = Text36.Text + " fractal world: I had thought I would never get that far with my impoverished existence! My family are kind of 'pioneers' in California in arriving before most of the"
Text36.Text = Text36.Text + " others in 1914, but we haven't got rich or famous here. My father is one of the original hot rodders from the 1940's and my first recollections were of very fast old"
Text36.Text = Text36.Text + " cars that Dad put together in his garage beside the house. In contrast I didn't get my driver's license until my late 30's. I have been a very self conscious and shy"
Text36.Text = Text36.Text + " intellectual/ bookish person most of my life, but am now able to get past that in most public situations. I have been called 'too honest','too frank' and without tact or"
Text36.Text = Text36.Text + " polite manners and it is probably true. In this to eastern elite types I also appear as 'stupid' for not playing the 'game', but I have been pretty much denied 'entry' to"
Text36.Text = Text36.Text + " their game so I play it 'truthfully' as easier to remember than any tactful lies. I nurse my invalid mother and take care of my 89 year old Dad. I am a Christian. This"
Text36.Text = Text36.Text + " sketch is an autobiographical essay as truthfully as I can make it. Roger L. Bagula 4 Oct 1997 ©"
End Sub
Private Sub Command54_Click()
Text36.Visible = True
Text36.Text = ""
Text36.Text = "AUTO-BIOGRAPHY OF MALCOLM LICHTENSTEIN"
Text36.Text = Text36.Text + "Education:"
Text36.Text = Text36.Text + " At City College of N.Y: Began as Business Administration Major, but WWII interrupted that."
Text36.Text = Text36.Text + " During Army service in WWII, I received some crash courses in Math and Physics, preparatory for Army Engineer Service. Exigencies of war interrupted"
Text36.Text = Text36.Text + " that,too,and then I received training as a high speed radio operator. As such, I served in relay station,transmitting and receiving coded messages between Asia, the"
Text36.Text = Text36.Text + " Western Pacific Islands, and U.S mainland locations."
Text36.Text = Text36.Text + " After the war, I returned to C.C.N.Y., and completed a Bachelor of Science degree, majoring in Experimental Psychology. The latter included study of basic human"
Text36.Text = Text36.Text + " sensation, perception, and judgments therein. It also included experimental design methodology and statistical analytical methods."
Text36.Text = Text36.Text + " Employment:"
Text36.Text = Text36.Text + " As it turned out, I was fortunate enough to actually be hired, in 1948, as an experimental psychologist,at the then Navy Electronics Laboratory. There, my work"
Text36.Text = Text36.Text + " broke down into two main categories:(a) Basic Research and (b) Applied work pertinent to design and analysis of Navy individual equipments and equipment"
Text36.Text = Text36.Text + " systems."
Text36.Text = Text36.Text + " Areas of Basic Research included:Hearing, Vision, Motor control dynamics (tracking), reaction time,signal detection and localization,and electrical signals of"
Text36.Text = Text36.Text + " muscle,eye and brain. Aside from the usual experimental design and statistical math required for planning and analysis in these researches, one area in"
Text36.Text = Text36.Text + " particular-Motor control dynamics-involved engineering type math, like Fourier analysis, in order to specify and simulate signal features, control system transfer"
Text36.Text = Text36.Text + " functions, amd operator response characteristics. Analog computers were used to simulate the control systems upon which human operators were tested. The signal"
Text36.Text = Text36.Text + " detection area also involved, at times, engineering principles.ie-theory of receiver operating characteristics."
Text36.Text = Text36.Text + " Some of the Journals in which this basic research was published include:Jnl of the Optical Society of America, Jnl of the Acoustical Society of America, Jnl of"
Text36.Text = Text36.Text + " Perception and Psychophysics, American Jnl of Psychology,Jnl of Perceptual and Motor Skills, and lab reports which had fairly wide distribution within concerned"
Text36.Text = Text36.Text + " government labs and agencies."
Text36.Text = Text36.Text + " The main objective of the above, as in all basic research,was to expand the data base of knowledge in the subject. A second objective was (hopefully) to apply such"
Text36.Text = Text36.Text + " data to optimize design of human-operated Navy equipments and systems."
Text36.Text = Text36.Text + " Applied Research involved contributions to the design,testing and analysis of Navy equipments during developmental phase, as well as efforts to detect and correct"
Text36.Text = Text36.Text + " deficiencies in operational fleet components. Three typical examples--"
Text36.Text = Text36.Text + " (a) Analysis of visual display screens in order to specify optimal design for target detection and tracking by a particular piece of Sonar equipment."
Text36.Text = Text36.Text + " (b) Planning,execution and analyses of test runs during development stages of a Navy Tactical Data System. That activity differed from (a) above, in that it involved"
Text36.Text = Text36.Text + " many interactive components, whose function was to process and react to sub-surface, surface and air threats in a Naval Task force environment."
Text36.Text = Text36.Text + " (c) Different from (a) and (b) above, because it is more in the nature of a survey than of testing, was on-board observation of Interior Communications on two"
Text36.Text = Text36.Text + " aircraft carriers, Independence and John F. Kennedy, during operations in the Aegean sea. Object there was to make recommendations to improve aircraft carrier"
Text36.Text = Text36.Text + " (and other) interior communication systems."
Text36.Text = Text36.Text + " Publications in the above areas were almost exclusively in Laboratory reports, some of which, again., had wide intra- governmental distribution. I also wrote two"
Text36.Text = Text36.Text + " chapters in a book entitled 'Human Engineering Guide for Equipment designers'"
Text36.Text = Text36.Text + " COMPUTING:"
Text36.Text = Text36.Text + " About ten years ago, after I had retired from experimental psychology, I acquired the hobby of programming, predominantly in Basic, and gradually was drawn into"
Text36.Text = Text36.Text + " many areas, mostly for recreation, but some, hopefully, of mathematical interest. Topics included: aesthetic graphics,strange attractor music, special musical scales,"
Text36.Text = Text36.Text + " fractals, especially Mandelbrot-type, iterated functional systems, logistic trajectories, chaos theory, information theory, order, coding, tracking, catastrophe theory,"
Text36.Text = Text36.Text + " attractor,and fuzzy logic trajectories,tented functions,S.E.S, BAM's,cellular automata,'turmites' and snowflakes, neural nets..and, many other interesting"
Text36.Text = Text36.Text + " programs.Also,several programs included within them feedbacks among two or more of the aforementioned functions.."
Text36.Text = Text36.Text + " Publications:"
Text36.Text = Text36.Text + " Some programs in the above areas were published,in the following journals/newsletters:Algorithm,Recreational and Educational Computing,Fractal Report, Fractalia,"
Text36.Text = Text36.Text + " Punkt i Bit, and above all, in The Fractal Translight Newsletter, wherein Roger Bagula has published some of my material in every edition, for some years now."
End Sub
Private Sub Command55_Click()
'forest
Call AddToList("forest", "", "", "", "", "")
End Sub
Private Sub Command6_Click()
'binary
Call AddToList("Binary", "", "", "", "", "")
End Sub
Private Sub Command7_Click()
'dendriic
Call AddToList("Dendritic", "", "", "", "", "")
End Sub
Private Sub Command8_Click()
'feigenbaum
Call AddToList("Feigenbaum", "", "", "", "", "")
End Sub
Private Sub Command9_Click()
'henon
If Val(Text4.Text) < 10 Then
    MsgBox "Invalid config. Probably you've put something wrong in a text box."
    Exit Sub
End If
Call AddToList("Henon", Text4.Text, "", "", "", "")
End Sub

Private Sub Dir1_Change()
File1.Path = Dir1.Path
End Sub

Private Sub Drive1_Change()
Dir1.Path = Drive1.Drive
End Sub

Private Sub File1_Click()
If RIGHT$(File1.Path, 1) = "\" Then Text26.Text = File1.Path + File1.filename Else Text26.Text = File1.Path + "\" + File1.filename
End Sub

Private Sub Form_Load()
Picture1.Picture = Form1.Image4.Picture
Image5.Picture = Form1.Image5.Picture
RunMode = 1
'log "Config Window startup - Initializing"
InitializeDefaults
'log "Config Window startup - finding setup file"
CheckSetupFileExists
'log "Config Window startup - loading list"
LoadList
'log "Config Window startup - displaying list"
Displaylist
'log "Config Window startup - showing text msg"
Form2.Show
'Form1.message "Configuration"
Command51_Click
End Sub
Sub LoadList()
Dim a As String
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
ListOfModules(i, 0) = "-1"
Close #1
End Sub
Sub InitList()
ListOfModules(0, 0) = "-1"
List1.Clear
End Sub
Sub InitializeDefaults()
'Lorentz
Text1.Text = 40000
'ml1
Text2.Text = 4
'Rossler
Text3.Text = 80000
'henon
Text4.Text = 70000
'organic
Text5.Text = 2000000
'fern
Text6.Text = 80000
'gasket5
Text7.Text = 200000
'julia set
Text8.Text = 100000
'kch
Text9.Text = 7
'mandel
Text10.Text = -1
Text11.Text = 1
Text12.Text = 2
Text13.Text = -1
'gasket3
Text14.Text = 7
'snow4
Text15.Text = 100000
'snow5
Text16.Text = 100000
'snow6
Text17.Text = 100000
'square
Text18.Text = 610000
'tree
Text19.Text = 10
'majority rule
Text20.Text = 0.5
Option4.Value = True
'1 in 8 rule
Text21.Text = 70
'bagula1
Text22.Text = 1000000
Option7.Value = True
'levy
Text23.Text = 350000
Text24.Text = 2
'life
Text25.Text = 5
End Sub
Sub CheckSetupFileExists()
On Error GoTo jim
a = FileLen(GetWinDir + "\FracSaver.INI")
Exit Sub
jim:
    InitList
    MakeDefaultList
    SaveNow
End Sub
Sub AddToList(a, b, c, d, e, f)
For i = 0 To 60
    If ListOfModules(i, 0) = "-1" Then
        ListOfModules(i + 1, 0) = "-1"
        ListOfModules(i, 0) = a
        ListOfModules(i, 1) = b
        ListOfModules(i, 2) = c
        ListOfModules(i, 3) = d
        ListOfModules(i, 4) = e
        ListOfModules(i, 5) = f
        Exit For
    End If
Next i
Displaylist
End Sub
Sub MakeDefaultList()
Call AddToList("Lorentz", Text1.Text, "", "", "", "")
Call AddToList("ross", Text3.Text, "", "", "", "")
Call AddToList("Bird", "", "", "", "", "")
Call AddToList("Binary", "", "", "", "", "")
Call AddToList("Dendritic", "", "", "", "", "")
Call AddToList("Feigenbaum", "", "", "", "", "")
Call AddToList("Henon", Text4.Text, "", "", "", "")
Call AddToList("Organic", Text5.Text, "", "", "", "")
Call AddToList("pascal", "", "", "", "", "")
Call AddToList("cantor", "", "", "", "", "")
Call AddToList("carpet", "", "", "", "", "")
Call AddToList("circ", "", "", "", "", "")
Call AddToList("coast", "", "", "", "", "")
Call AddToList("fern", Text6.Text, "", "", "", "")
Call AddToList("gasket5", Text7.Text, "", "", "", "")
Call AddToList("Julia", Text8.Text, "", "", "", "")
Call AddToList("Koch", Text9.Text, "", "", "", "")
Call AddToList("mset", Text10.Text, Text11.Text, Text12.Text, Text13.Text, "")
Call AddToList("gasket3", Text14.Text, "", "", "", "")
Call AddToList("snow4", Text15.Text, "", "", "", "")
Call AddToList("snow5", Text16.Text, "", "", "", "")
Call AddToList("snow6", Text17.Text, "", "", "", "")
Call AddToList("square", Text18.Text, "", "", "", "")
Call AddToList("tree", Text19.Text, "", "", "", "")
Call AddToList("wave", "", "", "", "", "")
If Option1.Value = True Then a = 1
If Option2.Value = True Then a = 2
If Option3.Value = True Then a = 3
If Option4.Value = True Then a = 4
If Option5.Value = True Then a = 5
If Option6.Value = True Then a = 6
Call AddToList("majority", Str$(a), Text20.Text, "", "", "")
Call AddToList("1in8", Text21.Text, "", "", "", "")
Call AddToList("land", "", "", "", "", "")
If Option7.Value = True Then a = 3
If Option8.Value = True Then a = 4
If Option9.Value = True Then a = 5
If Option10.Value = True Then a = 6
If Option11.Value = True Then a = 7
If Option12.Value = True Then a = 8
If Option13.Value = True Then a = 9
If Option14.Value = True Then a = 10
Call AddToList("bagula1", Text22.Text, Str$(a), "", "", "")
Call AddToList("rndifs", "", "", "", "", "")
Call AddToList("1dca3", "", "", "", "", "")
Call AddToList("grav", "", "", "", "", "")
Call AddToList("levy", Text23.Text, Text24.Text, "", "", "")
Call AddToList("life", Text25.Text, "", "", "", "")
Call AddToList("Contin", "", "", "", "", "")
Call AddToList("PropSier", Text29.Text, "", "", "", "")
Call AddToList("boid", Text30.Text, Text31.Text, Text32.Text, Text33.Text, "")
Call AddToList("hilbert", "", "", "", "", "")
Call AddToList("Bool", "", "", "", "", "")
Call AddToList("Gimps", "", "", "", "", "")
Call AddToList("JM", "", "", "", "", "")
Call AddToList("PG", "", "", "", "", "")
Call AddToList("ml1", "5", "", "", "", "")
Call AddToList("coolbag", "", "", "", "", "")
Call AddToList("forest", "", "", "", "", "")
End Sub
Sub Displaylist()
List1.Clear
For i = 0 To 60
    If ListOfModules(i, 0) = "-1" Then Exit For
    If ListOfModules(i, 0) = "mset" Then
        a = "Mandelbrot set Xa =" + ListOfModules(i, 1) + " Ya = " + ListOfModules(i, 2) + " Xb = " + ListOfModules(i, 3) + " Yb = " + ListOfModules(i, 4)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "land" Then
        a = "Fractal Landscape"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "ross" Then
        a = "Rossler Attractor. Iterations = " + ListOfModules(i, 1)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "Lorentz" Then
        a = "Lorenz Attractor. Iterations = " + ListOfModules(i, 1)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "Henon" Then
        a = "Henon Attractor. Iterations = " + ListOfModules(i, 1)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "Organic" Then
        a = "Organic. Iterations = " + ListOfModules(i, 1)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "pascal" Then
        a = "Pascals Triangle"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "cantor" Then
        a = "Cantor bars"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "carpet" Then
        a = "Carpet"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "circ" Then
        a = "Circles"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "coast" Then
        a = "Coast"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "fern" Then
        a = "Fern. Iterations = " + ListOfModules(i, 1)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "gasket5" Then
        a = "Pentagon gasket. Iterations = " + ListOfModules(i, 1)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "gasket3" Then
        a = "Sierpinsky gasket. Iterations = " + ListOfModules(i, 1)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "snow4" Then
        a = "Snowflake - square. Iterations = " + ListOfModules(i, 1)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "snow5" Then
        a = "Snowflake - pentagon. Iterations = " + ListOfModules(i, 1)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "snow6" Then
        a = "Snowflake - hexagon. Iterations = " + ListOfModules(i, 1)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "square" Then
        a = "Square. Iterations = " + ListOfModules(i, 1)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "tree" Then
        a = "Tree. Depth of iterations = " + ListOfModules(i, 1)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "wave" Then
        a = "Wave"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "majority" Then
        a = "2-DCA majority rule." + ListOfModules(i, 1) + " surrounding cells."
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "1in8" Then
        a = "2-D CA 1 in 8 rule. Screen iterations =" + ListOfModules(i, 1)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "rndifs" Then
        a = "Random IFS pattern."
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "bagula1" Then
        a = "Lapidus' Sierpinsky. iterations = " + ListOfModules(i, 1) + " Sides =" + ListOfModules(i, 2)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "1dca3" Then
        a = "1-D CA"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "grav" Then
        a = "Gravity"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "levy" Then
        a = "Levy Dragon. Iterations = " + ListOfModules(i, 1) + " Number = " + ListOfModules(i, 2)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "life" Then
        a = "Life. Screen iterations = " + ListOfModules(i, 1)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "Bird" Then
        a = "Bird"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "Binary" Then
        a = "Binary"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "Dendritic" Then
        a = "Dendritic"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "Feigenbaum" Then
        a = "Feigenbaum"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "Julia" Then
        a = "Julia. Screen iterations = " + ListOfModules(i, 1)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "Koch" Then
        a = "Koch. Depth of iteration = " + ListOfModules(i, 1)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "ThrowPic" Then
        a = "Throw this picture at the screen:" + ListOfModules(i, 1) + " for " + ListOfModules(i, 2) + " seconds."
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "Contin" Then
        a = "Continuous 1-D CA"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "PropSier" Then
        a = "Proper Sierpinsky Carpet. Depth of iteration = " + ListOfModules(i, 1)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "boid" Then
        a = "Boids for " + ListOfModules(i, 1) + " seconds, number= " + ListOfModules(i, 2) + " , acc = " + ListOfModules(i, 3) + " , rand = " + ListOfModules(i, 4)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "hilbert" Then
        a = "Hilbert curve"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "Bool" Then
        a = "Random Boolean network"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "Gimps" Then
        a = "Gimps"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "JM" Then
        a = "Julia Morpher"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "PG" Then
        a = "Pixel game"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "ml1" Then
        a = "Malformation 1, m:" + ListOfModules(i, 1)
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "coolbag" Then
        a = "CoolBagula"
        List1.AddItem a
    ElseIf ListOfModules(i, 0) = "forest" Then
        a = "Percolation net - forest"
        List1.AddItem a
    Else
        'MsgBox ListOfModules(i, 0)
        'List1.AddItem ListOfModules(i, 0)
    End If
Next i
End Sub
Sub SaveNow()
Open GetWinDir + "\FracSaver.INI" For Output As #1
Close #1
Kill GetWinDir + "\FracSaver.INI"

Open GetWinDir + "\FracSaver.INI" For Output As #1
For i = 0 To 60
    If ListOfModules(i, 0) = "-1" Then Exit For
    For y = 0 To 5
        Write #1, ListOfModules(i, y)
    Next y
Next i
Goodbye:
Close #1
End Sub
Private Sub UpDown1_DownClick()
Text27.Text = RIGHT$(Str$(Val(Text27.Text) - 10), Len(Str$(Val(Text27.Text) - 10)) - 1)
If Val(Text27.Text) < 20 Then Text27.Text = 20
End Sub
Private Sub UpDown1_UpClick()
Text27.Text = RIGHT$(Str$(Val(Text27.Text) + 10), Len(Str$(Val(Text27.Text) + 10)) - 1)
End Sub
Private Sub Label17_Click()
Call ShellExecute(0, "", "mailto:Steve@fractalus.com", "", "", 0)
End Sub
Private Sub Timer1_Timer()
Text28.Text = Str$(Int(SierCounter / 1500 * 100)) + "%"
If SierRunMode = 0 Then
    SierRunMode = 1
    For q = 0 To 1
        For w = 0 To 2
            Points(q, w) = Rnd(1) * 100
        Next w
    Next q
    Picture1.Cls
    Picture1.ScaleWidth = 100
    Picture1.ScaleHeight = 100
    SierX = 0
    SierY = 0
    SierCounter = 0
End If
    If SierCounter > 1500 Then SierRunMode = 0
    For we = 1 To 20
    SierCounter = SierCounter + 1
    a = Int(Rnd(1) * 3)
    Dx = Points(0, a)
    Dy = Points(1, a)
    SierX = ((SierX - Dx) / 2) + Dx
    SierY = ((SierY - Dy) / 2) + Dy
    Picture1.PSet (SierX, SierY), QBColor(15)
    Next we
End Sub
