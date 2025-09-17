#include "../all_functions/computation_II.h"


int main(void)
{
	int rows = 6; int cols = 6;
	matrix <double> A = file_to_matrix("A.txt", rows, cols);
	matrix <double> U (rows, cols);
	double iter = 0;
	double eps = 1e-7;

	Jacobi_eigen(A, U, iter, eps);
	cout << A << endl << U << endl;

	matrix <double> eigen_val = (rows, 1);
	matrix <double> eigen_vec(rows,1);
	
	eigen_val = print_eigen_val(A);
	for (int pos = 0; pos < rows; pos++)
	{
	 eigen_vec = get_eigen_vect(A, pos);
	 cout << (A * eigen_vec - eigen_val(pos,0) * eigen_vec) << endl;
	}

}