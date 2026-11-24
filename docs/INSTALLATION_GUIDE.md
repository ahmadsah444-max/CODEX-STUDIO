# Installation and Setup Guide

## 1. Prerequisites
- Windows 10 or Windows 11.
- PowerShell 5.1 or later.
- Enough free disk space for media, caches, backups, and project files.
- Creative applications installed separately from their official sources.

## 2. Extract the repository
Extract the ZIP or clone the repository into a location you control. The suggested workspace root is `D:\CODEX_STUDIO`.

## 3. Run the read-only audit
Open PowerShell in the repository folder and run:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\01-readonly-audit.ps1
```

The script collects basic system/application information and writes a timestamped report in the workspace root. Review the report before proceeding.

## 4. Create missing workspace folders
Run:

```powershell
.\scripts\02-create-workspace.ps1
```

The script creates missing directories and does not overwrite existing files.

## 5. Third-party integrations
For every optional integration:
1. Open its official repository.
2. Read its README, license, release notes, and installation scripts.
3. Confirm compatibility with the exact application version.
4. Inspect all scripts before running them.
5. Back up the relevant application/plugin folders.
6. Install only after explicit approval.
7. Test on a disposable sample project before using client work.

## 6. Arabic subtitle validation
Use a short sample containing:
- Arabic connected letters and diacritics
- Arabic punctuation and numerals
- Mixed Arabic/English text
- Syrian colloquial phrases
- Multiple subtitle lines
- Timing changes and line breaks

Check shaping, RTL order, font support, safe margins, timing, and export appearance in the final rendered video.

## 7. Rollback
If an integration causes a problem:
- Stop using it.
- Restore the relevant backed-up plugin/application files.
- Reopen the application and test a clean project.
- Record the incident and exact versions in the local installation log.

Never delete original project files as a troubleshooting shortcut.
