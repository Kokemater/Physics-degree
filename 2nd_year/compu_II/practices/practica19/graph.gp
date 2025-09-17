

# Configurar el tipo de gráfico
set title " Método del disparo + rk4 "
set xlabel "x"
set ylabel "u"
set grid


set terminal png size 800,600
set output 'graph1.png'
set key left

# Graficar los puntos experimentales y la expresión teórica
plot "0.5_disparo.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "0.5", \
	"1_disparo.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "1", \
	"1.5_disparo.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "1.5", \



########################################################################################


# Configurar el tipo de gráfico
set title " Método del disparo + rk4 "
set xlabel "x"
set ylabel "u'"
set grid


set terminal png size 800,600
set output 'graph2.png'
set key left


# Graficar los puntos experimentales y la expresión teórica
plot "0.5_disparo.txt" using 1:3 with linespoints pointtype 7 pointsize 0.5 title "0.5", \
	"1_disparo.txt" using 1:3 with linespoints pointtype 7 pointsize 0.5 title "1", \
	"1.5_disparo.txt" using 1:3 with linespoints pointtype 7 pointsize 0.5 title "1.5", \


	########################################################################################


# Configurar el tipo de gráfico
set title " Método del disparo + rk4 "
set xlabel "x"
set ylabel "u'"
set grid


set terminal png size 800,600
set output 'graph3.png'
set key left


# Graficar los puntos experimentales y la expresión teórica
plot "0.5_disparo.txt" using 2:3 with linespoints pointtype 7 pointsize 0.5 title "0.5", \
	"1_disparo.txt" using 2:3 with linespoints pointtype 7 pointsize 0.5 title "1", \
	"1.5_disparo.txt" using 2:3 with linespoints pointtype 7 pointsize 0.5 title "1.5", \

