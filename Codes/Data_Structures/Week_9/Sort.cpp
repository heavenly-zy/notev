/*
# ����
����N���������ͷ�Χ�ڵģ�������Ҫ�������С���������Ľ����

����ּ�ڲ��Ը��ֲ�ͬ�������㷨�ڸ�����������µı��֡�������������ص����£�

* ����1��ֻ��1��Ԫ�أ�
* ����2��11������ͬ�����������Ի�����ȷ�ԣ�
* ����3��103�����������
* ����4��104�����������
* ����5��105�����������
* ����6��105��˳��������
* ����7��105������������
* ����8��105�����������������
* ����9��105�������������ÿ�����ֲ�����1000��

# �����ʽ:
�������һ�и���������N(<=10^5)�����һ�и���N���������ͷ�Χ�ڵģ�����������Կո�ָ���


# �����ʽ:
��һ���������С���������Ľ�������ּ���1���ո�ָ�����ĩ�����ж���ո�

# ��������:
```
11
4 981 10 -17 0 -20 29 50 8 43 -5
``` 

# �������:
```
-20 -17 -5 0 4 8 10 29 43 50 981
```
*/


#include <iostream> 
#include <cstdlib>

#define MAXSIZE 100005

using namespace std;

template<typename T>
void Bubble_Sort(T A[], int N){
	for (int P = N-1; P >= 0; P--){
		bool flag = false;
		for (int i = 0; i < P; i++){
			if (A[i] > A[i+1]){
				T t = A[i];
				A[i] = A[i+1];
				A[i+1] = t;
				flag = true;
		    }
		}
		if (!flag)
			break;
	}
}

template<typename T>
void Insertion_Sort(T A[], int N){
	int i;
	for ( int P = 1; P < N; P++){
		T Tmp = A[P];
		for (i = P; i > 0 && A[i-1] > Tmp; i--){
			A[i] = A[i-1];
		}
		A[i] = Tmp;
	}
}

template<typename T>
void Shell_Sort(T A[], int N){
	int i;
	for (int D = N/2; D > 0; D /= 2){
		for ( int P = D; P < N; P++){
		    T Tmp = A[P];
		    for (i = P; i >= D && A[i-D] > Tmp; i-=D){
			    A[i] = A[i-D];
		    }
		    A[i] = Tmp;
	    }
	}
}


int main(){
	// IN
	int N, a[MAXSIZE];
	cin >> N;
	for (int i = 0; i < N; i++){
		cin >> a[i];
	}
	// Sort
	Shell_Sort(a, N);
	// OUT
	for (int i = 0; i < N; i++){
		cout << a[i];
		if (i < N-1){
			cout << ' ';
		}
	}
	return 0;
}
