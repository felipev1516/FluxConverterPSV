function Invoke-SaveFileDialog {
    param([string]$initialDirectory)
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

    $SaveFileDialog = New-Object System.Windows.Forms.SaveFileDialog -Property @{
        Title = "Select Location to Save File"
        #RestoreDirectory = $true
        initialDirectory = $initialDirectory
        DefaultExt = "txt"
        filter = "All files (*.*)| *.*"
    }
    $SaveFileDialog.ShowDialog() |  Out-Null
    return $SaveFileDialog
}
