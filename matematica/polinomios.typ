#import "../lib.typ" : *
#show: init.with(debug: true)

#title[Polinomios]

= Polinomio a coeficientes complejos
Sea $n in NN_0 and forall i in NN_0 inter [0, n] space a_i in CC and a_n != 0$ entonces Una función polinómica o polinomio a coeficientes complejos es una función de la forma:
#align(center)[#function_def($p$, $CC$, $CC$, $x$, $p(x) = display(sum_(i=0)^n a_i x^i) = a_n x^n + a_(n-1) x^(n-1) + ... + a_1 x + a_0$)]

- $a_k$ es el $k$-ésimo coeficiente.
- $a_k x^k$ es el $k$-ésimo término o monomio.
- $p(x) != 0 => n$ es el grado de polinomio y se nota $gr(p) = n$.
- $a_0$ es el coeficiente (o termino) independiente.
- $a_n$ es el coeficiente principal.
- $CC[x]$ es el conjunto de todos los polinomios a coeficientes complejos en la variable $x$.
- $p(x) = 0 => p = overline(0)$, $overline(0)$ es el polinomio nulo.
- $p(x) = 1 => p = overline(1)$
- $gr(p) = 0 => p$ es una función constante no nula.

= Igualdad de polinomios
Dados $p$, $q in CC[x]$ de ley $p(x) = display(sum_(i=0)^n a_i x^i)$ y $q(x) = display(sum_(i=0)^m b_i x^i)$ se dice que son iguales si se cumple:
$ gr(p) = gr(q) and forall i in NN_0 inter [0, n] space a_i = b_i $

= Operaciones de polinomios
Sean $p, q in CC[x]$ y $p(x) = display(sum_(i=0)^n a_i x^i)$, $q(x) = display(sum_(i=0)^m b_i x^i)$ s

== Suma
La suma de $p$ y $q$ es el polinomio suma definido por:
#align(center)[#function_def($(p+q)$, $CC$, $CC$, $x$, $(p+q)(x) = p(x) + q(x)$)]

== Opuesto
El opuesto de $p$ de define por:
#align(center)[#function_def($-p$, $CC$, $CC$, $x$, $(-p)(x) = -p(x)$)]

== Diferencia
La diferencia de $p$ y $q$ es el polinomio definido por:
#align(center)[#function_def($(p-q)$, $CC$, $CC$, $x$, $(p-q)(x) = (p+(-q))(x) = p(x) - q(x)$)]

== Multiplicación
La multiplicación de $p$ y $q$ es el polinomio definido por:
#align(center)[#function_def($(p dot q)$, $CC$, $CC$, $x$, $(p dot q)(x) = p(x) q(x) = (display(sum_(i=0)^n a_i x^i)) (display(sum_(j=0)^m b_j x^j)) = display(sum_(i=0)^n sum_(j=0)^m a_i b_j x^(i+j)) = display(sum_(k=0)^(n+m) c_k x^k)$)]

== Inverso
Se dice que $q$ es el inverso de $p$ si $p dot q = overline(1)$. Esto se da si:
$ p(x) q(x) = 1 => q(x) = p(x)^(-1) = (display(sum_(i=0)^n a_i x^i))^(-1) $
Notemos que si $n = 0$ queda que $q(x) = a_0^(-1) = 1/a_0$, por lo tanto:
$ forall p in CC[x] space gr(p) = 0 => p "tiene inverso con grado" 0 $

== Propiedades
+ $p != overline(0) and q != overline(0) => gr(p + q) <= max{gr(p) + gr(q)}$
+ $p != overline(0) and q != overline(0) => gr(p dot q) = gr(p) + gr(q)$
+ La suma es cerrada, conmutativa, asociativa, tiene elemento neutro $overline(0)$ y elementos opuestos.
+ La multiplicación es cerrada, conmutativa, asociativa y tiene elemento neutro $overline(1)$.
+ La multiplicación es distributiva respecto a la suma.
