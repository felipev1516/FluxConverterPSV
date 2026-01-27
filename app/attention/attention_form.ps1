. "$PSScriptRoot\attention_form.designer.ps1"
. "$PSScriptRoot\attention_form.events.ps1"
param (
    [string]$prompt_type=$args[0]
)
switch ($prompt_type) {
    "flux_warning_prompt" { &$flux_warning_prompt }
    "flux_file_extentions_error" { &$flux_file_extentions_error }
    "flux_reset_prompt" { &$flux_reset_prompt }
    "update_file_error_prompt" { &$update_file_error_prompt }
    default { throw "Invalid prompt type specified: $prompt_type" }
}
$Attention_form.ShowDialog() | Out-Null