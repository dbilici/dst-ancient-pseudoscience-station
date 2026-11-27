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
- Published Workshop version: `1.2.0` (confirmed by maintainer)
- GitHub release: [`v1.2.0`](https://github.com/dbilici/dst-ancient-pseudoscience-station/releases/tag/v1.2.0)

## Features

- Adds recipes for Ancient Pseudoscience Station / Small Station variants.
- Adds configurable Thulecite Fragment crafting.
- Supports the modern DST crafting menu through `AddRecipe2`.
- New recipes build vanilla Ancient Stations; legacy custom prefabs remain registered for existing saves.
- Adds Ancient station tags so station-gated recipes appear near the structure.

## Configuration

| Option | Values | Default |
| --- | --- | --- |
| Ancient Pseudoscience Station | Disabled, Easy, Normal, Hard | Normal |
| Thulecite Fragments | Disabled, Easy, Normal, Hard | Normal |
| Debug Mode | Off, Log only, Chat + log | Off |

## Diagnostics

Use `c_as()` in the remote console to report recipe IDs and products even when debug mode is off. Log only enables startup diagnostics; Chat + log also shows status on the invoking player. Existing boolean settings remain supported.

Legacy command alias:

```text
ANCIENT_STATION_DEBUG()
```

## Compatibility testing

Newly crafted stations follow vanilla repair, hammer, loot and lighting behavior. Existing custom stations are not automatically converted. Manual in-game checks reported successful; separate multiplayer validation remains unverified.

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
