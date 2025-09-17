#include "computation_II.h"

double diferencia_centrada_1(double (*f) (double), double x, double h)
{
	return ((f(x + h) - f(x-h))/(2*h));
}

double S(double (*f)(double), double x, double h)
{
	double num = 8*f(x+h) - 8*f(x-h) + f(x-2*h) - f(x+2*h);
	double den = 12 *h;
	return (num/den);
}

double H(double (*f)(double), double x, double h)
{
	return ((16*S(f,x,h) - S(f,x,2*h))/15);
}


double diferencia_centrada_2(double (*f)(double), double x, double h) {
    return (f(x + h) - 2 * f(x) + f(x - h)) / pow(h, 2);
}

double diferencia_centrada_3(double (*f)(double), double x, double h) {
    return (f(x + 2 * h) - 2 * f(x + h) + 2 * f(x - h) - f(x - 2 * h)) / (2 * pow(h, 3));
}

double progresivas2(double (*f)(double), double x, double h) {
    return (f(x + 2 * h) - 2 * f(x + h) + f(x)) / pow(h, 2);
}

double progresivas3(double (*f)(double), double x, double h) {
    return (f(x + 3 * h) - 3 * f(x + 2 * h) + 3 * f(x + h) - f(x)) / pow(h, 3);
}

double regresivas2(double (*f)(double), double x, double h) {
    return (f(x) - 2 * f(x - h) + f(x - 2 * h)) / pow(h, 2);
}

double regresivas3(double (*f)(double), double x, double h) {
    return (f(x) - 3 * f(x - h) + 3 * f(x - 2 * h) - f(x - 3 * h)) / pow(h, 3);
}

double error_relativo(double dnumerica, double dteorica) {
    return fabs((dteorica - dnumerica) / dteorica);
}