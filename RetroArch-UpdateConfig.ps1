echo "RetroArch Slav installator"

echo "There will be a lot of downloading, internet is required :)"
echo ""
echo "Check if git is enabled"
# Check if git is installed
try
{
    git | Out-Null
   "Git zainstalowany"
}
catch [System.Management.Automation.CommandNotFoundException]
{
    "No git, installing"

    winget install --id Git.Git -e --source winget

    #Reloading Path variables
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

}
