# Configurar el tipo de gráfico
set title "Error"
set xlabel "tau"
set ylabel "Error"
set grid

set terminal png size 800,600
set output 'graph4.png'
set key left

# Funciones para ajuste
f(x) = A + B*x
g(x) = C + D*x

# Ajustar los datos
set xrange [-6:0]
fit f(x) "Error.txt" u 1:2 via A, B
set xrange [-3:0]
fit g(x) "Error.txt" u 1:3 via C, D

set xrange[-6:0]
# Graficar los puntos experimentales y las curvas ajustadas
plot "Error.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "Trapezoidal", \
     "Error.txt" using 1:3 with linespoints pointtype 7 pointsize 0.5 title "Simpson", \
     f(x) title "Trapezoidal fit", \
     g(x) title "Simpson fit"
