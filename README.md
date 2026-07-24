# Craftable Ancient Pseudoscience Station

Public Don't Starve Together mod that adds craftable Ancient Pseudoscience Station recipes and configurable Thulecite Fragment crafting.

## Status

- Steam Workshop visibility: Public
- Workshop ID: `3750960771`
- Workshop URL: https://steamcommunity.com/sharedfiles/filedetails/?id=3750960771
- Steam title: `Craftable Ancient Pseudoscience Station`
- Local source package: `ancient_altar_fixed`
- Mod name: `Craftable Ancient Pseudoscience Station`
- Author: `k0za1ak`
- Source repository: https://github.com/dbilici/dst-ancient-pseudoscience-station
- Repository folder: `dst-ancient-pseudoscience-station`
- Version: `1.1.1`

## Features

- Adds recipes for Ancient Pseudoscience Station / Small Station variants.
- Adds configurable Thulecite Fragment crafting.
- Supports the modern DST crafting menu through `AddRecipe2`.
- Registers custom station prefabs with `AddPrototyperDef`.
- Adds Ancient station tags so station-gated recipes appear near the structure.

## Configuration

| Option | Values | Default |
| --- | --- | --- |
| Ancient Pseudoscience Station | Disabled, Easy, Normal, Hard | Normal |
| Thulecite Fragments | Disabled, Easy, Normal, Hard | Normal |
| Debug Logging | Disabled, Enabled | Disabled |

## Diagnostics

Enable **Debug Logging**, restart the world, and inspect the client/server logs
for lines beginning with `[Ancient Station 1.1.1]`. The console command below
always prints a compact configuration and recipe-registration status:

```text
ANCIENT_STATION_DEBUG()
```

## Install Locally

Copy this folder into the Don't Starve Together mods folder, then enable it from the in-game mod screen.

Common macOS location:

```text
~/Library/Application Support/Steam/steamapps/common/Don't Starve Together/dontstarve_steam.app/Contents/mods/
```

## Repository Notes

- Keep generated or OS-local files out of Git (`.DS_Store`, logs, temporary zips).
- Keep Workshop metadata in this README.
- Keep the Steam Workshop page text in `STEAM_WORKSHOP.md`.
- Tag GitHub releases when publishing Workshop updates.
