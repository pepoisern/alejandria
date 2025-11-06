// TODO: Remove this comments below and maybe redesign colors
// colors i like
//blue
//hipótesis("f534ce")

/////// DEBUG ///////

#let _debug = state("debug_mode", false)

#let note(content) = context(
  if _debug.get() { super(emph(text(fill: red, content))) }
)

#let todo(hide: false, content) = context(
  if _debug.get() {
    set text(fill: red)
    lower(smallcaps(strong(content)))
    linebreak()
  }
)

/////// STYLE ///////

#let title_fullpage(color: blue, title: none, author: none) = {
  align(center)[
    #block(below: 85mm)
    #block(below: 7mm,text(size: 45pt, smallcaps(title)))
    #block(text(size: 17pt)[#author])
    #pagebreak()
    #outline(title: text(fill: color, size: 22pt)[Contents])
  ]
}

#let title_halfpage(color: blue, title: none, author: none) = {
  align(center)[
    #block(below: 30mm)
    #block(below: 7mm, text(size: 45pt, smallcaps(title)))
    #block(text(size: 17pt)[#author])
    #outline(title: text(fill: color, size: 22pt)[Contents])
  ]
}

#let init(
  first_page: false,
  title: "Titulo",
  author: "Alejandria",
  color: blue,
  font: "Libertinus Serif",
  font_size: 13pt,
  full_title: false,
  debug: false,
  doc
) = {
  if debug == true {
    _debug.update(true)
  }

  set page(paper: "a4", margin: 20mm)

  set par(leading: 3mm, spacing: 3.5mm, first-line-indent: (amount: 1em))
  set text(size: font_size, font: font)

  set outline(indent: 4mm)
  set outline.entry(fill: repeat(text[.], gap: 4pt))
  show outline.entry.where(level: 1): it =>[
    #show repeat: none
    #strong(smallcaps(it))
  ]

  set list(indent: 0.8cm, tight: true)

  show list: it => [
    #set par(spacing: 1mm,leading: 3mm)
    #it
  ]

  show line: it => [
    #set par(spacing:3mm)
    #it
  ]

  set heading(numbering: none)

  show heading: it => {
    let title
    let size
    let alignment
    if(it.level == 1 or it.level == 2){
      if(it.level == 1){size = 35pt} else {size = 23pt}
      alignment = center
      title = smallcaps(it.body)
    } else{
      size = 18pt
      alignment = left
      title = it.body
    }

    set text(size: size, weight: "bold")
    set align(alignment)
    block(title)
  }

//  show heading.where(level: 1): it => [
//    #set align(center)
//    #set text(35pt, weight: "bold")
//    #block(smallcaps(it.body))
//  ]
//  show heading.where(level: 2): it => [
//    #set align(center)
//    #set text(23pt, weight: "bold")
//    #block(smallcaps(it.body))
//  ]
//    show heading.where(level: 3): it => [
//    #set align(left)
//    #set text(18pt, weight: "bold")
//    #block((it.body))
//  ]
  if first_page == true {
    if full_title == true [
      #title_fullpage(
        color: color,
        title: text(50pt, title),
        author: author,
      )
    ] else [
      #title_halfpage(
        color: color,
        title: text(50pt, title),
        author: author,
      )
    ]
    pagebreak()
  }
  doc
}
