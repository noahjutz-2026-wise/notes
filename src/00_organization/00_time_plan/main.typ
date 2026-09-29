= Timetable

#include "timetable/main.typ"

= Timeline

#include "timeline/main.typ"

= Statistics

#include "stats/main.typ"
#pagebreak()

= Realtime Task Planning: Path of least resistance


- *State:* (2026-09-29) \
  Need data to find out how well a transferred model works
- *Action:* \
  Measure performance of unity model on real
  - [ ] MLAgents train until x% success
    - [ ] Python script that stores metrics and data, trains until >75% success, saves .onnx
  - [ ] onnxruntime infer on real
    - [ ] Python script that stores metrics and data, runs inference control loop for N eval runs
  P2: Baseline performance of sim \
  P3: Baseline performance of cr
