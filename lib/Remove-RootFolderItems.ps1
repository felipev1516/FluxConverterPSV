# Script to get items from the root folder
$rootPath = "$PSScriptRoot\.."
function Remove-RootFolderItems {
    param (
        [string[]] $SupportedExtensions
    )

    [string[]] $valid_files = @(Dir $rootPath -include $SupportedExtensions) #Check if supported files are in the root folder
    foreach($files in $valid_files.fullname){del $files}
    return
}
