#include <iostream> 
#include <vector>
#include <string> 

using namespace std;

// 如果不声明命名空间的话，vector需要改成std::vector 

int main(){
	vector<int> intVector;
	for (int i = 0; i < 10; i++)
	    intVector.push_back(i + 1);
	std::cout << "Numbers in the vector:";
	for (int i = 0; i < intVector.size(); i++)
	    std::cout << intVector[i] << " ";
	
	vector<string> stringVector;
	stringVector.push_back("M");
	stringVector.push_back("I");
	stringVector.push_back("A");
	stringVector.push_back("O");
	std::cout << "\nStrings in the string vector: ";
	for (int i = 0; i < stringVector.size(); i++)
	    std::cout << stringVector[i] << " ";
	stringVector.pop_back();
	
	vector<string> v2;
	v2.swap(stringVector);
	v2[0] = "blabla";
	
	std::cout << "\nStrings in the vector v2: ";
	for (int i = 0; i < v2.size(); i++){
		std::cout << v2.at(i) << " ";
	}
	return 0;
}
