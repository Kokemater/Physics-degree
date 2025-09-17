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
h(x) = E + F*x
# Ajustar los datos
set xrange [-5:-2]
fit f(x) "error.txt" u 1:2 via A, B
set xrange[-6:-1]
fit g(x) "error.txt" u 1:3 via C, D
fit h(x) "error.txt" u 1:4 via E, F

set xrange[-14:0]
# Graficar los puntos experimentales y las curvas ajustadas
plot "error.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "D", \
     "error.txt" using 1:3 with linespoints pointtype 7 pointsize 0.5 title "S", \
	"error.txt" using 1:4 with linespoints pointtype 7 pointsize 0.5 title "H", \
	f(x) title "D ajuste",\
	g(x) title "S ajuste",\
	h(x) title "H ajuste",\

