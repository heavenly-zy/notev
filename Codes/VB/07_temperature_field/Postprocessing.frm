VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Main 
   Caption         =   "Form1"
   ClientHeight    =   9615
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   13695
   LinkTopic       =   "Form1"
   ScaleHeight     =   9615
   ScaleWidth      =   13695
   StartUpPosition =   3  '����ȱʡ
   Begin VB.CommandButton Compute_Button 
      Caption         =   "��ʼ����"
      Height          =   735
      Left            =   10680
      TabIndex        =   8
      Top             =   2160
      Width           =   1335
   End
   Begin VB.CommandButton Test 
      Caption         =   "test"
      Height          =   735
      Left            =   10560
      TabIndex        =   7
      Top             =   5040
      Width           =   1215
   End
   Begin VB.CheckBox Dynamic_View_CheackBox 
      Caption         =   "�ۿ���̬����"
      Height          =   495
      Left            =   10560
      TabIndex        =   6
      Top             =   3960
      Value           =   1  'Checked
      Width           =   1695
   End
   Begin VB.CheckBox Hidden_Sand_CheckBox 
      Caption         =   "����ʾ����"
      Height          =   495
      Left            =   10680
      TabIndex        =   5
      Top             =   3120
      Value           =   1  'Checked
      Width           =   1575
   End
   Begin MSComDlg.CommonDialog CommonDialog 
      Left            =   9960
      Top             =   720
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin ComctlLib.StatusBar StatusBar 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   4
      Top             =   9240
      Width           =   13695
      _ExtentX        =   24156
      _ExtentY        =   661
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   4
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Object.Tag             =   ""
         EndProperty
         BeginProperty Panel2 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Object.Tag             =   ""
         EndProperty
         BeginProperty Panel3 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Object.Width           =   3528
            MinWidth        =   3528
            Object.Tag             =   ""
         EndProperty
         BeginProperty Panel4 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Object.Width           =   5292
            MinWidth        =   5292
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton Settings_Button 
      Caption         =   "��������"
      Height          =   735
      Left            =   10680
      TabIndex        =   3
      Top             =   1320
      Width           =   1335
   End
   Begin VB.CommandButton Data_Import_Button 
      Caption         =   "��������"
      Height          =   615
      Left            =   10680
      TabIndex        =   2
      Top             =   600
      Width           =   1335
   End
   Begin ComctlLib.ProgressBar ProgressBar 
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   8640
      Width           =   9615
      _ExtentX        =   16960
      _ExtentY        =   661
      _Version        =   327682
      Appearance      =   1
   End
   Begin VB.PictureBox Grid 
      AutoRedraw      =   -1  'True
      Height          =   8000
      Left            =   120
      ScaleHeight     =   7935
      ScaleWidth      =   9540
      TabIndex        =   0
      Top             =   240
      Width           =   9600
   End
End
Attribute VB_Name = "Main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim PI!
Dim Material_Matrix()
Dim Temperature_Matrix() As Single
Dim Tmp_Matrix() As Single
Dim L_Matrix() As Single
Dim Loaded As Boolean
Dim paused As Boolean
Dim pause_index%
Public delta_x As Single, delta_y As Single

Private Sub Form_Load()
    PI = 3.1415926
    Loaded = False
    paused = True
    pause_index = 1
    Init_Material_Params
    Init_ShadeGuide
End Sub

' ��ʼ�����
'' ��ʼ���¶Ⱦ���Ǳ�Ⱦ���
Private Sub Init_Temperature_Matrix()
    For i = 0 To range_x - 1
        For j = 0 To range_y - 1
            Temperature_Matrix(i, j) = T0(Material_Matrix(i, j))
            If Material_Matrix(i, j) = CASTING Then
                L_Matrix(i, j) = Materials(CASTING).L
            End If
        Next j
    Next i
End Sub

