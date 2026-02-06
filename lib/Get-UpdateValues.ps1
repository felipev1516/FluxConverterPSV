. "$PSScriptroot\Invoke-ServerRedirect"
. "$PSScriptroot\Get-ClientItems"
. "$PSScriptroot\Get-UpdateTypes"
. "$PSScriptroot\Get-UpdateCommands"
. "$PSScriptroot\Get-UpdateRegex"
. "$PSScriptroot\Get-RootDirectory.ps1"
function Get-UpdateValues{
    param(
    [string]$server_dir=$args[0],
    [string]$client_dir=$args[1],
    [string]$upgrade_ext_path=$args[2],
    [string]$commands=$args[3],
    [string]$regex_pattern=$args[4],
    [string[]]$ignore_types=$args[5]
    )
    [string[]]$items_to_update = @()
    
    # Get Client Directory Items
    [string[]] $client_items = $(Get-ClientItems $client_dir)
    [string] $client_root = $(Get-RootDirectory)
    
    if($client_items.Length -eq 0){
        return "0x4" # Error Code 0x4: Client directory does not have items
    }else{
        [string[]]$client_items_leaf = $client_items | Foreach-Object{
            [string] $_.replace("$client_root","")
        }
    }

    [string[]] $upgrade_ext = $(Get-UpdateTypes $upgrade_ext_path)

    # Get Commands
    if($commands -eq ""){
        [string[]]$commands = (Get-UpdateCommands $upgrade_ext_path)
        if($commands -eq "-1"){
           $commands = "" 
        }
    }

    # Get Regular Expressions Patterns
    if($regex_pattern -eq ""){
        [string[]]$regex_pattern = (Get-UpdateRegex $upgrade_ext_path)
        if($regex_pattern -eq "-1"){
           $regex_pattern = "" 
        }
    }
    
    [string[]] $server_items = (Get-ChildItem "$server_dir\*" -recurse).FullName
    [string[]] $server_items_leaf = $server_items | Foreach-Object{
            [string] $_.replace("$server_dir","")
    }

    # Remove Files mention in the supported file types
    [string[]]$union_items_leaf = @()

    foreach($item in $upgrade_ext){
        $union_items_leaf += $client_items_leaf.where{$_ -like "*$item"}
    }

    # Only get Leaf files that are available in both Server and Client
    $union_items_leaf = $union_items_leaf.where{$_ -in $server_items_leaf}

    # Remove ignore extentions or folders
    foreach($types in $ignore_types){
       $union_items_leaf = $union_items_leaf.where{$_ -notlike "*$types*"}
    }

    # In Testing
    # Iterate through each File Types, Commands, and Regex
    for([int] $i = 0; $i -lt $upgrade_ext.length; $i++){
        [string[]] $temp = $union_items_leaf.where{$_ -like "*$($upgrade_ext[$i])"}
        foreach($item in $temp){
            [string] $client_file = "$client_root$item"
            [string] $server_file = "$server_dir$item"

            # In the .exe section
            if($commands[$i] -ne " " -and $regex_pattern[$i] -ne " "){
                [string] $argument = $commands[$i].trim(" ")
                [string] $client_version = $(((. "$client_file" $argument| Select-String -pattern "$regex_pattern[$i]").matches.value) -split " ")[1]
                [string] $server_version = $(((. "$server_file" $argument | Select-String -pattern "$regex_pattern[$i]").matches.value) -split " ")[1]
                if($client_version -ne $server_version){
                    $items_to_update += $item
                }
            }else{
                if($(Get-Content $client_file).length -ne 0 -and $(Get-Content $server_file).length -ne 0){
                    if((Compare-Object (Get-Content $client_file) (Get-Content $server_file) -IncludeEqual).SideIndicator.contains("<=")`
                    -or (Compare-Object (Get-Content $client_file) (Get-Content $server_file) -IncludeEqual).SideIndicator.contains("=>")){
                        $items_to_update += $item
                    }
                }
            }
        }
    }
    
    # This will return from root to leaf
    return $items_to_update
}