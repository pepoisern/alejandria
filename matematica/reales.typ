#import "../lib.typ" : *
#show: init.with(debug: true)

#title[Números Reales]

#show: indent_first_line
Veremos en este apunte una posible definición axiomática de los números reales. Los axiomas se dividen en tres grupos y son, los axiomas de cuerpo, de orden y del supremo.

Se da por sabido conocimiento básico de conjuntos y lógica. El conjunto de números reales es $RR$ y elementos del conjunto se declaran $a in RR$ o $b, c in RR$. Las operaciones binarias de suma y multiplicación (o producto) entre dos números reales $a, b in RR$ se notan $a + b$ y $a b$ (o $a dot b$) respectivamente.
#show: indent_block

= Axiomas de cuerpo
== Los axiomas de cuerpo (propiedades aritméticas)
Dados los números reales $a, b, c in RR$ de cumplen:
+ Propiedades conmutativas: $a + b = b + a$ y $a b = b a$
+ Propiedades asociativas: $a + (b + c) = (a + b) + c$ y $a (b c) = (a b) c$
+ Propiedad distributiva: $a(b + c) = a b + a c$
+ Existencia de elementos neutros: $exists 0 [ a + 0 = 0 + a = a ]$ y $exists 1 [ a 1 = 1 a = a ]$
+ Existencia de elementos opuestos: $forall a [ exists b [ a + b = 0 ]]$
+ Existencia de elementos recíprocos (o inversos): $forall a != 0 space exists b [ a b = 1 ]$

= Teoremas de cuerpo
== Ley de simplificación para la suma
También llamada propiedad cancelativa de la suma es:

Sean $a, b, c in RR$ entonces si $a + b = a + c$ se da que $b = c$.

=== Demostración

$forall a, b, c in RR bracket.l a + b = a + c bracket.r attach(=>, t: "A5") exists y bar a + y = 0$

