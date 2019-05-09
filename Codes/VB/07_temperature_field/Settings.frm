VERSION 5.00
Begin VB.Form Settings 
   Caption         =   "Form2"
   ClientHeight    =   9015
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   5850
   LinkTopic       =   "Form2"
   ScaleHeight     =   9015
   ScaleWidth      =   5850
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton Set_Params_Button 
      Caption         =   "确定"
      Height          =   855
      Left            =   720
      TabIndex        =   3
      Top             =   7800
      Width           =   4095
   End
   Begin VB.Frame Heat_Transfer_Coefficient_Frame 
      Caption         =   "传热系数"
      Height          =   2055
      Left            =   360
      TabIndex        =   2
      Top             =   5160
      Width           =   4695
      Begin VB.TextBox CA_Transfer_Box 
         Height          =   270
         Left            =   2400
         TabIndex        =   23
         Text            =   "29.03"
         Top             =   1680
         Width           =   1695
      End
      Begin VB.TextBox CS_Transfer_Box 
         Height          =   270
         Left            =   2400
         TabIndex        =   22
         Text            =   "0"
         Top             =   1200
         Width           =   1575
      End
      Begin VB.TextBox SA_Transfer_Box 
         Height          =   270
         Left            =   2400
         TabIndex        =   21
         Text            =   "25.08"
         Top             =   720
         Width           =   1575
      End
      Begin VB.TextBox CC_Transfer_Box 
         Height          =   270
         Left            =   2400
         TabIndex        =   17
         Text            =   "2000"
         Top             =   360
         Width           =   1575
      End
      Begin VB.Label CA_Transfer_Label 
         AutoSize        =   -1  'True
         Caption         =   "铸件/空气"
         Height          =   180
         Left            =   600
         TabIndex        =   20
         Top             =   1680
         Width           =   810
      End
      Begin VB.Label CS_Transfer_Label 
         AutoSize        =   -1  'True
         Caption         =   "铸件/铸型"
         Height          =   180
         Left            =   600
         TabIndex        =   19
         Top             =   1200
         Width           =   810
      End
      Begin VB.Label SA_Transfer_Label 
         AutoSize        =   -1  'True
         Caption         =   "铸型/空气"
         Height          =   180
         Left            =   600
         TabIndex        =   18
         Top             =   840
         Width           =   810
      End
      Begin VB.Label CC_Transfer_Label 
         AutoSize        =   -1  'True
         Caption         =   "铸件/冷铁"
         Height          =   180
         Left            =   600
         TabIndex        =   16
         Top             =   360
         Width           =   810
      End
   End
   Begin VB.Frame Start_Params_Frame 
      Caption         =   "初始温度"
      Height          =   2175
      Left            =   360
      TabIndex        =   1
      Top             =   2640
      Width           =   4815
      Begin VB.TextBox Air_T0_Box 
         Height          =   375
         Left            =   2280
         TabIndex        =   15
         Text            =   "30"
         Top             =   1680
         Width           =   1935
      End
      Begin VB.TextBox Chill_T0_Box 
         Height          =   375
         Left            =   2280
         TabIndex        =   14
         Text            =   "25"
         Top             =   1320
         Width           =   1935
      End
      Begin VB.TextBox Sand_T0_Box 
         Height          =   375
         Left            =   2280
         TabIndex        =   13
         Text            =   "30"
         Top             =   840
         Width           =   1935
      End
      Begin VB.TextBox Casting_T0_Box 
         Height          =   375
         Left            =   2280
         TabIndex        =   12
         Text            =   "973"
         Top             =   360
         Width           =   1935
      End
      Begin VB.Label Air_T0_Label 
         AutoSize        =   -1  'True
         Caption         =   "空气"
         Height          =   180
         Left            =   480
         TabIndex        =   11
         Top             =   1560
         Width           =   360
      End
      Begin VB.Label Chill_T0_Label 
         AutoSize        =   -1  'True
         Caption         =   "冷铁"
         Height          =   180
         Left            =   480
         TabIndex        =   10
         Top             =   1200
         Width           =   360
      End
      Begin VB.Label Sand_T0_Label 
         AutoSize        =   -1  'True
         Caption         =   "铸型"
         Height          =   180
         Left            =   480
         TabIndex        =   9
         Top             =   840
         Width           =   360
      End
      Begin VB.Label Casting_T0_Label 
         AutoSize        =   -1  'True
         Caption         =   "铸件"
         Height          =   180
         Left            =   480
         TabIndex        =   8
         Top             =   360
         Width           =   360
      End
   End
   Begin VB.Frame Basic_Params_Frame 
      Caption         =   "基础参数"
      Height          =   2055
      Left            =   360
      TabIndex        =   0
      Top             =   240
      Width           =   5175
      Begin VB.CommandButton Compute_Delta_T_Button 
         Caption         =   "计算时间步"
         Height          =   855
         Left            =   4080
         TabIndex        =   24
         Top             =   600
         Width           =   855
      End
      Begin VB.TextBox Range_T_Box 
         Height          =   375
         Left            =   1680
         TabIndex        =   5
         Text            =   "20000"
         Top             =   1080
         Width           =   2055
      End
      Begin VB.TextBox Delta_T_Box 
         Height          =   375
         Left            =   1800
         TabIndex        =   4
         Text            =   "10"
         Top             =   480
         Width           =   2055
      End
      Begin VB.Label Range_T_Label 
         AutoSize        =   -1  'True
         Caption         =   "时间步数"
         Height          =   180
         Left            =   600
         TabIndex        =   7
         Top             =   1080
         Width           =   720
      End
      Begin VB.Label Delta_T_Label 
         AutoSize        =   -1  'True
         Caption         =   "时间步长"
         Height          =   180
         Left            =   600
         TabIndex        =   6
         Top             =   480
         Width           =   720
      End
   End
