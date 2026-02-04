param(
[string]$remote=$args[0],
[string]$local=$args[1],
[string[]]$update=$args[2],
[string[]]$delete=$args[3],
[string[]]$add=$args[4]
)

. (Join-Path $PSScriptRoot 'progressbar_form.events.ps1')
$progress_form.ShowDialog()