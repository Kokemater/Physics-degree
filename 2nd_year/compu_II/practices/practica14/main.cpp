#include "../all_functions/computation_II.h"

double f(double x)
{
	return ((x*x -x +1))*(sin(x)*sin(x));
}
double I_exact()
{
	return (78 - 3*cos(12) - 73.0/4.0*sin(12));
}

int main(void)
{
	double a = -6;
	double b = 6;
	double trap_sol, simp_sol, anal_sol, gauss_sol;

	// Parte 1
	anal_sol = I_exact();
	gauss_sol = gauss_6(f, a,b);
	double gauss_err = abs(anal_sol - gauss_sol);
	int n = 1;

	while(1)
	{
		double tau = (b-a)/n;
		if (abs(simpson(f,a,b,tau) - anal_sol) < gauss_err)
			break;
		n++;
	}
	cout <<" Particiones simpson : "<<  n <<endl;
	int fraccion = n/6;
	cout << "FRACCION: simpson/gauss : " << fraccion << endl;

	n = 1;
	while(1)
	{
		double tau = (b-a)/n;
		if (abs(trapezoidal(f,a,b,tau) - anal_sol) < gauss_err)
			break;
		n++;
	}
	cout <<" Particiones trapezoidal : "<<  n <<endl;
	fraccion = n/6;
	cout << "FRACCION: trapezoidal/gauss : " << fraccion << endl;

	cout << "--------------------" <<endl;
	// Parte 2
	double I1 =  gauss_6(f, a,0);
	double I2 = gauss_6(f, 0,b);
	gauss_sol = I1 + I2;
	gauss_err = abs(anal_sol - gauss_sol);

	while(1)
	{
		double tau = (b-a)/n;
		if (abs(simpson(f,a,b,tau) - anal_sol) < gauss_err)
			break;
		n++;
	}
	cout <<" Particiones simpson : "<<  n <<endl;
	fraccion = n/12;
	cout << "FRACCION: simpson/gauss : " << fraccion << endl;

	n = 1;
	while(1)
	{
		double tau = (b-a)/n;
		if (abs(trapezoidal(f,a,b,tau) - anal_sol) < gauss_err)
			break;
		n++;
	}
	cout <<" Particiones trapezoidal : "<<  n <<endl;
	fraccion = n/12;
	cout << "FRACCION: trapezoidal/gauss : " << fraccion << endl;



}
