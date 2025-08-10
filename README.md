# Bienvenido a alejandria
Alejandria es un repositorio de apuntes hackeables. Esto significa que aunque contiene los documentos compilados en formato `pdf` realmente está pensado para que cada uno se descarga los archivos y compile el apunte que requiere configurándolo a su preferencia. La idea es usar una misma librería como plantilla pero que la misma tenga una API sencilla de re-implementar para poder tener un apunte realmente personalizado. Están todos invitados a contribuir sus propios apuntes siempre que sigan las normas (escritas y si no de sentido común).

## Requisitos
Tener una instalación funcional de `typst`.

## Pero... ¿Como uso alejandria?
Para poder ver la versión más actualizada de un apunte de forma confiable primero se tiene que copiar el repositorio y compilar el apunte que desee ver con el comando:

```bash
typst compile --root <lib_dir> <file.typ> [<pdf_dir>/<file.pdf>]
```

Por ejemplo si uno quiere leer el apunte de números complejos situado en `matematica/complejos.typ`, se encuentra en el directorio `matematica/` y quiere que el apunte generado en formato `pdf` se encuentre en `pdfs/` entonces el comando sería.

```bash
typst compile --root .. complejos.typ ../pdfs/complejos.pdf
```

Luego con el visor de preferencia del lector abre el archivo generado.

## Reglamentos
Para que los apuntes mantengan una estética mínimamente coherente dejo dos documentos que intentan ser de ayuda al escribir un documento en caso de querer contribuir.

El primero es `notacion.typ` dedicado a establecer la notación (principalmente para apuntes de matemática) recomendado en los documentos donde se explayen materias con multiples posibles notaciones de las cuales elegir.

El segundo es `estilo_y_normas.typ` que dará reglas generales para que los estilos de los apuntes se mantengan estables. Este segundo archivo no contendrá demasiadas instrucciones al respecto del resultado gráfico deseado de un apunte ya que una parte principal del proyecto es que eso sea modificable a disposición del usuario, en cambio se apunta a una guía estructural que ayude a usar los elementos y herramientas de la librería.
