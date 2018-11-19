#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>

typedef struct TreeNode *HuffmanTree;
typedef TreeNode{
	int Weight;
	HuffmanTree Left, Right;
}; 

HuffmanTree Huffman(MinHeap H){
	int i;
	HuffmanTree T;
	BuildMinHeap(H);
	for (i = 1; i<H->Size; i++){
		T = malloc(sizeof(struct TreeNode));
		T->Left = DeleteMin(H);
		T->Right = DeleteMin(H);
		T->Weight = T->Left->Weight+T->Right->Weight;
		Insert(H, T);
	}
	T = DeleteMin(H);
	return T;
}

// ��������С�Ѷ����ݽ������򣬲��𽥽�����������֯��һ����
// ��Ȼ���������ݴ洢������������˵������֯�õ���Root��δ��֯�õ���ɢNode 
