import numpy as np

def apply_identity(x):
	A = np.array([[1,0,0],[0,1,0],[0,0,1]])
	b = np.array([0,0,0])
	return A @ x + b

def apply_traslation(x, traslation):
	A = np.array([[1,0,0],[0,1,0],[0,0,1]])
	b = traslation
	return A @ x + b

def apply_glide_simmetry(x, plane, traslation):
	A_prime = np.array([[1,0,0],[0,1,0],[0,0,-1]])
	v1 = plane[:,0]
	v2 = plane[:,1]
	v3 = np.cross(v1,v2)
	P = np.column_stack((v1,v2,v3))
	A = P @ A_prime @ np.linalg.inv(P)
	b = traslation
	return A @ x + b

def apply_helicoidal_movement(x, line, angle, traslation):
	A_prime = np.array([[1,0,0],[0,np.cos(angle), -np.sin(angle)],[0,np.sin(angle), np.cos(angle)]])
	v = line
	P = np.array([v, np.cross(v, np.array([1,0,0])), np.cross(v, np.array([0,1,0]))])
	A = P @ A_prime @ np.linalg.inv(P)
	b = traslation
	return A @ x + b
	
	

def main():
	arr = np.array([1,2,3])
	b = np.array([1,0,0])
	v1_plane = np.array([1,1,1])
	v2_plane = np.array([1,0,0])
	plane = np.column_stack((v1_plane, v2_plane))
	angle = 2*np.pi
	line = np.array([1,1,1])

	arr_identity = apply_identity(arr)
	print(f"[IDENTITY] || \t\t\t\t\t\t\t before {arr}, after:  {arr_identity}")

	arr_traslation = apply_traslation(arr, b)
	print(f"[TRASLATION v = {b}] || \t\t\t\t\t  before {arr}, after:  {arr_traslation}")

	arr_glide_sym = apply_glide_simmetry(arr, plane, b)
	print(f"[GLIDE SYMMETRY plane = ({v1_plane}, {v2_plane}), v = {b}] || \t  before {arr}, after:  {arr_glide_sym}")

	arr_helicoidal_move = apply_helicoidal_movement(arr, plane, b)
	print(f"[HELICOIDAL MOVEMENT line = {line}, angle = {angle}, v = {b}] || \t  before {arr}, after:  {arr_helicoidal_move}")



if __name__ == "__main__":
	main()