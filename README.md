# petrochen/tap

```bash
brew install petrochen/tap/audio-priority
```

[Audio Priority](https://github.com/petrochen/audio-input-priority): keeps the macOS default microphone and
sound output on the best available device. Built from source, so no Gatekeeper dialog.

```bash
brew install petrochen/tap/brioctl              # command line
brew install --cask petrochen/tap/brioctl-app   # menu bar app
```

[brioctl](https://github.com/petrochen/brioctl): sets up the Logitech MX Brio and other UVC webcams from the
command line or the menu bar (field of view, zoom, warmth, HDR, presets) and re-applies your settings when video
starts. The formula builds from source. The app is signed ad hoc and not notarized; the cask removes the quarantine
attribute after installing it.

```bash
brew install --cask petrochen/tap/nvmeter
```

[NVMeter](https://github.com/petrochen/nvmeter): monitor for NVMe SSDs and the USB4 / Thunderbolt enclosures they sit
in (SMART health, temperatures, per-slot PCIe links, history, speed tests for video work). Signed with Developer ID
and notarized by Apple, so it opens without a Gatekeeper dialog.
