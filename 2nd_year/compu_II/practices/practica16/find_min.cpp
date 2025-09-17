#include "../all_functions/computation_II.h"


int main(void)
{
	int rows = 104;
	int cols = 7;

	matrix <double> errors = file_to_matrix("error.txt", rows, cols);
	int row0 = 0; 
	int row1 = 1;
	matrix <double> h = extract_columns(errors, 0, 0);
	matrix <double> diferencia_centrada_2 = extract_columns(errors, 1, 1);
	matrix <double> progresivas2 = extract_columns(errors, 2, 2);
	matrix <double> regresivas2 = extract_columns(errors, 3, 3);
	matrix <double> diferencia_centrada_3 = extract_columns(errors, 4, 4);
	matrix <double> progresivas3 = extract_columns(errors, 5, 5);
	matrix <double> regresivas3 = extract_columns(errors, 6, 6);

	cout << h;
	int i_d2, j_d2, i_p2, j_p2, i_r2, j_r2, i_d3, j_d3, i_p3, j_p3, i_r3, j_r3;
	bool find_by_absolut_value = true;
	min_element_index(diferencia_centrada_2, i_d2, j_d2);
	min_element_index(progresivas2, i_p2, j_p2);
	min_element_index(regresivas2, i_r2, j_r2);
	min_element_index(diferencia_centrada_3, i_d3, j_d3);
	min_element_index(progresivas3, i_p3, j_p3);
	min_element_index(regresivas3, i_r3, j_r3);

	cout << "Para diferencia centrada 2 " << diferencia_centrada_2(i_d2, j_d2) << " | h = " << h(i_d2, j_d2) << endl;
	cout << "Para progresivas 2 " << progresivas2(i_p2, j_p2) << " | h = " << h(i_p2, j_p2) << endl;
	cout << "Para regresivas 2 " <<regresivas2(i_r2, j_r2) << " | h = " << h(i_r2, j_r2) << endl;
	cout << "Para diferencia centrada 3 " << diferencia_centrada_3(i_d3, j_d3) << " | h = " << h(i_d3, j_d3) << endl;
	cout << "Para progresivas 3 " << progresivas3(i_p3, j_p3) << " | h = " << h(i_p3, j_p3) << endl;
	cout << "Para regresivas 3 " <<regresivas3(i_r3, j_r3) << " | h = " << h(i_r3, j_r3) << endl;



	// Intersection (teórica ) y = 1e-10
	// a: y =  2x + 0.52
	double x0 = intersection_with_horizontal(2, 0.52, -10);
	cout << "Intersection : " << x0 << endl;
}
