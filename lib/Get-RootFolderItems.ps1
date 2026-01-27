# Script to get items from the root folder
$rootPath = "$PSScriptRoot\.."
function Get-RootFolderItems {
    param (
        [string[]] $SupportedExtensions
    )

    [string[]] $valid_files = @(Dir $rootPath -include $SupportedExtensions) #Check if supported files are in the root folder
    return $valid_files.fullname
}