'' ��������
Private Sub Data_Import_Button_Click()
    'On Error GoTo ErrHandler
    Dim filename As String
    filename = App.Path & "\data\mesh.dat"
    CommonDialog.CancelError = True
    CommonDialog.Flags = cdlOFNHideReadOnly
    CommonDialog.Filter = "All Files (*.*)|*.*|Text Files (*.txt)|*.txt|Binary Files (*.dat)|*.dat"
    CommonDialog.filename = filename
    CommonDialog.FilterIndex = 3
    CommonDialog.ShowOpen
    filename = CommonDialog.filename
    Dim cnt%, line%
    Dim s As String
    i = 0
    line = 0
    Open filename For Input As #1
        Do While Not EOF(1)
            Line Input #1, s
            If Not s = "" Then
                If Mid(s, 1, 3) = "###" Then
                    cnt = cnt + 1
                    line = 0
                Else
                    Select Case cnt
                        Case 1
                            Materials(line) = StringToMaterial(s)
                        Case 2
                            range_x = Val(Split(s, ",")(0))
                            range_y = Val(Split(s, ",")(1))
                            delta_x = 0.5 / range_x
                            delta_y = 0.5 / range_y
                            ReDim Material_Matrix(range_x - 1, range_y - 1)
                            ReDim Temperature_Matrix(range_x - 1, range_y - 1)
                            ReDim Tmp_Matrix(range_x - 1, range_y - 1)
                            ReDim L_Matrix(range_x - 1, range_y - 1)
                            Grid.Scale (0, range_y)-(range_x * 1.2, 0)
                        Case 3
                            j = 0
                            For Each c In Split(s, ",")
                                Material_Matrix(line, j) = Val(c)
                                j = j + 1
                            Next c
                    End Select
                    line = line + 1
                End If
            End If
        Loop
    Close #1
    Loaded = True
    Init_Temperature_Matrix
    Redraw_Cloud_Chart (Hidden_Sand_CheckBox.Value)
    Mesh
ErrHandler:
    Exit Sub
End Sub

'' ��ʼ��ɫ��
Private Sub Init_ShadeGuide()
    Grid.AutoRedraw = True
    Grid.BackColor = vbBlack
    Grid.Scale (-40, 18)-(8, 0)
    Grid.ForeColor = vbWhite
    delta = PI / 16
    For i = 0 To 15
        Grid.Line (2, i + 1)-(4, i + 2), Get_Color(i * 100), BF
        Grid.CurrentX = 4: Grid.CurrentY = i + 1: Grid.Print i * 100
    Next i
    Grid.CurrentX = 5: Grid.CurrentY = 17: Grid.Print "ɫ��"
End Sub

''' ɫ�¶��պ���
Private Function Get_Color(T As Single) As Variant
    Dim i%
    Dim w!
    w = 2.5
    i = T / 100
    Get_Color = HSV(250 - sigmoid_variant(i / 16, w) * 250, 1, 1)
    ' ����ֱ�Ӿ��ȷ�ɫ���м����ɫ�������ֲ������ԣ�ʹ�� sigmoid ���������໺�����м�ȽϿ죩������е���, w Խ��Ч��Խ����
End Function

''' Sigmoid �Զ�����壬���ڵ�����ɫ�仯����
Private Function sigmoid_variant(x As Single, w As Single) As Single
    ' x (0, 1) w(0, INF) output (0, 1)
    x = w * 2 * (x - 0.5) ' x (-w, w) y (1-sigmoid(w), sigmoid(w))
    h = 2 * (sigmoid(w) - 0.5)
    sigmoid_variant = (sigmoid(x) - 0.5) / h + 0.5
End Function

''' Sigmoid
Private Function sigmoid(x As Single) As Single
    sigmoid = 1 / (1 + Exp(-x))
End Function

''' ���� HSV ɫֵ���� RGB ��ɫ
Private Function HSV(h As Integer, s As Single, v As Single) As Variant
   ' h(0, 360) s(0, 1.0) v(0, 1.0)
    Dim r As Single, g As Single, b As Single
    Dim i As Integer, f As Single, p As Single, q As Single, T As Single
    i = Int(h / 60) Mod 6
    f = h / 60 - i
    p = v * (1 - s)
    q = v * (1 - f * s)
    T = v * (1 - (1 - f) * s)
    
    Select Case i
        Case 0
            r = v
            g = T
            b = p
        Case 1
            r = q
            g = v
            b = p
        Case 2
            r = p
            g = v
            b = T
        Case 3
            r = p
            g = q
            b = v
        Case 4
            r = T
            g = p
            b = v
        Case 5
            r = v
            g = p
            b = q
    End Select
    HSV = RGB(r * 255, g * 255, b * 255)
