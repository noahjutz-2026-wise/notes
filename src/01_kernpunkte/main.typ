#set document(
  author: "Noah Jutz",
  date: datetime(year: 2026, month: 8, day: 11),
)
#set page(
  header: [
    #stack(dir: ltr, spacing: 1fr)[
      #context document.author.join("") \
      Bachelorarbeit -- CyberRunner Sim2Real
    ][
      #context document.date.display()
    ]
  ],
)

#title[Kernpunkte]

- *Titel:* CyberRunner Sim2Real: Beschleunigung des Trainings eines physischen Reinforcement-Learning Murmelspiel-Roboters durch Sim-to-Real transfer.
- *Hypothese:* Ein Sim-to-Real-Transfer am CyberRunner reduziert die benötigten Umgebungsschritte am physischen System um mindestens 80%, um eine Erfolgsquote von 76% zu erreichen, wobei die finale Durchlaufzeit maximal 15% über der eines rein hardwaretrainierten Modells liegt. Annahme: Der Reality Gap bezüglich physikalischer Dynamiken und visueller Beobachtungen lässt sich durch die Simulation hinreichend minimieren.
- *Basis:* CyberRunner paper, "Marble Maze" Unity Masterprojekt
- *Ziele*
  - *Ziel 1 (Baseline):* CyberRunner reproduzierbar und vollständig trainieren, sodass man ihn vorzeigen kann. (Aktueller Stand: nach max. 50% Plateau und Rückbildung des Fortschritts.) Vorgehen: Physischer Umbau, Containerisierung, Analyse Trainingsfortschritt, Observation, Reward, Value function. Falls nicht erfolgreich, gilt der teilweise Fortschritt (oder die Werte aus dem CyberRunner-Paper) als Baseline.
  - *Ziel 2 (Simulation, Hauptziel):* Sim to Real Transfer Prototyp. Vorgehen: In Unity PPO durch DreamerV3 ersetzen (erheblicher Aufwand; falls unmöglich fallback auf PPO). Kamerabild simulieren und in Observation geben. Modell in Simulation trainieren und auf Hardware evaluieren.
  - *Ziel 3 (Optimierung, optional):* Sim to Real Transfer optimieren. Domain Randomization.
- *Gliederung:* Einleitung über versch. BRIO-Labyrinth-Papers; Theoretische Grundlagen RL; Probleme & Ziele; Baseline (Ziel 1); Simulation (Ziel 2); Optimierung (Ziel 3); Evaluation; Interpretation; Ausblick.
- *Erfolgsmessung:* Trainieren, bis Erfolgsquote >=76% über ein gleitendes Fenster der letzten n = 100 Trainingsepisoden. Anschließend mit unveränderter Policy N = 50 Eval-Episoden nachmessen.
- *Zeitplanung*
  - *vor 23.09.26:* Tag -42..0: RL-Buch lesen, Unity & TF/Torch lernen, Physischer Umbau CyberRunner
  - *ab 23.09.26:* Tag 1..6: Teamausflug SappZ; Tag 7..10: Abschluss Ziel 1; Tag 11..40: Ziel 2; Tag 41..60: Ziel 3; Tag 61..90: Arbeit schreiben.
