#include <iostream> 
#include <fstream>

using namespace std;

int main(){
	fstream inout;
	inout.open("city.txt", ios::out);
	
	inout << "Beijing" << " " << "Shanghai" << " " << "Guangzhou" << " ";
	inout.close();
	
	inout.open("city.txt", ios::out | ios::app);
	inout << "Shenzhen" << " " << "Hongkong";
	inout.close();
	
	char city[20];
	inout.open("city.txt", ios::in);
	while(!inout.eof()){
		inout >> city;
		cout << city << " ";
	}
	
	return 0;
}
