= Gymnasium

https://gymnasium.farama.org

- #link("https://github.com/yannbouteiller/rtgym")[rtgym] enforces a clock

= NVIDIA Container Toolkit

Links

- #link("https://podman-desktop.io/docs/podman/gpu")[Podman + NVIDIA]
- #link("https://docs.nvidia.com/cuda/cuda-installation-guide-linux/")[CUDA Installation]
- #link(
    "https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html",
  )[NVIDIA Container Toolkit]
- #link("https://wiki.archlinux.org/title/Podman")[Podman ArchWiki]

= DreamerV3

Forks

- #link("https://github.com/NM512/r2dreamer")[r2dreamer]
- #link("https://github.com/InexperiencedMe/NaturalDreamer")[NaturalDreamer]
- #link("https://github.com/DrunkJin/dreamer-from-scratch")[Dreamer From Scratch]
- #link("https://docs.pytorch.org/rl/main/reference/dreamer_v3.html")[TorchRL]
- #link("https://github.com/ray-project/ray/blob/master/rllib/algorithms/dreamerv3/README.md")[Ray RLlib]

Tools

- #link("https://gist.github.com/qxcv/e8641342c102c2aa714c9caeca724101")[FromGymnasium] (#link("https://github.com/danijar/dreamerv3/issues/41")[Issue])

Hyperparameters

#link("https://github.com/danijar/dreamerv3/blob/main/dreamerv3/configs.yaml")

#table(
  columns: 3,
  table.header([Key], [Default], [Meaning]),
  [],
)

= PyTorch

Provides GPU-Accelerated ndarrays, Neural-Network abstractions, ML implementations.

= TorchRL

- _TorchRL Episode Data (TED):_ TensorDict with MDP Information

= Ray RLLib

Distributed Computing for RL.

- Prometheus: `podman run -p 9090:9090 docker.io/prom/prometheus`
