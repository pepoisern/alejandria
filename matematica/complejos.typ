#import "../lib.typ" : *
#show: init.with(debug: true)

#let Arg = "Arg"

#title[Números Complejos]

= Los números complejos
Todo número complejo es de la forma $z = a + i b$ donde $a", "b in RR$. A $i$ se le llama unidad imaginaria y se define por la relación $i^2=-1$.

Esa forma de representar un numero complejo se llama forma canónica.

== El conjunto $CC$
Al conjunto de todos los números complejos de lo define $CC = {a+i b: a", "b in RR}$.

== Componentes
Para todo número complejo $z = a + i b$ se definen
+ Parte real de $z$: $Re(z) = a$
+ Parte imaginaria de $z$: $Im(z) = b$

= Las operaciones de los números complejos
Sean $z_1 = a_1 + i b_1$ y $z_2 = a_2 + i b_2$ dos números complejos se definen.
== Igualdad
Antes de definir las operaciones debemos definir la igualdad entre números complejos. Se dice que $z_1$ es igual a $z_2$ si se cumple tienen igual parte real e imaginaria. Simbólicamente:
$ z_1 = z_2 <=> a_1 + i b_1 = a_2 + i b_2 <=> a_1 = a_2 and b_1 = b_2 $

== Suma
La suma de dos números complejos es $z_1 + z_2 = (a_1 + a_2) + i (b_1 + b_2)$

== Producto
El producto de dos números complejos es $z_1 z_2 = (a_1 a_2 - b_1 b_1) + i (a_1 b_2 + a_2 b_1)$

= Teoremas de cuerpo
Sean $z$, $w$ y $u$ números complejos, entonces valen:
+ Clausura de la suma y el producto: $(z+w) in CC$ y $(z w) in CC$
+ Ley conmutativa de la suma y el producto: $z+w = w+z$ y $z w = w z$
+ Ley asociativa de la suma y el producto: $(z+w)+u = z+(w+u)$ y $(z w)u = z(w u)$
+ Ley distributiva del producto respecto a la suma: $z(w + u) = z w + z u$
+ Existencia del elemento neutro de la suma: $exists 0 in CC space 0 + z = z $
+ Existencia del elemento identidad del producto: $exists 1 in CC space 1 z = z $
+ Existencia del elemento opuesto: $forall z in CC space exists -z in CC z + (-z) = 0$
+ Existencia del elemento inverso: $forall z in CC-{0} space exists z^(-1) in CC space z^(-1) = a/(a^2+b^2) + i (-b)/(a^2+b^2) and z^(-1)z = 1$

= Más operaciones
== Resta
La resta de dos números complejos $z_1$ y $z_2$ es $z_1 - z_2 = z_1 + (-z_2)$

== División
La resta de dos números complejos $z_1$ y $z_2 != 0$ es $z_1/z_2 = z_1 z_2^(-1)$

== Potencia de exponente entero
La potencia de exponente entero para $z in CC$ y $n in ZZ$ es
$ z^n = casesAlign(
        1, n = 0,
        z, n = 1,
        z^(n-1)z, n >= 2,
        (z^(-1))^(-n), n < 0
) $

=== Propiedades
Sean $z, w in CC$ y $n, k in ZZ$ entonces:
+ $z^k z^n = z^(k+n)$
+ $(z^k)^n = z^(k n)$
+ $(z w)^n = z^k w^n$
+ $w != 0 => (z/w)^n = z^n/w^n$

=== Potencias de la unidad imaginaria
Se da que para todo $n in NN$ el resultado de $i^n$ es fácilmente predecible y es:
$ casesAlign(
    1, n = 0,
    i, n = 1,
    -1, n = 2,
    -i, n = 3,
    i^r, n >= 4 "donde" r "es el resto de" n/4
) $

== Raíz cuadrada de un numero complejo
Sean $z, w in CC$ decimos que $z$ es raíz cuadrada de $w$ si $z^2 = w$.

=== Raíz cuadrada de un numero real negativo
Sea $z in CC$ raíz cuadrada de $a in RR^-$ entonces $z = plus.minus i sqrt(abs(a))$

= Forma de par ordenado de un número complejo
Los números complejos son _identificables_ con los pares de números reales. Esto quiere decir que... #todo[no se que significa]

== Pares ordenados
Los pares ordenados de números reales son del la forma $z = (a, b)$ donde $a$ y $b$ son números reales.

