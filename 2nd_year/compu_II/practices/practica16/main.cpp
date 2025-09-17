#include "../all_functions/computation_II.h"
double f(double x) {
    return pow((pow(x, 2) + 1) / (3 * x - 1), 2);
}

double f_prime_prime(double x) {
    return (2 * (9 * pow(x, 4) - 12 * pow(x, 3) + 6 * pow(x, 2) + 12 * x + 29)) /
           (81 * pow(x, 4) - 108 * pow(x, 3) + 54 * pow(x, 2) - 12 * x + 1);
}

double f_prime_prime_prime(double x) {
    return -(240 * x + 720) /
           (243 * pow(x, 5) - 405 * pow(x, 4) + 270 * pow(x, 3) - 90 * pow(x, 2) + 15 * x - 1);
}


int main(void) {
    double x = 1.0;
    double anal_solution_2 = f_prime_prime(x);
    double anal_solution_3 = f_prime_prime_prime(x);

	ofstream error("error.txt");
	for(double h = 1; h >1e-10; h*=0.8)
	{
		error << log10(h) << " ";
		error << log10(error_relativo(diferencia_centrada_2(f, x, h),f_prime_prime(x))) << " ";
		error << log10(error_relativo(progresivas2(f, x, h),f_prime_prime(x)))<< " ";
		error <<  log10(error_relativo(regresivas2(f, x, h),f_prime_prime(x)))<< " ";
		error << log10(error_relativo(diferencia_centrada_3(f, x, h),f_prime_prime_prime(x)))<< " ";
		error <<  log10(error_relativo(progresivas3(f, x, h),f_prime_prime_prime(x)))<< " ";
		error <<  log10(error_relativo(regresivas3(f, x, h),f_prime_prime_prime(x)))<< endl;
	}



    return 0;
}
