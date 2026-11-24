# CODEX STUDIO
### AI-Assisted Creative Production Environment

**Turning Creative Ideas into Cinematic Experiences.**

CODEX STUDIO is a modular workspace for planning, producing, reviewing, and delivering professional advertising content with AI-assisted workflows and creative applications.

> **Repository status:** Initial public release / workflow framework.
> This repository provides the project structure, operating guidelines, audit scripts, templates, and integration plans. Optional third-party tools must be installed and validated on the target computer before being described as operational.

## What it is designed to do

- Turn a client brief into a creative direction, script, and storyboard.
- Organize assets, project files, versions, and final exports.
- Support 3D scenes and product visualization in Blender.
- Support motion graphics and compositing in Adobe After Effects.
- Support editing, sound, and delivery in Adobe Premiere Pro.
- Support short-form editing workflows in CapCut where appropriate.
- Prepare Arabic subtitle workflows with right-to-left (RTL) and connected-letter quality checks.
- Use Codex as an assistant for planning, documentation, automation, and code review.

## Target deliverables

| Item | Default target |
|---|---|
| Short-form duration | 15–30 seconds |
| Vertical format | 1080 × 1920 (9:16) |
| Frame rate | 30 FPS |
| Delivery container | MP4 |
| Video codec | H.264 |
| Other formats | 4:5 and 16:9 when required |

These are project defaults, not guaranteed export settings. Confirm each client brief and the capabilities of the installed software.

## Creative workflow

1. **BRIEF** — collect the objective, audience, offer, brand assets, and delivery requirements.
2. **RESEARCH** — review the brand, references, competitors, and constraints.
3. **CONCEPT** — define the creative idea, visual language, and message.
4. **SCRIPT** — write the hook, body, call to action, and voice-over.
5. **STORYBOARD** — plan shots, transitions, camera movement, and timing.
6. **ASSET PREPARATION** — organize logos, images, fonts, audio, and 3D assets.
7. **PRODUCTION** — create 3D, motion graphics, compositing, and edits.
8. **SOUND** — add voice, music, ambience, and sound effects with appropriate rights.
9. **QUALITY CONTROL** — check spelling, Arabic shaping, RTL direction, timing, audio, framing, and export.
10. **DELIVERY** — export, review, archive, and hand off the approved files.

## Supported creative applications

The workflow is designed to work with these applications when installed and licensed by the user:

- Blender
- Adobe After Effects
- Adobe Premiere Pro
- CapCut
- OpenAI Codex

Third-party integrations are optional. Compatibility depends on exact application versions, operating system, GPU drivers, and the integration's own requirements.

## Optional integrations under evaluation

These projects are not bundled into this repository. Review their source code, license, release history, security implications, and compatibility before installing:

- [Raunen](https://github.com/Zeyphers/raunen)
- [arabic-subtitles (arsub)](https://github.com/Ifazawezk/arabic-subtitles)
- [LazyMotionToolkit](https://github.com/raisulsohan/LazyMotionToolkit)
- [Kerf](https://github.com/kamalivaturi/kerf)
- [AE Subtitle Plugin](https://github.com/salahWD/AE-subtitle-plugin)

Do not assume that an integration is installed or verified merely because it appears in this list.

## Repository structure

```text
CODEX-STUDIO/
├── AGENTS.md
├── README.md
├── LICENSE
├── CHANGELOG.md
├── CONTRIBUTING.md
├── SECURITY.md
├── .gitignore
├── config/
│   └── studio.defaults.json
├── docs/
│   ├── SYSTEM_AUDIT.md
│   ├── INSTALLATION_GUIDE.md
│   ├── WORKFLOW.md
│   └── QUALITY_CHECKLIST.md
├── scripts/
│   ├── 01-readonly-audit.ps1
│   └── 02-create-workspace.ps1
├── skills/
│   └── README.md
├── templates/
│   └── project-template/
├── assets/
├── projects/
├── backups/
├── tests/
└── exports/
```

## Getting started

1. Download or clone this repository.
2. Read `AGENTS.md` and `docs/INSTALLATION_GUIDE.md`.
3. Run the read-only audit script in PowerShell:
   ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
   .\scripts\01-readonly-audit.ps1
   ```
4. Review the generated audit report before installing anything.
5. Create the workspace structure:
   ```powershell
   .\scripts\02-create-workspace.ps1
   ```
6. Configure `config/studio.defaults.json` for your own machine and workflow.
7. Validate each optional integration separately and record the result in `docs/SYSTEM_AUDIT.md` or your local installation log.

## Safety principles

- Never overwrite original projects or source assets.
- Back up before changing project files or application settings.
- Read scripts before running them, especially scripts downloaded from the internet.
- Do not run unknown installers with administrator privileges.
- Do not modify the Windows Registry without explicit approval and a recovery plan.
- Verify third-party licenses before redistribution or commercial use.
- Never publish private client assets, credentials, or personal information.
- Mark an integration as **verified** only after a repeatable test on the target machine.

## System baseline

A practical starting point for the intended workflow is Windows 10/11, an NVIDIA RTX-class GPU, 16 GB RAM or more, and a modern Intel Core i5 or equivalent CPU. Heavy 3D scenes, AI transcription, and high-resolution compositing may require more memory and GPU capacity. These are planning guidelines, not official minimum requirements for every listed application.

## Project status and verification

This repository is prepared as a structured starter framework. The scripts and documentation are supplied for local execution. No claim is made here that a specific computer has passed the audit, that all third-party integrations have been installed, or that end-to-end exports have been tested.

Use the verification checklist in `docs/QUALITY_CHECKLIST.md` and record real results before making a verified-release claim.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Contributions should be modular, documented, safe to run, and clear about supported versions and licensing.

## License

The repository's original documentation and scripts are released under the MIT License. Third-party tools listed above retain their own licenses and are not relicensed by this project.
