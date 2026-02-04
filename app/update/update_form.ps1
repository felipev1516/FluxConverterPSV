. "$PSScriptroot\..\..\lib\Get-AddedValues.ps1"
. "$PSScriptroot\..\..\lib\Get-UpdateValues.ps1"
. "$PSScriptroot\..\..\lib\Get-DeletedValues.ps1"
. "$PSScriptroot\..\..\lib\Get-RootDirectory.ps1"
. "$PSScriptroot\..\..\lib\Invoke-WaitPrompt.ps1"

$p_id = Invoke-WaitPrompt

# Get Update items
[string] $supported_update_types = "$(Get-RootDirectory)\config\supported_update_types.cfg"
[string] $folder_name = $(Get-Content "$(Get-RootDirectory)\config\folder_name.cfg")


# Invoke-ServerRedirect will return error codes or new path with specifued folder
# Validate the specified Server Directory
[string] $server_dir = $(Invoke-ServerRedirect $(Get-ServerPath) $folder_name)

# If return a server directory unreachanle error or host offline  0x1
if($server_dir -in @("0x1","0x2")){
    . "$PSScriptroot\..\prompt\prompt_form.ps1" "server"
    return
}

# If returned a server folder unavailable error 0x2
if($server_dir -in @("0x3")){
    . "$PSScriptroot\..\prompt\prompt_form.ps1" "missing"
    return
}

#In Testing

[string[]] $items_to_update = $(Get-UpdateValues -server_dir $server_dir -client_dir $(Get-RootDirectory) -upgrade_ext_path $supported_update_types)
Stop-Process -ID $p_id.id
# If returned client directory error 0x3
if($server_dir -in @("0x4")){
    #. "$PSScriptroot\..\prompt\prompt_form.ps1" "repair" # Will Not Do
    return
}

# If returned a update extention error 0x4 or 0x5
if($items_to_update.length -gt 0 -and $items_to_update[0] -in @("0x5","0x6")){
    . "$PSScriptroot\..\prompt\prompt_form.ps1" "support"
    return
}

# Get Deleted items
[string] $ignore_directories = "$(Get-RootDirectory)\config\ignore_directories.cfg"
[string[]] $items_to_delete = $(Get-DeletedValues -server_dir $server_dir -client_dir $(Get-RootDirectory) -ignore_path $ignore_directories -server_folder_name "FluxConverterPSV")

# Get Added items
[string[]] $items_to_add = $(Get-AddedValues -server_dir $server_dir -client_dir $(Get-RootDirectory))

. "$PSScriptroot\update_form.events.ps1"

# If Values exist call update form with Update Message

# If not call update form with no update message

$update_form.ShowDialog()
