Attribute VB_Name = "Module1"
Public Type Material
    name As String
    type_ As String
    param1 As String
End Type

' ����ת��Ϊ����ı�
Public Function MaterialToString(m As Material) As String
    MaterialToString = m.name & "," & m.type_ & "," & m.param1
End Function

' �ı�ת��Ϊ����
Public Function StringToMaterial(ByRef s As String) As Material
    Dim m As Material
    params = Split(s, ",")
    m.name = params(0)
    m.type_ = params(1)
    m.param1 = params(2)
    StringToMaterial = m
End Function
