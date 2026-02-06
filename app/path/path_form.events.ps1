$path_button_Click = {
    if(Test-Path "$(Get-RootDirectory)\config\server_path.cfg"){
        Remove-Item "$(Get-RootDirectory)\config\server_path.cfg"
        New-Item "$(Get-RootDirectory)\config\server_path.cfg" -type file
    }
    "server_path=$($path_tbx.Text)" >> "$(Get-RootDirectory)\config\server_path.cfg"
    $path_form.Close()
}
$support_button_Click = {
    if((Get-Content "$(Get-RootDirectory)\config\supported_update_types.cfg").length -eq 0){
        explorer "$(Get-RootDirectory)\config\supported_update_types.cfg"
    }
    $path_form.Close()
}
$ignore_button_Click = {
    if((Get-Content $path_tbx.Text).length -eq 0){
        explorer $path_tbx.Text
    }
    $path_form.Close()
}
$path_tbx_TextChanged = {
    &$check_path_input
}
$folder_button_Click = {
    [string] $start_path = Convert-Path("$PSScriptroot\..\..\config")
    
    if($server_panel.Visible){
        [System.Windows.Forms.OpenFileDialog] $folder_dir = $(Invoke-OpenFolderDialog -InitialDirectory $start_path)
        if($folder_dir.ShowDialog() -eq "OK"){
            $path_tbx.Text = (Split-Path $folder_dir.FileName -Parent)
        }
    }else{
         [System.Windows.Forms.OpenFileDialog] $file_dir = $(Invoke-OpenFileDialog -InitialDirectory $start_path -multiSelect $False)
         if($file_dir.ShowDialog() -eq "OK"){
            $path_tbx.Text = $file_dir.FileName
        }
    }
    
}
$path_form_Load = { 
    
    if($server_panel.Visible){
        if(Test-Path Get-ServerPath){
            $path_tbx.Text = $(Get-ServerPath)
        }
    }
    if($support_panel.Visible){
        if(Test-Path "$(Get-RootDirectory)\config\supported_update_types.cfg"){
            $path_tbx.Text = $(Get-ChildItem "$(Get-RootDirectory)\config\supported_update_types.cfg").fullname
        }
    }
    if($ignore_panel.Visible){
        if("$(Get-RootDirectory)\config\ignore_types.cfg"){
            $path_tbx.Text = $(Get-ChildItem "$(Get-RootDirectory)\config\ignore_types.cfg").fullname
        }
    }
    $path_tbx.SelectionStart = $path_tbx.Text.Length
    &$check_path_input    
}

$path_form_Closing = {
    
}

$server = {
    $server_panel.Visible = $True
    $path_prompt1 | ForEach-Object {
        $_.Location = "3, 21"
        $_.Size = "428,40"
    }
    $path_prompt_2 | ForEach-Object {
        $_.Location = "71, 77"
        $_.Size = "307,42"
    }
    $path_button | ForEach-Object {
        $_.Font = "Segoe UI, 11.25, style=Bold"
        $_.Location = "203, 260"
        $_.Size = "126,52"
        $_.Text = 'Okay'
        $_.Visible = $True
    }

    $ignore_panel.Visible = $False
    $ignore_button.Visible = $False
    $support_panel.Visible = $False
    $support_button.Visible = $False
}

$support = {
    $server_panel.Visible = $False
    $path_button.Visible = $False
    $ignore_panel.Visible = $False
    $ignore_button.Visible = $False
   
    $support_panel.Visible = $True
    $support_prompt | ForEach-Object {
        $_.Font = "Segoe UI, 18 style=Bold"
        $_.Location = "18, 21"
        $_.Size = "412,56"
        $_.Text = 'Supported File Path Not Set'
        $_.TextAlign = "MiddleCenter"
    }
    $support_prompt2 | ForEach-Object {
        $_.Font = "Segoe UI, 12 "
        $_.Location = "3, 77"
        $_.Size = "439,54"
        $_.Text = 'You need to specify the types of files that are upgradable (Required)'
        $_.TextAlign = "MiddleCenter"
    }
    $support_button | ForEach-Object {
        $_.Font = "Segoe UI, 11.25, style=bold"
        $_.Location = "203,260"
        $_.Size = "126,51"
        $_.Text = 'Okay'
        $_.Visible = $True
    }

}

$ignore = {
    
    $ignore_panel.Visible = $True
    $ignore_prompt1 | ForEach-Object {
        $_.Font = "Segoe UI, 18 style=Bold"
        $_.Location = "18, 10"
        $_.Size = "406,79"
        $_.Text = 'Non-Upgradable File Path Not Set'
        $_.TextAlign = "MiddleCenter"
    }
    $ignore_prompt2 | ForEach-Object {
        $_.Font = "Segoe UI, 12 "
        $_.Location = "18, 82"
        $_.Size = "412,46"
        $_.Text = 'Please specify the files types that will be ignored during update (Optional)'
        $_.TextAlign = "MiddleCenter"
    }
    $ignore_button | ForEach-Object {
        $_.Font = "Segoe UI, 11.25, style=bold"
        $_.Location = "203,260"
        $_.Size = "126,51"
        $_.Text = 'Okay'
        $_.Visible = $True
    }

    $server_panel.Visible = $False
    $path_button.Visible = $False
    $support_panel.Visible = $False
    $support_button.Visible = $False
}

$check_path_input = {
    if($path_tbx.Text.length -ne 0){
        if(Test-Path $path_tbx.Text){
            $path_button.enabled = $True
            $status_tbx.Text = "Reachable"
        }else{
            $path_button.enabled = $False
            $status_tbx.Text = "Not Reachable"
        }
    }else{
        $path_button.enabled = $False
        $status_tbx.Text = "Not Reachable"
    }
}

Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'path_form.designer.ps1')
