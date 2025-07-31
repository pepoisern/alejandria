#import "../lib.typ" : *
#show: init.with(debug: true)

// Este apunte lo hago 2 en uno pero probablemente después lo separe y lo vuelva a juntar.
#title[Funciones]
= Definición de función
Sea $f$ una relación de $A$ a $B$, se dice que $f$ es función si se cumple: $ a in A => exists! b in B space (a, b) in f $

== Dominio y codominio
$A$ es el dominio de $f$ y se nota $Dom(f)$. $B$ es el codominio de $f$ y se nota $Codom(f)$.

== Notación
Si $f$ es una función con $Dom(f) = A$ y $Codom(f) = B$ entonces se puede declarar usando la notación $f: A -> B$.

Como el conjunto imagen de cualquier elemento $a in A$ es un conjunto con un solo elemento empleamos la siguiente notación: $f(a) = b$ en vez de $f(a) = {b}$.

= Función inyectiva
Una función $f: A -> B$ es inyectiva si:
$ forall a_1 in A space forall a_2 in A space f(a_1) = f(a_2) -> a_1 = a_2 $

= Sobre el conjunto imagen de un subconjunto
Sea $f: A -> B, A_1 subset.eq A$ y $A_2 subset.eq A$ entonces:
+ $f(A_1 union A_2) = f(A_1) union f(A_2) $
+ $f(A_1 inter A_2) subset.eq f(A_1) inter f(A_2)$
+ $f(A_1 inter A_2) = f(A_1) inter f(A_2) <=> f$ es inyectiva

= Restricciones y extensiones
Sea $f: A -> B$ y $A_1 subset.eq A subset.eq A_2$
+ La restricción de $f$ a $A_1$ es $f|_A_1:A_1 -> B$ tal que $a in A_1 => f|_A_1(a) = f(a)$
+ La expansión de $f$ a $A_2$ es $g:A_2 -> B$ tal que $a in A => g(a) = f(x)$

= Sobre el conjunto pre-imagen de un subconjunto
Sea $f: A -> B, B_1 subset.eq B$ y $B_2 subset.eq B$
+ $f^(-1)(B_1 union B_2) = f^(-1)(B_1) union f^(-1)(B_2)$
+ $f^(-1)(B_1 inter B_2) = f^(-1)(B_1) inter f^(-1)(B_2)$
+ $f^(-1)(overline(B_1)) = overline(f^(-1)(B_1))$

= Función sobreyectiva
Una función $f: A -> B$ es sobreyectiva si:
$ forall b in B space exists a in A space f(a) = b $

= Función biyectiva
Una función $f: A -> B$ es biyectiva si es inyectiva y sobreyectiva simultáneamente.

= Composición de funciones
Sean $f: A -> B, g: B -> C, h: C -> D, a in A$ y $c in C$, entonces la composición de $A$ con $B$ es $g compose f$ tal que:
$ Dom(g compose f) = {x in Dom(f): f(x) in Dom(g)}\ forall x in Dom(g compose f) space (g compose f)(x) = g(f(x)) $

Si $Im(f) inter Dom(g) = emptyset$ la composición no es posible.

== Propiedades
+ La composición de funciones no es conmutativa.
+ La composición de funciones es asociativa: $(h compose g) compose f = h compose (g compose f)$
+ Si $f$ y $g$ son inyectivas entonce $g compose f$ es inyectiva.
+ Si $f$ y $g$ son sobreyectivas entonce $g compose f$ es sobreyectiva.

= Función inversible
#todo[Aclarar que significa $id_A$ y $id_B$ (son alguna función identidad)]
Una función $f: A -> B$ es inversible si existe $g: B -> A$ tal que $g compose f = "id"_A and f compose g = "id"_B$

== Propiedades
+ Si una función $f$ es inversible la inversa es única y se nota $f^(-1)$
+ Toda función es inversible si y solo sí es biyectiva.
+ Dadas las funciones $f$ y $g$ inversibles: $(g compose f)^(-1) = f^(-1) compose g^(-1)$
+ Dada una función inversible $f: A -> B$ donde las cantidades de elementos de $A$ y $B$ son finitas e iguales, entonces se cumple: $f$ inyectiva $<=>$ $f$ sobreyectiva $<=>$ $f$ biyectiva.

#title[Operaciones]
= Definición de operación.
Cualquier función de la forma $f: A times A -> B$ es una operación binaria en $A$. Si además #box[$Im(f) subset.eq A$] entonces es cerrada en $A$. Notamos $f(a, b)$ como $a times.circle b$

Cualquier función de la forma $g: A -> A$ es una operación monaria a en $A$.

= Operaciones conmutativas
Dada $f: A times A -> B$ es conmutativa si y solo si:
$ x times.circle y = f(x, y) = f(y, x) = y times.circle x $

= Operaciones asociativas
Dada $f: A times A -> B$ cerrada en $A$ es asociativa si y solo si:
$ (x times.circle y) times.circle z = f(f(x, y), z) = f(x, f(y, z)) = x times.circle (y times.circle z) $

= Elemento neutro
Dada $f: A times A -> A$ tiene elemento neutro si $exists e in A space e times.circle a = a times.circle e = a$

== Unicidad del neutro
Si una operación tiene neutro este es único.

= Elemento inverso
Dada $f: A times A -> A$ con $e$ elemento neutro de $f$ entonces $f$ tiene inversos si se cumple:
$ forall a in A space exists a' in A space a times.circle a' = a' times.circle a = e $

== Unicidad de inversos
Si $f: A times A -> A$ es una operación asociativa y conmutativa con elemento neutro $e in A$ que posee inversos. Entonces cada elemento posee un único inverso.
