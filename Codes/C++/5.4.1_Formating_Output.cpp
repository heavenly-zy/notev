#include <iomanip> 
#include <fstream>

using namespace std;

int main(){
	ofstream output;
	output.open("scores.txt");
	
	output << setw(6) << "John" << setw(2) << "T" << setw(6) << "Smith"
	<< " " << setw(4) << 90 << endl;
	output << setw(6) << "Eric" << setw(2) << "K" << setw(6) << "Jones"
	<< " " << setw(4) << 85 << endl;
	
	output.close();
	return 0;
}
