Function Get-ConfigFileValues([string]$configFilePath){
    [String[]] $values = @()
    For($i = 0; $i -lt (Get-Content -Path $configFilePath).length; $i++){
        $values += (Get-Content -Path $configFilePath).split('=')[2*$i+1]
    }
    return $values
}