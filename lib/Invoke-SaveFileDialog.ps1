function Invoke-SaveFileDialog {
    param([string]$initialDirectory)
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

    $OpenFileDialog = New-Object System.Windows.Forms.SaveFileDialog -Property @{
        Title = "Select Location to Save File"
        RestoreDirectory = $true
        initialDirectory = $initialDirectory
        DefaultExt = "txt"
        filter = "All files (*.*)| *.*"
    }
    $OpenFileDialog.ShowDialog() |  Out-Null
    return $OpenFileDialog
}
