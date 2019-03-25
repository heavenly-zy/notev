VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Operation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Public opType As String '�������� ��������������������
' �����ר��
Public details As String '���� �������ŵȵ�
Public text As String '��ʾ�ı�
Public precedence As Integer '���ȼ�
Public varNum As Integer 'n Ԫ�����
' ������ ����ר��
Public value As Integer '����������ֵ
Public dot As Integer ' С����λ��

Public Function isOperator() As Boolean
    isOperator = (opType = "operator")
End Function

Public Function isOperand() As Boolean
    isOperand = (opType = "operand")
End Function

Public Function isVariable() As Boolean
    isOperand = (opType = "variable")
End Function

' ���Ӻ͵�������ʱ����

Public Function isDot() As Boolean
    isOperand = (details = "dot")
End Function

' �����׺����ʽ���в���

Public Function isLeftBracket() As Boolean
    isOperand = (details = "leftBracket")
End Function

Public Function isRightBracket() As Boolean
    isOperand = (details = "rightBracket")
End Function

' �������㵥λջ����

Public Function isEqual() As Boolean
    isOperand = (details = "equal")
End Function

Public Function isCE() As Boolean
    isOperand = (details = "CE")
End Function

Public Function isC() As Boolean
    isOperand = (details = "C")
End Function

Public Function isBackSpace() As Boolean
    isOperand = (details = "backspace")
End Function

' ��˫Ŀ�����

Public Function isUnaryOperator() As Boolean
    isUnaryOperator = (varNum = 1)
End Function

Public Function isBinaryOperator() As Boolean
    isBinaryOperator = (varNum = 2)
End Function

' ���� or ʵ��

Public Function isInt() As Boolean
    isInt = (dot = 0)
End Function