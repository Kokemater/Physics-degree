#include "../all_functions/computation_II.h"


int main(void)
{
	matrix <double> dif01 = file_to_matrix("diferencias_h_0.1.txt", 11, 2);
	matrix <double> dif001 = file_to_matrix("diferencias_h_0.01.txt", 101, 2);
	matrix <double> dif0001 = file_to_matrix("diferencias_h_0.001.txt", 1001, 2);

	matrix <double> disp01 = file_to_matrix("disparo_h_0.1.txt", 11, 3);
	matrix <double> disp001 = file_to_matrix("disparo_h_0.01.txt", 101, 3);
	matrix <double> disp0001 = file_to_matrix("disparo_h_0.001.txt", 1001, 3);

	cout << disp001<< endl;

	ofstream comp01("comp01.txt");	ofstream comp001("comp001.txt");	ofstream comp0001("comp0001.txt");

	matrix <double> x01 = extract_columns(dif01,0,0);
	matrix <double> resta01 = extract_columns(dif01,1,1) - extract_columns(disp01,1,1);

	for (int i = 0; i < 11; i++)
	{
		comp01 << x01(i,0) << " " << abs(resta01(i,0)) << endl;
	}


	matrix <double> x001 = extract_columns(dif001,0,0);
	matrix <double> resta001 = extract_columns(dif001,1,1) - extract_columns(disp001,1,1);

	for (int i = 0; i < 101; i++)
	{
		comp001 << x001(i,0) << " " << abs(resta001(i,0)) << endl;
	}


	matrix <double> x0001 = extract_columns(dif0001,0,0);
	matrix <double> resta0001 = extract_columns(dif0001,1,1) - extract_columns(disp0001,1,1);

	for (int i = 0; i < 1001; i++)
	{
		comp0001 << x0001(i,0) << " " << abs(resta0001(i,0)) << endl;
	}
}