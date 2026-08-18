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

    [Search Term Matrix], [],
    [Data Extraction Schema],
    [
      Metadata
      - unique _key_
      - _stage_ in [new, preskimmed, skimmed, read, understood]
      - _decision_ in [exclude, include, uncertain, seed]
      - _reason_ for decision
      - _cluster_ in [sim2real, cyberrunner]
      - _date_ of modification
    ],

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
      - #link("https://doi.org/10.1109/IROS60139.2025.11247146")[CyberRunner 2]
      Sim2Real: // todo

    ],
  )
}
