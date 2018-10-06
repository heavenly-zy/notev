#include <iostream> 
#include <fstream>

using namespace std;

int main(){
	// ifstream input("score.txt"); // 和下面两句效果一样 
	ifstream input;
	input.open("scores.txt");
	
	if (input.fail()){
		cout << "File does not exist" << endl;
		cout << "Exit program" << endl;
		return 0;
	} 
	char firstName[80];
	char mi;
	char lastName[80];
	int score;
	
	while (!input.eof()){
		input >> firstName >> mi >> lastName >> score;
		cout << firstName << " " << mi << " " << lastName << " "
		<< score << endl;
	}
	
	input.close();
	cout << "Done" << endl;
	return 0;
}
