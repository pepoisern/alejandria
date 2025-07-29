#import "../lib.typ" : *
#show: init.with(debug: true)

// Dependiendo el autor la notación es diferente, por eso lo generalizo con variables.
// Producto escalar
#let escalar = math.times
// Producto vectorial
#let vectorial = math.and

#title[Recta en el plano]

= Recta
Dado $P$ un punto en el plano y $arrow(u)$ un vector no nulo entonces la recta $r$ que pasa por $P$ en la dirección de $arrow(u)$ es el conjunto de puntos $Q$ tal que:
$ Q in r <=> exists lambda in RR space arrow(P Q) = lambda arrow(u) $

= Ecuaciones de la recta
Si queremos encontrar la expresión del vector posición sobre $Q$ buscamos $arrow(O Q)$. Sabiendo que tenemos $arrow(P Q)$ entonces $arrow(O Q) = arrow(O P) + arrow(P Q)$, sustituyendo queda:
#align(center)[
    _*Ecuación Vectorial*_\
    $arrow(O Q) = arrow(O P) + lambda arrow(u)$
]

Luego si $P(x_0, y_0), Q(x,y), arrow(u) = (u_1, u_2)$ queda $(x, y) = (x_0, y_0) + lambda (u_1, u_2)$ y reorganizando queda:
#align(center)[
    _*Ecuación paramétrica*_\
    $display(cases(x = x_0 + lambda u_1, y = y_0 + lambda u_2)) #h(0.5em), lambda in RR$
]

Como sabemos que el vector $arrow(u)$ es no nulo podemos decir que $u_1 != 0 or u_2 != 0$ entonces se pueden despejar las ecuaciones para eliminar el parámetro $lambda$ de la siguiente manera:
#align(center)[
    $lambda = (x - x_0)/u_1 or lambda = (y - y_0)/u_2$

    $u_1 y = u_1 y_0 + (x - x_0) u_2 or u_2 x = u_2 x_0 + (y - y_0) u_1$

    $u_1 y = u_1 y_0 + (x - x_0) u_2 or u_2 x = u_2 x_0 + (y - y_0) u_1$

    $u_2 x + (-u_1) y + (u_1 y_0 - u_2 x_0) = 0 or (-u_2) x + u_1 y + (u_2 x_0 - u_1 y_0) = 0$
]

En cualquiera de ambos casos queda una expresión de la siguiente forma donde $a, b, c in RR$:
#align(center)[
    _*Ecuación cartesiana general*_\
    $a x + b y + c = 0$
]

Nótese que el vector $arrow(n) = (a, b)$ es perpendicular a la recta $r$ ya que es perpendicular al vector $arrow(u)$ que le da dirección a la recta.
$
    arrow(n) = (u_2, -u_1) or arrow(n) = (-u_2, u_1)\
    arrow(u) escalar arrow(n) = (u_1, u_2) escalar (u_2, -u_1) or arrow(u) escalar arrow(n) = (u_1, u_2) escalar (-u_2, u_1)\
    arrow(u) escalar arrow(n) = u_1 u_2 - u_1 u_2  or arrow(u) escalar arrow(n) = -u_1 u_2 + u_1 u_2\
    arrow(u) escalar arrow(n) = 0 or arrow(u) escalar arrow(n) = 0\
    arrow(u) escalar arrow(n) = 0\
    therefore arrow(n) perp r
$

Si además se tiene que $abs(arrow(n)) = 1$ la ecuación cartesiana general es también _*Ecuación normal*_.

Si $a != 0 and b != 0 and c != 0$ la ecuación cartesiana general se puede reescribir como:
#align(center)[
    #box[
        _*Ecuación segmentaria*_

        $display(x/(-c/a) + y/(-c/b) = 1)$
    ]
]

Donde $A(-c/a, 0)$ y $B(0, -c/b)$ son los puntos de de intersección de la recta con el eje $x$ e $y$ respectivamente.

Si $b != 0$ la ecuación cartesiana general se puede reescribir como $y = -a/b x - c/a$ y definiendo #box[$m = -a/b$] y $h = -c/a$ queda:
#align(center)[
        _*Ecuación explícita*_\
        $y = m x - h$
]

A $m$ se le llama pendiente y $h$ es la ordenada al origen. La recta $r$ interseca al eje $y$ en (0, h).

Con $a != 0$ existe la otra ecuación explícita simétrica a la anterior con x en función de y.

= Recta por dos puntos
Sean $r$ una recta y $P_1(x_1, y_1), P_2(x_2, y_2) in r$ dos puntos pertenecientes a la misma, entonces el vector $arrow(P_1 P_2) = (x_2 - x_1, y_2 - y_1)$ indica la dirección de la recta. Queda así la ecuación paramétrica con punto de paso $P_1$:
$ cases(x = x_1 + lambda (x_2 - x_1), y = y_1 + lambda (y_2 - y_1)) #h(0.5em), lambda in RR $

Si $x_1 != x_2$ la ecuación explicita con punto de paso $P_1$ y pendiente $m = (y_2 - y_1)/(x_2 - x_1)$ es:
$ y = m(x - x_1) + y_1 $

Si $x_1 = x_2$ la ecuación cartesiana queda: $x - x_1 = 0$

= Posición relativa de dos rectas
Dadas dos rectas $r_1$ y $r_2$ estas pueden ser:
+ *Paralelas* y se nota $r_1 parallel r_2$ si y solo si los vectores dirección/normales son paralelos.
    - Son *coincidentes* si comparten al menos punto de paso.
        - $r_1 parallel r_2 and r_1 inter r_2 != emptyset$
    - Son *estrictamente paralelas* si no comparten ningún punto.
        - $r_1 parallel r_2 and r_1 inter r_2 = emptyset$.
+ *Secantes* si no son paralelas.
        - $r_1 parallel.not r_2 => exists! P [P in r_1 inter r_2]$

= Distancia de un punto a una recta
Dados $P$ un punto y $r$ una recta sea $s$ una recta tal que $P in s and s perp r$ entonces #box[$exists! P' [P' in r inter s]$]. La distancia de $P$ a $r$ es $d(P, r)$ y es igual a la distancia entre $P'$ y $P$ igual a $abs(arrow(P' P))$.

Sea $r) a x + b y + c = 0, P(x_0, y_0), arrow(n) = (a, b)$ y $Q(x', y') in r$ entonces:

#todo[Arreglar los ángulos]
$ d(P, r) &= abs(arrow(P' P))\
          &= abs(arrow(Q P)) cos(angle(arrow(P' P), arrow(Q P)))\
          &= abs(arrow(Q P)) cos(angle(arrow(n), arrow(Q P)))\
          &= abs(arrow(Q P)) abs(arrow(n) escalar arrow(Q P))/ (abs(arrow(n)) abs(arrow(Q P)))\
          &= abs(arrow(n) escalar arrow(Q P))/ (abs(arrow(n)))\
          &= abs((a, b) escalar (x_0 - x', y_0 - y'))/abs((a, b))\
          &= abs(a (x_0 - x') + b (y_0 - y'))/sqrt(a^2 + b^2)\
          &= abs(a x_0 + b y_0 + (- a x' - b y'))/sqrt(a^2 + b^2)\
          &= abs(a x_0 + b y_0 + c)/sqrt(a^2 + b^2)
$
