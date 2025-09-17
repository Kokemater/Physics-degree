#include "../all_functions/math_stuff.h"
#include "../all_functions/computation_II.h"

int main(void)
{
	matrix <double> A(10,10);
	matrix <double> b(10,1);
	matrix <double> x_j(10, 1), x_g(10,1);
	double eps = 1e-5;

	insert_rands_in_matrix(A, 0, 10, true);
	insert_rands_in_matrix(b, 0,10, false);

	Jacobi(A, b, x_j, eps);
	matrix_to_file("x_Jacobi.txt", x_j, eps);
	Gauss_Seidel(A, b, x_g, eps);
	matrix_to_file("x_gauss.txt", x_g, eps);

	double norma_max = (x_j - x_g).Norm(2);
	cout << norma_max << endl;


	return (0);

}