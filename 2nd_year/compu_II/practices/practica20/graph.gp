

# Configurar el tipo de gráfico
set title " Comparación disparo con diferecias finitas"
set xlabel "x"
set ylabel "u"
set grid


set terminal png size 800,600
set output 'graph1.png'
set key left

# Graficar los puntos experimentales y la expresión teórica
plot "diferencias_h_0.1.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "diff 0.1", \
	"diferencias_h_0.01.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "diff 0.01", \
	"diferencias_h_0.001.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "diff 0.001", \
	"disparo_h_0.1.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "disp 0.1", \
	"disparo_h_0.01.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "disp 0.01", \
	"disparo_h_0.001.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "disp 0.001", \

########################################################################################

# Configurar el tipo de gráfico
set title "Resta diferencias finitias con respeto a h=0.001"
set xlabel "x"
set ylabel "Resta"
set grid


set terminal png size 800,600
set output 'graph3.png'
set key right

set logscale y
# Graficar los puntos experimentales y la expresión teórica
plot "comp01_2.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "comp 0.1", \
	"comp001_2.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "comp 0.01", \

########################################################################################

# Configurar el tipo de gráfico
set title " Resta disparo con diferecias finitas"
set xlabel "x"
set ylabel "Resta"
set grid


set terminal png size 800,600
set output 'graph2.png'
set key right
set logscale y

# Graficar los puntos experimentales y la expresión teórica
plot "comp01.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "comp 0.1", \
	"comp001.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "comp 0.01", \
	"comp0001.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title "comp 0.001", \

