#import "../lib.typ" : *
#show: init.with(debug: true)

#title[Lógica]
= Proposiciones
== ¿Que son?
#let prop = ["Las semanas tienen siete días"]
#let p = ["Los pájaros vuelan"]
Las proposiciones son expresiones a las que se les puede asignar un valor de verdad ya sea verdadero o falso pero no ambos. Por ejemplo la proposición #prop tiene valor de verdad verdadero ya que en efecto las semanas tienen siete días.

Se suelen usar letras para denotar una proposición. Sea $p$ la proposición #p, podemos decir que $p$ tiene valor de verdad verdadero refiriéndonos a que la proposición #p tiene valor de verdad verdadero.

= Conectores lógicos
Los conectores lógicos se usan para construir *proposiciones compuestas* en base a otras proposiciones. Para definirlos se usan las tablas de verdad.

== Tablas de verdad
Las tablas de verdad nos permiten expresar cual es el valor de verdad de una proposición compuesta para cada combinación posible de valores de verdad de las proposiciones que la componen. Se organizan en filas y columnas. Se representan los valores de verdad verdadero y falso como 1 y 0 respectivamente.
#todo[Falta explicar]

#grid(columns: (1fr,1fr,1fr,1fr),
    stroke: none,
    align: center)[
    Negación $not$
    #truth_table(($p$, $not p$),
        0, 1,
        1, 0)
][
    Conjunción $and$
    #truth_table(($p$, $q$, $p and q$),
        0, 0, 0,
        0, 1, 0,
        1, 0, 0,
        1, 1, 1)
][
    Disyunción $or$
    #truth_table(($p$, $q$, $p or q$, $p" \u{22BB} "q$),
        0, 0, 0, 0,
        0, 1, 1, 1,
        1, 0, 1, 1,
        1, 1, 1, 0)
][
    Implicación $->$
    #truth_table(($p$, $q$, $p->q$),
        0, 0, 1,
        0, 1, 1,
        1, 0, 0,
        1, 1, 1)
][
    Bicondicional $<->$
    #truth_table(($p$, $q$, $p<->q$),
        0, 0, 1,
        0, 1, 0,
        1, 0, 0,
        1, 1, 1)
]

== Proposiciones primitivas
Las proposiciones primitivas son proposiciones que no se pueden formar a partir de otras proposiciones usando conectores lógicos.

== Orden de precedencia
Para simplificar la notación se establece un orden de precedencia de los conectores lógicos y es:

#grid(columns: (auto, 1fr))[
#table(columns: (auto, auto),
        align: center,
        [Conector], [Precedencia],
        $not$, [1],
        $and$, [2],
        $or$,  [3],
        $->$,  [4],
        $<->$, [5])][
    #align(center + horizon)[
        De forma que la expresión $((p or (q and (not r))) -> s) <-> t$\
        es equivalente a $p or q and not r -> s <-> t$
    ]
]

== Tautologías y Contradicciones
Las proposiciones compuestas que tienen valor de verdad verdadero independientemente del valor de las proposiciones que las componen son tautologías por el contrario las que son falsas independientemente del valor de las proposiciones que las componen son contradicciones. Notamos a las tautologías como $T_0$ y las contradicciones como $F_0$.

= Equivalencia lógica
Dos proposiciones $p$ y $r$ son lógicamente equivalentes, notamos $p <=> r$, si la proposición $p <-> r$ es una tautología.

- Propiedades:
    + $p <=> p$
    + $p <=> q$, entonces $q <=> p$
    + $p <=> q$ y $q <=> r$, entonces $p <=> r$

- Ejemplo importante (EMI): $p -> q <=> not p or q$

= Leyes de la lógica
#columns(3)[
+ Ley de doble negación\
  $not (not p) <=> p$
+ Leyes de De Morgan\
  $not (p or q) <=> not p and not q$\
  $not (p and q) <=> not p or not q$
+ Leyes conmutativas\
  $p or q <=> q or p$\
  $p and q <=> q and p$
+ Leyes asociativas\
  $p or (q or r) <=> (p or q) or r$\
  $p and (q and r) <=> (p and q) and r$
+ Leyes distributivas\
  $p or (q and r) <=> (p or q) and (p or r)$\
  $p and (q or r) <=> (p and q) or (p and r)$
+ Leyes idempotentes\
  $p or p <=> p$\
  $p and p <=> p$
+ Leyes de neutro\
  $p or F_0 <=> p$\
  $p and T_0 <=> p$
+ Leyes inversas\
  $p or not p <=> T_0$\
  $p and not p <=> F_0$
+ Leyes de dominación\
  $p or T_0 <=> T_0$\
  $p and F_0 <=> F_0$\
+ Leyes de absorción\
  $p and (p or q) <=> p$\
  $p or (p and q) <=> p$
]
#todo[Completar la tabla]

= Reglas de sustitución
+ Supongamos que una proposición compuesta $P$ es una tautología y que $p$ es una proposición primitiva que aparece en $P$. Si reemplazamos cada ocurrencia de $p$ en $P$ por la misma proposición $q$, entonces la proposición resultante también es una tautología
+ Sea $P$ una proposición compuesta y $p$ una proposición arbitraria que aparece en $P$. Sea $q$ una proposición tal que $p <=> q$. Supongamos que reemplazamos en $P$ una o mas ocurrencias de $p$ por $q$ y llamemos $P_1$ a la proposición obtenida.  Entonces $P <=> P_1$.

