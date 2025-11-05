#import "../macros.typ": *
#import "../estilo.typ": *

#let color = blue

#show: init.with( 
  color: color,
  //debug: true
)

= Lógica
== Proposiciones
=== Proposición
Se considera proposición a cualquier oración a la cual se le pueda asignar un valor de verdad ($V$ o $F$). Se las suele nombrar con una única letra minúscula ($p,q,s$).

=== Conectores Lógicos
Son operadores de proposiciones que resultan en otras proposiciones.
- *Negación*: La negación de $p$ se simboliza $not p$, y su valor de verdad es el opuesto de $p$.
- *Conjunción*: La conjunción entre $p$ y $q$ es $p and q$, y es verdadera sólo si ambas proposiciones lo son.
- *Disyunción*:
  - Inclusiva: Se simboliza $p or q$ y es verdadero si al menos $p$ o $q$ son verdaderas.
  - Exclusiva: Se simboliza $p xor q$ y es verdadero si $p$ o $q$ son verdaderas, pero no ambas.
- *Implicación*: Se simboliza $p -> q$, a $p$ se le llama _hipótesis_ y $q$ _tesis_, y es verdadero salvo que $p$ sea verdadero, y $q$ no.
- *Bicondicional*: Se simboliza $p bic q$, y es verdadero cuando $p$ y $q$ tienen el mismo valor de verdad.

=== Proposiciones Primitivas
Son aquellas proposiciones que no pueden ser formadas a partir de conectores lógicos.

=== Tautologías y Contradicciones
Una proposición compuesta se llama _tautología_ si es verdadera para cualquier combinación de asignaciones de verdad de las proposiciones que la componen. Lo contrario es llamado _contradicción_.

=== Equivalencia Lógica
Dos proposiciones $s_1, s_2$ son _lógicamente equivalentes_ si tienen la misma tabla de verdad. Esto se simboliza $s_1 iff s_2$. La equivalencia lógica tiene las siguientes propiedades:
- $s iff s$
- si $s_1 iff s_2$, entonces $s_2 iff s_1$
- si $s_1 iff s_2$ y $s_2 iff s_3$, entonces $s_1 iff s_3$

== Leyes de la Lógica
Sean $p,q,r$ proposiciones primitivas, $T_0$ y $F_0$ una _tautología_ y _contradicción_ respectivamente, se cumplen:

