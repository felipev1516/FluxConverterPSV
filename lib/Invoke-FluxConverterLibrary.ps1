Function Invoke-FluxConverterLibrary {
    foreach($scripts in (dir "$PSScriptRoot\*" -Include @("*.ps1","*.exe")).fullname){
        Unblock-File $scripts
        if($scripts -like "*ffmpeg*"){ 
            . $scripts -version
        }else{
            . $scripts
        }
    }
    return
}