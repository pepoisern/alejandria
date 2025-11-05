#import "../macros.typ": *
#import "../estilo.typ": *

#let color = blue

#show: init.with(
  color: color,
  //debug: true
)

= Conjuntos

== Nociones primitivas
Un conjunto puede tener un elemento y decimos que el elemento pertenece al conjunto, o puede no tenerlo entonces decimos que el elemento *no* pertenece al conjunto. Si al conjunto lo llamamos $A$ (letras mayúsculas) y al elemento $x$ (letras minúsculas), "$x$ pertenece a $A$" se nota $x in A$ y "$x$ no pertenece a $A$" se nota $x in.not A$. Un conjunto *no* tiene elementos repetidos, entonces si $A$ es un conjunto con los elementos $a_1$ y $a_2$, pero $a_1=a_2$, $A$ solo tiene un elemento. Los elementos de un conjunto no están ordenados.

=== Definición por extensión
Dado un conjunto $A$ cuyos únicos elementos son $a,b,c$, podemos definir al mismo como $A = {a, b, c}$ quedando así explícito entre llaves la lista de los elementos de $A$.

=== Definición por comprensión
Sea $p(x)$ una proposición abierta y $A$ un conjunto, el nuevo conjunto $B$ que contiene todos los elementos $x$ de $A$ tal que $p(x)$ es verdadera es por $B = {x in A: p(x)}$.
#example(color: color, title: "aclaración")[
Se cumplen:
- ${x in A: p(x)} = {x in universe: x in A and p(x)}$
- $x in B <=> x in A and p(x)$
]

=== Conjunto Universal
Un conjunto universal #universe es aquel del cual tomamos los elementos para determinar la veracidad o falsedad de proposiciones abiertas cuantificadas.

== El Conjunto Vacío

=== Existencia del Conjunto Vacío
Existe el conjunto vacío #emptyset y es aquel que _no tiene elementos_. $exists emptyset [forall x [x in.not emptyset]]$.

=== Unicidad del Conjunto Vacío
Existe un único conjunto vacío. Sea $A$ un conjunto, si no existe ningún $x$ tal que $x in A$ se da que $A = emptyset$.

#example(color : color, title: "lema")[
Sea $A$ un conjunto, entonces $emptyset subset.eq A$ y si $A$ tiene al menos un elemento se cumple $emptyset subset A$.
]
== Comparación de Conjuntos

=== Igualdad de Conjuntos
Se dice que dos conjuntos $A$ y $B$ son _iguales_ y se nota $A = B$ si $x in A <=> x in B$.

=== Contención de Conjuntos
Decimos que un conjunto _$A$ está contenido en el conjunto $B$_ ($A$ es subconjunto de $B$) y notamos $A subset.eq B$ si se cumple $x in A => x in B$. Si $A$ no esta contenido en $B$, osea $not (A subset.eq B)$ entonces $A subset.eq.not B$.

=== Contención Estricta
Se dice que _$A$ está contenido estrictamente en $B$_ y se nota $A subset B$ si se cumple $A subset.eq B and A != B$.

=== Disjunción de Conjuntos
Se dice que 2 conjuntos son _disjuntos_ si $A inter B = emptyset$. Esto quiere decir, que ningún elemento de $A$ pertenece a $B$ y viceversa.

#example(color: color, title: "propiedades")[
  Para los conjuntos $A$, $B$ y $C$ siempre se cumple:
  + $A subset.eq A$
  + $A = B <=> A subset.eq B and B subset.eq A$
  + $A subset.eq B and B subset.eq C => A subset.eq C$
  + $A subset B and B subset C => A subset C$
  + Si $A$ y $B$ son disjuntos, $|A union B| = |A| + |B|$
]
== Cardinalidad

=== Cardinalidad de Conjuntos Finitos
La cardinalidad de un conjunto finito es igual a la cantidad de elementos que contiene. Si $A$ es un conjunto entonces $|A|$ es la cardinalidad de $A$. Un conjunto finito informalmente es aquel que tiene una cantidad contable de elementos.

#example(color: color, title: "propiedades")[
  - $A subset.eq B => |A| <= |B|$
  - $A subset B => |A| < |B|$
  - $|emptyset| = 0$
]
=== Cardinalidad de Conjuntos Infinitos
#todo[No es prioridad]

== Conjunto de Partes
Sea $A$ un conjunto, el conjunto de partes de $A$ es $powerset(A) = {X in universe : X subset.eq A}$

#example(color: color, title: "propiedades")[
  - $|A| = n => |powerset(A)| = 2^n = 2^(|A|)$
]

== Operaciones con Conjuntos

