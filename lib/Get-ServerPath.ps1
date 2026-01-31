. "$PSScriptroot\Get-RootDirectory.ps1"
. "$(Get-RootDirectory)\lib\Invoke-OpenFolderDialog.ps1"
Function Get-ServerPath{
    [string] $buffer = $((Get-Content "$(Get-RootDirectory)\config\server_path.cfg") -split "=")[1]
    return $buffer
}

# Note if this throws a error check the server_path.cfg file in the config folder