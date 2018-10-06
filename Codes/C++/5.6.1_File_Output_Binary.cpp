#include <iostream> 
#include <fstream>

using namespace std;

int main(){
	fstream binaryio;
	binaryio.open("city.dat", ios::out | ios::binary);
	char s[] = "Hangzhou";
	binaryio.write(s, 8);
	binaryio.close();
	
	cout << "Done" << endl;
	
	return 0;
}
