$flux_warning_prompt = {
    $Attention_form.text = "Missing Media"
    $Prompt_Label.Text = "Flux Unsuccessful!"
    
    $Warning_Label.Text = "Please place files in the Flux Converter folder or in the drop box to begin"
    $Warning_Label.Size	= "250,35"
    $Warning_Label.Location = "55,55"
    
    $Prompt_Button.size	= "120,40"
    $Prompt_Button.Location = "115,100"
    $Prompt_Button.Visible 	= $True
    $Yes_Button.Visible	= $False
    $No_Button.Visible	= $False
    $Yes_Reset_Button.Visible = $False
}
$flux_file_transfer_error = {
    $Attention_form.Text = "Error"
    $Prompt_Label.Text = "Flux Unsuccessful!"
    
    $Warning_Label.Text = "Something went wrong please try again"
    $Warning_Label.Size	= "250,35"
    $Warning_Label.Location = "55,55"
    
    $Prompt_Button.size	= "120,40"
    $Prompt_Button.Location = "115,100"
    $Prompt_Button.Visible= $True
    $Yes_Button.Visible	= $False
    $No_Button.Visible = $False
    $Yes_Reset_Button.Visible = $False
}
$flux_reset_prompt = {
    $Attention_form.Text = "Text Fields Reset"
    $Prompt_Label.Text = "Are You Sure?"
    
    $Warning_Label.Text = "This will reset all the text fields"
    $Warning_Label.Size	= "300,50"
    $Warning_Label.Location = "25,45"
    
    $No_Button.Size	= "120,40"
    $No_Button.Location = "185,100"
    $Yes_Reset_Button.Location = "45,100"
    
    $No_Button.Visible = $True
    $Yes_Reset_Button.Visible = $True
    $Yes_Button.Visible	= $False
    $Prompt_Button.Visible = $False
    
}

$update_file_error_prompt = {
    $Attention_form.Text = "Flux Converter Update Error"
    $Yes_Button.Visible = $False
    $No_Button.Visible = $False
    $Yes_Reset_Button.Visible = $False
    
    $Prompt_Label.Text = "An Error Has Occured!"
    $Prompt_Label.size = "285,35"
    $Prompt_Label.Location = "33,20"
    $Prompt_Label.Visible = $True
    
    $Warning_Label.Text	= "The update file was not found in the data folder"
    $Warning_Label.Size	= "205,35"
    $Warning_Label.Location = "75,55"
    
    $Prompt_Button.Location = "115,100"
    $Prompt_Button.Visible = $True
}

$Yes_Reset_Button_click = {
    $Project_TextBox.Text = "" 
    $Bug_TextBox.Text = "" 
    $Device_List.SelectedIndex = 0
    $Branch_List.SelectedIndex = 0 
    $Build_TextBox.Text = "" 
    $Quality_List.SelectedIndex	= 0
    $Check_Box.Checked = $False
    $Nvidia_Box.Checked = $False
    $verify_cbx.Checked = $False
    $Video_TextBox.Text	= ""
    $Picture_TextBox.Text = ""
    $Text_TextBox.Text = ""
    $fps_cbx.SelectedIndex = 0
    $bit_cbx.SelectedIndex = 3
    $frame_cbx.SelectedIndex = 1
    $ratio_cbx.SelectedIndex = 0
    $Attention_form.Close()
}

$Prompt_Button_click = {
    $Attention_form.Close()
}
$Yes_Button_click = {
     # Attention Form will call Restart Form to prompt user to restart application
    try{
        # &$restart_application_prompt
        # $Restart_form.ShowDialog() | Out-Null
        Start-Process -FilePath "$PSScriptroot\..\restart\restart_form.ps1" -ArgumentList "restart_application_prompt"
    }
    catch{
        # &$error_restart_prompt
        Start-Process -FilePath "$PSScriptroot\..\restart\restart_form.ps1" -ArgumentList "error_restart_prompt"
        }
}

$No_Button_click = {$Attention_form.Close()}

. (Join-Path $PSScriptroot "attention_form.designer.ps1")