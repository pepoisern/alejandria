#import "../lib.typ" : *
#show: init.with(debug: true)

#let gr = "gr"

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
- $p(x) = 0 => p = overline(0), overline(0)$ es el polinomio nulo.
- $p(x) = 1 => p = overline(1)$
- $gr(p) = 0 => p$ es una función constante no nula.

= Igualdad de polinomios
Dados $p, q in CC[x]$ de ley $p(x) = display(sum_(i=0)^n a_i x^i)$ y $q(x) = display(sum_(i=0)^m b_i x^i)$ se dice que son iguales si se cumple:
$ gr(p) = gr(q) and forall i in NN_0 : i <= n space a_i = b_i $

= Operaciones de polinomios
Sean $p, q in CC[x]$ y $p(x) = display(sum_(i=0)^n a_i x^i), q(x) = display(sum_(i=0)^m b_i x^i)$ s

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

== Algoritmo de división
Sean $p, q in CC[x] and q != overline(0) => exists! c, r in CC[x] space space p = c dot q + r and (r = overline(0) or 0 <= gr(r) <= gr(q))$

=== Regla de Ruffini
$ q(x) = x - alpha and alpha in CC => cases(p = c dot q + r, r = a_0 + alpha b_0, c(x) = sum_(i=0)^(n-1) b_i x^i, b_(n-1) = a_n, forall i in NN_0 inter [0, n-2] b_i = a_(i+1) + alpha b_(i+1)) $

El método gráfico es el siguiente:
#todo[Explicación]

Siendo $a_n$ el coeficiente de mayor grado de $p$, se escribe $p$ completo y ordenado en la parte superior.
El primer coeficiente se pasa a la última fila. El valor obtenido se multiplica por $alpha$ y se anota en la segunda
fila, debajo del próximo coeficiente de $p$. Los valores se suman, el resultado se anota debajo y se repite el proceso.
Los valores de la última fila (excluyendo al último) son los coeficientes ordenados de $c(x)$. 
El último valor representa al resto $r$ de la división.
#align(center)[#table(stroke: (x, y) => (
            top: if y == 2 { black } else { none },
            left: if x == 1 { black } else { none },
        ),
        columns: (auto, auto, auto, auto, auto, auto, auto),
        "", $a_n$, $a_(n-1)$, $dots$, $a_2$, $a_1$, $a_0$,
        $alpha$, "", $alpha b_(n-1)$, $dots$, $alpha b_2$, $alpha b_1$, $alpha b_0$,
        "", $a_n$, $a_(n-1) + alpha b_(n-1)$, $dots$, $a_2 + alpha b_2$, $a_1 + alpha b_1$, $a_0 + alpha b_0$
)]

=== Teorema del resto
Si $gr(p) >= 1 and a in CC => p(z)$ es igual al resto de la division de $p$ por $x - z$. Esto es porque por el algoritmo de la división $p(x) = (x - z) c(x) + r(x) => p(z) = (z - z) c(x) + r(x) = r(x)$

=== Raíces de polinomios
Sea $z in CC$ se dice que $z$ es raíz de $p$ si y solo sí $p(z) = 0$.

Si $z$ es raíz de $p$ si y solo si $x - z$ divide a $p$.

= Factorización de polinomios a coeficientes enteros
== Teorema fundamental del álgebra
$ forall p in CC[x] space gr(p) >= 1 -> exists z in CC space p(z) = 0 $

Deducimos entonces que si $gr(p) >= 1$ podemos expresar a $p(x)$ como $(x - alpha_1) c_1(x)$ donde $c_1$ tiene grado $gr(p) - 1$. Si $gr(c_1) >= 1$ entones se puede expresar a $c_1(x)$ como $(x - alpha_2) c_2(x)$ y así... Al final nos queda $c_n in CC and n = gr(p) and p(x) = (x - alpha_1)(x - alpha_2)...(x - alpha_n)c_n$

== Descomposición factorial
Sea $p in CC[x], r$ la cantidad de raíces de $p, n = gr(p)$ y $ forall i in NN inter [1, r] space alpha_i in CC and l_i in NN$ entonces se llama descomposición factorial del polinomio $p$ a la expresión.
$ p(x) = a_n product_(i=1)^r (x-alpha_i)^(l_i) $

- $display(sum_(i=1)^r l_i) = n$
- $gr(p) = n => p$ tiene a lo sumo $n$ raíces.
- $l_i$ es la multiplicidad de $a_i$

== Teorema de Gauss
Sea $p in CC[x]$ tal que $p(x) = sum_(i=0)^n a_i x^i$ y $a_i in ZZ$ entonces:
$ r/s in QQ and p(r/s) = 0 => r|a_0 and s|a_n $

#todo[Agregar un ejemplo del método de búsqueda y verificación de raíces]

== Raíces complejas de un polinomio a coeficientes reales
Si un polinomio $p in CC[x]$ tiene una raíz compleja $alpha in CC$ entonces también tiene por raíz al conjugado de $alpha = overline(alpha)$

$ p(overline(alpha)) = sum_(i=0)^n a_i overline(alpha)^i = sum_(i=0)^n overline(a_i) overline(alpha^i) = sum_(i=0)^n overline(a_i alpha^i) = overline(sum_(i=0)^n a_i alpha^i) = overline(p(alpha)) = overline(0) = 0 $
