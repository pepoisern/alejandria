#import "../macros.typ": *
#import "../estilo.typ": * 

#let color = blue 

#show: init.with(
	color: color,
	//debug: true
)


= Principio de Inducción
En esta sección aprenderemos una técnica utilizada para demostrar la validez de proposiciones de la forma $forall k space p(k), "con" k in NN$.
=== Principio de buen orden
+ Sea $A subset.eq RR$ entonces $A$ tiene *primer elemento* $a$ si $exists a in A : forall x in A space a < x$.
+ Un conjunto $A subset.eq RR$ está *bien ordenado* si todo $X subset.eq A$ no vacío tiene primer elemento.

== Principio de inducción matemática
Sea $p(n)$ una proposición abierta con $universe = NN$ entonces:
#align(center)[
    $inference(
            p(1) "es verdadera",
            forall n in NN space p(n) -> p(n+1),
            conclusion: forall n in NN space p(n)
    )$
]

A la segunda premisa se le llama _hipótesis inductiva_.

#example(color : color, title: "demostración")[
+ Sea $H = {n in NN: p(n) "es falso"}$
+ Supongamos $H != emptyset$, y sabemos que $H subset.eq NN$ entonces $H$ tiene primer elemento (llamaremos $m$).
+ $p(m)$ es falso y $ p(m-1)$ verdadero.
+ Sabemos por la primer premisa que $m >= 2$, entonces $(m - 1) in NN$
+ $p(m-1)$ es verdadero#super[(3)] y por la segunda premisa $p((m-1)+1) = p(m)$ es verdadero. 
+ Tenemos $p(m) and not p(m)$. Esto es una contradicción.
+ $therefore H = emptyset space => forall n in NN space p(n)$
]
Se puede generalizar el principio de inducción para afirmaciones que comiencen en cualquier $n_0 in NN$:
#align(center)[
    #inference(
            $p(n_0) "es verdadera"$,
            $forall n in {k in NN: k >= n_0} space p(n) -> p(n+1)$,
            conclusion: $forall n in {k in NN: k >= n_0} space p(n)$
    )
]
#example(color : color, title: "demostración")[
+ Sea $q(n) = p(n_0 + n - 1)$.
+ Entonces $q(1) = p(n_0 + 1 - 1) = p(n_0)$ es verdadero.
+ Y $q(n) -> q(n+1) iff_((1)) p(n_0 + n - 1) -> p(n_0 + n)$.
+ $q(1) "es verdadero" and  q(n) -> q(n+1)$#super[(3)] $implies_("ind.") forall n >= 1 space q(n)$ es verdadero.
+ pero $q(1) =_((1)) p(n_0)$, entonces $forall n >= n_0 space p(n)$ es verdadero.#super[(4)]
]

#let def_xoria(nombre, op, sim) = [
== Símbolo #nombre
Dados $n in NN$ números $x_i$ con $i in NN and i <= n$ se define a la #nombre desde $i = 1$ hasta $n$ de los $x_i$ a:
$ display(sim_(i=1)^1x_i = x_1)\
  display(sim_(i=1)^(k+1) x_i = x_(k+1) #op sim_(i=1)^(k)x_i", " k in NN inter [1, n)) $
Si se desea demostrar una proposición del tipo $sim_(i=1)^n x_i = f(n)$ se puede (al menos intentar) demostrar por inducción tomando $sim_(i=1)^1 x_i = f(1)$ como caso base y $forall n in NN space sim_(i=1)^n x_i -> sim_(i=1)^(n+1) x_i$

Se extiende la definición de la #nombre para incluir valores de $n_0 in ZZ$ (con $n_0 < n$) de la siguiente manera:
$ y_i = x_(i + n_0 - 1) => sim_(i=n_0)^n x_i = sim_(i=1)^(n-n_0+1) y_i $
]

#def_xoria([sumatoria], $+$, $sum$)
#def_xoria([productoria], $dot$, $product$)

== Principio de inducción fuerte
Sea $p(n)$ una proposición abierta que depende de $n in NN$ entonces:
#align(center)[
    #inference(
            $p(1) "es verdadera"$,
            $forall n in NN space (forall m in NN inter [1, n] space p(m)) -> p(n+1)$,
            conclusion: $forall n in NN space p(n)$
    )
]

#example(color : color, title: "demostración")[
+ Sea $H = {n in NN: p(n) "es falso"}$ 
+ Supongamos $H != emptyset$, y sabemos que $H subset.eq NN$ entonces $H$ tiene primer elemento (llamaremos $m$).
+ $forall k  in NN inter [1, m) space p(k)$ es verdadero, y $p(m)$ es falso.
+ Por la primer premisa $m >= 2$.
+ Por la segunda premisa, (2.) y (3.) $p(m)$ es verdadera.
+ Tenemos $p(m) and not p(m)$. Esto es una contradicción.
  + $therefore H = emptyset space => forall n in NN space p(n)$
]
