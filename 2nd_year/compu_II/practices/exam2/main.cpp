#include "../all_functions/computation_II.h"

void runge_kutta_4(double& x, matrix<double>& cond_iniciales, double h, matrix <double(*)(matrix <double>, double)> Z_derivatives);

double K = 7.63e-13;
double mu = 6.25e-27;
double C = 5.6;

double z1_prime(matrix <double> cond_inic, double t)
{
	double z1 = cond_inic(0,0);	double z2 = cond_inic(1,0);
	double z3 = cond_inic(2,0);	double z4 = cond_inic(3,0);
	return z2;
}

double z2_prime(matrix <double> cond_inic, double t)
{
	double z1 = cond_inic(0,0);	double z2 = cond_inic(1,0);
	double z3 = cond_inic(2,0);	double z4 = cond_inic(3,0);
	return C*z1 /(pow(z1*z1 + z3*z3, 1.5));
}

double z3_prime(matrix <double> cond_inic, double t)
{
	double z1 = cond_inic(0,0);	double z2 = cond_inic(1,0);
	double z3 = cond_inic(2,0);	double z4 = cond_inic(3,0);
	return z4;
}

double z4_prime(matrix <double> cond_inic, double t)
{
	double z1 = cond_inic(0,0);	double z2 = cond_inic(1,0);
	double z3 = cond_inic(2,0);	double z4 = cond_inic(3,0);
	return C*z3 /(pow(z1*z1 + z3*z3, 1.5));
}




int main(void)
{

	double b_list[] = {1.6e-14, 3.2e-14, 6.4e-14, 1.3e-13, 2.6e-13};
	int n_iterations = 110;
	matrix <double> cond_iniciales(4,1);
	matrix <double(*)(matrix <double>, double)> Z_derivatives(4,1);
	double dt = 4e-22;
	double t;
	double b;
	for (int j = 0; j < 5; j++)
	{
		b = b_list[j];
		t = 0;
		Z_derivatives(0,0) = z1_prime;	Z_derivatives(1,0) = z2_prime;
		Z_derivatives(2,0) = z3_prime;	Z_derivatives(3,0) = z4_prime;

		cond_iniciales(0,0) = -3e-13;	cond_iniciales(1,0) = sqrt(2*K/mu);
		cond_iniciales(2,0) = b;		cond_iniciales(3,0) = 0;
		
		string fnombre;
		std::ostringstream ss;
		ss << "rk4_b"<< j << ".txt";
		fnombre = ss.str();
		std::fstream F_datos;
		F_datos << fixed << setprecision(17);
		F_datos.open(fnombre.c_str(), std::fstream::out);

		for (int i = 0; i < n_iterations; i++)
		{
			runge_kutta_4(t, cond_iniciales, dt, Z_derivatives);
			F_datos << t << " " << cond_iniciales(0,0) << " " << cond_iniciales(1,0) << " " << cond_iniciales(2,0) << " "<< cond_iniciales(3,0) << endl;
		}
	}

}
