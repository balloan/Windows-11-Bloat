Function Remove-AppX {
    param (
        [string]$appName
    )
    
    $packageFullName = (Get-AppxPackage -Name $appName).PackageFullName
    if ($packageFullName) {
        Remove-AppxPackage -Package $packageFullName
    } 
}

# List of apps to remove
$appsList = @(
    "Microsoft.BingWeather"
    "Microsoft.BingNews"
    "Microsoft.GamingApp"
    "Microsoft.GetHelp"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsMaps"
    "Microsoft.News"
    "Microsoft.People"
    "Microsoft.YourPhone"
    "Microsoft.OutlookForWindows"
    "Microsoft.Windows.DevHome"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    "Microsoft.Xbox.TCUI"
    "Microsoft.XboxApp"
    "Microsoft.Messaging"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.MicrosoftSolitaireCollection"
    "Clipchamp.Clipchamp"
)

# Loop through the list and remove each app
foreach ($app in $appsList) {
    try: {
        Get-AppxPackage -allusers -Name $app | Remove-AppxPackage
    } catch {
        Write-Host "Failed to remove $app"
    }
    
}