End Function

' �����ص�
'' ��������
Private Sub Settings_Button_Click()
    Settings.Show
End Sub

'' �л�����/��ʾ����
Private Sub Hidden_Sand_CheckBox_Click()
    Redraw_Cloud_Chart (Hidden_Sand_CheckBox.Value)
    Mesh
End Sub

'' ��ʼ����
Private Sub Compute_Button_Click()
    If paused Then
        Compute_Button.Caption = "��ͣ����"
        paused = False
        Grid.AutoRedraw = True
        ProgressBar.Min = 1
        ProgressBar.Max = range_t
        For i = pause_index To range_t
            ' �ж��Ƿ���ͣ
            If paused Then
                pause_index = i
                Exit Sub
            End If
            
            ' ������һʱ���¶�
            Next_T
            
            ' ��ʾʱ��
            StatusBar.Panels(4).Text = Round(delta_t * i, 3) & "s"
            
            If i Mod 20 = 0 Then
                ' ������ͼ
                If Dynamic_View_CheackBox.Value Then
                    Redraw_Cloud_Chart (Hidden_Sand_CheckBox.Value)
                    Mesh
                    Grid.Refresh
                End If
                
                ' ���ƽ�����
                ProgressBar.Value = i
                
                ' ��ȡ���̱Ȳ���ʾ
                Solidification_Rate = Get_Solidification_Rate()
                StatusBar.Panels(3).Text = "���̰ٷֱȣ�" & Round(Solidification_Rate * 100, 2) & "%"
                If Solidification_Rate = 1 Then
                    Exit For
                End If
                
                ' �������������������ؼ�����ֹ����
                DoEvents
            End If
        Next i
        Compute_Button.Caption = "��ʼ����"
        pause_index = 1
    Else
        Compute_Button.Caption = "��������"
        paused = True
    End If
End Sub

' �ƶ��ص�
Private Sub Grid_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim real_x%, real_y%
    real_x = Int(x)
    real_y = Int(y)
    If Loaded And real_x < range_x And y < range_y Then
        StatusBar.Panels(1).Text = "(" & real_x & ", " & real_y & ")"
        StatusBar.Panels(2).Text = Temperature_Matrix(real_x, real_y) & "��"
    End If
End Sub

' �������
'' ������ͼ
Private Sub Redraw_Cloud_Chart(Only_Casting As Boolean)
    For i = 0 To range_x - 1
        For j = 0 To range_y - 1
            If Only_Casting Then
                If Material_Matrix(i, j) = CASTING Then
                    Grid.Line (i, j)-(i + 1, j + 1), Get_Color(Temperature_Matrix(i, j)), BF
                Else
                    Grid.Line (i, j)-(i + 1, j + 1), RGB(77, 77, 77), BF
                End If
            Else
                Grid.Line (i, j)-(i + 1, j + 1), Get_Color(Temperature_Matrix(i, j)), BF
            End If
        Next j
    Next i
End Sub

'' ���Ʊ߽�
Private Sub Redraw_Border()
    Grid.Line (0, 0)-(range_x, 1 / 2), vbBlack, BF
    Grid.Line (0, range_y - 1 / 2)-(range_x, range_y), vbBlack, BF
    Grid.Line (0, 0)-(1 / 2, range_y), vbBlack, BF
    Grid.Line (range_x - 1 / 2, 0)-(range_x, range_y), vbBlack, BF
End Sub

'' ��������
Private Sub Mesh()
    For i = 0 To range_x
        Grid.Line (i, 0)-(i, range_y), vbBlack
    Next i
    For i = 0 To range_y
        Grid.Line (0, i)-(range_x, i), vbBlack
    Next i
    Redraw_Border
End Sub

