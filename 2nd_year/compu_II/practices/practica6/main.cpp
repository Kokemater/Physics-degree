#include "../all_functions/math_stuff.h"
#include "../all_functions/computation_II.h"

double f(double x)
{
	return pow(x,2) - 5*sin(2*M_PI*x) * cos(4*x);
}
double f_prime(double x)
{
	return (2 * x - 5 * (2 * M_PI *cos(2 * M_PI * x)* cos(4*x) - 4*sin(2*M_PI*x) * sin(4*x)));
}

int main(void)
{
	double a = -1.;
	double b = 1.;
	double n_iterations_newton = 0;
	double n_iterations_secant = 0;
	double n_iterations_bisection = 0;
	double eps_list []= {1e-6, 1e-11};
	
	double newton_points[] = {
	-0.6,
	 -0.42,
	  -0.1,
	  0.35,
	  0.55,
	  0.9};

	double x_b, x_n, x_s;
	double secant_points[6][2] = {
		{-0.6, -0.5},
		{-0.43, -0.42},
		{-0.1, -0.09},
		{0.2, 0.3},
		{0.54,0.55},
		{0.9, 0.91}
	};
	double bisection_points[6][2] = {
		{-0.6, -0.45},
		{-0.45, -0.35},
		{-0.1, 0.2},
		{0.3, 0.4},
		{0.5,0.6},
		{0.9, 1}
	};

	ofstream solutions("solutions.txt");
	for (double eps : eps_list )
	{
		solutions << fixed << setprecision(-log10(eps));
		solutions << "Para precisión : " << eps << endl ;
		for (int i = 0; i < 6; i++)
		{
			solutions << "Results for " << i << "th point: " << endl;

			x_b = biseccion(f, bisection_points[i][0], bisection_points[i][1], eps, n_iterations_bisection);
			solutions << "biseccion : " << x_b << " iter " << n_iterations_bisection << endl; 

			x_n = newton(f, f_prime,newton_points[i], eps, n_iterations_newton);
			solutions << "newton : " << x_n << " iter " << n_iterations_newton << endl;

			x_s = secante(f, secant_points[i][0], secant_points[i][1], eps, n_iterations_secant);
			solutions << "secante : " << x_s << " iter " << n_iterations_secant << endl;
		}
		solutions << "------------------------ " << endl;
	}



}