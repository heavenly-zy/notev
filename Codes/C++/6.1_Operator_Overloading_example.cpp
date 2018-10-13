#include <iostream> 
#include <string> 
#include <sstream>
#include <vector>

using namespace std;

int main(){
	// Student1~4
	string sname("Student"), snumber("1");
	for (int i = i; i <=4; i++){
		cout << sname + snumber << endl;
		snumber[0]++;
	}
	
	// Student5~7
	vector<char> vname(sname.begin(), sname.end());
	vname.resize(vname.size() + 1);
	for (int i = 5; i <=7; i++){
		vname[vname.size() - 1] = static_cast<char>(i + '0');
		for (unsigned int j = 0; j < vname.size(); j++)
		    cout << vname[j];
		cout << endl;
	}
	
	// Student8~10
	stringstream sequenceNo("", ios::out|ios::app);
	for (int i = 8; i <= 10; i++){
		sequenceNo.str("Student");
		sequenceNo << i;
		cout << sequenceNo.str() << endl;
	}
	
	cout << boolalpha << "Student1 > Student2 : " <<
	        (string("Student1") > string("Student2"));
	
	return 0;
}
