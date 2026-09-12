/// Parse betterbibtex.json into an array of dicts with keys:
/// citationKey, stage, decision, cluster, label.
/// Fields not present in an entry are `none`.
#let parse_literature(path) = {
  let data = json(path)
  let items = data.at("items", default: ())

  let results = ()

  for item in items {
    let citation_key = item.at("citationKey", default: none)
    if citation_key == none { continue }

    let stage = none
    let decision = none
    let cluster = none
    let label = none

    let raw_tags = item.at("tags", default: ())
    for entry in raw_tags {
      let tag_str = if type(entry) == dictionary {
        entry.at("tag", default: "")
      } else if type(entry) == str {
        entry
      } else {
        ""
      }

      if tag_str.starts-with("stage:") {
        stage = tag_str.slice("stage:".len())
      } else if tag_str.starts-with("decision:") {
        decision = tag_str.slice("decision:".len())
      } else if tag_str.starts-with("status:") {
        // Some entries use "status:" instead of "decision:"
        decision = tag_str.slice("status:".len())
      } else if tag_str.starts-with("cluster:") {
        cluster = tag_str.slice("cluster:".len())
      } else if tag_str.starts-with("label:") {
        label = tag_str.slice("label:".len())
      }
    }

    let title = item.at("title", default: none)

    results.push((
      citationKey: citation_key,
      title: title,
      stage: stage,
      decision: decision,
      cluster: cluster,
      label: label,
    ))
  }

  results
}
