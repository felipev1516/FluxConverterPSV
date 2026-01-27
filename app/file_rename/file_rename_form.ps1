param($option=$args[0])
. "$PSScriptroot\file_rename_form.events.ps1"
switch ($option) {
    "jira" {
        &$jira_option_selected
    }
    "regression" {
        &$regression_option_selected
    }
    default {
        # Do nothing
    }
}
$File_Rename_Form.ShowDialog() | Out-Null