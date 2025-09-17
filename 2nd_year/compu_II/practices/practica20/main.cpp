#include "../all_functions/computation_II.h"


double gamma_val = 1;

double z1_prime(matrix <double> cond_inic, double x)
{
	double z1 = cond_inic(0,0);		double z2 = cond_inic(1,0);
	return (z2);
}

double z2_prime(matrix <double> cond_inic, double x)
{
	double z1 = cond_inic(0,0);		double z2 = cond_inic(1,0);
	return (x*z2 + (1-x*x)*pow(z1,gamma_val) + exp(-x*x));
}
double p(double x)
{
	return x;
}
double q(double x)
{
	return (1 - x*x);
}
double r(double x)
{
	return exp(-x*x);
}
int main(void)
{
	double h_list[] = {0.1, 0.01, 0.001};
	double eps = 1e-5;
	double a = 0; double ua = 40;
	double b = 1; double ub = 40;
	matrix <double(*)(matrix <double>, double)> Z_derivatives = {{z1_prime}, {z2_prime}};
	for (double h : h_list)
	{
		rk4_con_metodo_del_disparo(a, b, ua, ub, Z_derivatives, h,eps);
		diferencias_finitas(h, a, b, ua, ub,p, q, r);
	}

}