' �������
'' �¶Ⱦ�����һʱ��
Private Sub Next_T()
    ' ������һʱ���¶�
    Dim s!, w!, d! ' ������Ӵ���ȡ�����ȡ������¶����ľ���
    Dim T!
    Dim Ma As Material
    Dim m!
    For i = 0 To range_x - 1
        For j = 0 To range_y - 1
            ' ����Ӹ������õ�����
            heat = 0
            Ma = Materials(Material_Matrix(i, j))
            Call Get_SWD(s, w, d, i, j, 0)
            heat = heat + Get_Heat(i, j, i - 1, j, s, w, d)
            heat = heat + Get_Heat(i, j, i + 1, j, s, w, d)
            Call Get_SWD(s, w, d, i, j, 1)
            heat = heat + Get_Heat(i, j, i, j - 1, s, w, d)
            heat = heat + Get_Heat(i, j, i, j + 1, s, w, d)
            m = Ma.rho * s * w ' ��Ԫ����
            dT = heat / (Ma.c * m) ' ��ʱ�¶ȱ仯ֵ
            T = Temperature_Matrix(i, j)
            
            ' ����Ǳ��
            If compute_L Then
                If Material_Matrix(i, j) = CASTING And T + dT < Materials(CASTING).Tl And L_Matrix(i, j) > 0.001 Then
                    heat = heat + Ma.c * m * (T - Materials(CASTING).Tl)
                    T = Materials(CASTING).Tl
                    If -heat >= L_Matrix(i, j) * m Then
                        heat = heat + L_Matrix(i, j) * m
                        L_Matrix(i, j) = 0
                        dT = heat / (Ma.c * m)
                    Else
                        L_Matrix(i, j) = L_Matrix(i, j) + heat / m
                        dT = 0
                    End If
                End If
            End If
            
            ' �����¶�
            Tmp_Matrix(i, j) = T + dT
        Next j
    Next i
    ' ��ʱ������ֵ�����¶Ⱦ���
    For i = 0 To range_x - 1
        For j = 0 To range_y - 1
            Temperature_Matrix(i, j) = Tmp_Matrix(i, j)
        Next j
    Next i
End Sub

'' ���������ĽӴ���ȡ���ȡ��¶����ľ���
Private Sub Get_SWD(ByRef s!, ByRef w!, ByRef d!, ByVal x%, ByVal y%, ByVal direct%)
    Dim dx!, dy!
    dx = delta_x
    dy = delta_y
    If x = 0 Or x = range_x - 1 Then ' ���ұ߽�
        dx = dx / 2
    End If
    If y = 0 Or y = range_y - 1 Then ' ���±߽�
        dy = dy / 2
    End If
    If direct = 0 Then ' �����ˮƽ����
        d = delta_x
        s = dy
        w = dx
    Else ' �������ֱ����
        d = delta_y
        s = dx
        w = dy
    End If
End Sub

'' ����Դ��㵽Ŀ�Ľ��Ľ�������
Private Function Get_Heat(ByVal x%, ByVal y%, ByVal sx%, ByVal sy%, ByVal s!, ByVal w!, ByVal d!)
    If sx < 0 Or sx >= range_x Or sy < 0 Or sy >= range_y Then
        h = TT(Material_Matrix(x, y), AIR)
        Get_Heat = h * (T0(AIR) - Temperature_Matrix(x, y)) * s * delta_t
        Exit Function
    Else
        If Material_Matrix(x, y) = Material_Matrix(sx, sy) Then
            k = Materials(Material_Matrix(x, y)).k
        Else
            k1 = Materials(Material_Matrix(x, y)).k
            k2 = Materials(Material_Matrix(sx, sy)).k
            k = 2 * k1 * k2 / (k1 + k2)
        End If
        Get_Heat = k * (Temperature_Matrix(sx, sy) - Temperature_Matrix(x, y)) / d * s * delta_t
        Exit Function
    End If
End Function

'' ��ȡ������
Private Function Get_Solidification_Rate() As Single
    Dim cnt%, total%
    cnt = 0
    total = 0
    For i = 0 To range_x - 1
        For j = 0 To range_y - 1
            If Material_Matrix(i, j) = CASTING Then
                If L_Matrix(i, j) < 0.01 Then
                    cnt = cnt + 1
                End If
                total = total + 1
            End If
        Next j
    Next i
    Get_Solidification_Rate = 1# * cnt / total
End Function

' ��������ʱ��ť
Private Sub Test_Click()
    Next_T
    Redraw_Cloud_Chart (Hidden_Sand_CheckBox.Value)
    Mesh
End Sub
