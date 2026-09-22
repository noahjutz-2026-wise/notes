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

*Aktueller Stand*
- Anfang BA 2026-09-23
- Ziel des Meetings: Erste Schritte planen

*Bisherige Vorbereitung*
- BartoSutton: Kapitel 1-7 gelesen
- Paper über Dreamer, ML-Agents, CyberRunner gelesen
- Papers gesammelt (Tabelle zeigen)
- mit DreamerV3 Flappy Bird gelernt
- Tools: Ray, JAX, PyTorch, NVIDIA-ctk, WandB, CyberRunner (ROS2), Gymnasium

*Time Plan*
- [-] Show time plan
- [x] Next meeting: 2026-10-07 afternoon
- [x] 10-01: Baseline
  - #text(gray)[Szenario 1: CR works fully]
  - #highlight[Szenario 2: CR works partially]
    - Lösung: Teilweise funktionalität als Baseline verwenden
  - #text(gray)[Szenario 3: CR doesn't work; Solution: Use CR-Paper as baseline]
  - #text(gray)[Szenario 4: DreamerV3 doesn't work; Solution: Use PPO]
- [x] 11-01: Sim2Real
  - Transfer:
    - ML-Agents with Ray DreamerV3
    - CR with Ray DreamerV3
    - Unify observations and actions
  - Collect Data: Sim & Real, metrics, obs, rewards, images
  - #text(gray)[Stochastic latency]
    - Test if necessary
    - #strike[reimplement CR? (Consistent Framerate, modular)]
- [x] 11-21: Optimize
  - Domain Randomization
  - Don't focus on exact physical simulation
- 12-23: Write

*Priorities* \
- [x] Show time plan: realistic?
- *No* CR rewrite
- Immediate P1: Gather data, train

*Questions about writing*
- [x] Show thesis outline
  - RE not necessary
  - RL before CR
- [x] Show literature
  - Enough read
  - Don't go too deep into latency
- [-] Experiments: WandB, DVC
- [x] Write thesis in english? Yes
