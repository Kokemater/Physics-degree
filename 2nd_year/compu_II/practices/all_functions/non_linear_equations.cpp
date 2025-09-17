#include "computation_II.h"

/**
 * @brief Implementación del método de Newton para resolver sistemas de ecuaciones no lineales.
 * 
 * Esta función utiliza el método de Newton para encontrar la solución de un sistema de ecuaciones no lineales.
 * 
 * @param funciones Matriz de funciones que representan el sistema de ecuaciones no lineales.
 * @param jacobiano Matriz de funciones que representan el jacobiano del sistema de ecuaciones.
 * @param x1 Matriz que representa la estimación inicial de la solución.
 * @param eps Tolerancia para la convergencia del método.
 * @param n_iterations_newton Referencia a una variable que almacenará el número de iteraciones realizadas.
 * @param solution Referencia a una matriz que almacenará la solución del sistema de ecuaciones.
 * 
 * @details
 * La función iterará hasta que la distancia entre dos iteraciones consecutivas sea menor que `eps`.
 * Convergerá si el jacobiano es invertible y la estimación inicial está suficientemente cerca de la solución real.
 * Puede fallar si el jacobiano no es invertible en algún punto de la iteración o si la estimación inicial no está cerca de la solución real.
 * No convergerá si el sistema de ecuaciones no tiene solución, si el jacobiano se vuelve singular (no invertible) durante las iteraciones, 
 * o si la estimación inicial está demasiado lejos de la solución real.
 */

void newton_non_linear(matrix < double(*)(double, double)> funciones, matrix < double(*)(double, double)> jacobiano, matrix <double> x1, double eps, double &n_iterations_newton, matrix <double> &solution)
{
	matrix <double> x_prev(2,1);
	matrix <double> x_next(2,1);
	matrix <double> F(2,1);
	matrix <double> J(2,2);
	matrix <double> dist(2,1);
	x_prev = x1;
	n_iterations_newton = 0;
	while(true)
	{
		for (int i = 0; i < 2; i++)
		{
			F(i,0) = funciones(i,0)(x_prev(0,0), x_prev(1,0));
		}
		for (int i = 0; i < 2; i++)
		{
			for (int j = 0; j < 2; j++)
			{
				J(i,j) = jacobiano(i,j)(x_prev(0,0), x_prev(1,0));
			}
		}
		n_iterations_newton++;
		x_next = x_prev - !J * F;
		dist = x_prev - x_next;
		if (dist.Norm(1) <= eps)
		{
			solution = x_next;
			return ;
		}

		x_prev = x_next;
	}
}

/**
 * @brief Implementación del método de Broyden para resolver sistemas de ecuaciones no lineales.
 * 
 * Esta función utiliza el método de Broyden para encontrar la solución de un sistema de ecuaciones no lineales.
 * 
 * @param funciones Matriz de funciones que representan el sistema de ecuaciones no lineales.
 * @param x1 Matriz que representa la primera estimación inicial de la solución.
 * @param x2 Matriz que representa la segunda estimación inicial de la solución.
 * @param A_0 Matriz inicial para la aproximación del Jacobiano inverso.
 * @param eps Tolerancia para la convergencia del método.
 * @param n_iterations_sec Referencia a una variable que almacenará el número de iteraciones realizadas.
 * @param solution Referencia a una matriz que almacenará la solución del sistema de ecuaciones.
 * 
 * @details
 * La función iterará hasta que la distancia entre dos iteraciones consecutivas sea menor que `eps`.
 * Convergerá si la estimación inicial está suficientemente cerca de la solución real.
 * Puede fallar si la estimación inicial no está cerca de la solución real.
 * No convergerá si el sistema de ecuaciones no tiene solución, si la matriz de aproximación del Jacobiano se vuelve singular (no invertible) durante las iteraciones,
 * o si las estimaciones iniciales están demasiado lejos de la solución real.
 */
 
void Broyden(matrix <double (*)(double, double)> funciones, matrix <double> x1, matrix <double> x2, matrix <double> A_0, double eps, double &n_iterations_sec, matrix <double> &solution)
{
	matrix <double> x_prev(2,1), x_curr(2,1), x_next(2,1), s(2,1);
	matrix <double> F_curr(2,1), F_prev(2,1);
	matrix <double> A(2,2);
	matrix <double> A_prev(2,2);
	x_prev = x1;
	x_curr = x2;
	A_prev = A_0;

	n_iterations_sec = 0;
	while(true)
	{

		s = x_curr - x_prev;
		for(int i = 0; i < 2; i++)
		{
			F_curr(i, 0) = funciones(i,0)(x_curr(0,0), x_curr(1,0)); 
		}

		for(int i = 0; i < 2; i++)
		{
			F_prev(i,0) = funciones(i,0) (x_prev(0,0), x_prev(1,0));
		}
		A = A_prev + ((F_curr - F_prev - A_prev * s)/(~s*s ))* ~s;
		x_next = x_curr - !A * F_curr;
		n_iterations_sec++;
		if (s.Norm(1) <= eps)
		{
			solution = x_next;
			return ;
		}
		x_prev = x_curr;
		x_curr = x_next;
		A_prev = A;
	}
}