=== Igualdad
Los pares ordenados $(a_1, b_1)$ y $(a_2, b_2)$ son iguales si y solo si $a_1 = a_2 and b_1 = b_2$

=== Suma
La suma de dos pares ordenados se define por $(a_1, b_1) + (a_2, b_2) = (a_1 + a_2, b_1 + b_2)$

=== Producto
El producto de dos pares ordenados se define por $(a_1, b_1) + (a_2, b_2) = (a_1 a_2 - b_1 b_2, a_1 b_2 + a_2 b_1)$

#todo[comlpetar]

== Unidad imaginaria
La unidad imaginaria de define por $i = (0, 1)$ que verifica:
$ i^2 = i i = (0, 1)(0, 1) = (0 dot 0 - 1 dot 1, 1 dot 0 + 0 dot 1) = (-1, 0) = -1 $

= Representación geométrica de los números complejos en el plano complejo
#todo[acortar título]\
#todo[Los malditos gráficos]

== Conjugado de un número complejo
Dado $z = a + i b in CC$ el conjugado de $z$ es $overline(z) = a - i b$

=== Propiedades
Sean $z, w in CC$, entonces:
+ $overline(z+w) = overline(z) + overline(w)$
+ $overline(z w) = overline(z) overline(w)$
+ $z = overline(z) => z in RR$
+ $z*overline(z) = Re(z)^2 + Im(z)^2$
+ $z^(-1) = overline(z)/(Re(z)^2 + Im(z)^2)$

= Módulo y argumento
Dado $z in CC$
+ Su módulo $abs(z)$ es la longitud del segmento $overline("OP")$ donde $P$ es el punto asociado a $z$.
+ Su argumento $Arg(z)$ es el conjunto de todos los ángulos que forma el vector $arrow("OP")$ con el semieje positivo de las abscisas. (El 0 no tiene argumento)
+ Su argumento principal es $arg(z) in Arg(z)$ tal que $-pi < arg(z) <= pi$
+ $Arg(z) = {phi in RR: exists k in ZZ space phi = arg(z) + 2k pi}$
+ $abs(z)^2 = Re(z)^2 + Im(z)^2 = z overline(z)$
+ $cos(arg(z)) = a/abs(z)$, $sin(arg(z)) = b/abs(z)$ y $tan(arg(z)) = b/a$
+ Si $z != 0$ entonces: $ arg(z) = casesAlign(spread: #(0.9em),
    pi/2, a = 0 and b > 0,
    -pi/2, a = 0 and b < 0,
    arctan(b/a),      a != 0 and (z in "I"_c or z in "IV"_c),
    arctan(b/a) + pi, a != 0 and z in "II"_c,
    arctan(b/a) - pi, a != 0 and z in "III"_c
) $

= Forma trigonométrica de un número complejo
Sean $z = a + i b$, $rho = abs(z)$ y $phi in Arg(z)$ se define la forma trigonométrica de z como
$ z = rho (cos phi + i sin phi) $

Despejando queda: $a = rho cos phi space and space b = rho sin phi$

=== Propiedades
Sean $z$, $w in CC$
+ $abs(z w) = abs(z) abs(w)$
+ $arg(z) + arg(w) in Arg(z w)$

= Forma polar de un número complejo
Sea $z = a + i b in CC$, $rho = abs(z)$ y $phi in Arg(z)$ entonces la forma polar de $z$ es $rho_phi$.

Así queda que si $z = rho_phi$ y $w = delta_theta$ se cumple $z = w <=> rho = delta and exists k in ZZ space phi = theta + 2 k pi$

=== Propiedades
Sean $z$, $w in CC$, $z = rho_phi$ y $w = delta_theta$
+ $z w = (rho delta)_(phi+theta)$
+ $w != 0 => z/w = (rho/delta)_(phi-theta)$
+ $z^n = (rho^n)_(n phi)$

= Raíces n-ésimas de un numero complejo
== Formula de De Moivre
Sea $z = rho_phi in CC$ entonces si $w = delta_theta in CC$ es una raíz $n$-ésima de $z$ por la formula de De Moivre:
$ delta = root(n, rho) $
$ exists k in NN space theta = (phi + 2 k pi)/n $
= Apéndice
== La resolvente
Cuando se quiere determinar las raíces de un polinomio de segundo grado con coeficientes complejos notamos que se evita el uso del símbolo $plus.minus$ quedando $z_(1","2) = (-b+sqrt(b^2-4 a c))/2$ ya que todo complejo tiene dos raíces cuadradas.

