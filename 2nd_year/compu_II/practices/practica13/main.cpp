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
	double trap_sol, simp_sol, anal_sol;

	anal_sol = I_exact();
	ofstream Error("Error.txt");
	Error << fixed << setprecision(15);
	// tau		trap_error		simp_error
	for (double tau = 1; tau > 1e-6; tau /= 2)
	{
		Error << log10(tau) << " " << log10(abs(anal_sol - trapezoidal(f, a, b, tau))) << " " << log10(abs(anal_sol -  simpson(f, a, b, tau))) << endl;
	}

	cout << "trap_sol " << trap_sol << endl;
	cout << "simp_sol" << simp_sol <<endl;
	cout << "anal_sol " << anal_sol << endl;
}
