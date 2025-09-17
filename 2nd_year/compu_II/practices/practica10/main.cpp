#include "../all_functions/math_stuff.h"
#include "../all_functions/computation_II.h"


double f1(double x0, double x1)
{
	return (2*pow(x0,3) + 10*pow(x0,2) -8*pow(x1,2) + x0*x1 +1);
}
double f2(double x0, double x1)
{
	return (pow(x0,2) + pow(x1,2) - 3*x1 -1);
}

double f_1_x0(double x0, double x1)
{
	return 6 * x0 * x0 + 20*x0 + x1;
}
double f_1_x1(double x0, double x1)
{
	return -16*x1 + x0;
}
double f2_x0(double x0, double x1)
{
	return 2*x0;
}
double f2_x1(double x0, double x1)
{
	return 2*x1 - 3;
}

int main(void)
{
	matrix < double(*)(double, double)> funciones = {{f1}, {f2}};
	matrix < double(*)(double, double)> Jacobiano = {
		{f_1_x0, f_1_x1}, 
		{f2_x0, f2_x1}};
	matrix <double> x1 = {{-2}, {1.4}};
	matrix <double> x2 = {{1.5}, {2.5}};
	double n_iter1, n_iter2;
	matrix <double> sol1(2,1), sol2(2,1);
	double eps = 1e-8;


	newton_non_linear(funciones, Jacobiano, x1, eps, n_iter1, sol1);
	newton_non_linear(funciones, Jacobiano, x2, eps, n_iter2, sol2);


	cout << "solution : " << endl << sol1 << "n_iter : " << n_iter1 << endl << "----------------" <<endl;
	cout << "solution : " << endl << sol2 << "n_iter : " << n_iter2 << endl << "----------------" <<endl;

}