function Get-RootDirectory{
    return $(Resolve-Path "$PSScriptRoot\..").path
}