#import "../lib.typ" : *
#show: init

#title[Inducción matemática]
= Principio de buen orden
+ Sea $A subset.eq RR$ entonces $A$ tiene primer elemento $a$ si $exists a in A space forall x in A space a < x$.
+ Sea $A subset.eq RR$ entonces $A$ esta bien ordenado si $X subset.eq A => X "tiene primer elemento"$.
+ $NN$ esta bien ordenado.
= Principio de inducción matemática
Sea $p(n)$ una proposición abierta que depende de $n in NN$ entonces:
#align(center)[
    #inference_rule(
            $p(1) "es vedadera"$,
            $forall n in NN space p(n) -> p(n+1)$,
            conclusion: $forall n in NN space p(n)$
    )
]

A la segunda premisa se le llama hipótesis inductiva.

== Demostración:
+ Sea $H = {n in NN: not p(n)}$ entonces $H subset.eq NN$
+ Supongo $H != emptyset => exists m [ m "primer elemento de" H ] => p(m)$ es falso y $p(m-1)$ verdadero.
+ Sabemos por la primer premisa que $m != 1$, entonces $(m - 1) in NN$
+ Por la segunda premisa y (2.) que $p(m)$ es verdadero
+ Por (2.) y (4.) $p(m) and not p(m)$
+ $therefore H = emptyset space => forall n in NN space p(n)$

== Comenzando desde $n_0$
Ahora demostremos que también se da:
#align(center)[
    #inference_rule(
            $p(n_0) "es vedadera"$,
            $forall n in {k in NN: k >= n_0} space p(n) -> p(n+1)$,
            conclusion: $forall n in {k in NN: k >= n_0} space p(n)$
    )
]

+ Sea $q(n) = p(n_0 + n - 1)$
+ Entonces $q(1)$ es verdadero
+ Y $q(n) -> q(n+1) <=> p(n_0 + n - 1) -> p(n_0 + n)$
+ $n in {k in NN: k >= n_0} <=> n in NN and  n$\
$n in {k in NN: k >= n_0} <=>$

#let def_xoria(nombre, op, sim) = [
= Símbolo #nombre
Dados $n in NN$ números $x_i$ con $i in NN and i <= n$ se define a la #nombre entre $i = 1$ e $i = n$ de los $x_i$ a:
$ cases(display(sim_(i=1)^1x_i = x_1),display(sim_(i=1)^(k+1) x_i = x_(k+1) #op sim_(i=1)^(k)x_i", " k in NN inter [1, n))) $
Si se desea demostrar una proposición del tipo $sim_(i=1)^n x_i = f(n)$ se puede (al menos intentar) demostrar por inducción tomando $sim_(i=1)^1 x_i = f(1)$ como caso base y $forall n in NN space sim_(i=1)^n x_i -> sim_(i=1)^(n+1) x_i$

== #nombre desde $n_0 in ZZ$
Se extiende la definición de la #nombre para incluir valores de $n_0 in ZZ$ (con $n_0 < n$) de la siguiente manera:
$ y_i = x_(i + n_0 - 1) => sim_(i=n_0)^n x_i = sim_(i=1)^(n-n_0+1) y_i $
]

#def_xoria([sumatoria], $+$, $sum$)
#def_xoria([productoria], $dot$, $product$)

= Principio de inducción fuerte
Sea $p(n)$ una proposición abierta que depende de $n in NN$ entonces:
#align(center)[
    #inference_rule(
            $p(1) "es vedadera"$,
            $forall n in NN space (forall m in NN inter [1, n] space p(m)) -> p(n+1)$,
            conclusion: $forall n in NN space p(n)$
    )
]

== Demostración
+ Sea $H = {n in NN: not p(n)}$ entonces $H subset.eq NN$
+ Supongo $H != emptyset => exists m [ m "primer elemento de" H ] => p(m)$ es falso y $forall k in NN inter [1, m) space p(m)$ verdadero.
+ Por la primer premisa $m >= 2$
+ Por la segunda premisa, (2.) y (3.) $p(m)$ es verdadera
+ Por (2.) y (4.) $p(m) and not p(m)$
+ $therefore H = emptyset space => forall n in NN space p(n)$
