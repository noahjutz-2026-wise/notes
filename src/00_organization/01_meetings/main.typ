= Vorstellungsgespräch (Weiß 2026-06-15)

Hintergrundinformationen
- Arbeite bei Sappz an CyberRunner inbetriebnahme

Arbeit
- Richtlinien Fak./Lehrstuhl/Prof

Thema
- Zu ambitioniert?
- Must haves / nice to haves

Betreuung
- Meeting Turnus
- Mathe kenntnisse Erwartungen

Bewertung
- Zwingendes LaTeX template? Typst?
- Bewertungskriterien

Organisatorisches
- Prof. Ehrnsperger als Erstbetreuer oder externer
- Nächste Schritte

---

Notizen
- RL an introduction richard s sutton andrew g
- alphapos(?) citation style
- faq dokument

= Kickoff (Weiß 2026-09-23)

#table(
  columns: (1fr, auto),
  table.header([], [*Notizen*]),
  [
    *Aktueller Stand*
    - Anfang BA 2026-09-23
    - Ziel des Meetings: Erste Schritte planen
  ],
  [],

  [
    *Bisherige Vorbereitung*
    - BartoSutton: Kapitel 1-7 gelesen
    - Paper über Dreamer, ML-Agents, CyberRunner gelesen
    - Papers gesammelt (Tabelle zeigen)
    - mit DreamerV3 Flappy Bird gelernt
    - Tools: Ray+Prometheus+Grafana, JAX, Torch, NVIDIA-ctk, WandB, CyberRunner (ROS2), Gymnasium
  ],
  [],

  [
    *Erste 30 Tage*
    - [ ] Womit soll ich anfangen?
    - [ ] Wie soll ich meine Tätigkeiten dokumentieren?
    - [ ] Struktur der Arbeit
    - [ ] Milestones setzen
    - [ ] Nächstes Meeting
    #text(fill: black.lighten(60%))[
      - 09-23: Meeting, Planung
      - 09-28: Urlaub
      - 11-01: Sim2Real
      - 11-21: Optimieren
      - 12-23: Schreiben
    ]
  ],
  [],

  [
    *Risikomanagement*
    - [ ] Szenario 1: CR teilweise bis 2026-10-01 fertig
      - Lösung: Teilweise funktionalität als Baseline verwenden
    - [ ] Szenario 2: CR gar nicht bis 2026-10-01 fertig
      - Lösung: Machbarkeit testen, ohne Vergleich
    - [ ] Szenario 3: DreamerV3 nicht bis 2026-10-01 fertig
      - Lösung: PPO verwenden (Uncharted Territory!)
  ],
  [],

  [
    *Prioritäten* \
    Wie sollte ich folgendes priorisieren?
    - [ ] Neues lernen
      - [ ] Grundwissen Neurale Netze?
      - [ ] PyTorch und TorchRL?
      - [ ] BartoSutton Teil 2?
    - [ ] CyberRunner reproduzieren
    - [ ] Sim2Real ("Einfach" Modell rüberkopieren)
      - [ ] CyberRunner clean re-implementieren
    - [ ] Optimierung (Domain Randomization, etc.)
  ],
  [],

  [
    *Langfristiger Zeitplan*
    - [ ] Gemeinsamen Konsens erstellen
    - [ ] Präzisieren
  ],
  [],

  [
    *Blocker*
    - [ ] Brauche starke CUDA-GPU + mind. 64GB RAM
  ],
  [],

  [
    *Weitere Fragen*
    - Literaturempfehlungen:
      - NNs, Sim2Real
      - Papers
  ],
)
