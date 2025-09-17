#include "computation_II.h"


double biseccion(double (*f)(double), double a, double b, double eps, double &n_iterations) {
    n_iterations = 0;
    double x_med;

    while (b - a > eps)
	{
        x_med = (a + b) / 2.0;
        n_iterations++;
		if (f(x_med) == 0)
			return x_med;
        if (f(a) * f(x_med) < 0)
            b = x_med; 
        else
            a = x_med;
    }
    return (a + b) / 2.0; 
}

double secante(double (*f) (double), double x1, double x2, double eps, double &n_iterations_sec)
{
	double x_prev = x1;
	double x_curr = x2;
	double x_next;

	n_iterations_sec = 0;
	while(true)
	{
	
		n_iterations_sec++;

        x_next = x_curr - f(x_curr) * (x_curr - x_prev) / (f(x_curr) - f(x_prev));
		if (abs(x_next - x_prev) <= eps)
			return x_next;
		x_prev = x_curr;
		x_curr = x_next;
	}
}

double newton(double (*f)(double), double (*f_prime)(double), double x1, double eps, double &n_iterations_newton)
{
	double x_prev = x1;
	double x_next;

	n_iterations_newton = 0;
	while(true)
	{
		if (f_prime(x_prev) == 0)
        {
            cout << "Error: La derivada se anuló en x = " << x_prev << ". Método fallido." << endl;
            return NAN;  
        }
		n_iterations_newton++;

		x_next = x_prev - f(x_prev)/f_prime(x_prev);
		if (abs(x_next - x_prev) <= eps)
			return x_next;
		x_prev = x_next;
	}
}
