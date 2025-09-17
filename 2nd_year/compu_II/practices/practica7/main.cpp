#include "../all_functions/math_stuff.h"
#include "../all_functions/computation_II.h"

int main(void)
{
	matrix <double> A(10,10);
	matrix <double> b(10,1);
	matrix <double> L(10,10), U(10,10), x(10,1);
	insert_rands_in_matrix(A, 0, 10, true);
	insert_rands_in_matrix(b, 0, 10, false);

	LU(A, L, U);
	solve_LU(L, U, b, x);
	
	double decimales = 1e-10;
	matrix_to_file("A_matrix.txt", A, decimales);
	matrix_to_file("b_matrix.txt", b, decimales);
	matrix_to_file("L_matrix.txt", L, decimales);
	matrix_to_file("U_matrix.txt", U, decimales);
	matrix_to_file("x_matrix.txt", x, decimales);

	// check the solution
	x = !A * b;
	cout << x;

}