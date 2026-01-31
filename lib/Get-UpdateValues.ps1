. "$PSScriptroot\Invoke-ServerRedirect"
. "$PSScriptroot\Get-ClientItems"
. "$PSScriptroot\Get-UpdateTypes"
. "$PSScriptroot\Get-UpdateCommands"
. "$PSScriptroot\Get-UpdateRegex"
function Get-UpdateValues{
    param(
    [string]$server_dir=$args[0],
    [string]$client_dir=$args[1],
    [string[]]$upgrade_ext_path=$args[2],
    [string]$commands=$args[3],
    [string]$regex_pattern=$args[4],
    [string]$server_folder_name=$args[5]
    )
    [string[]]$items_to_update = @()
    
    # Authenticate Server Directory
    $server_dir = $(Invoke-ServerRedirect $server_dir $server_folder_name)
    if($server_dir -eq "-1" -or $server_dir -eq "-2"){
        return "0x1" # Error Code 0x1: Server Unreachable
    }
    
    # Get Server Items
    [string[]]$server_items = $(Get-ChildItem $server_dir -Recurse).FullName
    if($server_items.Length -eq 0){
        return "0x2" # Error Code 0x2: Server directory does not have items
    }
    
    # Get Client Directory Items
    [string[]] $client_items = $(Get-ClientItems $client_dir)
    if($client_items.Length -eq 0){
        return "0x3" # Error Code 0x3: Client directory does not have items
    }else{
        $client_dir = $(Split-Path $client_dir -parent)
    }

    # Check if Upgrade Extention Path Exist
    if ($upgrade_ext_path -eq ""){
        return "0x4" # Error Code 0x4: Supported extention path is blank
    }else{
        [string] $upgrade_ext = $(Get-UpdateTypes $upgrade_ext_path)
        if ($upgrade_ext -eq "-1"){
            return "0x5" # Error Code 0x4: Supported extention path is unreachable
        }
    }

    # Get Commands
    if($commands -eq ""){
        $commands = (Get-UpdateCommands $upgrade_ext_path)
        if($commands -eq "-1"){
           $commands = "" 
        }
    }

    # Get Regular Expressions Patterns
    if($regex_pattern -eq ""){
        $regex_pattern = (Get-UpdateRegex $upgrade_ext_path)
        if($regex_pattern -eq "-1"){
           $regex_pattern = "" 
        }
    }

    [string[]]$client_items_leaf = $client_items.Replace($(Get-RootDirectory),"")
    [string[]]$server_items_leaf = $server_items.Replace($server_dir,"")
    
    # Leaf files that are available in Server and Client
    [string[]]$client_items_leaf = $client_items_leaf.where{$_ -in $server_items_leaf}

    foreach($item in $client_items_leaf){
        foreach($ext in $upgrade_ext){
            if($item -like "*$ext" ){
                if($ext -like "*.exe"){
                    $client_version = $(((."$client_dir\$item" $commands | Select-String -pattern $regex_pattern).matches.value) -split " ")[1]
                    $server_version = $(((."$client_dir\$item" $commands | Select-String -pattern $regex_pattern).matches.value) -split " ")[1]
                    if($client_version -ne $server_version){
                        $items_to_update += $item
                    }
                }else{
                    if($(Get-Content "$client_dir\$item").length -ne 0 -and $(Get-Content "$server_dir\$item").length -ne 0){
                        if((Compare-Object (Get-Content "$client_dir\$item") (Get-Content "$server_dir\$item") -IncludeEqual).SideIndicator.contains("<=")`
                        -or (Compare-Object (Get-Content "$client_dir\$item") (Get-Content "$server_dir\$item") -IncludeEqual).SideIndicator.contains("=>")){
                            $items_to_update += $item
                        }
                    }
                }
            }
        }
    }

    # This will return from root to leaf
    return $item_to_update
}