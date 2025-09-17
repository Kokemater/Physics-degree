
#################################################################
# Configurar el tipo de gráfico
set title "Posición y(t) con respecto a x(t)"
set xlabel "x(t)"
set ylabel "y(t)"
set grid


set terminal png size 800,600
set output 'pos_x_y.png'
set key top left



# Graficar los puntos experimentales y la expresión teórica
plot "rk4_b0.txt" using 2:4 with linespoints pointtype 7 pointsize 0.5 title " b0 = 1.6e-14", \
 "rk4_b1.txt" using 2:4 with linespoints pointtype 7 pointsize 0.5 title " b1 = 3.2e-14", \
  "rk4_b2.txt" using 2:4 with linespoints pointtype 7 pointsize 0.5 title " b2 = 6.4e-14", \
   "rk4_b3.txt" using 2:4 with linespoints pointtype 7 pointsize 0.5 title " b3 = 1.3e-13", \
 "rk4_b4.txt" using 2:4 with linespoints pointtype 7 pointsize 0.5 title " b4 = 2.6e-13", \


 #################################################################
# Configurar el tipo de gráfico
set title "Velocidad y'(t) con respecto a x'(t)"
set xlabel "x'(t)"
set ylabel "y'(t)"
set grid


set terminal png size 800,600
set output 'vel_x_y.png'
set key top left


# Graficar los puntos experimentales y la expresión teórica
plot "rk4_b0.txt" using 3:5 with linespoints pointtype 7 pointsize 0.5 title " b0 = 1.6e-14", \
 "rk4_b1.txt" using 3:5 with linespoints pointtype 7 pointsize 0.5 title " b1 = 3.2e-14", \
  "rk4_b2.txt" using 3:5 with linespoints pointtype 7 pointsize 0.5 title " b2 = 6.4e-14", \
   "rk4_b3.txt" using 3:5 with linespoints pointtype 7 pointsize 0.5 title " b3 = 1.3e-13", \
 "rk4_b4.txt" using 3:5 with linespoints pointtype 7 pointsize 0.5 title " b4 = 2.6e-13", \