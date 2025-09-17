#include "math_stuff.h"

matrix <double> file_to_matrix(string filename, int rows, int cols)
{
	matrix <double> solution (rows, cols);
	ifstream file(filename);

	for (int i = 0; i < rows; i++)
	{
		for (int j = 0; j < cols; j++)
		{
			file >> solution(i,j);
		}
	}
	return (solution);
}


void matrix_to_file(string filename, const matrix<double>& A, double eps) 
{
    ofstream file(filename);

    if (!file.is_open()) {
        cerr << "Error: No se pudo abrir el archivo " << filename << " para escribir." << endl;
        return;
    }
	file << fixed << setprecision(-log10(eps));

    int rows = A.RowNo();
    int cols = A.ColNo();

    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            file << A(i, j);
            if (j < cols - 1) {
                file << " "; 
            }
        }
        file << endl; 
    }

    file.close();
}

void insert_rands_in_matrix(matrix <double> &A, double min, double max, bool dominancia_diagonal)
{
	srand(42);
	double rand_v;
    double random_number;
	for(int i = 0; i < A.RowNo(); i++)
	{
		for (int j = 0; j < A.ColNo(); j++)
		{
			rand_v = rand();
			A(i,j) = min + (rand_v / RAND_MAX) * (max - min);
			if (i != j && dominancia_diagonal == true)
				A(i,j) = A(i,j)/1000;
		}
	}
}


matrix<double> extract_columns(const matrix<double>& A, int start_col, int end_col) {
    // Verificar que el rango de columnas es válido
    if (start_col >= A.ColNo() || end_col >= A.ColNo() || start_col > end_col) {
        throw std::out_of_range("El rango de columnas está fuera del rango.");
    }

    // Crear una nueva matriz con el mismo número de filas y las columnas seleccionadas
    matrix<double> col_matrix(A.RowNo(), end_col - start_col + 1);

    // Copiar las columnas seleccionadas a la nueva matriz
    for (int i = 0; i < A.RowNo(); i++) {
        for (int j = start_col; j <= end_col; j++) {
            col_matrix(i, j - start_col) = A(i, j);
        }
    }

    return col_matrix;
}


matrix<double> extract_rows(const matrix<double>& A, int start_row, int end_row) {
    // Verificar que el rango de filas es válido
    if (start_row >= A.RowNo() || end_row >= A.RowNo() || start_row > end_row) {
        throw std::out_of_range("El rango de filas está fuera del rango.");
    }

    // Crear una nueva matriz con las filas seleccionadas y el mismo número de columnas
    matrix<double> row_matrix(end_row - start_row + 1, A.ColNo());

    // Copiar las filas seleccionadas a la nueva matriz
    for (int i = start_row; i <= end_row; i++) {
        for (int j = 0; j < A.ColNo(); j++) {
            row_matrix(i - start_row, j) = A(i, j);
        }
    }

    return row_matrix;
}

void min_element_index(const matrix<double>& A, int &min_row, int &min_col, bool find_by_absolute_value = false)
{
    if (A.RowNo() == 0 || A.ColNo() == 0) {
        throw std::invalid_argument("La matriz está vacía.");
    }

    min_row = 0;
    min_col = 0;
    double min_value = find_by_absolute_value ? std::abs(A(0, 0)) : A(0, 0);

    for (int i = 0; i < A.RowNo(); i++) {
        for (int j = 0; j < A.ColNo(); j++) {
            double current_value = find_by_absolute_value ? std::abs(A(i, j)) : A(i, j);
            if (current_value < min_value) {
                min_value = current_value;
                min_row = i;
                min_col = j;
            }
        }
    }
}



void max_element_index(const matrix<double>& A, int &max_row, int &max_col, bool find_by_absolute_value = false)
{
    if (A.RowNo() == 0 || A.ColNo() == 0) {
        throw std::invalid_argument("La matriz está vacía.");
    }

    max_row = 0;
    max_col = 0;
    double max_value = find_by_absolute_value ? std::abs(A(0, 0)) : A(0, 0);

    for (int i = 0; i < A.RowNo(); i++) {
        for (int j = 0; j < A.ColNo(); j++) {
            double current_value = find_by_absolute_value ? std::abs(A(i, j)) : A(i, j);
            if (current_value > max_value) {
                max_value = current_value;
                max_row = i;
                max_col = j;
            }
        }
    }
}
double intersection_with_horizontal(double a, double b, double y0)
{
	// Para una recta
    if (a == 0) {
        throw std::invalid_argument("La pendiente 'a' no puede ser 0, ya que la recta sería horizontal y no intersecta con y = y0.");
    }

    // Resolver la ecuación: y0 = ax + b -> x = (y0 - b) / a
    return (y0 - b) / a;
}


void set_precission(double precission)
{
    double cifras = abs(log10(precission));
    cout << fixed << setprecision(cifras);
}