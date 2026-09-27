param (
    [Parameter(Mandatory=$true)]
    [string]$Type,

    [Parameter(Mandatory=$true)]
    [string]$IssueNumber,

    [Parameter(Mandatory=$true)]
    [string]$Description
)

# Format description (lowercase, replace spaces with hyphens)
$FormattedDesc = $Description.ToLower() -replace '\s+', '-' -replace '[^a-z0-9-]', ''
$BranchName = "$Type/$IssueNumber-$FormattedDesc"

# Determine current folder and parent folder
$CurrentDir = Get-Location
$ProjectName = (Get-Item $CurrentDir).Name
$ParentDir = Split-Path $CurrentDir -Parent
$WorktreePath = Join-Path $ParentDir "$ProjectName-$BranchName"

Write-Host "Creating branch: $BranchName" -ForegroundColor Cyan
git branch $BranchName origin/main

Write-Host "Creating worktree at: $WorktreePath" -ForegroundColor Cyan
git worktree add $WorktreePath $BranchName

Write-Host "Opening VS Code..." -ForegroundColor Cyan
code $WorktreePath

Write-Host "`nSetup complete!" -ForegroundColor Green
Write-Host "Your new worktree is located at: $WorktreePath"
Write-Host "When finished, commit, push, and run: git worktree remove `"$WorktreePath`"" -ForegroundColor Yellow
