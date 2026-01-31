
$path_button_Click = {
    Remove-Item "$(Get-RootDirectory)\config\server_path.cfg"
    "server_path=$($path_tbx.Text)" >> "$(Get-RootDirectory)\config\server_path.cfg"
    $path_form.Close()
}
$path_tbx_TextChanged = {
    &$check_path_input
}
$folder_button_Click = {
    [System.Windows.Forms.OpenFileDialog] $folder_dir = $(Invoke-OpenFolderDialog)
    if($folder_dir.ShowDialog() -eq "OK"){
        $path_tbx.Text = (Split-Path $folder_dir.FileName -Parent)
    }
}
$path_form_Load = {
    $path_tbx.Text = $(Get-ServerPath)
    $path_tbx.SelectionStart = $path_tbx.Text.Length
    &$check_path_input
    
}
$path_form_Closing = {
    $path_form.Dispose()
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
