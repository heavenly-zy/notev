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
   StartUpPosition =   3  '����ȱʡ
   Begin VB.CommandButton Set_Params_Button 
      Caption         =   "ȷ��"
      Height          =   855
      Left            =   720
      TabIndex        =   3
      Top             =   7800
      Width           =   4095
   End
   Begin VB.Frame Heat_Transfer_Coefficient_Frame 
      Caption         =   "����ϵ��"
      Height          =   2055
      Left            =   360
      TabIndex        =   2
      Top             =   5160
      Width           =   4695
   End
   Begin VB.Frame Start_Params_Frame 
      Caption         =   "��ʼ�¶�"
      Height          =   2175
      Left            =   360
      TabIndex        =   1
      Top             =   2640
      Width           =   4815
   End
   Begin VB.Frame Basic_Params_Frame 
      Caption         =   "��������"
      Height          =   2055
      Left            =   360
      TabIndex        =   0
      Top             =   240
      Width           =   4695
   End
End
Attribute VB_Name = "Settings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Set_Params_Button_Click()
    Unload Me
End Sub
