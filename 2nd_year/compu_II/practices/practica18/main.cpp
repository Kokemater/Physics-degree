#include "../all_functions/computation_II.h"

double F0 = 1;
double w = 0.1;
double m = 1;
double k = 1;
double w0 = sqrt(k/m);

double z1_prime(matrix <double> cond_iniciales, double t)
{
	double z1 = cond_iniciales(0,0);	double z2 = cond_iniciales(1,0);	double z3 = cond_iniciales(2,0);
	double z4 = cond_iniciales(3,0);	double z5 = cond_iniciales(4,0);	double z6 = cond_iniciales(5,0);
	return (z2);
}
double z2_prime(matrix <double> cond_iniciales, double t)
{
	double z1 = cond_iniciales(0,0);	double z2 = cond_iniciales(1,0);	double z3 = cond_iniciales(2,0);
	double z4 = cond_iniciales(3,0);	double z5 = cond_iniciales(4,0);	double z6 = cond_iniciales(5,0);
	return (F0/m*cos(w*t) - 2*w0*w0 * z1 + w0*w0*z3);
}
double z3_prime(matrix <double> cond_iniciales,double t)
{
	double z1 = cond_iniciales(0,0);	double z2 = cond_iniciales(1,0);	double z3 = cond_iniciales(2,0);
	double z4 = cond_iniciales(3,0);	double z5 = cond_iniciales(4,0);	double z6 = cond_iniciales(5,0);
	return (z4);
}
double z4_prime(matrix <double> cond_iniciales, double t)
{
	double z1 = cond_iniciales(0,0);	double z2 = cond_iniciales(1,0);	double z3 = cond_iniciales(2,0);
	double z4 = cond_iniciales(3,0);	double z5 = cond_iniciales(4,0);	double z6 = cond_iniciales(5,0);
	return (w0*w0*z1 + w0*w0*z5 - 2*w0*w0*z3);
}
double z5_prime(matrix <double> cond_iniciales, double t)
{
	double z1 = cond_iniciales(0,0);	double z2 = cond_iniciales(1,0);	double z3 = cond_iniciales(2,0);
	double z4 = cond_iniciales(3,0);	double z5 = cond_iniciales(4,0);	double z6 = cond_iniciales(5,0);
	return (z6);
}
double z6_prime(matrix <double> cond_iniciales, double t)
{
	double z1 = cond_iniciales(0,0);	double z2 = cond_iniciales(1,0);	double z3 = cond_iniciales(2,0);
	double z4 = cond_iniciales(3,0);	double z5 = cond_iniciales(4,0);	double z6 = cond_iniciales(5,0);
	return (w0*w0*z3 - 2*w0*w0*z5);
}



int main(void)
{
	matrix <double(*)(matrix <double>, double)> Z_derivatives(6,1);
	matrix<double> cond_iniciales(6,1);
	double h;
	double t0; double t;
	for (int i = 0; i < 6; i++)
		cond_iniciales(i,0) = 0;
	cout << cond_iniciales;

	Z_derivatives(0,0) = z1_prime;
	Z_derivatives(1,0) = z2_prime;
	Z_derivatives(2,0) = z3_prime;
	Z_derivatives(3,0) = z4_prime;
	Z_derivatives(4,0) = z5_prime;
	Z_derivatives(5,0) = z6_prime;

	h = 0.01;
	t0 = 0; 
	t = t0;
	ofstream rk4("rk4.txt");

	while(t < 100)
	{
		runge_kutta_4(t, cond_iniciales, h, Z_derivatives);
		rk4 << t << " ";
		for (int i = 0; i < 6; i++)
			rk4 << cond_iniciales(i,0) << " ";
		rk4 << endl;
	}
}