#include "computation_II.h"

double trapezoidal(double (*f)(double), double a, double b, double tau)
{
	double sum = 0;	
	int n = (b - a)/ tau;
	tau = (b - a) / n;
	for(double i = a + tau; i < b; i += tau)
	{
		sum += f(i);
	}
	return ((b - a) * (f(a) + 2*sum + f(b))/ (2 * n));
}

double simpson(double (*f) (double), double a, double b, double tau)
{
	double sum_odd = 0;
	double sum_even = 0;
	int n = (int) ((b - a)/ tau);
	tau = (b - a) / n;

	if (n % 2 != 0)
		n++;
	for (double i = a + tau; i < b; i += (2*tau))
	{
		sum_odd += f(i);
	}
	for (double j = a + 2*tau; j < b ; j += (2*tau))
	{
		sum_even += f(j);
	}
    return (b - a) * (f(a) + 4 * sum_odd + 2 * sum_even + f(b)) / (3 * n);
}

double gauss_6(double (*f)(double),double a, double b)
{
	matrix <double> xd {
		{	0.9324695142, -0.9324695142, 0.6612093865,
		 -0.6612093865, 0.2386191861, -0.2386191861}
		};
	matrix <double> w {
		{0.1713244924, 0.1713244924, 0.360761573,
        0.360761573, 0.4679139346, 0.4679139346}
	};

	double sum = 0;
	for(int i = 0; i < 6; i++)
	{
		sum += w(0,i) * f(((b+a) + (b-a)*xd(0,i))/2);
	}
	sum*=(b - a)/2;
	return (sum);
}