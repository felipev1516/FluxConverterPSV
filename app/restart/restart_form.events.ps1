. "$PSScriptRoot\restart_form.designer.ps1"
. "$PSScriptRoot\..\main\main_form.designer.ps1"
. "$PSScriptRoot\..\attention\attention_form.designer.ps1"

$Close_Button_click = {
    if($Restart_form.visible -eq $True){
        $Restart_form.Close()
    }
    if($Attention_form.visible -eq $True){
        $Attention_form.Close()
    }
    if($main_form.visible -eq $True){
        $main_form.Close()
    }
}
$Close_Button.Add_Click($Close_Button_click)

$error_restart_prompt = {
    
    $Restart_Label.Text = "An error has occured!"
    $Status_Label.text = "Please restart the Flux Converter"
}

$restart_application_prompt = {
    
    $Restart_Label.text = "Update Successful!"
    $Status_Label.text = "Please restart the Flux Converter"
}
