/// Parse literature.rdf into an array of dicts with keys:
/// citationKey, stage, decision, cluster, label.
/// Fields not present in an entry are `none`.
#let parse_literature(path) = {
  let data = xml(path)
  let root = data.first()

  // Typst strips namespace prefixes, so rdf:Description → Description, etc.
  let item_tags = ("Description", "Article", "Book", "Document")

  let results = ()

  for node in root.children {
    if type(node) != dictionary { continue }
    if node.tag not in item_tags { continue }

    let citation_key = none
    let stage = none
    let decision = none
    let cluster = none
    let label = none

    for child in node.children {
      if type(child) != dictionary { continue }

      if child.tag == "citationKey" {
        citation_key = child.children.filter(c => type(c) == str).first(default: none)
      }

      if child.tag == "subject" {
        let text = child.children.filter(c => type(c) == str).first(default: none)
        if text == none { continue }
        if text.starts-with("stage:") {
          stage = text.slice("stage:".len())
        } else if text.starts-with("decision:") {
          decision = text.slice("decision:".len())
        } else if text.starts-with("status:") {
          // Some entries use "status:" instead of "decision:"
          decision = text.slice("status:".len())
        } else if text.starts-with("cluster:") {
          cluster = text.slice("cluster:".len())
        } else if text.starts-with("label:") {
          label = text.slice("label:".len())
        }
      }
    }

    if citation_key != none {
      results.push((
        citationKey: citation_key,
        stage: stage,
        decision: decision,
        cluster: cluster,
        label: label,
      ))
    }
  }

  results
}
