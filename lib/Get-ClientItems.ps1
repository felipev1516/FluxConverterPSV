. "$PSScriptroot\Get-RootDirectory.ps1"
function Get-ClientItems{
    param([string]$client_dir=$args[1])

    # Test if Client Directory is reachable
    if($client_dir -eq ""){
        [string[]] $client_items = $(Get-ChildItem $(Get-RootDirectory) -Recurse).FullName
    }else{
        try{
            if(!(Test-Path $client_dir)){
                [string[]] $client_items = $(Get-ChildItem $(Get-RootDirectory) -Recurse).FullName
            }else{
                [string[]] $client_items = $(Get-ChildItem $($client_dir) -Recurse).FullName
            }
        }catch{
            return
        }
    }
    return $client_items
}
