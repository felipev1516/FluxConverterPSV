param (
    [string]$prompt_type=$args[0]
)

. "$PSScriptroot\restart_form.events.ps1"

switch ($prompt_type) {
    "error_restart_prompt" { &$error_restart_prompt }
    "restart_application_prompt" { &$restart_application_prompt }
    default { throw "Invalid prompt type specified: $prompt_type" }
}

$Restart_form.showDialog() | Out-Null