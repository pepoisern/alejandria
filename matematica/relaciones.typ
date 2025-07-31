#import "../lib.typ" : *
#show: init.with(debug: true)

//Por comodidad resumo los nombres de las relaciones R, S, T
#let Rr = $"\u{1D4E1}"$
#let Sr = $"\u{1D4E2}"$
#let Tr = $"\u{1D4E3}"$
#let nRr = $cancel("\u{1D4E1}", angle: #38deg ,stroke: #(thickness: 1pt))$
#let nSr = $cancel("\u{1D4E2}", angle: #38deg ,stroke: #(thickness: 1pt))$
#let nTr = $cancel("\u{1D4E3}", angle: #38deg ,stroke: #(thickness: 1pt))$

#title[Relaciones]
#todo[Faltan hacer todos los gráficos]

= Pares ordenados
#todo[Mover pares ordenados a conjuntos... ¿O no?]

Sean $A$ y $B$ conjuntos y $a in A and b in B$ entonces el par ordenado de $a$ y $b$ es $(a, b)$.

=== Igualdad de pares ordenados
Dados $a_1, a_2 in A$ y $b_1, b_2 in B$ la igualdad de los pares ordenados $(a_1, b_1)$ y $(a_2, b_2)$ se define por:
$ (a_1, b_1) = (a_2, b_2) <=> a_1 = a_2 and b_1 = b_2 $

= Producto cartesiano de dos conjuntos
Sean $A$ y $B$ dos conjuntos entonces el producto cartesiano de $A$ y $B$ es $A times B$ y se define por:
$ a in A and b in B  <=> (a, b) in A times B $

Nótese lo siguiente:
$
A = emptyset or B = emptyset &<=> a in.not A or b in.not B)\
                             &<=> not (a in A and b in B)\
                             &<=> not ((a, b) in A times B)\
                             &<=> (a, b) in.not A times B\
                             &<=> A times B = emptyset
$
Por lo tanto $A = emptyset or B = emptyset <=> A times B = emptyset$

== Propiedades
Dados $A, B$ y $C$ conjuntos.
+ $A times (B inter C) = (A inter B) times (A inter C)$
+ $A times (B union C) = (A union B) times (A union C)$
+ $(A inter B) times C = (A inter C) times (B inter C)$
+ $(A union B) times C = (A union C) times (B union C)$

= Relación binaria entre dos Conjuntos
Dados dos conjuntos $A, B$ y $Rr$ decimos que $Rr$ es una relación de $A$ en $B$ si se cumple $Rr subset.eq A times B$.
$ (a, b) in Rr <=> a Rr b\ (a, b) in.not Rr <=> a nRr b $

= Dominio e imagen de una relación
Sea $Rr$ una relación de $A$ en $B$.
+ El *dominio* de $Rr$ es $Dom(Rr) = {a in A: exists b in B space (a, b) in Rr}$
+ La *imagen* de $Rr$ es $Im(Rr) = {b in B: exists a in A space (a, b) in Rr}$

$ Dom(Rr) subset.eq A and Im(Rr) subset.eq B $

= Imagen y pre-imagen de un elemento
Sea $Rr$ una relación de $A$ en $B$, $a in A$ y $b in B$.
+ El conjunto imagen de $a$ por $Rr$ es $Rr (a) = {b in B: (a, b) in Rr}$
+ El conjunto pre-imagen de $b$ por $Rr$ es $Rr^(-1)(b) = {a in A: (a, b) in Rr}$

= Imagen y pre-imagen de un subconjunto
Sea $Rr$ una relación de $A$ en $B$, $X subset.eq A$ y $Y subset.eq B$.
+ El conjunto imagen de $X$ por $Rr$ es $Rr (X) = {b in B: exists x in X space (x, b) in Rr}$
+ El conjunto pre-imagen de $Y$ por $Rr$ es $Rr^(-1)(Y) = {a in A: exists y in Y space (a, y) in Rr}$

= Relación inversa de una relación
Sea $Rr$ una relación de $A$ en $B$ la relación inversa de $Rr$ es $Rr^(-1)$ y se define:
$ x Rr y <=> y Rr^(-1) x $

=== Relación inversa de la relación inversa
$ x (Rr^(-1))^(-1) y <=> y Rr^(-1) x <=> x Rr y $

= Composición de relaciones
Sean $Rr$ una relación de $A$ en $B$ y $Sr$ una relación de $B$ en $C$. La relación composición de $Rr$ con $Sr$ es $Sr compose Rr$ relación de $A$ en $C$ tal que:
$ x (Sr compose Rr) y <=> exists u in B space x Rr u and u Sr y $
$ Sr compose Rr = {(x, y) in A times C: exists u in B space x Rr u and u Sr y} $