#wide_list(
      [$not not p iff p$ #h(3fr)],
      [Ley de doble negación],
      [$not(p or q) iff not p and not q$ \
       $not(p and q) iff not p or not q$ #h(3fr)],
      [Leyes de De Morgan],
      [$p or q iff q or p$ \
       $p and q iff q and p$ #h(3fr)],
      [Leyes Conmutativas],
      [$p or (q or r) iff (p or q) or r$ \
       $p and (q and r) iff (p and q) and r$ #h(3fr)],
      [Leyes Asociativas],
      [$p or (q and r) iff (p or q) and (p or r)$ \
       $p and (q or r) iff (p and q) or (p and r)$ #h(3fr)],
      [Leyes Distributivas],
      [$p or p iff p$ \
       $p and p iff p$ #h(3fr)],
      [Leyes Idempotentes],
      [$p or F_0 iff p$ \
       $p and T_0 iff p$ #h(3fr)],
      [Leyes de Neutro],
     [$p or not p iff T_0$ \
      $p and not p iff F_0$ #h(3fr)],
     [Leyes Inversas],
     [$p or T_0 iff T_0$ \
      $p and F_0 iff F_0$ #h(3fr)],
     [Leyes de Dominación],
     [$p and (p or q) iff p$ \
      $p or (p and q) iff p$ #h(3fr)],
    [Leyes de Absorción],)

== Inferencia
=== Argumento
Se le llama *argumento* a una _proposición compuesta_ de la forma:

$ p_1 and p_2 and p_3 and dots and p_k then q $

Llamamos _premisas_ al conjunto de todas las $p$, y _conclusión_ a $q$. Se dice que el argumento es *válido* si es una _tautología_, escrito:

$ p_1 and p_2 and p_3 and dots and p_k implies q $

También llamamos a esto *_Implicacion Lógica_*.

#example(color: color)[
  Si intentamos demostrar
  $ (p then r) and (r then s) and (t or not s) and (not t or u) and not u implies not p $
  deberíamos ver que
  $ (p then r) and (r then s) and (t or not s) and (not t or u) and not u then not p $
  es una *tautología*. Para que una _implicancia_ sea falsa, la hipótesis debe ser verdadera, y la tesis falsa. Entonces supongamos que

  $ p then r, quad r then s, quad t or not s, quad not t or u, quad not u $
  son todas verdaderas y $not p$ falso, osea $p$ verdadero.
  - si $p$ #text(color)[*verdadero*] y $p then r$ #text(color)[*verdadero*], $r$ #text(color)[*verdadero*].
  - si $r$ #text(color)[*verdadero*] y $r then s$ #text(color)[*verdadero*], $s$ #text(color)[*verdadero*].
  - si $s$ #text(color)[*verdadero*] entonces $not s$ #text(color)[*falso*].
  - si $s$ #text(color)[*verdadero*] y $t or not s$ #text(color)[*verdadero*], $t$ debe ser #text(color)[*verdadero*].
  - si $p$ #text(color)[*verdadero*] y $p then r$ #text(color)[*verdadero*], $r$ #text(color)[*verdadero*].
]

== Reglas de Inferencia
Sean $p,q,r$ proposiciones primitivas y $F_0$ una _contradicción_, se cumplen:

#wide_list(
[$inference(p, q, conclusion: p and q)$],
  [Regla de la Conjunción],
[$inference(p then q, p, conclusion: q)$],
  [Modus Ponens],
[$inference(p then q, not q, conclusion: not p)$],
  [Modus Tollens],
[$inference(p then q, q then r, conclusion: p then r)$],
  [Ley de Silogismo],
[$inference(p or q, not p, conclusion: q)$],
  [Regla del Silogismo Disyuntivo],
[$inference(not p then F_0, conclusion: p)$],
  [Regla de Contradicción],
[$inference(p and q, conclusion: p)$],
  [Regla de Simplificación Conjuntiva],
[$inference(p, conclusion: p or q)$],
  [Regla de Amplificación Disyuntiva],
[$inference(p and q, p then (q then r), conclusion: r)$],
  [Regla de Demostración Condicional],
[$inference(p then r, q then r, conclusion: (p or q) then r)$],
  [Regla de Demostración por Casos],
[$inference(p then q, r then s, p or r, conclusion: q or s)$],
  [Regla del Dilema Constructivo],
[$inference(p then q, r then s, not q or not s, conclusion: not p or not r)$],
  [Regla del Dilema Destructivo],)

#line(length: 100%)

== Cuantificadores
=== Proposiciones abiertas
Expresiones como $x^2 + 1 = 0$ inicialmente no cumplen con las características de una proposición, pero *si reemplazamos $x$ por ciertos valores*, la expresión se convierte en una. En estos casos, $x$ se considera una _variable_.

#example(color : color, title: "definición")[
Una _afirmación_ es una *proposición abierta* si:
- Contiene una o más variables.
- Se convierte en una proposición cuando las variables son reemplazadas por valores permitidos.
Las proposiciones abiertas se denotan de la forma $p(x)$.
]

=== Cuantificadores
Los cuantificadores son formas de formar proposiciones a partir de proposiciones abiertas y valores posibles de las variables.

- *Cuantificador existencial*: $exists x space p(x)$ (existe un $x$ tal que $p(x)$ es #text(color)[*VERDADERA*]).
Esta proposición es verdadera si hay al menos un valor de $x$ en el universo dado que consiga que $p(x)$ sea verdadera.
- *Cuantificador universal*: $forall x space p(x)$ (para todo $x$ se tiene que $p(x)$ es #text(color)[*VERDADERA*]).
Esta proposición es verdadera si todo valor posible de $x$ en el universo dado hace que $p(x)$ sea verdadera.

Es importante tener en cuenta en qué *universo* existen nuestras variables (esto es, el _conjunto_ de todas las variables permitidas).
#example(color : color)[
Supongamos la proposición $p(x) space : space exists x space x^2 = 2$ 
Si el universo ($universe$) es $NN$, $p(x)$ es #text(color)[*FALSA*], ya que no existe un número natural que cumpla la proposición. Sin embargo, si $universe = RR$, la proposición se vuelve #text(color)[*VERDADERA*], ya que $sqrt(2) in RR$.
]

=== Equivalencia Lógica
Sean $p(x)$ y $q(x)$ dos proposiciones abiertas para un universo dado, decimos que $p(x)$ y $q(x)$ son _lógicamente equivalentes_ cuando $p(a) bic q(a)$ es *verdadero* $forall a in universe$. Esto se escribe:
$ forall x [p(x) iff q(x)] $
=== Implicancia Lógica
Sean $p(x)$ y $q(x)$ dos proposiciones abiertas para un universo dado, decimos que $p(x)$ _implica lógicamente_ $q(x)$ cuando $p(a) then q(a)$ es *verdadero* $forall a in universe$. Esto se escribe:
$ forall x [p(x) implies q(x)] $

=== Negación de Cuantificadores
- $not [exists x space p(x)] iff forall x space not p(x)$
- $not [forall x space p(x)] iff exists x space not p(x)$
Usando estas reglas, tenemos:
- $not [exists x space not p(x)] iff forall x space not not p(x) iff forall x space p(x)$
- $not [forall x space not p(x)] iff exists x space not not p(x) iff exists x space p(x)$

#example(color : color)[
Estas negaciones son útiles para determinar la veracidad de una proposición. Imaginemos una proposición $p(x), x in N$: si x es impar, entonces $2 x$ es impar. Esto se puede escribir:
$
  p(x): forall x [q(x) then s(x)] quad  text("donde") quad cases(
                                                           q(x): #h(1cm) &x text("es impar"),
                                                           s(x):         &2x text("es impar"))
$
Probar la falsedad de esto, es lo mismo que probar $exists x space not[q(x) then s(x)]$. En este caso es sencillo, si $x = 1 implies 2x = 2$ y $2$ no es impar. Por ende p(x) es falsa.
]
