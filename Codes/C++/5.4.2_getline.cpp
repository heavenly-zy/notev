#include <iostream> 
#include <fstream>

using namespace std;

int main(){
	ifstream input;
	input.open("state.txt"); // "New York#New Mexico#Texas#Indiana"
	
	if (input.fail()){
		cout << "File does not exist" << endl;
		cout << "Exit program" << endl;
		return 0;
	}
	
	char city[40];
	while (!input.eof()){
		input.getline(city, 40, '#');
		cout << city << endl;
	}
	
	input.close();
	cout << "Done" << endl;
	return 0;
}