End
Attribute VB_Name = "Settings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    Delta_T_Box.Text = delta_t
    Range_T_Box.Text = range_t
    Sand_T0_Box.Text = T0(SAND)
    Casting_T0_Box.Text = T0(CASTING)
    Chill_T0_Box.Text = T0(CHILL)
    Air_T0_Box.Text = T0(AIR)
    CC_Transfer_Box.Text = TT(CHILL, CASTING)
    SA_Transfer_Box.Text = TT(SAND, AIR)
    CS_Transfer_Box.Text = TT(CASTING, SAND)
    CA_Transfer_Box.Text = TT(CASTING, AIR)
    Compute_Delta_T_Button_Click
End Sub

Private Sub Set_Params_Button_Click()
    delta_t = Val(Delta_T_Box.Text)
    range_t = Val(Range_T_Box.Text)
    T0(SAND) = Val(Sand_T0_Box.Text)
    T0(CASTING) = Val(Casting_T0_Box.Text)
    T0(CHILL) = Val(Chill_T0_Box.Text)
    T0(AIR) = Val(Air_T0_Box.Text)
    TT(CHILL, CASTING) = Val(CC_Transfer_Box.Text): TT(CASTING, CHILL) = Val(CC_Transfer_Box.Text)
    TT(SAND, AIR) = Val(SA_Transfer_Box.Text): TT(AIR, SAND) = Val(SA_Transfer_Box.Text)
    TT(CASTING, SAND) = Val(CS_Transfer_Box.Text): TT(SAND, CASTING) = Val(CS_Transfer_Box.Text)
    TT(CASTING, AIR) = Val(CA_Transfer_Box.Text): TT(AIR, CASTING) = Val(CA_Transfer_Box.Text)
    Unload Me
End Sub

Private Sub Compute_Delta_T_Button_Click()
    Dim delta_d!, delta_t!, M_Casting As Material
    If Main.delta_x < Main.delta_y Then
        delta_d = Main.delta_x
    Else
        delta_d = Main.delta_y
    End If
    M_Casting = Materials(CASTING)
    delta_t = 1 / 4 * delta_d * delta_d * M_Casting.c * M_Casting.rho / M_Casting.k
    Delta_T_Box.Text = Round(delta_t / 10, 3)
End Sub
