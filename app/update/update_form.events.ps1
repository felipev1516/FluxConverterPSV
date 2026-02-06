$update_btn_no_Click = {
    $update_form.Close()
}
$okay_btn_1_Click = {
    $update_form.Close()
}
$update_btn_yes_Click = {
    
    . "$PSScriptroot\..\progressbar\progressbar_form" -remote $server_dir -local $client_dir -update $items_to_update -delete $items_to_delete -add $items_to_add
    
    # Check if server and client root to leaf matches again
    [string[]] $items_to_add = $(Get-AddedValues -server_dir $server_dir -client_dir $client_dir)
    [string[]] $items_to_update = $(Get-UpdateValues -server_dir $server_dir -client_dir $client_dir -upgrade_ext_path $supported_update_types)
    [string[]] $items_to_delete = $(Get-DeletedValues -server_dir $server_dir -client_dir $client_dir -ignore_types $ignore_types)
    
    if($items_to_add.Length -lt 1 -and $items_to_update -lt 1 -and $items_to_delete -lt 1){
        # If Success
        [System.Windows.Forms.DialogResult] $result = $(. "$PSScriptroot\..\restart\restart_form" -prompt_type "restart_application_prompt")
        if($result -eq "OK"){
            $update_form.DialogResult = [System.Windows.Forms.DialogResult]::OK
            $update_form.close()
            $main_form.DialogResult = [System.Windows.Forms.DialogResult]::OK
            $main_form.close()
        }
    }else{
        # If Failure
            . "$PSScriptroot\..\restart\restart_form" -prompt_type "error_restart_prompt"
            $update_form.close()
            
    }

}
. (Join-Path $PSScriptRoot "update_form.designer.ps1")

$update_available_prompt = {

    $update_form.ClientSize = "415, 230"

    
    $update_prompt_panel.Location = "20, 15"
    $update_prompt_panel.Size = "400, 113"
    $update_prompt_panel.Visible = $True
    

  
    $update_btn_panel.Location = "30, 133"
    $update_btn_panel.Size = "374, 81"
    $update_btn_panel.Visible = $True
    
    
    $uptodate_panel.Visible = $False
}

$no_update_prompt = {
    $update_form.ClientSize = "397, 224"

    
    $uptodate_panel.Location = "12, 12"
    $uptodate_panel.Size = "371, 196"
    $uptodate_panel.Visible = $True
    
    $update_prompt_panel.Visible = $false
    $update_btn_panel.Visible = $False
}

