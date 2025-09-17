import numpy as np
# import matplotlib.pyplot as pl


def ReLU(x):
    return np.maximum(0, x)


def deriv_ReLU(x):  # Derivada de la función ReLU para arrays de numpy\n
    return np.where(x >= 0, 1, 0)


def MSE(y, a_2):
    return 0.5 * np.sum((a_2 - y)**2)


x = np.array([[0], [1]])
y = np.array([[1], [0]])

learning_rate = 0.1

w_1 = np.random.rand()
w_2 = np.random.rand()
b_1 = np.random.rand()
b_2 = np.random.rand()

for i in range(1000):
    z_1 = w_1 * x + b_1
    a_1 = ReLU(z_1)
    z_2 = w_2 * a_1 + b_2
    a_2 = ReLU(z_2)

    delta_2 = (a_2 - y) * deriv_ReLU(z_2)
    delta_1 = w_2 * deriv_ReLU(z_1)

    partial_w2 = delta_2 * a_1
    partial_b2 = delta_2 * 1

    partial_w1 = delta_1 * delta_2 * x
    partial_b1 = delta_1 * delta_2 * 1

    C = MSE(y, a_2)

    w_2 -= partial_w2 * learning_rate
    b_2 -= partial_b2 * learning_rate

    w_1 -= partial_w1 * learning_rate
    b_1 -= partial_b1 * learning_rate

print(y)
print(a_2)
