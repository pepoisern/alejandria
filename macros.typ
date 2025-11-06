/////// VARIABLES ///////

// logic
#let iff = $arrow.l.r.double.long$
#let implies = $arrow.r.double.long$
#let then = $arrow.r$
#let bic = $arrow.l.r$
#let dots = $dots.h.c$
#show math.xor: $#h(0.2375em)"\u{22BB}"#h(0.2375em)$
// sets
#let universe = "\u{1D4E4}"
#let emptyset = "\u{2300}"
#let powerset = "\u{1D4AB}"
#let Dom = "Dom"
#let Codom = "Codom"
#let functions = "\u{1D4D5}"
// functions
#let Im = "Im"
#let Rec = "Rec"
#let limit = $limits("lim")$

/////// FUNCTIONS ///////

#let truth_table(header, ..args) = {
  let truth_table_inset(x, y) = (
    x: 4pt,
    bottom: if y == 0 { 5pt } else if y == 1 { 2pt } else { 2pt },
    top:    if y == 0 { 1pt } else if y == 1 { 3pt } else { 2pt }
  )
  let s = stroke(thickness: 0.7pt, paint: black)
  table(
    inset: truth_table_inset,
    stroke: (x, y) => (bottom: if y == 0 { s }, left: if x > 0 { s }),
    columns: header.map(i => auto),
    align: center + horizon,
    ..header,
    ..args.pos().map(i => $#i$)
  )
}

#let inference(conclusion: none, ..premises) = {
  let p = for (c) in premises.pos() { ($#c$,) }
  table(
    stroke: (x, y) => (top: if y == premises.pos().len() { black } else { none }),
    inset: (top: 0.2em,
      bottom: 0.5em,
      left: 0.1em,
      right: 0.1em),
    align: left,
    ..p,
    [$therefore conclusion$]
  )
}

#let function(name, dom, codom, var, law) = {
  set par(leading: 20mm)
  $ name: dom &-> codom \
    var &|-> law $
}

// hay que mejorarla a esta...
#let example(body, color: blue, title: "ejemplo") = {
  align(center)[
    #block(
      inset: (x: 3mm, top: 5mm, bottom: 6mm),
      width: 100%,
      radius: 0pt,
      fill: color.transparentize(88%),
      stroke: (left: 3pt + color)
    )[
      #align(left)[
        #smallcaps(text(fill: color, size: 18pt)[*#title: *])
        #linebreak()
        #body
      ]
    ]
  ]
}

#let wide_list(color: blue, ..args) = {
  args.pos()
      .chunks(2, exact: true)
      .map(x => [- #x.first() #h(1fr) #text(color, strong(x.last()))])
      .join(line(length: 100%))
}
