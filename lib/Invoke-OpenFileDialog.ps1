function Invoke-OpenFileDialog {
    param([string]$initialDirectory, [bool]$multiSelect=$false)
    if($initialDirectory -eq "" -or -not(Test-Path $initialDirectory)){
        $initialDirectory = "$PSScriptroot\..\"
    }
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog -Property @{
        Title = "Select File to Open"
        RestoreDirectory = $true
        initialDirectory = $initialDirectory
        filter = "All files (*.*)| *.*"
    }
    if($multiSelect) {
        $OpenFileDialog.Multiselect = $true
    }
    return $OpenFileDialog
}