param($option=$args[0])

. "$PSScriptroot\file_rename_form.events.ps1"
switch ($option) {
    "jira" {
        &$jira_option_selected
        $File_Rename_Form.ShowDialog() | Out-Null
    }
    "regression" {
        &$regression_option_selected
        $File_Rename_Form.ShowDialog() | Out-Null
    }
    default {
        # Do nothing
    }
}