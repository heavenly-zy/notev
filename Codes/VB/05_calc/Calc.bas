Attribute VB_Name = "Calc"
Dim operationUnitStack As Stack '���㵥λջ
Dim operatorStack As Stack '�����ջ
Dim operandTmp As Operation '��������ʱ����
Dim postfixExpressionQueue As Queue '��׺���ʽ����
Dim runtimeStack As Stack '����ʱջ ���ڶԺ�׺���ʽ���м���

Public Sub init()
    'Shell (start & "calc.exe")
    Set operationUnitStack = New Stack
    Set operatorStack = New Stack
    Set operandTmp = New Operation
    operandTmp.value = 0
    operandTmp.dot = 0
    Set postfixExpressionQueue = New Queue
    Set runtimeStack = New Stack
End Sub

Public Sub addUnit(unit As Operation)
    If unit.isBackSpace() Then
        Call operationUnitStack.pop
    ElseIf unit.isC() Then
        Call operationUnitStack.clear
    ElseIf unit.isCE() Then
        While operationUnitStack.peek().isOperand()
            Call operationUnitStack.pop
        Wend
    ElseIf unit.isEqual() Then
        Call compute
    Else
        operationUnitStack.push (unit)
    End If
End Sub

Public Sub compute()
    ' ����ǰ����
    If Not operatorStack.isEmpty() Then
        MsgBox "�����ջ����ǰ�ǿգ�"
    End If
    If Not (operandTmp.value = 0) Then
        MsgBox "��������ʱ��������ǰ�ǿգ�"
    End If
    If Not (operandTmp.dot = 0) Then
        MsgBox "С����λ����ʱ��������ǰ�ǿգ�"
    End If
    If Not postfixExpressionQueue.isEmpty() Then
        MsgBox "��׺���ʽ��������ǰ�ǿգ�"
    End If
    If Not runtimeStack.isEmpty() Then
        MsgBox "����ʱջ����ǰ�ǿգ�"
    
    ' ����׺���ʽ����Ϊ��׺���ʽ
    eles = operationUnitStack.getElements()
    For Each ele In eles
        If ele.isVariable() Then
            Set newOperand = New Operation
            newOperand.value = operandTmp.value * ele.value
            newOperand.dot = operandTmp.dot + ele.dot - 1
            postfixExpressionQueue.enqueue (newOperand)
            operandTmp.value = 0
            operandTmp.dot = 0
        ElseIf ele.isOperator() Then
            Set newOperand = New Operation
            newOperand.value = operandTmp.value
            newOperand.dot = operandTmp.dot - 1
            postfixExpressionQueue.enqueue (newOperand) ' ���Ѿ��ݴ�Ĳ�����װ�����׺����
            operandTmp.value = 0
            operandTmp.dot = 0
            
            If ele.isLeftBracket() Then ' ����������ǿ����ջ�����������ȼ�
                ele.precedence = 0
                operatorStack.push (ele)
            ElseIf ele.isRightBracket() Then ' ���������Ų�������ջ��ֱ�����������Ż�ջ��
                While Not (operatorStack.isEmpty() Or operatorStack.peek().isLeftBracket())
                    postfixExpressionQueue.enqueue (operatorStack.pop())
                Wend
                If Not operatorStack.isEmpty() Then
                    Call operatorStack.pop
                End If
            ElseIf operatorStack.isEmpty() Or ele.precedence > operatorStack.peek().precedence Then ' �����ȼ�����ջ�������������ջ
                operatorStack.push (ele)
            Else
                While Not operatorStack.isEmpty() And ele.precedence <= operatorStack.peek().precedence ' �����ȼ�С�ڵ���ջ�����������������ջ��ֱ������ջ��
                    postfixExpressionQueue.enqueue (operatorStack.pop())
                Wend
                opertorStack.push (ele)
            End If
        ElseIf ele.isOperand() Then
            operandTmp.value = operandTmp.value * 10 + ele.value
            If ele.isDot() Then
                operandTmp.dot = 1
            End If
            If Not (operandTmp.dot = 0) Then
                operandTmp.dot = operandTmp.dot + 1
            End If
        End If
    Next ele
    While Not operatorStack.isEmpty() ' ʣ�������ȫ����ջ
        postfixExpressionQueue.enqueue (operatorStack.pop())
    Wend
    
    ' �Ժ�׺���ʽ���м��� ʵ��̫�鷳�� ��ס�ˣ�
    if
End Sub
