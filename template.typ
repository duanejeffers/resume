#import "@preview/fontawesome:0.1.0": *

#let bgColor = rgb("444352")
#let txtColor = rgb("fdfdfd")
#let titleRect = gradient.linear(
  rgb("046fb5"), rgb("00aaff"), dir: ttb,
)
#let lineColor = white
#let resumeData = yaml("data/resume_data.yaml")

// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", authors: (), body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(
    paper: "us-letter",
    fill: gradient.linear(bgColor, rgb("84829f"), dir: ttb),
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

  show heading.where(level: 1): head => [
    #set text(
      size: 11pt,
    )
    #set align(center)
    #head.body
    
  ]
  
  show heading.where(level: 2): head => [
    #set text(size: 11pt)
    #head.body.children.at(0)
    #set text(size: 10pt)
    \- #head.body.children.at(4)
    #set text(size: 9pt)
    (#head.body.children.at(2)) \[#head.body.children.at(6) \- #head.body.children.at(8)\]
    
  ]

  show heading.where(level: 3): head => [
    #h(5pt)
    #head.body
    
  ]

  show heading.where(level: 4): head => [
    #set text(size: 9pt)
    #head.body
  ]

  body
}

#let bodyRect = rect.with(
  width: 100%,
  fill: txtColor,
  radius: 5pt,
  stroke: none,
  inset: 7pt,
)

// Header Variables and Functions

// headerLinkIcon - Generates Font-Awesome Icons in a box with a baseline
#let headerLinkIcon(name, type, shift: 1.5pt) = {
  box(
    baseline: shift,
    height: 10pt,
    fa-icon(name, fa-set: type)
  )
  h(3pt)
}

// headerLinksBar - Generates a Horizontal list of Links from an Array
#let headerLinksBar(linkArray) = {
  set text(10pt)

  linkArray.map(l => {
    headerLinkIcon(l.icon, l.type)

    if "display" in l.keys() {
      link(l.link)[#{l.display}]
    } else {
      link(l.link)
    }
  }).join(h(5pt))
}

// headerSummary - Generates a Summary Text String
#let headerSummary(txtStr) = {
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

// headerLine - Generates a Simple Line in the header
#let headerLine = line(
  length: 550pt,
  stroke: (
    paint: lineColor,
    thickness: 3pt,
    cap: "round",
  ),
)

// header - main header variable to generate from resumeData file.
#let header = block(
  stack(
    dir: ltr,
    spacing: 5pt,
    block(
      image(resumeData.header.profile.file, width: 46pt)
    ),
    stack(
      dir: ttb,
      spacing: 5pt,
      stack(
        dir: ltr,
        spacing: 40pt,
        rect(
          fill: titleRect,
          radius: 5pt,
          inset: 10pt,
          text(
            size: 23pt,
            weight: "medium",
            resumeData.name
          )
        ),
        headerSummary(resumeData.header.summary),
      ),
      headerLine,
      h(5pt) + headerLinksBar(resumeData.header.links),
      headerLine
    )
  )
)

// Skills Section 
#let skills = block(
  width: 100%,
  height: 75pt,
  stack(
    dir: ltr,
    spacing: 1pt,
  )[
    #for skillSect in resumeData.skills {
      rect(
      fill: lineColor,
      stroke: none,
      radius: 5pt,
      inset: 5pt,
      height: 75pt,
      text(
        fill: bgColor
      )[
        #skillSect.section_title
      ]
      )
    }
  ]
)
