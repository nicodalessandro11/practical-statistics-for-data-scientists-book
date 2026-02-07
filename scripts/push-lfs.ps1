<#
Adds common media files to Git LFS and pushes both the Git commit and LFS objects.

Usage (from repo root):
  .\scripts\push-lfs.ps1 -Branch main

This script:
- Ensures Git LFS is installed
- Stages .gitattributes (LFS rules)
- Finds *.mp4 and *.m4a, stages them (force-add in case they were previously ignored)
- Commits (only if there are staged changes)
- Pushes Git commit + LFS objects
#>

param(
    [string]$Branch = 'main',
    [string]$CommitMessage = 'Add media files (Git LFS)'
)

$ErrorActionPreference = 'Stop'

Write-Host "Running Git LFS push helper (branch: $Branch)"

Write-Host "1) Ensure git LFS is installed/configured"
& git lfs install | Out-Host

Write-Host "2) Stage .gitattributes (LFS rules) if present"
if (Test-Path .gitattributes) {
    & git add -- .gitattributes
}

Write-Host "3) Ensure common media types are tracked (no-op if already tracked)"
& git lfs track "*.mp4" "*.m4a" | Out-Null

Write-Host "4) Find media files and stage them"
$files = Get-ChildItem -Recurse -File -Include '*.mp4','*.m4a' -ErrorAction SilentlyContinue
if (-not $files) {
    Write-Host "No .mp4 or .m4a files found in repository. Nothing to do." -ForegroundColor Yellow
    exit 0
}

Write-Host "Files found:"
$files | ForEach-Object { Write-Host " - " $_.FullName }

Write-Host "\nPress Enter to stage+commit+push, or Ctrl+C to abort."
[void][System.Console]::ReadLine()

foreach ($f in $files) {
    # Git expects repo-relative paths (not absolute Windows paths)
    $relative = Resolve-Path -Relative $f.FullName
    & git add -f -- $relative
}

Write-Host "5) Commit staged changes (if any)"
& git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Host "No staged changes to commit." -ForegroundColor Yellow
} else {
    & git commit -m $CommitMessage
}

Write-Host "6) Push Git commit"
& git push origin $Branch

Write-Host "7) Push Git LFS objects (extra safety)"
& git lfs push --all origin $Branch

Write-Host "8) Verify LFS-tracked files"
& git lfs ls-files | Out-Host

Write-Host "Done." -ForegroundColor Green
