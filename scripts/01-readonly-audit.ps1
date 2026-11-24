# CODEX STUDIO - Read-only system audit
# This script gathers information only. It does not install software or change settings.

$ErrorActionPreference = "Continue"
$root = Split-Path -Parent $PSScriptRoot
$stamp = Get-Date -Format "yyyyMMdd-HHmmss"
$outFile = Join-Path $root "SYSTEM_AUDIT-$stamp.md"

function Add-Section($title, $content) {
    Add-Content -Path $outFile -Value "`n## $title`n"
    Add-Content -Path $outFile -Value $content
}

"# CODEX STUDIO - System Audit`nGenerated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')`n" | Set-Content -Path $outFile

$os = Get-CimInstance Win32_OperatingSystem
$cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
$ram = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
Add-Section "Windows" "- Caption: $($os.Caption)`n- Version: $($os.Version)`n- Build: $($os.BuildNumber)"
Add-Section "Hardware" "- CPU: $($cpu.Name)`n- Visible RAM (GB): $ram"

$gpus = Get-CimInstance Win32_VideoController | ForEach-Object {
    "- Name: $($_.Name)`n  - Driver: $($_.DriverVersion)`n  - Adapter RAM: $($_.AdapterRAM)"
}
Add-Section "Display adapters" ($gpus -join "`n")

$disks = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
    $free = if ($_.Size -gt 0) { [math]::Round($_.FreeSpace / 1GB, 2) } else { "Unknown" }
    "- Drive $($_.DeviceID): $free GB free"
}
Add-Section "Disk space" ($disks -join "`n")

$apps = @(
    @{Name="Blender"; Paths=@("$env:ProgramFiles\Blender Foundation", "$env:LOCALAPPDATA\Programs\Blender Foundation")},
    @{Name="Adobe After Effects"; Paths=@("$env:ProgramFiles\Adobe", "$env:ProgramFiles(x86)\Adobe")},
    @{Name="Adobe Premiere Pro"; Paths=@("$env:ProgramFiles\Adobe", "$env:ProgramFiles(x86)\Adobe")},
    @{Name="CapCut"; Paths=@("$env:LOCALAPPDATA\CapCut", "$env:ProgramFiles\CapCut")},
    @{Name="Codex"; Paths=@("$env:LOCALAPPDATA\Programs", "$env:ProgramFiles")}
)
$appLines = foreach ($app in $apps) {
    $found = foreach ($p in $app.Paths) {
        if (Test-Path $p) { Get-ChildItem -Path $p -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -match [regex]::Escape(($app.Name -replace "Adobe ","")) } | Select-Object -ExpandProperty FullName }
    }
    "- $($app.Name): " + $(if ($found) { ($found -join "; ") } else { "Not identified by this basic path scan; verify manually." })
}
Add-Section "Creative application path scan" ($appLines -join "`n")

$nvidia = Get-Command nvidia-smi -ErrorAction SilentlyContinue
if ($nvidia) {
    $nv = & nvidia-smi 2>&1 | Out-String
    Add-Section "NVIDIA SMI" ('```text' + "`n" + $nv + "`n" + '```')
} else {
    Add-Section "NVIDIA SMI" "nvidia-smi was not found in PATH. This does not prove that an NVIDIA GPU is absent."
}

Add-Section "Manual verification required" @"
- Open each creative application and record its exact version from About.
- Confirm GPU driver and application GPU acceleration settings.
- Confirm Adobe plugin/extension folders manually.
- Do not install or modify anything based only on this report.
"@

Write-Host "Read-only audit complete: $outFile"
