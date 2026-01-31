Function Get-UpdateCommands{
     param([string]$path=$args[0])
     if(!(Test-Path $path)){
        return "-1"
    }else{
        [string[]] $output = (Get-Content $path| Select-String -pattern '=[\W]*[-,a-z]*\s{1}').matches.value.trim("=")
    }
    return $output
}