== Implicaciones varias:
+ Implicación directa: $p -> q$
+ Implicación recíproca: $q -> p$
+ Implicación inversa: $not p -> not q$
+ Implicación contrapositiva: $not q -> not p$

= Reglas de inferencia
== Argumentos
Un argumento es una proposición de la forma: $p_1 and p_2 and dots and p_n -> q$.  Un argumento válido es un argumento y una tautología. A las proposiciones $p_i$ se les llama premisas y $q$ es conclusión.

== Reglas de inferencia
Las reglas de inferencia nos permiten determinar la validez de un argumento sin usar tablas de verdad. La notación es la siguiente:
#align(center)[
    #inference_rule($p_1$, $p_2$, $dots$, $p_n$, conclusion: [$q$#h(1.25em)])
]
Donde $p_1 and p_2 and dots and p_n -> q$ es la tautología asociada.
#v(1em)
#columns(4)[
    #box[
        Modus Ponens:
        #inference_rule($p -> q$, $p$, conclusion: $q$)
    ]\ #box[
        Modus Tollens:
        #inference_rule($p -> q$, $not q$, conclusion: $not p$)
    ]\ #box[
        Ley de Silogismo:
        #inference_rule($p -> q$, $q -> r$, conclusion: $p -> r$)
    ]\ #box[
        \
        #inference_rule($p$, $q$, conclusion: $p and q$)
    ]\ #box[
        \
        #inference_rule($p or q$, $not p$, conclusion: $q$)
    ]\ #box[
        Inducción del\ bicondicional:
        #inference_rule($p -> q$, $q -> p$, conclusion: $p <-> q$)
    ]\ #box[
        Eliminación del\ bicondicional:
        #inference_rule($p <-> q$, $p$, conclusion: $q$)
    ]\ #box[
        Eliminación del\ bicondicional:
        #inference_rule($p <-> q$, $not p$, conclusion: $not q$)
    ]\ #box[
        Eliminación del\ bicondicional:
        #inference_rule($p <-> q$, $p or q$, conclusion: $p and q$)
    ]\ #box[
        Reducción al absurdo:
        #inference_rule($p -> F_0$, conclusion: $not p$)
    ]
]
#todo[Completar la tabla]

= Cuantificadores
== Variables
Una variable un identificador al cual se le puede asignar un valor. Por ejemplo si $x$ es una variable puede tomar como valor el número 2.

== Proposiciones abiertas
=== Definición
Una proposición abierta es una expresión que contiene una o más variables de forma que si las variables toman un valor la proposición abierta pasa a ser una proposición.

=== Notación
Proposición de una sola variable: $p(x)$ por ejemplo $x + 1 = 2$.  $p(x)$ es la proposición abierta de variable $x$.  Proposición de varias variables: $p(x, y)$ o $p(x_1,dots,x_n)$, por ejemplo la proposición abierta $x = y$.

== Universo
El universo es la familia de elementos que se permiten asignar a las variables. Se simboliza #universe.

== Cuantificadores
Los cuantificadores nos permiten formular una proposición mediante el uso de una proposición abierta y valores posibles de la variable.

=== Existencial
El cuantificador existencial $exists$ aplicado en la variable $x$ para la proposición abierta $p(x)$ notado $exists x[p(x)]$ es una proposición verdadera si existe por lo menos un $x$ en el universo tal que $p(x)$ es verdadera y si no es falsa.

=== Universal
El cuantificador universal $forall$ aplicado en la variable $x$ para la proposición abierta $p(x)$ notado $forall x[p(x)]$ es una proposición verdadera para todo $x$ en el universo se cumple $p(x)$, si no es falsa.

== Equivalencia lógica
Se dice que una proposición abierta $p(x)$ es lógicamente equivalente a otra proposición abierta $q(x)$ si se cumple $forall x[p(x)<->q(x)]$ y se escribe $p(x)<=>q(x)$

== Implicación lógica
Se dice que una proposición abierta $p(x)$ implica lógicamente a otra proposición abierta $q(x)$ si se cumple $forall x[p(x)->q(x)]$ y se escribe $p(x)=>q(x)$

== Más implicaciones lógicas
- La directa        $forall x [p(x) -> q(x)]$
- La reciproca      $forall x [q(x) -> p(x)]$
- La inversa        $forall x [not p(x) -> not q(x)]$
- La contrapositiva $forall x [not q(x) -> not p(x)]$

=== Propiedades
+ $exists x [p(x) and q(x)] => exists x [p(x)] and exists x [q(x)]$
+ $exists x [p(x) or q(x)] <=> exists x [p(x)] or exists x [q(x)]$
+ $forall x [p(x) and q(x)] <=> forall x [p(x)] and forall x
[q(x)]$
+ $forall x [p(x)] or forall x [q(x)] => forall x [p(x) or q(x)]$

== Negación de los cuantificadores
+ $not (exists x[p(x)]) <=> forall x[not p(x)]$
+ $not (forall x[p(x)]) <=> exists x[not p(x)]$
