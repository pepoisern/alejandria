//// Usage example ////
// #import "<path>/lib.typ": *
// #show: init.with(debug: false)

//Do not use this in documents
#let _debug = state("debug_mode", false)
#let _font_size = state("font_size", 12pt)

#let title(title, size: 24pt) = {
    set text(size)
    set align(center)
    strong(title)
}

#let truth_table(header, ..args) = {
    let truth_table_inset(x, y) = (
// Otra opción, no se cual queda mejor.
//        if      y == 0 { (x: 4pt, bottom: 5pt, top: 1pt) }
//        else if y == 1 { (x: 4pt, bottom: 2pt, top: 3pt) }
//        else           { (x: 4pt, bottom: 2pt, top: 2pt) }
        x: 4pt,
        bottom: if y == 0 { 5pt } else if y == 1 { 2pt } else { 2pt },
        top:    if y == 0 { 1pt } else if y == 1 { 3pt } else { 2pt }
    )
    let s = stroke(thickness: 0.7pt, paint: black)
    table(inset: truth_table_inset,
            stroke: (x, y) => (bottom: if y == 0 { s }, left: if x > 0 { s }),
            columns: header.map(i => auto),
            align: center + horizon,
            ..header,
            ..args.pos().map(i => $#i$))
}

#let inference_rule(dots: true, conclusion: none, ..premises) = {
    let symbol = if dots { $therefore$ } else {}
    table(stroke: (x, y) => (top: if y == premises.pos().len() { black } else { none }),
            inset: (top: 0.1em,
                bottom: 0.5em,
                left: 0.1em,
                right: 0.1em),
            align: left,
            ..premises,
            [#symbol #conclusion])
}

#let todo(hide: false, content) = {
    context(
        if _debug.get() {
            set text(fill: red, font: "DejaVu Sans Mono")
            strong([[TODO: #content]])
        }
    )
}

#let universe = $"\u{1D4E4}"$
#let emptyset = $"\u{2300}"$
#let powerset = $"\u{1D4AB}"$
#let Dom = "Dom"
#let Codom = "Codom"
#let Im = "Im"
#let Arg = "Arg"
#let sin = "sen"
#let gr = "gr"
#let proyection(u, v) = $op("proy")_#u #v$
#let angle(u, v) = context($hat(#u\,#v,size: #(1.2*_font_size.get()))$)

#let indent_first_line(doc) = {
    set par(spacing: 0.65em, first-line-indent: 1em)
    doc
}

#let indent_block(doc) = {
    set par(spacing: 1.2em, first-line-indent: 0em)
    doc
}

#let casesAlign(spread: 0.5em, comma: true, ..cases) = {
    math.cases(
        table(
            inset: (x, y) => (left: 0em, top: if y != 0 { spread } else { 0em }, bottom: 0em, right: 1em),
            align: left,
            columns: (auto, auto),
            stroke: none,
            ..cases.pos().chunks(2).map(case => {
                if case.len() == 2 {
                    if comma == true {
                        ([#case.first(), ], [#case.last()])
                    }
                    else {
                        ([#case.first()], [#case.last()])
                    }
                }
                else {
                    case
                }
            }).flatten()
        )
    )
}

#let function_def(name, dom, codom, var, law) = {
    box(
        table(
                stroke: none,
                inset: (rest: 0.1em),
                align: left + horizon,
                columns: (auto, auto, auto, auto)
        )[#name:][#dom][$->$][#codom][][#var][$|->$][#law]
    )
}

#let init(debug: false, font_size: 12pt, doc) = {
    _font_size.update(font_size)
    let heading_numbering(..nums) = {
        let depth = nums.pos().len()
        if depth == 1 {
            "[" + str(nums.pos().first()) + "]"
        }
        else if depth == 2 {
            "\u{27A5}"
        }
        else if depth == 3 {
            "  " + str(nums.pos().last()) + "."
        }
        else {
            str(nums.pos().first())
        }
    }

    if debug == true {
        _debug.update(true)
    }

    set par(justify: true)
    set page(margin: (rest: 2cm))
    set text(size: font_size, lang: "es")
    set heading(numbering: heading_numbering)

    if false { // Considering removal
        show math.in.not: it => {
            h(0.05em)
            math.in.not
            h(0.05em)
        }
        show math.in: it => {
            h(0.05em)
            it
            h(0.05em)
        }
    }
    show math.Re: "Re"
    show math.Im: "Im"

    show: indent_block
    doc
}
