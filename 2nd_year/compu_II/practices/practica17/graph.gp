# Configurar el tipo de gráfico
set title " Método "
set xlabel "x"
set ylabel "u"
set grid


set terminal png size 800,600
set output 'graph.png'
set key left


# Graficar los puntos experimentales y la expresión teórica
plot "euler.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "h = 0.1'", \
	"rk2.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "h = 0.1'", \
	"rk4.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "h = 0.1'", \


# Configurar el tipo de gráfico
set title " Método "
set xlabel "x"
set ylabel "u"
set grid


set terminal png size 800,600
set output 'graph2.png'
set key left


# Graficar los puntos experimentales y la expresión teórica
plot "euler.txt" using 1:3 with linespoints pointtype 7 pointsize 0.5 title "h = 0.1'", \
	"rk2.txt" using 1:3 with linespoints pointtype 7 pointsize 0.5 title "h = 0.1'", \
	"rk4.txt" using 1:3 with linespoints pointtype 7 pointsize 0.5 title "h = 0.1'", \
