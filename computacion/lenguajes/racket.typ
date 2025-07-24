#import "../../lib.typ" : *
#show: init
#let debug = true

#title[Racket]

= Vocabulario
== Valores
=== Numéricos
=== Booleanos
=== Cadenas
=== Imágenes
== Primitivas
=== Palabras clave
=== Operadores matemáticos
=== Operadores sobre cadenas
=== Operadores booleanos
= Syntax
== Notación prefija
=== Expresiones S
```lisp     (name arg1 arg2 ...)```
=== Codificación de caracteres Unicode
```lisp
    (<operador> <val1> [val2] [...])
    (<funcion> <val1> [val2] [...])
```
= Semántica
== Tipos de datos
= Programas interactivos
== Estado
El estado es el conjunto de valores que cambia cuando ocurre un evento. Requiere cuidado al diseñarse para que sea eficiente y cómodo.
=== Estado inicial
Se requiere definir un estado inicial que es el que será presente al iniciar un programa.
=== Función interpretar
Interpreta el estado para mostrar al usuario la información necesaria.
== Expresión big-bang
La expresión big-bang se encarga de manejar el estado en un lenguaje funcional como racket. La syntax es:
```lisp
(big-bang INICIAL ;(El estado inicial)
    [to-draw interpretar]       ;manejador de evento obligatorio
    [<evento1> <manejador1>]    ;manejador opcional 1
    [<evento2> <manejador2>]    ;manejador opcional 2
    ...)
```
= Estructuras
== Definición de estructuras
La definición de una estructura: \
```lisp (define-struct <nombre> [<campo1> ... <campoN>])``` \
También define:
+ Un constructor: ```lisp ; make-nombre: campo1 .. campoN -> nombre```
+ Selectores: ```lisp ;nombre-campoN: nombre -> campoN```
+ Un predicado: ```lisp ;nombre?: Any -> Boolean```
== Evaluación de estructuras
```lisp (posn-x (make-posn a b)) ;*** Notar como se enumera la ley ***``` \
``` == <def. de posn (ley 1)>``` \
```lisp a``` \
\
```lisp (posn-y (make-posn a b)) ;*** Notar como se enumera la ley ***``` \
``` == <def. de posn (ley 2)>``` \
```lisp b``` \
= Listas
== Propiedades
=== Constructores
Son:
+ ``` '()```: La lista vacía.
+ ``` cons```: Toma un elemento y una lista y devuelve una nueva lista.
=== Selectores
Son:
+ ``` first```: Devuelve el primer elemento de la lista.
+ ``` rest```: Devuelve la lista sin su primer elemento.
=== Predicados
+ ``` empty?```: Verdadero si es una lista vacía. Falso en cualquier otro caso.
+ ``` cons?```: Verdadero si es una lista no vacía. Falso en cualquier otro caso.

== Ejemplos:
```lisp
    '()
    (cons "holis" '())
    (cons 2 (cons 3 (cons 4 '())))
```
Formas abreviadas:
```lisp
    empty
    (list "holis")
    (list 2 3 4)
```
= Patrones
== ¿Que son?
Son funciones generalizadas que abstraen justamente patrones de comportamiento de funciones sobre listas. Ayudan a evitar la repetición y redundancia.
== Filter
El patrón filter toma un predicado y una lista $L$ y devuelve una nueva lista $L_1$ con elementos que pertenecían a L. Justamente filtra $L$ y en $L_1$ quedan los elementos que hayan "sobrevivido" el filtro. Su signatura es la siguiente:\
```lisp ; filter: (X -> Boolean) (Listof X) -> Listof X```\
Una posible implementación:\
```lisp
(define (filter pred lst)
    (cond [(emtpy? lst) empty]
          [(pred (first lst)) (cons (first lst) (filter pred (rest lst))))]
          [else (filter pred (rest lst))])
```
== Map
Su signatura es la siguiente:\
```lisp ; map: (X -> Y) (Listof X) -> (Listof Y)```\
Una posible implementación:\
```lisp
(define (map func lst)
    (cond [(emtpy? lst) empty]
          [else (cons (func (first lst)) (map func (rest lst)))]))
```
== Foldr
Su signatura es la siguiente:\
```lisp ; foldr: (X Y -> Y) Y  (Listof X) -> Y```\
Una posible implementación:\
```lisp
(define (foldr func init lst)
    (cond [(emtpy? lst) init]
          [else (func (first lst) (foldr func init (rest lst)))]))
```
== Definiciones locales
```lisp
(define (f ..)
    (local
        (<definicion1>)
        ..
        (<definicionN>)
        expr)
```
