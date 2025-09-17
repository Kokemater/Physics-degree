// Authors: Pablo Collado and Jose del Peso (UAM, Madrid)

#ifndef __MIVECTORT__
#define __MIVECTORT__

#include <cmath>
#include <initializer_list>

/*
 * La clase `mivector` incluye las operaciones usuales
 * con vectores numéricos de dimension `n`.
 */

template <class T>
class mivector {
    protected:
        T  *v;
        int n;

    public:
        // Constructor sin argumentos.
        mivector();

        // Constructor copia.
        mivector(const mivector<T>&);

        // Operador de asignación.
        mivector<T>& operator=(const mivector<T>&);

        // Constructor con una dimensión.
        mivector(int);

        // Constructor con elementos de inicialización y dimensión.
        mivector(T*, int);

        // Constructor que inicializa el vector e infiere la dimensión.
        mivector(std::initializer_list<T>);

        // Método para añadir un nuevo elemento al vector.
        void append(T);

        // Devuelve la dimensión del vector.
        int dimension();

        // Devuelve o asigna la componente especificada del vector.
        T& operator[](int);

        // Suma de dos vectores.
        mivector<T> operator+(const mivector<T>&);

        // Resta de dos vectores.
        mivector<T> operator-(const mivector<T>&);

        // Multiplicación del vector por un escalar.
        mivector<T> operator*(T);

        // Producto escalar de dos vectores.
        T operator*(const mivector<T>&);

        // Módulo o norma de un vector.
        T norma(int);

        // Módulo o norma de un vector.
        T operator||(int);

        // Módulo o norma cuadrática de un vector.
        T operator~();

        // Destructor.
        ~mivector();
};

/*
 * Este constructor inicializa un vector de dimensión `0`
 * para evitar fallos en su uso posterior.
 */
template <class T>
mivector<T>::mivector() {
    this->n = 0;
    this->v = NULL;
}

/*
 * Este constructor copia es invocado cuando llamamos
 * a las funciones que reciben argumentos por valor,
 * así como cuando devolvemos las instancias de la
 * clase `aux` en varios métodos.
 */
template <class T>
mivector<T>::mivector(const mivector<T>& other) {
    this->n = other.n;
    this->v = new T[other.n];

    for (int i = 0; i < other.n; i++)
        this->v[i] = other.v[i];
}

/*
 * Este operador de asignación se encarga de copiar la
 * memoria dinámica donde corresponda a fin de evitar
 * la mezcla y mal manejo de las referencias subyacentes
 * a la clase.
 */
template <class T>
mivector<T>& mivector<T>::operator=(const mivector<T>& other) {
    if (this == &other)
        return *this;

    this->n = other.n;
    this->v = new T[other.n];

    for (int i = 0; i < other.n; i++)
        this->v[i] = other.v[i];

    return *this;
}

/*
 * Este constructor reserva una porción de memoria dinámica
 * suficiente para `n` elementos.
 */
template <class T>
mivector<T>::mivector(int m) {
    this->v = new T[m];
    this->n = m;
}

/*
 * Este constructor reserva una porción de memoria de
 * `m` elementos y los inicializa a través del puntero a `T`.
 */
template <class T>
mivector<T>::mivector(T* u, int m) {
    this->v = new T[m];
    this->n = m;
    for (int i = 0; i < m; i++)
        this->v[i] = u[i];
}

/*
 * Este constructor recibe una serie de componentes para
 * inferir la dimensión del vector en base a ellas e
 * inicializarlo.
 */
template <class T>
mivector<T>::mivector(std::initializer_list<T> components) {
    this->n = components.size();
    this->v = NULL;
    if (!this->n)
        return;

    this->v = new T[this->n];

    int i = 0;
    for (T component:components)
      this->v[i++] = component; //v[i] y despues incrementa i en uno.
}

/*
 * Este método añade un nuevo elemento al vector.
 */
template <class T>
void mivector<T>::append(T newElm) {
    T* aux = new T[this->n + 1];
    for (int i = 0; i < this->n; i++)
        aux[i] = this->v[i];
    aux[this->n] = newElm;
    delete[] this->v;
    this->v = aux;
    this->n++;
}

/*
 * Este método devuelve la dimensión del vector.
 */
template <class T>
int mivector<T>::dimension() {
    return this->n;
}

