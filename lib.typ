//// Usage example ////
// #import "<path>/lib.typ": *
// #show: init.with(debug: false)

//Do not use this in documents
#let _debug = state("debug_mode", false)

#let title(title, size: 24pt) = {
    set text(size)
    set align(center)
    strong(title)
}

#let truth_table(header, ..args) = {
    let truth_table_inset(x, y) = {
        if y == 0 {
            (x: 4pt, bottom: 5pt, top: 1pt)
        }
        if y == 1 {
            (x: 4pt, bottom: 2pt, top: 3pt)
        }
        else {
            (x: 4pt, y: 2pt)
        }
    }
    let truth_table_stroke(x, y) = {
        let columns = header.len()
        let s = stroke(thickness: 0.7pt, paint: black)
        if x > 0 and x < columns {
            if y == 0 {
                (bottom: s, left: s)
            }
            (left: s)
        }
        else if y == 0 {
            (bottom: s)
        }
    }
    table(inset: truth_table_inset,
            stroke: truth_table_stroke,
            columns: header.map(i => auto),
            align: center + horizon,
            ..header,
            ..args.pos().map(i => $#i$))
}

#let inference_rule(dots: true, conclusion: none, ..premises) = {
    let inference_rule_stroke(x, y) = {
        let lines = premises.pos().len()
        let s = stroke(paint: black)
            if y == lines {
                (top: s)
            }
            else {
                none
            }
    }
    let symbol = if dots { $therefore$ } else {}
    table(stroke: inference_rule_stroke,
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

#let init(debug: false, font_size: 12pt, doc) = {
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

    set page(margin: (rest: 2cm))
    set par(spacing: 0.65em,
        justify: true,
        first-line-indent: 1em)
    set text(size: font_size, lang: "es")
    set heading(numbering: heading_numbering)

    show math.in: it => { 
        h(0em)
        set text(size: (font_size - 2pt))
        math.in
        set text(font_size)
        h(0em)
    }

    doc
}
