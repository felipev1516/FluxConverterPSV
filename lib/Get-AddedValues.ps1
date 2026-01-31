. "$PSScriptroot\Invoke-ServerRedirect"
. "$PSScriptroot\Get-ClientItems"
. "$PSScriptroot\Get-RootDirectory.ps1"
function Get-AddedValues {
    param(
    [string]$server_dir=$args[0],
    [string]$client_dir=$args[1]
    )

    [string[]] $items_to_add = @()

    # Authenticate Server Directory
    $server_dir = $(Invoke-ServerRedirect $server_dir $server_folder_name)
    if($server_dir -eq "-1" -or $server_dir -eq "-2"){
        return "-1" # Error Code 0x1: Server Unreachable
    }
    
    # Get Server Items
    [string[]]$server_items = $(Get-ChildItem $server_dir -Recurse).FullName
    if($server_items.Length -eq 0){
        return "-2" # Error Code 0x2: Server directory does not have items
    }
    
    # Get Client Directory Items
    [string[]] $client_items = $(Get-ClientItems $client_dir)
    if($client_items.Length -eq 0){
        return "-3" # Error Code 0x3: Client directory does not have items
    }else{
        $client_dir = $(Split-Path $client_dir -parent)
    }

    [string[]]$client_items_leaf = $client_items.Replace($(Get-RootDirectory),"")
    [string[]]$server_items_leaf = $server_items.Replace($server_dir,"")
    
    # Leaf files that are available in Server and Client
    $items_to_add = $server_items_leaf.where{$_ -notin $client_items_leaf}

    # This will return from root to leaf
    return $items_to_add
}