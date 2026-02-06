. "$PSScriptroot\..\..\lib\Get-AddedValues.ps1"
. "$PSScriptroot\..\..\lib\Get-UpdateValues.ps1"
. "$PSScriptroot\..\..\lib\Get-DeletedValues.ps1"
. "$PSScriptroot\..\..\lib\Get-RootDirectory.ps1"
. "$PSScriptroot\..\..\lib\Invoke-WaitPrompt.ps1"

$p_id = Invoke-WaitPrompt

# Get Client Directory
[string] $client_dir = $(Get-RootDirectory)

# Get Update items
[string] $supported_update_types_path = "$(Get-RootDirectory)\config\supported_update_types.cfg"
[string] $supported_ignore_types_path = "$(Get-RootDirectory)\config\ignore_types.cfg"
[string] $folder_name = $(Get-Content "$(Get-RootDirectory)\config\folder_name.cfg")


# Invoke-ServerRedirect will return error codes or new path with specifued folder
# Validate the specified Server Directory
[string] $server_dir = $(Invoke-ServerRedirect $(Get-ServerPath) $folder_name)


# If return a server directory unreachanle error or host offline  0x1
if($server_dir -in @("0x1","0x2")){
    Stop-Process -ID $p_id.id
    . "$PSScriptroot\..\prompt\prompt_form.ps1" "server"
    return
}

# If returned a server folder unavailable error 0x2
if($server_dir -in @("0x3")){
    Stop-Process -ID $p_id.id
    . "$PSScriptroot\..\prompt\prompt_form.ps1" "missing"
    return
}

# Get Ignore Types 
[string[]] $ignore_types = $(Get-Content $supported_ignore_types_path)

if($ignore_types.length -lt 1){
    Stop-Process -ID $p_id.id
    . "$PSScriptroot\..\prompt\prompt_form.ps1" "ignore"
    return
}

# Check if Upgrade Extention Path Exist
if (Test-Path $supported_update_types_path){
    if((Get-Content $supported_update_types_path).length -eq 0){
        Remove-Item  $supported_update_types_path
        Invoke-ConfigManager
        return
    }
}else{
    . "$PSScriptroot\..\prompt\prompt_form.ps1" "support"
    Stop-Process -ID $p_id.id
    return
}

[string[]] $items_to_update = $(Get-UpdateValues -server_dir $server_dir -client_dir $client_dir -upgrade_ext_path $supported_update_types_path -ignore_types $ignore_types)

# If returned client directory error 0x3
if($server_dir -in @("0x4")){
    #. "$PSScriptroot\..\prompt\prompt_form.ps1" "repair" # Will Not Do
    return
}

[string[]] $items_to_delete = $(Get-DeletedValues -server_dir $server_dir -client_dir $client_dir -ignore_types $ignore_types)

# Get Added items
[string[]] $items_to_add = $(Get-AddedValues -server_dir $server_dir -client_dir $client_dir)


. "$PSScriptroot\update_form.events.ps1"

# If Values exist call update form with Update Message
if($items_to_add.Length -gt 0 -or $items_to_update.length -gt 0 -or $items_to_delete.Length -gt 0){
    &$update_available_prompt
}else{
    # If not call update form with no update message
    &$no_update_prompt
}

Stop-Process -ID $p_id.id


$update_form.ShowDialog()

# 