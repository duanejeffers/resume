#import "template.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Duane Jeffers Resume",
  authors: (
    "Duane Jeffers",
  ),
)

// Heading
#stack(
  dir: ltr,
  spacing: 5pt,
  block(
    image("images/profile-rounded.png", width: 46pt)
  ),
  stack(
    dir: ttb,
    spacing: 5pt,
    stack(
      dir: ltr,
      spacing: 10pt,
      rect(
        fill: titleRect,
        radius: 5pt,
        inset: 10pt,
        text(
          size: 23pt,
          weight: "medium",
          "Duane Jeffers"
        )
      ),
      block(
        
      ),
    ),
    headerLine,
    h(5pt) + headerLinksBar(headerLinks),
    headerLine
  )
)