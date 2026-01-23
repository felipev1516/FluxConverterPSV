function Invoke-OpenFileDialog {
    param([string]$initialDirectory, [bool]$multiSelect=$false)
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog -Property @{
        Title = "Select File to Open"
        RestoreDirectory = $true
        initialDirectory = $initialDirectory
        filter = "All files (*.*)| *.*"
    }
    if($multiSelect) {
        $OpenFileDialog.Multiselect = $true
    }
    $OpenFileDialog.ShowDialog() |  Out-Null
    return $OpenFileDialog
}