. "$PSScriptroot\Invoke-ServerRedirect"
. "$PSScriptroot\Get-ClientItems"
function Get-DeletedValues {
    param(
    [string]$server_dir=$args[0],
    [string]$client_dir=$args[1],
    [string[]]$ignore_types=$args[2]
    )

    [string[]] $items_to_delete = @()

    # Get Client Directory Items
    [string[]] $client_items = $(Get-ClientItems $client_dir)
    # Get Server Directory Items
    [string[]] $server_items = (Get-ChildItem $server_dir -Recurse).FullName

    [string[]]$client_items_leaf = $client_items.Replace($(Get-RootDirectory),"")
    [string[]]$server_items_leaf = $server_items.Replace($server_dir,"")
    
    # Leaf files that are available in Server and Client
    $items_to_delete = $client_items_leaf.where{$_ -notin $server_items_leaf}

    # Remove ignore extentions or folders
    foreach($ext in $ignore_path){
        $items_to_delete = $items_to_delete.where{$_ -notlike "*$ext*"}
    }
    # This will return from root to leaf
    return $items_to_delete
}