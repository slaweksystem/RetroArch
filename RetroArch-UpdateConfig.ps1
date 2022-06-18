$RetroArchPath = "C:\Gry\RetroArchLib"

echo "RetroArch Slav installator"

echo "There will be a lot of downloading, internet is required :)"
echo ""
echo "Check if git is enabled"
# Check if git is installed
try
{
    git | Out-Null
   "Git installed :)"
}
catch [System.Management.Automation.CommandNotFoundException]
{
    "No git, installing"

    winget install --id Git.Git -e --source winget

    #Reloading Path variables
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

}

if (Test-Path $RetroArchPath)
{
    echo "Removing last RetroArch"
    Remove-Item $RetroArchPath -Recurse -Force
}


git clone --branch main https://github.com/slaweksystem/RetroArch.git $RetroArchPath
powershell "$RetroArchPath\RetroArch-Setup.ps1"

Write-Host 'Press any key to continue ...'
Write-Host -Object ('The key that was pressed was: {0}' -f [System.Console]::ReadKey().Key.ToString());
