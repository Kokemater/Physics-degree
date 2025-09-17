f(x,y)= 2*x**3 + 10*x**2 - 8*y**2 + x*y + 1
g(x,y)= x**2 + y**2 - 3*y -1
splot f(x,y),g(x,y) 
set cntrparam levels 0
set contour
replot
set xrange [-3:3]
set yrange [0:3]
unset surface
set view map
set xlabel " X"
set ylabel " Y"
set terminal png
set output "figure2.png"
replot
