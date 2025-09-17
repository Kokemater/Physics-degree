# Configurar el tipo de gráfico
set title "Erf datos de -3 a 3"
set xlabel "x"
set ylabel "erf(x)"
set grid


set terminal png size 800,600
set output 'erf.png'
set key top left



# Graficar los puntos experimentales y la expresión teórica
plot "erf_table.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title " Mi erf(x)", \

################################################

# Configurar el tipo de gráfico
set title "comparación Erf mío y c++"
set xlabel "x"
set ylabel "abs(erf(x)- mi_erf)"
set grid


set terminal png size 800,600
set output 'erf_comparation.png'
set key top left


# Graficar los puntos experimentales y la expresión teórica
plot "erf_error.txt" using 1:2 with linespoints pointtype 7 pointsize 0.5 title " comparación", \

