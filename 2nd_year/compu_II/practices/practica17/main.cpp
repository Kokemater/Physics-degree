#include "../all_functions/computation_II.h"


double z1_prime(matrix <double> cond_iniciales, double x)
{
	double z1 = cond_iniciales(0,0);
	double z2 = cond_iniciales(1,0);

	return (z2);
}

double z2_prime(matrix <double> cond_iniciales, double x)
{
	double z1 = cond_iniciales(0,0);
	double z2 = cond_iniciales(1,0);

	return(exp(-x/2) + z2 - 2*z1);
}

int main(void)
{
	double h = 0.01;
	double x0 = 0;
	matrix <double> cond_iniciales(2,1);
	matrix <double(*)(matrix <double>, double)> Z_derivatives (2,1);
	ofstream euler("euler.txt");
	ofstream rk2_file("rk2.txt");
	ofstream rk4_file("rk4.txt");

	cond_iniciales(0,0) = 0;
	cond_iniciales(1,0) = 0;

	Z_derivatives(0,0) = z1_prime;
	Z_derivatives(1,0) = z2_prime;


	while(x0 < 3)
	{
		euler_one_step(x0, cond_iniciales, h, Z_derivatives);
		euler << x0 << " " << cond_iniciales(0,0) << " " << cond_iniciales(1,0) << endl;
	}
	cond_iniciales(0,0) = 0;
	cond_iniciales(1,0) = 0;
	x0 = 0;

	while(x0 < 3)
	{
		runge_kutta_2(x0, cond_iniciales, h, Z_derivatives);
		rk2_file << x0 << " " << cond_iniciales(0,0) << " " << cond_iniciales(1,0) << endl;
	}

	cond_iniciales(0,0) = 0;
	cond_iniciales(1,0) = 0;
	x0 = 0;

	while(x0 < 3)
	{
		runge_kutta_4(x0, cond_iniciales, h, Z_derivatives);
		rk4_file << x0 << " " << cond_iniciales(0,0) << " " << cond_iniciales(1,0) << endl;
	}
}