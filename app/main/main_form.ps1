# Unblock the corresponding files
Unblock-File "$PSScriptRoot\main_form.designer.ps1"
Unblock-File "$PSScriptRoot\main_form.events.ps1"
# The FluxConverter Library
. "$PSScriptRoot\..\..\lib\Invoke-FluxConverterLibrary.ps1"
. Invoke-FluxConverterLibrary
# Call the events
. "$PSScriptRoot\main_form.events.ps1"
# Call the designer
. "$PSScriptRoot\main_form.designer.ps1"
# Run the form
$main_form.ShowDialog() | Out-Null

#Update Me