#include <iostream> 
#include <fstream>

using namespace std;

int main(){
	fstream binaryio;
	binaryio.open("temp.dat", ios::in | ios::binary);
	int value;
	binaryio.read(reinterpret_cast<char * >(&value), sizeof(value));
	cout << value;
	binaryio.close();
	
//	cout << "Done" << endl;
	
	return 0;
}
