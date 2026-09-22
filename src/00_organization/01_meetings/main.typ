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
    - Tools: Ray, JAX, PyTorch, NVIDIA-ctk, WandB, CyberRunner (ROS2), Gymnasium
  ],
  [],

  [
    *Zeitplanung & Risikomanagement*
    - [ ] Zeitplan & Milestones prüfen
    - [ ] Nächstes Meeting ausmachen
    #text(fill: black.lighten(60%))[
      - bis 09-27: Urlaub
    ]
    - [ ] 10-01: Baseline
      - Szenario 1: CR voll funktionsfähig
      - Szenario 2: CR teilweise fertig
        - Lösung: Teilweise funktionalität als Baseline verwenden
      - #highlight[Szenario 3: CR gar nicht fertig]
        - Lösung: CR-Paper als Baseline verwenden
      - Szenario 4: DreamerV3 nicht fertig
        - Lösung: PPO verwenden
    - [ ] 11-01: Sim2Real
      - Kompatibilität schaffen:
        - ML-Agents mit DreamerV3
        - ML-Agents mit Kamera-Observation
        - CR von Dreamer abkapseln (Ansonsten Implementierungs-Volatilität)
      - Sim isoliert testen
      - #highlight[Robust unter stochastischer Latenz]
        - CR Re-implementieren? (Consistent Framerate, Modularisierung)
      - [ ] Modelle trainieren, speichern, evaluieren; Übertragen, auf HW evaluieren
    - 11-21: Optimieren
      - [ ] Domain Randomization
    - 12-23: Schreiben
    - Durchgehend: Literaturrecherche, schreiben
  ],
  [],

  [
    *Prioritäten* \
    - [ ] Zeitplan vortragen: Realistisch?
  ],
  [],

  [
    *Fragen zur Arbeit*
    - [ ] Struktur der Arbeit vortragen: Anpassungen?
      - [ ] Anforderungsanalyse?
    - [ ] Literatur vortragen: Welche Richtung fokussieren?
    - [ ] Experimente: Mit WandB, DVC
    - [ ] Kann ich meine Arbeit auf Englisch schreiben?
  ],
  [],
)
