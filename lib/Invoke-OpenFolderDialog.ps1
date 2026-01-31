function Invoke-OpenFolderDialog{
    $folder_destination = New-Object System.Windows.Forms.OpenFileDialog -Property @{
        InitialDirectory = "$home\Downloads"
        RestoreDirectory = $True
        Multiselect = $False
        CheckFileExists = 0
        ValidateNames = 0
        FileName = "Choose Folder"
    }
    return $folder_destination
}