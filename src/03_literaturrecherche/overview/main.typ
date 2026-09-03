#import "parse_literature.typ": parse_literature
= Protokoll

#{
  show table.cell.where(x: 0): strong
  table(
    columns: 2,
    [Research Questions],
    [
      - Which Sim2Real methods have been used and to which degree of success? (infinite-horizon optimal control problem under partial observability)
    ],

    [Inclusion Criteria], [],
    [Exclusion Criteria],
    [
      - Not RL
      - Bioinspired, humanoid, bipedal
    ],

    [Search Tools],
    [
      Search
      - #link("https://scholar.google.com/")[Google Scholar]
      - #link("https://www.semanticscholar.org/")[Semantic Scholar]

      Graphs
      - #link("https://www.researchrabbit.ai/")[ResearchRabbit]
      - #link("litmaps.com")[Litmaps]

      AI Prompting
      - #link("https://consensus.app/")[Consensus]
      - #link("https://elicit.com")[Elicit]
      - #link("https://openalex.org/")[OpenAlex]

      Reference
      - #link("https://bibkatalog.oth-regensburg.de/")[OTH Katalog]
      - #link("https://www.base-search.net/")[BASE]
      - #link("https://dl.acm.org/")[ACM Digital Library]
      - #link("https://ieeexplore.ieee.org/")[IEEE Xplore]
    ],

    [Search Terms],
    [
      see ../data/search_terms.json
    ],

    [Metadata], [See ../data/schema.toml],
    [Data Extraction Schema], [],

    [Methodology],
    [
      Search
      - Using search terms
      - Forward / Backward snowballing

      Escalation Ladder
      - new: 1 min
      - preskimmed: 10 min
      - skimmed: 1 h
      - read: 5 h
      - understood: 5 d
    ],

    [Seed Papers],
    [
      BRIO
      - #link("https://doi.org/10.48550/arXiv.2312.09906")[CyberRunner]
      Sim2Real: // todo

    ],
  )
}

= Search Log
#include "fig_search_log.typ"

= Library

// #parse_literature("../assets/literature.rdf")