$therefore$
$cases(reverse: #true, y + (a + b) attach(eq, t:"A2") (y + a) + b = 0 + b attach(eq, t:"A4") b, y + (a + b) = y + (a + c) attach(eq, t:"A2") (y + a) + c = 0 + c attach(eq, t:"A4") c) => b = c$


== Diferencia (o resta) de números reales
Primero definimos que dado un $a in RR$ su elemento opuesto se nota $-a$ tal que $a + (-a) = 0$.

Dados $a, b in RR$ la diferencia entre ellos es $a - b = a + (-b)$

=== Propiedades de la diferencia y el opuesto
Dados $a, b, c in RR$ se cumplen:
+ $-(-a) = a$
+ $-0 = 0$
+ $0 dot a = 0$
+ $a (-b) = -(a b) = (-a)b$
+ $(-a)(-b) = a b$
+ $a(b - c) = a b - a c$

== Ley de simplificación para producto
También llamada propiedad cancelativa del producto es:

Sean $a, b, c in RR$ con $a != 0$ entonces si $a b = a c$ se da que $b = c$.

#todo[Demostración]

== Unicidad del elemento neutro del producto
Si $1'$ es un número real que verifica $forall a in RR space a dot 1' = 1' dot a = a$ entonces $1' = 1$

== Unicidad del reciproco
$forall a in RR-{0} space exists! b in RR-{0} space a b = b a = 1$

== Cociente de números reales
Primero definimos que dado un $a in RR-{0}$ su reciproco se nota $a^(-1)$ tal que $a a^(-1) = 1$.

Dados $a in RR$ y $b in RR-{0}$ el cociente entre ellos es $a/b = a b^(-1)$

=== Propiedades del cociente y el reciproco
Dados $a, b, c, d in RR$ se cumplen:
+ $1^(-1) = 1$
+ $a/1 = a$
+ $a != 0 => 1/a = a^(-1)$
+ $a b = 0 => a = 0 or b = 0$
+ $b != 0 and d != 0 =>$
    - $(b d)^(-1) = b^(-1) d^(-1)$
    - $a/b+c/b = (a d + b c)/(b d)$
    - $a/b dot c/d = (a c)/(b d)$
+ $a != 0 and b != 0 => (a/b)^(-1) = a^(-1)/b^(-1)$
+ $-a = (-1) a$

= Axiomas de orden
Para poder enunciar los axiomas de orden debemos primero declarar el conjunto de los números positivos. Suponemos que existe un $RR^+ subset.eq RR$ y lo llamamos conjunto de números positivos.

== Los axiomas de orden
7. La suma y el producto son cerrados en los números positivos:\
   $a in RR^+ and b in RR^+ => a + b in RR^+ and a b in RR^+$
+ Para todo real $a != 0$ se da que $a$ es positivo o su opuesto $-a$ es positivo pero no ambos:\
  $forall a in RR space a != 0 -> (a in RR^+ and -a in.not RR^+) or (a in.not RR^+ and -a in RR^+)$
+ El elemento neutro de la suma (el cero) no es positivo:\
  $0 in.not RR^+$

== Símbolos menor a, mayor a, ...
Dados $a, b in RR$
+ Menor a: $a < b <=> b - a in RR^+$
+ Mayor a: $a > b <=> a - b in RR^+ <=> b < a$
+ Menor o igual a: $a <= b <=> b - a in RR^+ or a = b$
+ Mayor o igual a: $a >= b <=> a - b in RR^+ or a = b <=> b <= a$

=== Propiedades
Para cualesquiera $a, b, c, d in RR$
+ $a < b => a + c < b + c$
+ $a < b and c < d => a + c < b + d$
+ $a < b and c > 0 => a c < b c$
+ $a < b and c < 0 => a c > b c$
+ $a != 0 =>  a dot a > 0$
+ $1 > 0$ osea $1 in RR^+$
+ $a < b => -b < -a$
+ $a b > 0 <=> a, b in RR^+ or (a in.not RR^+ and b in.not RR^+)$
+ $a b < 0 <=> a in RR^+ Xor b in RR^+$
+ $a > 0 <=> 1/a > 0$
+ $0 < a < b => 0 < 1/b < 1/a$

== Subconjuntos de los reales
=== Los números naturales
El conjunto de números naturales (notamos $NN$) se define mediante las siguientes reglas.
+ $1 in NN$
+ $a in NN => a + 1 in NN$

Notemos que $NN subset.eq RR^+$ ya que $1 > 0$ y $a > 0 => a + 1 > 0$.

=== Los números enteros
El conjunto de los números enteros (notamos $ZZ$) se define por:
$ ZZ = {x in RR: x in NN or -x in NN or x = 0} $

=== Los números racionales
El conjunto de los números racionales (notamos $QQ$) se define por:
$ QQ = {x in RR: exists p, q in ZZ space q != 0 and x = p/q} $

=== Los números irracionales
El conjunto de los números irracionales (notamos $II$) se define por $II = RR - QQ$.

== La recta real
#todo[Explicar la representación geométrica de los números reales]

== Intervalos reales
Dados $a, b in RR$ tal que $a < b$
+ $(a, b) = {x in RR: a < x < b}$ (intervalo abierto)
+ $[a, b) = {x in RR: a <= x < b}$ (semiabierto a derecha o semicerrado a izquierda)
+ $(a, b] = {x in RR: a < x <= b}$ (semiabierto a izquierda o semicerrado a derecha)
+ $[a, b] = {x in RR: a <= x <= b}$ (intervalo cerrado)
+ $(a, +oo) = {x in RR: a < x}$
+ $[a, +oo) = {x in RR: a <= x}$
+ $(-oo, b) = {x in RR: x < b}$
+ $(-oo, b] = {x in RR: x <= b}$

#todo[Representaciones gráficas]

== Valor absoluto de un número real
Dado $x in RR$ su valor absoluto es:
$ abs(x) = casesAlign(x, x >= 0, -x, x < 0) $

=== Propiedades
Sean $x, y in RR$ se cumplen:
+ $abs(x) >= 0$
    - $abs(x) = 0 <=> x = 0$
+ $abs(x) = abs(-x)$
+ $-abs(x) <= x <= abs(x)$
+ Dado $a in R^+$ entonces:
    - $abs(x) < a <=> -a < x < a$
    - $abs(x) > a <=> x < -a or x > a$
+ Desigualdad triangular: $abs(x + y) <= abs(x) + abs(y)$
+ $abs(x dot y) = abs(x) dot abs(y)$
+ $y != 0 => abs(x/y) = abs(x)/abs(y)$

=== Interpretación geométrica
Dado $x in RR$ entonces $abs(x)$ es la distancia del punto correspondiente a $x$ al punto correspondiente a $0$.

#todo[Completar]
= Axioma del supremo
== Cotas superiores
Dado el conjunto $A subset.eq RR$ tal que $A != emptyset$ y el número $b in RR$ se dice que $b$ es *cota superior* de $A$ si $forall a in A space a <= b$. Si existe al menos una cota superior para $A$ entonces $A$ esta acotado superiormente.

== Supremos
Dado el conjunto $A subset.eq RR$ tal que $A != emptyset$ y el número $b in RR$ se dice que $b$ es *supremo* de $A$ y se nota $b = sup(A)$ si:
+ $forall a in A space a <= b$.
+ $forall c in RR space c < b -> c "no es cota superior de" A$

=== Unicidad del supremo
Dados $a, b in RR$ y un conjunto $A subset.eq RR$ si $a = sup(A)$ y $b = sup(A)$ entonces $a = b$.

== Máximo
Dados $A subset.eq RR$ tal que $A != emptyset$ y $b in RR$ se dice que $b$ es el máximo de $A$ y se nota $b = max(A)$ si:
+ $forall a in A space a <= b$.
+ $b in A$

=== Supremacía del máximo
Sean $A subset.eq RR$ tal que $A != emptyset$ y $b in RR$ entonces $b = max(A) <=> b in A and b = sup(A)$

== Axioma del supremo
Todo conjunto no vacío de números reales acotado superiormente tiene supremo. Simbólicamente:

$ forall A in powerset (RR) space [(exists b in RR space forall a in A space a <= b) -> exists b in RR space b = sup(A)] $

=== Existencia de raíces cuadradas
Dado $a in RR$ entonces $a >= 0 => exists! x in RR space (x >= 0 and x^2 = a)$

=== Número de Euler
Notado $e$ se define por:
$ e in RR and e = sup({x in RR: exists n in NN space (1 + 1/n)^n}) $

== Cotas inferiores, ínfimo y mínimo
Dado el conjunto $A subset.eq RR$ tal que $A != emptyset$ y el número $b in RR$:
+ Se dice que $b$ es *cota inferior* de $A$ si $forall a in A space a >= b$.
    - Si existe al menos una cota inferior para $A$ entonces $A$ esta acotado inferiormente.
+ Se dice que $b$ es *ínfimo* de $A$ y se nota $b = inf(A)$ si:
    + $forall a in A space a >= b$.
    + $forall c in RR space c > b -> c "no es cota inferior de" A$
+ Se dice que $b$ es el mínimo de $A$ y se nota $b = min(A)$ si:
    + $forall a in A space a >= b$.
    + $b in A$

=== Infimacía#super[$dagger$] del mínimo
#align(right)[#v(-1.9em)#super[$dagger$ Esa palabra es una mentira]]
Sean $A subset.eq RR$ tal que $A != emptyset$ y $b in RR$ entonces $b = min(A) <=> b in A and b = inf(A)$

=== Teorema del ínfimo
Todo conjunto no vacío de números reales acotado inferiormente tiene supremo. Simbólicamente:

$ forall A in powerset (RR) space [(exists b in RR space forall a in A space a >= b) -> exists b in RR space b = inf(A)] $

