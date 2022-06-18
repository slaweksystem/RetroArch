$RetroArchPath = "C:\RetroArch"

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

if (Test-Path "C:\RetroArch")
{
    echo "Removing last RetroArch"
    Remove-Item $RetroArchPath -Recurse -Force
}

git clone --branch main https://github.com/slaweksystem/RetroArch.git $RetroArchPath
