Function Get-UpdateRegex{
     param([string]$path=$args[0])
     if(!(Test-Path $path)){
        return "-1"
    }else{
        [string[]] $output = (Get-Content $path | Select-String -pattern 'regex=.*$').matches.value.trim("regex=")
    }
    return $output
}