#include "../all_functions/computation_II.h"
#include "../all_functions/math_stuff.h"


int main(void)
{
	int size = 4;
	matrix <double> ds = {{3.2, 1.1, 1.3}}; // superior
	matrix <double> d = {{15, 7, 9, 11}}; // central
	matrix <double> df = {{1.9, -1.3, -2.5}}; // inferior
	matrix <double> b = {{1.9, 3.1, 2.2, 5.3}};
	matrix <double> delta_f(1, size-1), delta(1,size), delta_s(1,size-1), z(1, size), x(1,size);

	LU_tri(d, ds, df, b, size, delta_f, delta, delta_s, z, x);
	cout << x << endl;

	// Check the solution
	matrix <double> A = file_to_matrix("A.txt", 4,4);
	b = file_to_matrix("b.txt", 4,1);
	cout << A << endl << b << endl;
	matrix <double> x_real = !A * b;
	cout << x_real << endl;
	cout << x;
}