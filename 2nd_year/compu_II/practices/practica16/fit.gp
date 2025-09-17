# Configurar el tipo de gráfico
set title "Error"
set xlabel "tau"
set ylabel "Error"
set grid

set terminal png size 800,600
set output 'graph4.png'
set key 

# Funciones para ajuste
a(x) = A1 + A2*x
b(x) = B1 + B2*x
c(x) = C1 + C2*x
d(x) = D1 + D2*x
e(x) = E1 + E2*x
f(x) = F1 + F2*x 

# Ajustar los datos
set xrange [-3:-1.5]
fit a(x) "error.txt" u 1:2 via A1, A2
fit b(x) "error.txt" u 1:3 via B1, B2
fit c(x) "error.txt" u 1:4 via C1, C2
fit d(x) "error.txt" u 1:5 via D1, D2
fit e(x) "error.txt" u 1:6 via E1, E2
fit f(x) "error.txt" u 1:7 via F1, F2

set xrange[-10:0]
# Graficar los puntos experimentales y las curvas ajustadas
plot "error.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "diferencia_centrada_2", \
     "error.txt" using 1:3 with linespoints pointtype 7 pointsize 0.5 title "progresivas2", \
     "error.txt" using 1:4 with linespoints pointtype 7 pointsize 0.5 title "regresivas2", \
     "error.txt" using 1:5 with linespoints pointtype 7 pointsize 0.5 title "diferencia_centrada_3", \
     "error.txt" using 1:6 with linespoints pointtype 7 pointsize 0.5 title "progresivas3", \
     "error.txt" using 1:7 with linespoints pointtype 7 pointsize 0.5 title "regresivas3", \
	 a(x) ,\
	 b(x) ,\
	 c(x) ,\
	 d(x) ,\
	 e(x) ,\
	 f(x) ,\


