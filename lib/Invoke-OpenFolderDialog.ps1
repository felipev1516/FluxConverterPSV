function Invoke-OpenFolderDialog{
    param($InitialDirectory=$args[0])
    if($InitialDirectory -eq ""){
        $InitialDirectory = "$home\Downloads"
    }
    $folder_destination = New-Object System.Windows.Forms.OpenFileDialog -Property @{
        InitialDirectory = $InitialDirectory
        RestoreDirectory = $True
        Multiselect = $False
        CheckFileExists = 0
        ValidateNames = 0
        FileName = "Choose Folder"
    }
    return $folder_destination
}