/*
 * Este método devuelve una referencia a la dimensión
 * identificada por `j`. En caso de que `j >= this->n`
 * se provocará un error de acceso a memoria.
 */
template <class T>
T& mivector<T>::operator[](int j) {
    return v[j];
}

/*
 * Este método devuelve un nuevo `mivector` que
 * es la suma del que recibe la llamada
 * y el que se pasa como argumento.
 */
template <class T>
mivector<T> mivector<T>::operator+(const mivector<T>& w) {
    mivector<T> aux(this->n);
    for (int i = 0; i < this->n; i++)
        aux.v[i] = this->v[i] + w.v[i];
    return aux;
}

/*
 * Este método devuelve un nuevo `mivector` que
 * es la resta del que recibe la llamada y el
 * que se pasa como argumento.
 */
template <class T>
mivector<T> mivector<T>::operator-(const mivector<T>& w) {
    mivector<T> aux(this->n);
    for (int i = 0; i < this->n; i++)
        aux.v[i] = this->v[i] - w.v[i];
    return aux;
}

/*
 * Este método devuelve un nuevo `mivector` que
 * es el producto del vector que recibe la llamada
 * y el escalar `a`.
 */
template <class T>
mivector<T> mivector<T>::operator*(T a) {
    mivector<T> aux(this->n);
    for (int i = 0; i < this->n; i++)
        aux.v[i] = this->v[i] * a;
    return aux;
}

/*
 * Este método devuelve el producto escalar
 * de este vector con el que se pasa como
 * argumento. Para iterar sobre los vectores
 * se emplea la dimensión del receptor de la
 * llamada, con lo que hay que asegurar que
 * la dimensión de `u` sea igual que la deñ
 * receptor.
 */
template <class T>
T mivector<T>::operator*(const mivector<T>& u) {
    T sum = 0;
    for (int i = 0; i < this->n; i++)
        sum += this->v[i] * u.v[i];
    return sum;
}

/*
 * Este método devuelve el módulo del vector si
 * `type == 2`. Si `type == 0` devuelve la componente
 * mayor en valor absoluto. Si `type` no es ni `2`
 * ni `0`, se devuelve `-1` para indicar que ha habido
 * un error.
 */
template <class T>
T mivector<T>::norma(int type) {
    T aux = -1;
    switch (type) {
    case 2:
        aux = 0;
        for (int i = 0; i < this->n; i++)
            aux += this->v[i] * this->v[i];
        aux = std::sqrt(aux);
        break;
    case 0:
        aux = std::abs(this->v[0]);
        for (int i = 1; i < this->n; i++)
            if (this->v[i] > aux)
                aux = this->v[i];
        break;
    }
  return aux;
}

/*
 * Este método encapsula el método `norma()`
 * para que éste pueda ser invocado a través
 * de `||`.
 */
template <class T>
T mivector<T>::operator||(int type) {
    return this->norma(type);
}

template <class T>
T mivector<T>::operator~() {
    return this->norma(2);
}

/*
 * Este destructor se encarga de liberar la memoria
 * dinámica en la que se almacenan los contenidos
 * del vector
 */

template <class T>
mivector<T>::~mivector() {
    if (this->v)
        delete[] this->v;
}

/*
 * Esta sobrecarga del operador `*` permite multiplicar
 * un escalar por un vector en ese orden
 */
template <class T>
mivector<T> operator*(T a, mivector<T> z) {
    return z * a;
}

/*
 * Esta sobrecarga del operador `*` permite multiplicar
 * un entero por un vector de dobles sin que ello
 * implique una ambigüedad en la llamada
 */
template <class T>
mivector<T> operator*(int a, mivector<T> z) {
    return z * a;
}

/*
 * Esta sobrecarga del operador `<<` permite imprimir
 * vectores por pantalla de manera cómoda.
 */
template <class T>
std::ostream & operator<<(std::ostream & s, mivector<T> z) {
    int n = z.dimension();
    s << "(";

    for(int i = 0; i < n - 1; i++)
        s << z[i] << ", ";

    s << z[n-1] << ")";

    return s;
}

/*
 * Esta clase está orientada a soportar 
 * una colección de mivectores.
 */
template <class T, int sz>
class mivectores : public mivector<T> {
    public:
        mivectores() : mivector<T>(sz){};
};
#endif
