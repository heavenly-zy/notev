#include <iostream>  
#include <sstream>
#include <cmath>

using namespace std;

class Rational {
	public:
		Rational(){
			numerator_ = 0;
			denominator_ = 1;
		}
		Rational(long numerator, long denominator){
			long factor = gcd(numerator, denominator);
			numerator_ = ((denominator > 0) ? 1 : -1) * numerator / factor;
			denominator_ = abs(denominator) / factor;
		}
		long getNumerator(){
			return numerator_;
		}
		long getDenominator(){
			return denominator_;
		}
		Rational add(Rational &secondRational){
			long n = numerator_ * secondRational.getDenominator() +
			     denominator_ * secondRational.getNumerator();
			long d = denominator_ * secondRational.getDenominator();
			return Rational(n, d);
		}
		Rational subtract(Rational &secondRational){
			long n = numerator_ * secondRational.getDenominator() -
			    denominator_ * secondRational.getNumerator();
			long d = denominator_ * secondRational.getNumerator();
			return Rational(n, d);
		}
		Rational multiply(Rational &secondRational){
			long n = numerator_ * secondRational.getNumerator();
			long d = denominator_ * secondRational.getDenominator();
			return Rational(n, d);
		}
		Rational divide(Rational &secondRational){
			long n = numerator_ * secondRational.getDenominator();
			long d = denominator_ * secondRational.getNumerator();
			return Rational(n, d);
		}
		int compareTo(Rational &secondRational){
			Rational temp = this->subtract(secondRational);
			if (temp.getNumerator() < 0)
				return -1;
			else if (temp.getNumerator() == 0)
				return 0;
			else
			    return 1;
		}
		bool equals(Rational &secondRational){
			if (this->compareTo(secondRational) == 0)
			    return true;
			else
			    return false;
		}
		int intValue(){
			return getNumerator() / getDenominator();
		}
		double doubleValue(){
			return 1.0 * getNumerator() / getDenominator();
		}
		string toString(){
			stringstream stringStream;
			if (denominator_ != 1){
				stringStream << numerator_ << "/" << denominator_;
			}
			else{
				stringStream << numerator_;
			}
			return string(stringStream.str());
		}
	
	private:
		long numerator_;
		long denominator_;
		static long gcd(long n, long d){
			long n1 = abs(n);
			long n2 = abs(d);
			int gcd = 1;
			
			for (int k = 1; k <= n1 && k <= n2; k++){
				if (n1 % k == 0 && n2 % k == 0)
				    gcd = k;
				 
				    
			}
			return gcd;
		}
}; 

int main(){
	Rational r1(4, 2);
	Rational r2(2, 3);
	
	cout << r1.toString() << " + " << r2.toString() << " = " <<
	        r1.add(r2).toString() << endl;
	cout << r1.toString() << " - " << r2.toString() << " = " <<
	        r1.subtract(r2).toString() << endl;
	cout << r1.toString() << " * " << r2.toString() << " = " <<
	        r1.multiply(r2).toString() << endl;
	cout << r1.toString() << " / " << r2.toString() << " = " <<
	        r1.divide(r2).toString() << endl;
	        
	cout << "r2.intValue()" << " is " << r2.intValue() << endl;
	cout << "r2.doubleValue()" << " is " << r2.doubleValue() << endl;
	
	cout << "r1.compareTo(r2) is " << r1.compareTo(r2) << endl;	
	cout << "r2.compareTo(r1) is " << r2.compareTo(r1) << endl;
	cout << "r1.compareTo(r1) is " << r1.compareTo(r2) << endl;
	cout << boolalpha << "r1.equals(r1) is " << r1.equals(r1) << endl;
	cout << boolalpha << "r1.equals(r2) is " << r1.equals(r2) << endl;
	
	return 0;
}
