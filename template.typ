#import "@preview/fontawesome:0.1.0": *

#import "variables.typ": *
#import "header_links.typ": *

// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", authors: (), body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(
    paper: "us-letter",
    fill: bgColor,
    margin: (
      left: 5pt,
      right: 5pt, 
      top: 5pt, 
      bottom: 5pt
    ),
  )
  set text(
    font: "Noto Sans Display", 
    lang: "en",
    fill: txtColor
  )

  // Set paragraph spacing.
  show par: set block(above: 0.75em, below: 0.75em)

  set par(leading: 0.58em, justify: true)

  body
}

// Functions:
#let headerLinkIcon(name, type, shift: 1.5pt) = {
  box(
    baseline: shift,
    height: 10pt,
    fa-icon(name, fa-set: type)
  )
  h(3pt)
}


#let headerLinksBar(linkArray) = {
  set text(10pt)

  linkArray.map(l => {
    headerLinkIcon(l.name, l.type)

    if "display" in l.keys() {
      link(l.link)[#{l.display}]
    } else {
      link(l.link)
    }
  }).join(h(5pt))
}

#let summary(txtStr) = {
  set text(
    size: 9pt,
    style: "oblique",
    baseline: 10pt,
  )

  set align(
    horizon
  )

  txtStr
}

// Variables
#let headerLine = line(
  length: 550pt,
  stroke: (
    paint: white,
    thickness: 3pt,
    cap: "round",
  ),
)
