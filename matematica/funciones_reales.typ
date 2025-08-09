#import "../lib.typ" : *
#show: init.with(debug: true)

#title[Funciones Reales]
Se intenta en este apunte dar un entendimiento intuitivo y no formal de las funciones reales.

= Definición de función
#todo[Definición como terna del dominio, codominio y ley]

== Representación gráfica usando conjuntos
#todo[Hacer la gráfica]

= Algebra de funciones
#todo[]
== Suma
== Resta
== Producto
== Cociente

= Gráfica de una función
#todo[]
== Representación gráfica
=== Prueba de la recta vertical

= Propiedades de las funciones
#todo[]
== Función sobreyectiva
Una función $f$ es sobreyectiva cuando $Rec(f) = Codom(f)$
== Función inyectiva
== Función biyectiva

= Conjuntos simétricos
Un conjunto $A subset.eq RR$ es simétrico si $forall x in A space (-x in A)$

= Propiedades de funciones
== Paridad de funciones
Sea $f$ una función con dominio simétrico:
+ Se dice *par* si $forall x in Dom(f) space f(x) = f(-x)$
    - Si $f$ es par es simétrica respecto al eje y.
+ Se dice *impar* si $forall x in Dom(f) space f(-x) = -f(x)$
    - Si $f$ es impar es simétrica respecto al origen de coordenadas.

== Monotonía
Sea $f$ una función, $A subset.eq Dom(f)$ y $x_1, x_2 in A$:
+ Se dice *creciente* en $A$ si $x_1 < x_2 => f(x_1) < f(x_2)$
+ Se dice *decreciente* en $A$ si $x_1 < x_2 => f(x_1) > f(x_2)$
+ Se dice *no decreciente* en $A$ si $x_1 < x_2 => f(x_1) <= f(x_2)$
+ Se dice *no creciente* en $A$ si $x_1 < x_2 => f(x_1) >= f(x_2)$
+ Se dice *monótona* en $A$ si es cualquiera de los anteriores en $A$

= Funciones elementales
#todo[]
== Función constante
Sea $c in RR$ se define a la función constante $f$ como:
#align(center)[#function_def($f$, $RR$, $RR$, $x$, $f(x) = c$)]
#todo[Gráfica]

== #todo[Las otras funciones elementales]

= Transformaciones a la gráfica de una función
#todo[]
== Traslaciones
== Reflexiones
== Contracciones y dilataciones

= Composición de funciones
#todo[]

= Funciones inversas
#todo[]

= Más Funciones elementales
#todo[]
