#import "../macros.typ": *
#import "../estilo.typ": *

#let color = blue 

#show: init.with(
	color: color,
	//debug: true
)

= Guía de estilo
Este archivo busca mostrar una posible forma de organizar documentos para el repositorio. No son normas fijas, y pueden aceptarse variaciones de esto.

== organización de la información
Los archivos suelen esta organizados de la siguiente manera:
- Los *títulos de primer nivel* se usan para diferenciar temarios. Normalmente solo se usa uno al inicio del documento, y están más para juntar documentos entre sí y que sea más ordenado.
- Los *títulos de segundo nivel* se usan para diferenciar conceptos entre sí (ej. "vectores" y "matrices" serían títulos de segundo nivel en un documento titulado "álgebra lineal")
- Los *títulos de mayor nivel* a eso (aunque normalmente tres niveles son suficientes) se usan para clasificaciones específicas de algo (ej. "vector nulo" podría ser un subtítulo del título "vectores") 

== Destacando información importante
=== Negrita e italic
Normalmente se usa la negrita para destacar los nombres de conceptos, ejemplo:

"Dados $a,b in RR$ el *número complejo $z$* es aquel de la forma $a + b i$, con $i = sqrt(-1)$."

Esto se hace con el fin de lograr una mayor facilidad a la hora de buscar nuevamente la explicación de algo.

A veces se usa _italic_ para destacar conceptos de una oración, ejemplo:

"en la fisica, los vectores suelen interpretarse como _fuerzas aplicadas a un objeto_."

=== La función _example()_
En Alejandria, tenemos una función _example()_, que nos permite recuadrar con un color dado, alguna información que nos parezca importante. Por ejemplo:
#example(color : color)[Podemos calcular la *suma de los primeros $n$ naturales* de la siguiente manera:
$
sum_(k=1)^n n = (n(n+1))/2
$]
También, podemos cambiar el título del cuadro cuando llamamos la función,
#example(color : color, title: "demostración")[
Pensemos en el intervalo natural $[1, n]$. Es fácil notar que si _sumamos el primer elemento con el último_, el resultado es $n + 1$. Si repetimos esto con el segundo y el penúltimo, llegamos al mismo resultado. Entonces podemos pensar a esta suma como _múltiples sumas de $n+1$_, es decir $k(n+1)$. Y que valor toma $k$? Si estamos agarrando _dos elementos para formar uno nuevo_, podemos ver claramente que tenemos la mitad de elementos que originalmente, es decir $k = n/2$. Por lo tanto, tenemos:
$
sum_(k=1)^n n = n/2 dot (n+1) = (n(n+1))/2
$
(esto no es ninguna definición formal y no debería tenerse en cuenta)
]

=== La función _wide_list()_
Para enumerar algunas propiedades, usamos la función _wide_list()_, que muestra una tabla que ocupa todo el ancho de la hoja.
#example(color : color)[
#wide_list(
$a then b$, "Propiedad I",
$c then d$, "Propiedad II",
$e then f$, "Propiedad III",
$g then h$, "Propiedad IV",
$i then j$, "Propiedad V",
$k then l$, "Propiedad VI",
)]
== Otras funciones
En el archivo _macros.typ_ se pueden ver las distintas funciones que fueron definidas para simplificar la forma de escribir ciertas expresiones matemáticas, como _inference()_ o _truth_table()_.
