function Invoke-WaitPrompt {
    if((Test-Path "$PSScriptroot\pid.txt")){
        Remove-Item "$PSScriptroot\pid.txt"
    }
    $p_id = $(start-process -filepath pwsh -ArgumentList "-WindowStyle","Hidden","-c","`"$PWD\app\prompt\prompt_form.ps1`"","`"wait`"" -passthru| Get-Process)
    New-Item "$PSScriptroot\pid.txt" -type File
    [system.Int32] $p_id.id >> "$PSScriptroot\pid.txt"
    return $p_id
}