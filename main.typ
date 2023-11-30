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
#header

#v(-8pt)

// Skills Section
#bodyRect[
  #let itemCount = 3
  #let skillsList = list.with(
    indent: 1pt,
    tight: true,
  )
  #let skillsRect = rect.with(
    stroke: none,
  )
  #text(fill: bgColor)[
    = Related Skills
    #v(-10pt)
    #stack(
      dir: ltr,
      spacing: -1pt,
      ..resumeData.skills.map(item => {
        skillsRect[
          ==== #item.section_title
          #v(-8pt)
          #set text(size: 8pt)
          #let boxCount = 1
          #if item.data.len() > itemCount {
            boxCount = item.data.len() / itemCount
            if calc.rem(item.data.len(), itemCount) > 0 {
              boxCount += 1
            }
          }
          #let boxCount = calc.floor(boxCount)
          #let arrRange = range(0, (boxCount * itemCount), step: itemCount)
          #stack(
            dir: ltr,
            ..arrRange.map(skillItemStart => {
              skillsRect[
                #let skillItemStop = skillItemStart + itemCount
                #if skillItemStop > item.data.len() {
                  skillItemStop = item.data.len()
                }
                #let skillsSplice = item.data.slice(skillItemStart, skillItemStop)
                #skillsList(
                  ..skillsSplice.map(skillItem => {
                    skillItem.name
                  })
                )
              ]
            })
          )
          #v(-10pt)
        ]
      })
    )
  ]
]
#v(-10pt)
// Employment History
#bodyRect[
  #text(fill: bgColor)[
    = Work History
    #resumeData.history.map(item => {
    [
      == #item.organization #item.location #item.role #item.start #item.end
      #set text(
        size: 9.25pt,
      )
      #if "highlights" in item {
        list(
          indent: 5pt,
          ..item.highlights
        )
      }
      #if "projects" in item [
        === Select Projects
        #list(
          indent: 10pt,
          ..item.projects.map(project => {
            project.name
            list(
              project.description,
              strong("Skills Used: ") + project.skills.join(", ")
            )
          })
        )
      ]
    ]
  }).join()
  ]
]

#v(-10pt)

#bodyRect[
  #set align(center)
  #set text(
    size: 9pt,
    fill: bgColor,
  )
  Full Work History Available at #link("https://linkedin.com/in/duanejeffers")[linkedin.com/in/duanejeffers] #h(50pt) Full Resume Typst Source Available at #link("https://github.com/duanejeffers/resume")[resume.duanejeffers.com]
]
