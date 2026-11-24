# CODEX STUDIO - Create missing workspace structure
# Creates missing folders only. Does not overwrite existing files.
param(
    [string]$WorkspaceRoot = "D:\CODEX_STUDIO"
)

$ErrorActionPreference = "Stop"
$folders = @(
    "config", "tools", "skills", "templates", "assets",
    "projects", "backups", "tests", "exports", "docs"
)

if (-not (Test-Path -LiteralPath $WorkspaceRoot)) {
    New-Item -ItemType Directory -Path $WorkspaceRoot -Force | Out-Null
}

foreach ($folder in $folders) {
    $path = Join-Path $WorkspaceRoot $folder
    if (-not (Test-Path -LiteralPath $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
        Write-Host "Created: $path"
    } else {
        Write-Host "Exists:  $path"
    }
}

$readme = Join-Path $WorkspaceRoot "WORKSPACE_README.txt"
if (-not (Test-Path -LiteralPath $readme)) {
    @"
CODEX STUDIO workspace
This directory was created by the non-destructive setup script.
Original project files were not overwritten.
See the repository README and docs for setup and safety guidance.
"@ | Set-Content -Path $readme -Encoding UTF8
}
Write-Host "Workspace structure ready: $WorkspaceRoot"
