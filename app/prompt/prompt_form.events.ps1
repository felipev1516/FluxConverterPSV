$path_button_no_Click = {
    $prompt_form.Close()
}
$path_button_yes_Click = {
    . "$PSScriptroot\..\path\path_form.ps1" "server"
    $prompt_form.Close()
}

$no_support_btn_Click = {
    $prompt_form.Close()
}

$yes_support_btn_Click = {
    . "$PSScriptroot\..\path\path_form.ps1" "support"
    $prompt_form.Close()
}
$yes_ignore_btn_Click = {
    . "$PSScriptroot\..\path\path_form.ps1" "ignore"
    $prompt_form.Close()
}
$no_ignore_btn_Click = {
    $prompt_form.Close()
}
$server_prompt = {
    $prompt_form.ClientSize = "519,244"

    $prompt_form.Text = [System.String]'Server Unavailable'
    
    $status_lbl.Font = "Segoe UI, 20.25,style=bold"
    $status_lbl.Text = [System.String]'Server Directory Unreachable'
    $status_lbl.Size = "400, 55"
    $status_lbl.Location = "59, 31"
    
    $desc_lbl.Text = [System.String]'Would you like to change the directory?'
    
    
    $path_panel.Location = "48,155"
    $path_button_no.Location = "228,13"
    $path_button_yes.Location = "30,13"
    
    $path_support_panel.Visible = $False
    $ignore_panel.Visible = $False
    $path_panel.Visible = $True
}
# Supported extentions during update
$support_prompt = {
    $prompt_form.Text = [System.String]'Unknown Supported Extensions'
    
    $status_lbl.Text = [System.String]'You need to locate the supported extentions file'
    $status_lbl.Font = "Segoe UI, 20.25,style=bold"
    $status_lbl.Location = "35,18"
    $status_lbl.Size = "424,69"
    
    $desc_lbl.Text = [System.String]'Would you like to locate the file?'
    $desc_lbl.Font = "Segoe UI, 14.25"
    $desc_lbl.Location = "78,110"
    $desc_lbl.Size = "354, 42"
    
    $path_support_panel.Visible = $True
    $path_support_panel.Location = "49,155"
    $yes_support_btn.Location = "30,13"
    $no_support_btn.Location = "228,13"

    $path_panel.visible = $False
    $ignore_panel.Visible = $False
}
$ignore_prompt = {
    
    $status_lbl.Font = "Segoe UI, 20.25,style=bold"
    $status_lbl.Location = "27,18"
    $status_lbl.Text = [System.String]'The ignore file is not defined'
    $status_lbl.Size = "460, 87"
    
    $desc_lbl.Font = "Segoe UI, 14.25"
    $desc_lbl.Location = "65, 88"
    $desc_lbl.Size = "387, 42"
    $desc_lbl.Text = [System.String]'Would you like to locate the file? (Optional)'

    $ignore_panel.Visible = $True
    $ignore_panel.Location = "49, 139"

    $yes_ignore_btn.Font = "Segoe UI, 14.25,style=bold"
    $yes_ignore_btn.Location = "30, 15"

    $no_ignore_btn.Font = "Segoe UI, 14.25,style=bold"
    $no_ignore_btn.Location = "228, 18"

    $path_panel.visible = $False
    $path_support_panel.Visible = $False
}
$placeholder_prompt = {
    $prompt_form.Text = [System.String]'Placeholder'
    $status_lbl.Text = [System.String]'PLACEHOLDER'
    $desc_lbl.Text = [System.String]'Respect the PLACEHOLDER!!'
    $path_panel.visible = $False
    $path_support_panel.Visible = $False
    $ignore_panel.Visible = $False
}
$prompt_form_Load = {
}
Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'prompt_form.designer.ps1')

