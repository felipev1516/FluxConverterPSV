# Script to get items from the root folder
function Get-RootFolderItems {
    param([string[]] $SupportedExtensions=$args[0])

    [string] $rootPath = (Resolve-Path "$PSScriptRoot\..").Path
    
    [string[]] $valid_files = @(Get-ChildItem "$rootPath\*" -include $SupportedExtensions -Exclude "LICENSE.txt").fullname #Check if supported files are in the root folder
    
    return $valid_files
}
