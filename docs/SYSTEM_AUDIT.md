# System Audit

## Purpose
Record the actual machine configuration before installing integrations or changing application settings.

## Current status
**Not yet audited on the target computer.** Run `scripts/01-readonly-audit.ps1` and review its generated report.

## Required checks
- Windows edition, version, and build
- CPU and installed RAM
- GPU model, driver, and available CUDA tooling where applicable
- Free disk space
- Exact versions and install paths for Blender, After Effects, Premiere Pro, CapCut, and Codex
- Existing Adobe extension/plugin locations
- Existing workspace contents and backup status

## Verification record
| Component | Detected version | Test performed | Result | Date |
|---|---|---|---|---|
| Windows | Pending | Read-only audit | Pending | — |
| NVIDIA GPU/driver | Pending | Read-only audit | Pending | — |
| Blender | Pending | Launch + sample scene | Pending | — |
| After Effects | Pending | Launch + sample project | Pending | — |
| Premiere Pro | Pending | Launch + sample timeline/export | Pending | — |
| CapCut | Pending | Launch + sample export | Pending | — |
| Arabic subtitles | Pending | RTL + shaping + timing test | Pending | — |

Do not change Pending to Passed without evidence from an actual run.
