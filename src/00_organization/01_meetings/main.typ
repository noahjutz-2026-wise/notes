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

= Kickoff (Ehrnsperger 2026-09-08)

- [x] *Blocker*:
  - [x] CUDA-GPU + mind. 64GB RAM
  - [x] 2. BRIO Labyrinth (1x original, 1x modifiziert)

= Studierendenmeeting (Ehrnsperger 2026-09-14)

- [ ] Arbeitsplatz: Stand-up desk
- [ ] Zeitplan
- [ ] Struktur der Arbeit

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
    - Tools: Ray, JAX, Torch, NVIDIA-ctk, WandB, CyberRunner (ROS2), Gymnasium
  ],
  [],

  [
    *Zeitplanung & Risikomanagement*
    - [ ] Zeitplan & Milestones prüfen
    - [ ] Nächstes Meeting ausmachen
    #text(fill: black.lighten(60%))[
      - 09-23: Meeting, Planung
      - 09-28: Urlaub
    ]
    - [ ] 10-01: Baseline
      - Szenario 1: CR voll funktionsfähig
      - Szenario 2: CR teilweise fertig
        - Lösung: Teilweise funktionalität als Baseline verwenden
      - Szenario 3: CR gar nicht fertig
        - Lösung: CR-Paper als Baseline verwenden
      - Szenario 4: DreamerV3 nicht fertig
        - Lösung: PPO verwenden (Mit CR Uncharted Territory!)
    - [ ] 11-01: Sim2Real
      - Kompatibilität schaffen:
        - ML-Agents mit DreamerV3
        - ML-Agents mit Kamera-Observation
        - CR von Dreamer abkapseln (Ansonsten Implementierungs-Volatilität!)
      - Sim isoliert testen
      - CR Re-implementieren? (Consistent Framerate, Modularisierung)
      - [ ] Modelle trainieren, speichern, evaluieren; Übertragen, auf HW evaluieren
    - 11-21: Optimieren
      - [ ] Sim2Real Papers lesen
    - 12-23: Schreiben
    - Durchgehend: Literaturrecherche, schreiben
    - [ ] Optional: Vergleich versch. RL-Algorithmen
  ],
  [],

  [
    *Prioritäten* \
    Abwägen zwischen Prioritäten:
    - [ ] Theorie lernen (RL, NN, ML)
    - [ ] Tools lernen (PyTorch)
    - [ ] Entwicklung (Experimentspezifische Software)
      - [ ] Sauber entwickeln (Modular, Git LFS, Maintenance)
    - [ ] Literaturrecherche & Schreiben
  ],
  [],

  [
    *Blocker*
    - [ ] Brauche starke CUDA-GPU + mind. 64GB RAM
  ],
  [],

  [
    *Fragen zur Arbeit*
    - [ ] Struktur der Arbeit: Vorschlag vortragen
    - [ ] Literaturempfehlungen
      - [ ] NNs
      - [ ] Sim2Real
      - [ ] Robotik/Timing
    - [ ] Wie soll ich den Softwareentwicklungsprozess dokumentieren?
    - [ ] Wie soll ich Experimente durchführen und dokumentieren?
    - [ ] Kann ich meine Arbeit auf Englisch schreiben?
  ],
)