Dados los conjuntos $A$, $B$ y $C$ se definen las siguientes operaciones:

=== Unión
La _unión_ de $A$ y $B$ es $A union B$ tal que $x in A union B => x in A or x in B$

#example(color: color, title: "propiedades")[
  + $A = A union A$
  + $A union B = B union A$
  + $A subset.eq A union B$
  + $A subset.eq B <=> A union B = B$
  + $A union (B union C)$ = $(A union B) union C$
]

=== Intersección
La intersección de $A$ y $B$ es $A inter B = {x in A: x in B}$

#example(color: color, title: "propiedades")[
  + $A = A inter A$
  + $A inter B = B inter A$
  + $A inter B subset.eq A$
  + $A subset.eq B <=> A inter B = A$
  + $A inter (B inter C)$ = $(A inter B) inter C$
]
=== Diferencia
La _diferencia_ entre $A$ y $B$ es $A - B = {x in A: x in.not B}$

#example(color: color, title: "propiedades")[
  + $A - A = emptyset$
  + $A - emptyset = A$
  + $B - A subset.eq B$
  + $emptyset - A = emptyset$
  + $A - B = B - A => A = B$
// Demostración:
//     - #([
// #set align(left)
// $A - B = B - A =>$\
// $A - B subset.eq B - A and B - A subset.eq A - B =>$\
// $A - B subset.eq B and B - A subset.eq A =>$\
// $A - B subset.eq B and dots$\
// (puntos porque la rama derecha es análoga)\
// $forall x [x in A - B -> x in B] and dots$\
// $forall x [not (x in A - B) or x in B] and dots$\
// $forall x [not (x in A and x in.not B) or x in B] and dots$\
// $forall x [(x in.not A or x in B) or x in B] and dots$\
// $forall x [x in.not A or x in B or x in B] and dots$\
// $forall x [x in.not A or x in B] and dots$\
// $forall x [not (x in A and x in.not B)] and dots$\
// $forall x [x in.not A - B] and dots$\
// $A - B = emptyset and dots$\
// $A - B = emptyset and B - A = emptyset$\
// $A - B = B - A$\
// ])
  + $(A - B) - C subset.eq A - (B - C)$
]

=== Diferencia Simétrica
La _diferencia simétrica_ entre $A$ y $B$ es $A Delta B = (A - B) union (B - A)$.
#example(color : color, title: "propiedades")[
+ $A Delta B = (A union B) - (A inter B)$
+ $A Delta (B Delta C) = (A Delta B) Delta C$
+ $A Delta B = B Delta A$
+ $A Delta emptyset = A$
+ $A Delta A = emptyset$. Mas aún, $A Delta B = emptyset iff A = B$
+ $A inter (B Delta C) = (A inter B) Delta (A inter C)$
]

=== Complemento
Al _complemento_ de $A$ es $overline(A) = universe - A = {x in universe: x in.not A}$

#example(color: color, title: "propiedades")[
  Para algún $A subset.eq universe$
  + $A inter overline(A) = emptyset$
  + $A union overline(A) = universe$
]

== Diagramas de Venn
Los diagramas de Venn son un método para graficar conjuntos, utilizando líneas cerradas que encierran a los elementos, mostrando cuáles estan incluidos en cada conjunto.
Se pueden representar las operaciones entre conjuntos utilizando estos diagramas:
#align(center)[
  #table(inset: 0pt, stroke: none, columns: (1fr, 1fr),
       table(inset: 1pt, stroke: none, columns: 1, text[*Unión:*], image("../recursos/union.jpg")),
       table(inset: 1pt, stroke: none, columns: 1, text[*Intersección:*], image("../recursos/inter.jpg")),
       table(inset: 1pt, stroke: none, columns: 1, text[*Diferencia:*], image("../recursos/diff.jpg")),
       table(inset: 1pt, stroke: none, columns: 1, text[*Diferencia Simétrica:*], image("../recursos/diff_s.jpg"))
  )
]

== Leyes de teoría de Conjuntos
Dados los conjuntos $A, B, C subset.eq universe$:

\
$overline(overline(A)) = A$ #h(1fr)
  #text(color)[*Ley de doble negación*]
#line(length: 100%)
$overline(A union B) = overline(A) inter overline(B)$ \
  $overline(A union B) = overline(A) inter overline(B)$ #h(3fr)
  #text(color)[*Leyes de De Morgan*]
#line(length: 100%)
$A union B = B union A$ \
  $A inter B = B inter A$ #h(1fr)
  #text(color)[*Leyes Conmutativas*]