== Propiedades
Sean $Rr$ una relación de $A$ en $B$, $Sr$ una relación de $B$ en $C$ y $Tr$ una relación de $C$ en $D$.
+ $(Tr compose Sr) compose Rr = Tr compose (Sr compose Rr)$
+ $(Tr compose Sr)^(-1) = Sr^(-1) compose Tr^(-1)$

= Relaciones en un conjunto
Dada $Rr$ una relación de $A$ en $B$ si $A = B$ entonces se dice que $Rr$ es una relación en $A$.

== Propiedades de relaciones en un conjunto
Sea $Rr$ una relación en $A$.
+ $Rr$ es reflexiva si $forall a in A space a Rr a$
+ $Rr$ es simétrica si $a Rr b => b Rr a$
+ $Rr$ es antisimétrica si $a Rr b and b Rr a => a = b$
+ $Rr$ es transitiva si $a Rr b and b Rr c => a Rr c$

= Relaciones de orden
Sea $Rr$ una relación en $A$ reflexiva, antisimétrica y transitiva entonces es una relación de orden.  Si $x Rr y$ entonces "$x$ precede a $y$" o "$x$ es anterior a $y$" y se nota $x prec y$. Si $x prec y$ o $y prec x$ entonces $x$ e $y$ son comparables.

== Conjunto ordenado
Sea $A$ un conjunto y $Rr$ una relación de orden llamamos conjunto ordenado al par ordenado $(A, Rr)$.

== Diagrama de Hasse
#todo[Importante, supongo]

== Orden inducido en un subconjunto
Sean $(A, Rr)$ un conjunto ordenado y $S subset.eq A$ un conjunto, entonces el orden inducido por $Rr$ en $S$ es $Rr_S = Rr inter (S times S)$ queda así $(S, Rr_S)$ subconjunto ordenado de $(A, Rr)$.

== Orden total
Sean $A$ un conjunto y $Rr$ una relación en $A$ tal que $forall x, y in A space x prec y or y prec x$ entonces $Rr$ es una relación de orden total.

== Elementos minimales y maximales
Dado un conjunto ordenado $(A, Rr)$.
+ $a in A$ es un elemento minimal de $(A, Rr)$ si $forall x in A space x prec a -> x = a$
+ $a in A$ es un elemento maximal de $(A, Rr)$ si $forall x in A space a prec x -> x = a$

Todos los conjuntos ordenados finitos no vacíos tienen por lo menos un elemento minimal y un elemento maximal.

== Elementos mínimos y máximos
Dado un conjunto ordenado $(A, Rr)$.
+ $a in A$ es un elemento mínimo de $(A, Rr)$ si $forall x in A space a prec x$
+ $a in A$ es un elemento máximo de $(A, Rr)$ si $forall x in A space x prec a$

Si un conjunto tiene elemento mínimo entonces es único y si un conjunto tiene elemento máximo entonces también es único.

== Cotas inferiores y superiores
Dado un conjunto ordenado $(A, Rr)$ y un conjunto $S subset.eq A$.
+ $a in A$ es una cota inferior de S en $(A, Rr)$ si $forall x in S space a prec x$
+ $a in A$ es una cota superior de S en $(A, Rr)$ si $forall x in S space x prec a$

== Ínfimos y supremos
Dado un conjunto ordenado $(A, Rr)$ y un conjunto $S subset.eq A$.
+ $a in A$ es el ínfimo de S en $(A, Rr)$ si a es cota inferior de S en $(A, Rr)$ y:
  $ forall a' in A space (forall x in S space a' prec x) -> a' prec a $
+ $a in A$ es el supremo de S en $(A, Rr)$ si a es cota superior de S en $(A, Rr)$ y:
  $ forall a' in A space (forall x in S space x prec a') -> a prec a' $

= Relaciones de equivalencia
Sea $Rr$ una relación en $A$ reflexiva simétrica y transitiva entonces es una relación de equivalencia. Si $x Rr y$ entonces "$x$ es equivalente a $y$" y se nota $x ~ y$.

== Clase de equivalencia
Sea $Rr$ una relación de equivalencia en $A$ y $x in A$, entonces la clase de equivalencia de $x$ es $Rr (x) = [x]$.

=== Propiedades
+ $x in A => [x] != emptyset$
+ $a ~ b <=> [a] = [b]$
+ $not (a ~ b) <=> [a] inter [b] = emptyset$

== Particiones
Sean $A$ un conjunto y $P$ una familia de conjuntos, entonces $P$ es una partición de $A$ si y solo si se cumplen simultáneamente:
+ $forall X_1 in P space forall X_2 in P space X_1 != X_2 -> X_1 inter X_2 = emptyset$
+ $forall a in A space exists X in P space a in X$

Si $P$ es una partición de $A$ entonces existe una sola relación de equivalencia tal que todas las clases de equivalencia son elementos de $P$.

== Conjunto cociente
Sea $Rr$ una relación de equivalencia en $A$, entonces el conjunto cociente de $A$ por $R$ es $A|_R$ tal que:
$ x in A => [x] in A|_R $
