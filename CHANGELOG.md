# Changelog

All notable changes to Pigeon Lean Out are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project uses [Semantic Versioning](https://semver.org/spec/v2.0.0.html):

- **Major** versions can need changes to your configuration or other resources. Read the **Upgrade notes**.
- **Minor** versions add features without breaking existing setups.
- **Patch** versions fix bugs only.

## [Unreleased]

### Added

- 22 more languages, so it now comes in 23: Czech, Danish, German, Spanish, Estonian, Finnish, French, Croatian, Hungarian, Indonesian, Italian, Dutch, Norwegian, Polish, Portuguese, Brazilian Portuguese, Romanian, Slovenian, Swedish, Turkish, and Simplified and Traditional Chinese.
- `Config.Locale = 'auto'`, the new default: it follows ox_lib's language (`setr ox:locale "de"` in `server.cfg`) and is English when that isn't set. A config that already says `'en'` stays in English.

## [1.0.0] - 2026-11-03

First release.

### Highlights

- Passengers lean out of the window with one key
- Aim and shoot all the way round, with rifles and shotguns too
- Every player sees it, through the game's own sync
- Choose seats, vehicles, weapons and who can lean out
- An in-game tuner to fit any vehicle

### Added

- Leaning out of the window and coming back in with one key (G by default, which players can change in GTA's key bindings) or `/leanout`.
- Aiming and shooting while leaning out with any weapon, or only those allowed, turning with the camera all the way round or within a set arc.
- Back in the player's own seat, or another free one, when they come in; they stay out while every seat is taken.
- Brought back in automatically when they die, or the vehicle is destroyed or gone, and optionally above a speed.
- Seats, vehicle classes and vehicles that can or can't lean out, and a top speed for leaning out.
- Who can lean out: everyone, or an ACE permission and jobs with Qbox, QBCore or ESX, optionally only on duty, with `SetAllowed` and `IsAllowed` server exports.
- Where players sit on the window, from each vehicle's size, with settings by class and by vehicle, and `/leanouttune` for staff to find them in game.
- Optional first person while leaning out, and the window rolled down.
- Every message in `locales/`.
- Update checker from the Pigeon Studios version registry.

[Unreleased]: https://github.com/pigeon-studios-uk/pigeon-lean-out/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/pigeon-studios-uk/pigeon-lean-out/releases/tag/v1.0.0
