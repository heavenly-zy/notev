/*
# ��·���ͨ���д�����·��ͳ�����ݱ��У��г����п��ܽ���ɱ�׼��·����������·�ĳɱ�����ʹÿ�����䶼
�й�·��ͨ����Ҫ����ͳɱ���

# �����ʽ:
�������ݰ���������Ŀ������N����1000���ͺ�ѡ��·��ĿM����3N��������M�ж�ӦM����·��ÿ�и���3����������
�ֱ��Ǹ�����·ֱ����ͨ����������ı���Լ��õ�·�Ľ���Ԥ��ɱ���Ϊ������������1��N��š�

# �����ʽ:
������ͨ��Ҫ����ͳɱ�������������ݲ����Ա�֤��ͨ�������?1����ʾ��Ҫ������๫·��

# ��������:
```
6 15
1 2 5
1 3 3
1 4 7
1 5 4
1 6 2
2 3 4
2 4 6
2 5 2
2 6 6
3 4 6
3 5 1
3 6 1
4 5 10
4 6 8
5 6 3
``` 

# �������:
```
12
```
*/


#include <iostream> 
#include <cstdlib>
#include <vector>

#define MAXSIZE 100
#define INFINITY 999999

using namespace std;

class Edge{
	public:
		Edge(int village1, int village2, int d): v1(village1), v2(village2), dist(d){};
		int v1;
		int v2;
		int dist;
};

int MST[1000];
vector<Edge> E;

int main(){
	int N, M;
	cin >> N >> M;
	for (int i = 0; i < M; i++){
		int v1, v2, dist;
		cin >> v1 >> v2 >> dist;
		E.push_back(Edge(v1, v2, dist));
	}
	return 0;
}
