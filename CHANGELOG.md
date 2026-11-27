# Changelog

## 1.2.0 - Vanilla station compatibility

- New station recipes produce vanilla prefabs with existing recipe IDs and costs.
- Keep legacy station prefabs for existing saves; no automatic conversion.
- Use vanilla station animations for placement previews.
- Guard legacy random effects against invalid workers and missing health/sanity components.
- Add short diagnostics and three debug modes, preserving boolean configuration compatibility.
- All 16 recipe configuration regression cases passed; manual in-game checks reported successful. Separate multiplayer validation remains unverified.

## 1.1.1 - Diagnostics and Workshop copy

- Added optional, disabled-by-default recipe registration logging.
- Added the `ANCIENT_STATION_DEBUG()` console status command.
- Documented the exact ingredients and technology required by every difficulty.

## 1.1.0 - Steam metadata refresh

- Updated the Steam-visible mod name and author metadata.
- Bumped the mod version for Workshop re-upload.
- Added Workshop ID and Steam title to repository documentation.

## 1.0 - Friends Only

- Updated recipes to support the modern DST crafting menu with `AddRecipe2`.
- Registered `altar` and `altar_broken` as Ancient crafting station definitions.
- Added `ancient_station` and `ancientaltar` tags to the prefab.
- Modernized prefab and placer names.
- Removed duplicate placer returns from the prefab file.
