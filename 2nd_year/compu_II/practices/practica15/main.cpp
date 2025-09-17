#include "../all_functions/computation_II.h"

double f(double x)
{
	return exp(sin(cos(x*x - x + 1)));
}

double f_prime(double x)
{
	return (f(x) * cos(cos(x*x -x + 1)) * -sin(x*x - x + 1) * (2*x -1));
}

int main(void)
{
	ofstream error("error.txt");
	double x0 = 1.0;
	double exact_sol = f_prime(x0);
	for(double h = 1; h>1e-20; h*=0.9)
	{
		error << log(h) << " ";
		error << log(abs(exact_sol - diferencia_centrada_1(f,x0, h))) << " ";
		error << log(abs(exact_sol - S(f,x0, h))) << " ";
		error << log(abs(exact_sol - H(f,x0, h))) << endl;
	}	
}