$update_btn_no_Click = {
    $update_form.Close()
}
$update_btn_yes_Click = {
    
    . "$PSScriptroot\..\progressbar\progressbar_form" -remote $server_dir -local $(Get-RootDirectory) -update $items_to_add -delete $items_to_delete -add $items_to_add
}
$update_prompt_lbl1_Click = {

}

. (Join-Path $PSScriptRoot "update_form.designer.ps1")