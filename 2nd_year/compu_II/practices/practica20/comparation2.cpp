#include "../all_functions/computation_II.h"


int main(void)
{
	matrix <double> dif01 = file_to_matrix("diferencias_h_0.1.txt", 11, 2);
	matrix <double> dif001 = file_to_matrix("diferencias_h_0.01.txt", 101, 2);
	matrix <double> dif0001 = file_to_matrix("diferencias_h_0.001.txt", 1001, 2);

	cout << dif0001;

	ofstream comp01("comp01_2.txt");	ofstream comp001("comp001_2.txt");

	int i_01 = 0;	int i_001 = 0;
	for (int i_0001 = 0 ; i_0001< 1001; i_0001++)
	{
		cout << dif0001(i_0001,0) << "- " <<dif01(i_01,0)<< endl ;	
		if (abs(dif01(i_01,0) - dif0001(i_0001,0)) < 1e-6)
		{
			cout << dif01(i_01,0) << " -" << i_01 <<endl;
			comp01 << dif01(i_01,0) <<  " " << abs(dif01(i_01,1) - dif0001(i_0001,1)) << endl;
			i_01++;
		}
		if (abs(dif001(i_001,0) - dif0001(i_0001,0)) < 1e-6)
		{
			comp001 << dif001(i_001,0) <<  " " << abs(dif001(i_001,1) - dif0001(i_0001,1)) << endl;
			i_001++;
		}
	}




}