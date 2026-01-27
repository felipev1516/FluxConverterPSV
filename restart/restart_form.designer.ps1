add-type -assembly System.Windows.Forms
add-type -assembly System.Drawing

$icons_directory = "$PSScriptroot\..\..\assets\icons"

#Restart Window
$Restart_form = New-Object System.Windows.Forms.Form -Property @{
    Text            = "Flux Converter"
    Size            = "375,200"
    AutoSize        = $true
    FormBorderStyle = "Fixed3D"
    MaximizeBox     = $false
    Visible         = $false
    StartPosition   = "CenterScreen"
    Icon            = "$icons_directory\flux_cap_logo.ico"
}
#Restart Prompt Label
$Restart_Label = New-Object System.Windows.Forms.Label -Property @{
    Text      = "Placeholder"
    Location  = New-Object System.Drawing.Point(50,20)
    AutoSize  = $False
    Font      = "Microsoft Aldhabi, 16, style=Bold"
    TextAlign = "MiddleCenter"
    Size      = "270,35"
}
$Status_Label = New-Object System.Windows.Forms.Label -Property @{
    Text      = "Placeholder"
    Font      = "Microsoft Aldhabi, 11"
    TextAlign = "MiddleCenter"
    Size      = "170,30"
    Location  = "95,60"
}
$Close_Button = New-Object System.Windows.Forms.Button -Property @{
    Text     = "Okay"
    Size     = New-Object System.Drawing.Size(120,40)
    Font     = "Microsoft Aldhabi, 8, style=Bold"
    Location = New-Object System.Drawing.Point(115,100)
    Visible  = $True
} 
# Note: Close_button.Add_Click event was added in restart_form.events.ps1 since 
# it could not call the close_button_click event from the designer file.

# Restart GUI
$Restart_form.Controls.Add($Close_Button)
$Restart_form.Controls.Add($Restart_Label)
$Restart_form.Controls.Add($Status_Label)