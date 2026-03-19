// resume.typ — Pandoc Typst template
// Used via: pandoc resume.md --pdf-engine=typst --template=template/resume.typ

#set document(title: "$name$")
#set page(
  paper: "us-letter",
  margin: (top: 0.6in, bottom: 0.6in, left: 0.65in, right: 0.65in),
)
#set text(font: "Liberation Serif", size: 10.5pt)
#set par(justify: true, leading: 0.55em)

// ── Section headings ─────────────────────────────────────────────────────
#show heading.where(level: 2): it => {
  v(8pt)
  text(size: 11pt, weight: "bold", tracking: 0.5pt)[#upper(it.body)]
  v(1pt)
  line(length: 100%, stroke: 0.4pt + luma(180))
  v(3pt)
}

// ── Sub-entries (### level) ──────────────────────────────────────────────
#show heading.where(level: 3): it => {
  v(2pt)
  text(size: 10.5pt, weight: "bold")[#it.body]
}

// ── Bullet lists ─────────────────────────────────────────────────────────
#set list(indent: 8pt, body-indent: 6pt, marker: [–])

// ── Header ───────────────────────────────────────────────────────────────
#align(center)[
  #text(size: 20pt, weight: "bold")[$name$]
  #v(2pt)
  #let sep = h(8pt) + text(fill: luma(160))[·] + h(8pt)
  #text(size: 9pt)[
    $email$
    $if(phone)$#sep$phone$$endif$
    $if(location)$#sep$location$$endif$
    $if(linkedin)$#sep$linkedin$$endif$
    $if(github)$#sep$github$$endif$
  ]
]

#v(6pt)
#line(length: 100%, stroke: 0.5pt)
#v(4pt)

$body$
