# Configurar el tipo de gráfico
set title "Comparación Off(A(K)) vs Teórica"
set xlabel "Iteración K"
set ylabel "Off(A^(K)) / Off(A)"
set grid

M_PI = 3.14159265358979323846
f(x) = x*x - 5*sin(2*M_PI*x) * cos(4*x)


# Elegir la salida (por ejemplo, pantalla o archivo de imagen)
set terminal png size 800,600
set output 'grafico.png'

set xrange [0.3:0.6]

# Graficar los puntos experimentales y la expresión teórica
plot f(x) with lines linecolor rgb "red" title "Expresión "
