# Check if Winget is installed
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "Winget is not installed. Please update Windows App Installer from the Microsoft Store." -ForegroundColor Red
    exit
}

Write-Host "Updating Winget sources..." -ForegroundColor Cyan
winget source update

# List of applications to install
# Format: "Friendly Name" = "Winget ID"
$apps = @{
    "Steam"                  = "Valve.Steam"
    "Epic Games Launcher"    = "EpicGames.EpicGamesLauncher"
    "Spotify"                = "Spotify.Spotify"
    "Visual Studio Code"     = "Microsoft.VisualStudioCode"
    "IntelliJ IDEA Ultimate" = "JetBrains.IntelliJIDEA.Ultimate"
    "PyCharm Professional"   = "JetBrains.PyCharm.Professional" 
    "VLC Media Player"       = "VideoLAN.VLC"
    "MSI Afterburner"        = "Guru3D.Afterburner"
}

# Iterate through the list and install each app
foreach ($name in $apps.Keys) {
    $id = $apps[$name]
    Write-Host "Installing $name ($id)..." -ForegroundColor Yellow
    
    # Install command with arguments to suppress prompts
    winget install --id $id -e --accept-package-agreements --accept-source-agreements
    
    Write-Host "--------------------------------------------------"
}

Write-Host "Installation process complete!" -ForegroundColor Green
