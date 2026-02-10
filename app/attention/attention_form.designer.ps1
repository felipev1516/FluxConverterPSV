. "$PSScriptroot\attention_form.events.ps1"

$icons_directory = "$PSScriptroot\..\..\assets\icons"

#Attention form 
$Attention_form = New-Object System.Windows.Forms.Form -Property @{
    Size = "375,200"
    AutoSize = $true
    FormBorderStyle = "Fixed3D"
    MaximizeBox = $false
    StartPosition = "CenterScreen"
    Icon = "$icons_directory\flux_cap_logo.ico"
}
$Prompt_Label = New-Object System.Windows.Forms.Label -Property @{
    Text = "Placeholder"
    Font = "Segoe UI, 16, style=Bold"
    TextAlign = "MiddleCenter"
    Location = "68,15"
    Size = "220,40"
    AutoSize = $False
}
#Flux Warning Label
$Warning_Label = New-Object System.Windows.Forms.Label -Property @{
    Text      = "Placeholder"
    Font      = "Segoe UI, 10"
    TextAlign = "MiddleCenter"
    AutoSize  = $False
}
$Prompt_Button = New-Object System.Windows.Forms.Button -Property @{
    Size    = New-Object System.Drawing.Size(120,40)
    Text    = "Okay"
    Font    = "Segoe UI, 8, style=Bold"
    Visible = $False
}
$Prompt_Button.Add_Click($Prompt_Button_click)

$Yes_Reset_Button = New-Object System.Windows.Forms.Button -Property @{
    Text    = "YES"
    Size    = New-Object System.Drawing.Size(120,40)
    Font    = "Segoe UI, 8, style=Bold"
    Visible = $False
}
$Yes_Reset_Button.Add_Click($Yes_Reset_Button_click)

$Yes_Button = New-Object System.Windows.Forms.Button -Property @{
    Text     = "YES"
    Size     = New-Object System.Drawing.Size(120,40)
    Font     = "Segoe UI, 8, style=Bold"
    Location = New-Object System.Drawing.Point(0,0)
    Visible  = $False
}
$Yes_Button.Add_Click($Yes_Button_click)

$No_Button = New-Object System.Windows.Forms.Button -Property @{
    Text     = "NO"
    Size     = New-Object System.Drawing.Size(120,40)
    Font     = "Segoe UI, 8, style=Bold"
    Location = New-Object System.Drawing.Point(0,0)
    Visible  = $False
}
$No_Button.Add_Click($No_Button_click)

$attention_form.Controls.Add($Prompt_Label)
$attention_form.Controls.Add($Warning_Label)
$attention_form.Controls.Add($Yes_Reset_Button)
$attention_form.Controls.Add($Prompt_Button)
$attention_form.Controls.Add($Yes_Button)
$attention_form.Controls.Add($No_Button)