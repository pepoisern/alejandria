#import "../lib.typ" : *
#show: init.with(debug: true)

#title[Conjuntos]
= Nociones primitivas
Un conjunto puede tener un elemento y decimos que el elemento pertenece al conjunto o puede no tenerlo entonces decimos que el elemento *no* pertenece al conjunto. Si al conjunto lo llamamos $A$ (letras mayúsculas) y al elemento $x$ (letras minúsculas), "$x$ pertenece a $A$" se nota $x in A$ y "$x$ no pertenece a $A$" se nota $x in.not A$.

= Definición por extensión
Sea $A$ un conjunto, entonces si $a, b, c$ pertenecen a $A$ y son los únicos elementos de $A$ podemos definir al conjunto como $A = {a, b, c}$ así queda explícito entre llaves la lista de los elementos de $A$.

= Igualdad de Conjuntos
Se dice que dos conjuntos $A$ y $B$ son iguales si la proposición $forall x [x in A <=> x in B]$ es verdadera y se nota $A = B$.

= Definición por comprensión
Sea $p(x)$ una proposición abierta y $A$ un conjunto, el nuevo conjunto $B$ que contiene todos los elementos $x$ de $A$ tal que $p(x)$ es verdadera es por $B = {x in A: p(x)}$.
== Se cumplen
- ${x in A: p(x)} = {x in universe: x in A and p(x)}$
- $x in B <=> x in A and p(x)$

= Conjuntos universales
Un conjunto universal #universe es aquel del cual tomamos los elementos para determinar la veracidad o falsedad de proposiciones abiertas cuantificadas.

= El conjunto vacío
== Existencia del conjunto vacío.
Existe el conjunto vacío #emptyset y es aquel que no tiene elementos. $exists emptyset [forall x [x in.not emptyset]]$.

== Unicidad del conjunto vacío.
Existe un único conjunto vacío. Sea $A$ un conjunto, si no existe ningún $x$ tal que $x in A$ se da que $A = emptyset$.

= Contención de conjuntos
Decimos que un conjunto $A$ esta contenido en el conjunto $B$ o que $A$ es subconjunto de $B$ y notamos $A subset.eq B$ si se cumple #box[$forall x [x in A => x in B]$]. Si $A$ no esta contenido en $B$, osea $not (A subset.eq B)$ entonces $A subset.eq.not B$.

== Contención estricta
Se dice que $A$ esta contenido estrictamente en $B$ y se nota $A subset B$ si se cumple $A subset.eq B and A != B$.

== Algunas propiedades
Para los conjuntos $A$, $B$ y $C$ siempre se cumple
+ $A subset.eq A$
+ $A = B <=> A subset.eq B and B subset.eq A$
+ $A subset.eq B and B subset.eq C => A subset.eq C$
+ $A subset B and B subset C => A subset C$

== Lema
Sea $A$ un conjunto, entonces $emptyset subset.eq A$ y si $A$ tiene al menos un elemento se cumple $emptyset subset A$.

= Diagramas de Venn
#todo[Alta fiaca]

= Cardinalidad
== Cardinalidad de conjuntos finitos
La cardinalidad de un conjunto finito es igual a la cantidad de elementos que contiene. Si $A$ es un conjunto entonces $|A|$ es la cardinalidad de $A$. Un conjunto finito informalmente es aquel que tiene una cantidad contable de elementos.

== Propiedades
- $A subset.eq B => |A| <= |B|$
- $A subset B => |A| < |B|$
- $|emptyset| = 0$

== Cardinalidad de conjuntos infinitos
#todo[No es prioridad]

= Conjunto de partes
Sea $A$ un conjunto, el conjunto de partes de $A$ notado $powerset(A)$ es $powerset(A) = {X in universe : X subset.eq A}$

== Propiedades
- $|A| = n => |powerset(A)| = 2^n = 2^(|A|)$

= Operaciones con conjuntos
Dados los conjuntos $A$, $B$ y $C$ se definen las siguientes operaciones.

== Union
La union de $A$ y $B$ es $A union B$ tal que $forall x [x in A union B => x in A or x in B]$

=== Propiedades
+ $A = A union A$
+ $A union B = B union A$
+ $A subset.eq A union B$
+ $A subset.eq B <=> A union B = B$
+ $A union (B union C)$ = $(A union B) union C$

== Intersección
La union de $A$ y $B$ es $A inter B = {x in A: x in B}$

=== Propiedades
+ $A = A inter A$
+ $A inter B = B inter A$
+ $A inter B subset.eq A$
+ $A subset.eq B <=> A inter B = A$
+ $A inter (B inter C)$ = $(A inter B) inter C$

== Diferencia
El conjunto diferencia de $A$ y $B$ es $A - B = {x in A: x in.not B}$

=== Propiedades
+ $A - A = emptyset$
+ $A - emptyset = A$
+ $B - A subset.eq B$
    - $emptyset - A = emptyset$
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

== Complemento
Al complemento de $A$ es $overline(A) = universe - A = {x in universe: x in.not A}$

=== Propiedades
Para algún $A subset.eq universe$
+ $A inter overline(A) = emptyset$
+ $A union overline(A) = universe$

== Leyes de teoría de conjuntos
Dados $A$, $B$ y $C$ incluidos en $universe$
#let c = [#h(0.5em)]
+ $overline(overline(A)) = A$ #c (Ley de doble complemento)
+ $overline(A union B) = overline(A) inter overline(B)$\
  $overline(A inter B) = overline(A) union overline(B)$ #c (Leyes de De Morgan)
+ $A union B = B union A$\
  $A inter B = B inter A$ #c (Leyes conmutativas)
+ $A union (B union C) = (A union B) union C$\
  $A inter (B inter C) = (A inter B) inter C$ #c (Leyes asociativas)
+ $A inter (B union C) = (A inter B) union (A inter C)$\
  $A union (B inter C) = (A union B) inter (A union C)$ #c (Leyes distributivas)
+ $A union A = A$\
  $A inter A = A$ #c (Leyes idempotentes)
+ $A union emptyset = A$\
  $A inter universe = A$ #c (Leyes de identidad)
+ $A union (A inter B) = A$\
  $A inter (A union B) = A$ #c (Leyes de absorción)
