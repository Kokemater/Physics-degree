#include "../all_functions/computation_II.h"

double gauss_6(double (*f)(double),double a, double b);

double f(double x)
{
	return (exp(-x*x));
}

double simpson(double (*f) (double), double a, double b, double tau);

int main(void)
{
	double a = 0;
	double erf_val;
	ofstream erf_table("erf_table.txt");
	ofstream erf_error("erf_error.txt");

	erf_table << fixed << setprecision(9);
	erf_table << fixed << setprecision(9);
	

	for (double x = -3; x < 3; x+=0.1)
	{
		double sum = gauss_6(f, a,x/4) + gauss_6(f, x/4.0,x/2.0) + gauss_6(f, x/2.0,3*x/4.0)+ gauss_6(f, 3*x/4.0, x) ;
		erf_val = 2.0/sqrt(M_PI) *sum; 

		erf_table << x << " " << erf_val << endl;
		erf_error << x << " " << abs(erf_val - erf(x)) << endl;
	}

}