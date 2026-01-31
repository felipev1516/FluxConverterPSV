#. "$PSScriptroot\update_form.events.ps1"
. "$PSScriptroot\..\..\lib\Get-AddedValues.ps1"
. "$PSScriptroot\..\..\lib\Get-UpdateValues.ps1"
. "$PSScriptroot\..\..\lib\Get-DeletedValues.ps1"
. "$PSScriptroot\..\..\lib\Get-RootDirectory.ps1"

write-host "Server Path: $(Get-ServerPath)`n"

# Check if server path has a value
if ($(Get-ServerPath) -eq ""){
    # Call Path Form
    . "$PSScriptroot\..\path\path_form.ps1" -ArgumentList "server"
}else{
    # Check if server path value is still valid
    if(!(Test-Path $(Get-ServerPath))){
        # Ask user to edit server path value
        . "$PSScriptroot\..\prompt\prompt_form.ps1" "server"

        # Do not proceed any further
        if(!(Test-Path Get-ServerPath)){return}
    }
}

# Proceed if server_path file has a valid directory

# Check if Client has items from root to leaf
# If not call Repair (Repair only works of Server is reachable and has Folder)

# Get Added items
[string[]] $items_to_add = $(Get-AddedValues -server_dir $(Get-ServerPath) -client_dir $(Get-RootDirectory))

# Get Update items
[string] $supported_update_types = "$(Get-RootDirectory)\config\supported_update_types.cfg"
[string] $folder_name = $(Get-Content "$(Get-RootDirectory)\config\folder_name.cfg")
[string[]] $items_to_update = $(Get-UpdateValues -server_dir [string]$(Get-ServerPath) -client_dir $(Get-RootDirectory) -upgrade_ext_path $supported_update_types -server_folder_name $folder_name)

# If Returned a error
if($items_to_update[0] -in @("0x4","0x5")){
    . "$PSScriptroot\..\prompt\prompt_form.ps1" "support"
    return
}
if($items_to_update[0] -in @("0x3")){
    #. "$PSScriptroot\..\prompt\prompt_form.ps1" "repair" # Will Not Do
    return
}

# Get Deleted items
[string] $ignore_directories = "$(Get-RootDirectory)\config\ignore_directories.cfg"
[string[]] $items_to_delete = $(Get-DeletedValues -server_dir $(Get-ServerPath) -client_dir $(Get-RootDirectory) -ignore_path $ignore_directories -server_folder_name "FluxConverterPSV")

# Test
write-host "ADD:"
write-host $items_to_add

write-host "UPDATE:"
write-host $items_to_update 

write-host "DELETE:"
write-host $items_to_delete

# If Values exist call update form with Update Message

# If not call update form with no update message
