import numpy as np
import matplotlib.pyplot as plt
mass2_inel = 204 # gramos
mass1_inel = 200 # gramos
mass1_el = 200 # gramos
mass2_el = 191 #gramos

dmass = 1  #gramos

long1 = 10 #cm
long2 = 10 #cm
dlong = 0.1 #cm


# [mass1_el, mass2_el, t1_i, t2_i, t1_f, t2_f ]
tabla_el = [
	[200, 400+4, 0.082 , 0, 0.458, 0.163 ],
	[200, 400+4, 0.285 , 0, 0.934, 0.443],
	[200, 400+4, 0.135, 0, 0.431, 0.212],

	[200, 350+4, 0.106 , 0, 0.459, 0.164],
	[200, 350+4, 0.093 , 0, 0.429, 0.145],
	[200, 350+4, 0.073 , 0, 0.460, 0.126],

	[200, 300+4, 0.183 , 0, 1.529, 0.236],
	[200, 300+4, 0.147 , 0, 1.184, 0.193],
	[200, 300+4, 0.157 , 0, 0.886, 0.204],

	[200, 250+4, 0.084 , 0, 1.088, 0.106],
	[200, 250+4, 0.097 , 0, 0.995, 0.122],
	[200, 250+4, 0.101 , 0, 1.072, 0.126],


#[400, 400+4, 0.147 , 0, 1.184, 0.193],
#	[400, 400+4, 0.147 , 0, 1.184, 0.193],
		 ]
tabla_el = np.array(tabla_el)

#Nótese que sólo se recogen datos desde x 1.3 hasta 2, esto se debe a que los datos recogidos durante el experimento en relacciones de masa \( \frac{m2}{m1} <= 1 \) la masa 1 se quedaba completamente detenida tras chocar a la masa 2, sin retroceder. Esto puede deberse a un error experimental debido a la presencia de rozamiento durante el experimento, la solución a este problema podría ser lubricar la superficie en la que las masas se desplazan.

# [mass1_el, mass2_el, t1_i, t2_i, t1_i, t2_f ]

v_1_i = long1 / tabla_el[:, 2]
v_1_f = -long1 / tabla_el[:, 4]
v_2_f = long2 / tabla_el[:, 5]
v1f_v1i = v_1_f / v_1_i
v2f_v1i = v_2_f / v_1_i


m2_m1 = tabla_el[:,1] / tabla_el[:,0]

# Graficar varias listas en una misma gráfica
plt.plot(m2_m1, v1f_v1i, 'o', label="v1f_v1i")  # Graficar y1
plt.plot(m2_m1, v2f_v1i, 's', label ="v2f_v1i")  # Graficar y2

# Agregar etiquetas y título
plt.xlabel('x')
plt.ylabel('y')
plt.title('Varias listas en la misma gráfica')

# Mostrar leyenda para diferenciar las listas
plt.legend()

# Mostrar la cuadrícula
plt.grid(True)

# Mostrar la gráfica
plt.show()

v1f_v2f = v_1_f/v_2_f
v1i_v2f = v_1_i/v_2_f

# Graficar varias listas en una misma gráfica
plt.plot(m2_m1, v1f_v2f, 'o', label="v1f_v2f")  # Graficar y1
plt.plot(m2_m1, v1i_v2f, 's', label="v1i_v2f")  # Graficar y2

# Agregar etiquetas y título
plt.xlabel('x')
plt.ylabel('y')
plt.title('Varias listas en la misma gráfica')

# Mostrar leyenda para diferenciar las listas
plt.legend()

# Mostrar la cuadrícula
plt.grid(True)

# Mostrar la gráfica
plt.show()




# Graficar varias listas en una misma gráfica
plt.plot(m2_m1, v1f_v2f, 'o', label="v1f_v2f")  # Graficar y1
plt.plot(m2_m1, v1i_v2f, 's', label="v1i_v2f")  # Graficar y2

# Agregar etiquetas y título
plt.xlabel('x')
plt.ylabel('y')
plt.title('Varias listas en la misma gráfica')

# Mostrar leyenda para diferenciar las listas
plt.legend()

# Mostrar la cuadrícula
plt.grid(True)

# Mostrar la gráfica
plt.show()



# [mass1_el, mass2_el, t1_i, t2_f ]

tabla_inel = [
	[200, 400-10, 0.129 , 0, 0.457 ],
	[200, 400-10, 0.192 , 0, 0.571],

	[200, 300-10, 0.145 , 0, 0.359],
	[200, 300-10, 0.142, 0,0.359],
	
	[200, 200-10, 0.240, 0, 0.449],
	[200, 200-10, 0.197, 0, 0.393],

	[300, 200-10, 0.161, 0, 0.276],
	[300, 200-10, 0.333, 0, 0.530],

	[400, 200-10, 0.234, 0, 0.344],
	[400, 200-10, 0.216, 0, 0.328],
	]
tabla_inel = np.array(tabla_inel)


# [mass1_el, mass2_el, t1_i, t2_i, t2_f ]

v_i = long1 / tabla_inel[:, 2] 
v_f = long2 / tabla_inel[:, 4]
vf_vi = v_f / v_i

m2_m1 = tabla_inel[:,1] / tabla_inel[:,0]

print(m2_m1)
print(vf_vi)
plt.plot(m2_m1, vf_vi, 'o', label='vf/vi vs m2/m1')
x = np.linspace(0.4, 2.1, 100)
y = 1 / (1 + x)
plt.plot(x,y, '-', label="teoría")
plt.xlabel('m2 / m1')
plt.ylabel('vf / vi')
plt.title('Relación entre vf/vi y m2/m1 en colisión inelástica')
plt.legend()
plt.grid(True)
plt.show()