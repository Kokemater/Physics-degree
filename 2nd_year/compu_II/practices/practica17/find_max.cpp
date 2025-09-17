#include "../all_functions/computation_II.h"



int main(void)
{
	int n_rows = 301; 
	int n_cols = 3;
	matrix <double> euler = file_to_matrix("euler.txt",n_rows, n_cols);
	matrix <double> rk2 = file_to_matrix("rk2.txt",n_rows,n_cols );
	matrix <double> rk4 = file_to_matrix("rk4.txt",n_rows, n_cols);

	matrix <double> euler_pos = extract_columns(euler, 1,1);
	matrix <double> rk2_pos = extract_columns(rk2, 1,1);
	matrix <double> rk4_pos = extract_columns(rk4, 1,1);
	matrix <double> x = extract_columns(euler, 0,0);

	int euler_max_row, euler_max_col, rk2_max_row, rk2_max_col, rk4_max_row, rk4_max_col;

	max_element_index(euler_pos, euler_max_row,  euler_max_col, false);
	max_element_index(rk2_pos, rk2_max_row,  rk2_max_col, false);
	max_element_index(rk4_pos, rk4_max_row,  rk4_max_col, false);
	cout << euler_max_row << " " << euler_max_col << endl;

	cout << "Euler : (" << x(euler_max_row, euler_max_col)<<  ", "<< euler_pos(euler_max_row, euler_max_col) << ") " << endl;
	cout << "rk2 : (" << x(rk2_max_row, rk2_max_col)<<  ", "<< rk2_pos(rk2_max_row, rk2_max_col) << ") " << endl;
	cout << "rk4 : (" << x(rk4_max_row, euler_max_col)<<  ", "<< rk4_pos(rk4_max_row, euler_max_col) << ") " << endl;

}