#line(length: 100%)
$A union (B union C) = (A union B) union C$ \
  $A union (B union C) = (A union B) union C$ #h(1fr)
  #text(color)[*Leyes Asociativas*]
#line(length: 100%)
  $A inter (B union C) = (A inter B) union (A inter C)$ \
  $A union (B inter C) = (A union B) inter (A union C)$ #h(1fr)
  #text(color)[*Leyes Distributivas*]
#line(length: 100%)
  $A union A = A$ \
  $A inter A = A$ #h(1fr)
  #text(color)[*Leyes Idempotentes*]
#line(length: 100%)
  $A union emptyset = A$ \
  $A inter universe = A$ #h(1fr)
  #text(color)[*Leyes de Identidad*]
#line(length: 100%)
  $A union (A inter B) = A$ \
  $A inter (A union B) = A$ #h(1fr)
  #text(color)[*Leyes de Absorción*]
#line(length: 100%)

== Notación Generalizada

=== Unión Generalizada
Si $F$ es un conjunto de conjuntos, existe el conjunto $union.big F$, llamado la _unión de $F$_, cuyos elementos son exactamente todos los elementos de todos los conjuntos que conforman $F$. En símbolos:
$ x in union.big F iff exists (A in F), x in A $
#example(color : color, title: "notación alternativa")[
Si $F = {A_1, A_2, dots A_n}$ notamos $union.big F$:
$ union.big^n_(i=1) A_i = A_1 union A_2 union dots union A_n $
Si $I$ es un conjunto de índices y $F = {A_i : i in I}$ notamos $union.big F$:
$ union.big_(i in I) A_i = {x in universe : x in A_i #text[para algún] i in I} $
]

=== Intersección Generalizada
Si $F$ es un conjunto de conjuntos, existe el conjunto $inter.big F$, llamado la _intersección de $F$_, cuyos elementos son exactamente los elementos que pertenecen a todos conjuntos que conforman $F$. En símbolos:
$ x in inter.big F iff forall (A in F), x in A $
#example(color : color, title: "notación alternativa")[
Si $F = {A_1, A_2, dots A_n}$ notamos $inter.big F$:
$ inter.big^n_(i=1) A_i = A_1 inter A_2 inter dots inter A_n $
Si $I$ es un conjunto de índices y $F = {A_i : i in I}$ notamos $inter.big F$:
$ inter.big_(i in I) A_i = {x in universe : x in A_i #text[para todo] i in I} $
]

== Pares Ordenados
Un par ordenado se define $(a, b)$, con primer elemento $a$ y segundo elemento $b$.

=== Igualdad de Pares Ordenados
Dados $a,b,c,d$ tenemos que $(a,b) = (c,d) iff a = c and b = d$

=== N-Tupla
Análogamente a la definición de pares ordenados, podríamos imaginar una terna (3-tupla) de elementos ordenados, notado $(a,b,c)$. Siguiendo con esto, podemos pensar a la _$n$-tupla_ como $n$ elementos ordenados, siendo $(a_1, a_2, a_3, dots, a_n)$.

=== Igualdad de N-Tuplas
Dadas dos $n$-tuplas $(a_1, dots space, a_n)$ y $(b_1, dots space, b_n)$ tenemos que $ (a_1, dots space, a_n)=(b_1, dots space, b_n) iff a_k = b_k #text[para todo] k in NN, k <= n$.

=== Producto Cartesiano
Dados dos conjuntos $A, B$, el _producto cartesiano_ $A times B$ se define como el conjunto de todos los posibles pares ordenados en los cuales el primer elemento pertenece a $A$, y el segundo a $B$. Esto es:
$ A times B = {(a,b) : a in A and b in B} $

Generalizado, dados un número finito de conjuntos $A_1, dots, A_n$, el _producto cartesiano_ de los mismos es el conjunto de todas las posibles $n$-tuplas cuyo $k$-ésimo elemento pertenece a $A_k$. Esto es:
$ A_1 times dots times A_n = {(a_1, dots space, a_n): a_1 in A_1, dots space, a_n in A_n} $

=== El Espacio como Conjunto
Podemos pensar al espacio bidimensional como el conjunto de todos los puntos que lo conforman, y podemos representar dichos puntos como pares ordenados de números reales ($RR^2 = RR times RR$), normalmente llamados _coordenadas_. Análogamente, el espacio tridimensional es aquel conjunto de todas las posibles ternas de números reales ($RR^3 = RR times RR times RR$). Así, el espacio de dimensión $n$, notado $RR^n = RR times dots times RR$ $n$ veces, es aquel conjunto de todas las posibles $n$-tuplas de números reales.
