#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>

typedef struct{
	ElementType Data;
	int Parent;
} SetType;

int Find(SetType S[], ElementType X){
	int i;
	for (i=0; i<MaxSize && S[i].Data != X; i++);
	if (i >= MaxSize) return -1;
	for(;S[i].Parent >= 0; i = S[i].Parent);
	return i;
}

void Union(SetType S[], ElementType X1, ElementType X2){
	int Root1, Root2;
	Root1 = Find(S, X1);
	Root2 = Find(S, X2);
	if (Root1 != Root2) S[Roor2].Parent = Root1;
}


// �Ż�1�����ȹ鲢 
// ������Union���ܻᵼ�������ϳ���ʹ��FindЧ�ʲ��Ͻ��ͣ����Ծ���Ҫһ�ַ���������������
// ������Union��ʱ���ж��������ĸ����ߣ����͵ġ��޽ӡ����ߵ��ǿ�����ͺ�
/* 
����ʵ�������Ҫ�����ĸ��ڵ��ȡ�����ĸ߶���Ϣ�������Ҫ������֯�½ṹ��
ԭ�����Ǵ洢��-1�Ա�ʾ����㣬���ڿ��Դ洢 ���߶ȵ��෴�� ������ 
*/
// ���⻹���Աȹ�ģ��������һ���� 

// �Ż�2��·��ѹ��
// ÿһ��Find��ʱ������β�ݹ齫��·���ϵĸ���������������
