Function Get-UpdateTypes{
    param([string]$path=$args[0])
    if(!(Test-Path $path)){
        return "-1"
    }else{
        [string[]] $output = $((Get-Content $path) | Select-String -pattern '(\.\w+)').Matches.Value
    }
    return $output
}