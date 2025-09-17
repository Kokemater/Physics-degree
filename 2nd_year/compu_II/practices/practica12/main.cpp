#include "../all_functions/computation_II.h"


int main(void)
{
	int rows = 6; int cols = 6;
	matrix <double> A = file_to_matrix("A.txt", rows, cols);
	matrix <double> U (rows, cols);
	double iter = 0;
	double eps = 1e-7;
	matrix <double> A_cpy = A;
	for (int i = 0; i <=4; i++)
	{
		A = A_cpy;
		for (int j = 0; j < i; j++)
			A = A * A_cpy;
		cout << A <<  endl;
		Jacobi_eigen(A, U, iter, eps);
		matrix <double> eigen_val = (rows, 1);
		eigen_val = print_eigen_val(A);
	}



}