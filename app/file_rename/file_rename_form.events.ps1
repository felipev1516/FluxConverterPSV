# Note: You need to run the main_form.ps1 before this script to ensure all variables and controls are properly initialized.

. "$PSScriptRoot\file_rename_form.designer.ps1"

$retain_values = {
    if($Project_TextBox.Text -ne $Rename_Project_TextBox.Text){
        $Project_TextBox.Text = $Rename_Project_TextBox.Text
        $Rename_Project_TextBox.SelectionStart = $Rename_Project_TextBox.Text.Length
    }
    if($Bug_TextBox.Text -ne $Rename_Bug_Textbox.Text){
        $Bug_TextBox.Text = $Rename_Bug_Textbox.Text
        $Rename_Bug_Textbox.SelectionStart = $Rename_Bug_Textbox.Text.Length
    }
    if($Device_List.Text -ne $Rename_Device_Textbox.Text){
        $Device_List.Text = $Rename_Device_Textbox.Text
        $Rename_Device_Textbox.SelectionStart = $Rename_Device_Textbox.Text.Length
    }
    if($Branch_List.Text -ne $Rename_Branch_Textbox.Text){
        $Branch_List.Text = $Rename_Branch_Textbox.Text
        $Rename_Branch_Textbox.SelectionStart = $Rename_Branch_Textbox.Text.Length
    }
    if($Build_TextBox.Text -ne $Rename_Build_Textbox.Text){
        $Build_TextBox.Text = $Rename_Build_Textbox.Text
        $Rename_Build_Textbox.SelectionStart = $Rename_Build_Textbox.Text.Length
    }
    if($profile_tmi_jira.Checked){
        &$save_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Preset_values -pv $Preview_TextBox
        &$load_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Preset_values -pv $Preview_TextBox
    }else{
        &$save_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Regress_values -pv $Preview_TextBox
        &$load_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Regress_values -pv $Preview_TextBox
    }

}

$load_event = { 
    param([System.Windows.Forms.TextBox] $tb,[System.Windows.Forms.ComboBox] $cb, [string[]]$v,[System.Windows.Forms.TextBox]$pv)
    $Rename_Project_TextBox.Text = $Project_TextBox.Text
    $Rename_Bug_TextBox.Text = $Bug_TextBox.Text 
    $Rename_Device_TextBox.Text = $Device_List.Text
    $Rename_Branch_TextBox.Text = $Branch_List.Text
    $Rename_Build_TextBox.Text = $Build_TextBox.Text
    $Rename_COM_TextBox.Text = $env:COMPUTERNAME


    $tb.Enabled = $True
    $tb.Text = ""
    $pv.Text = ""
    switch($cb.Text){
        'Video'{
            $tb.Text = $v[0]
            if($tb.Text.length -gt 0){
                $pv.Text = &$Replace_AbbrevText -input_buffer $tb.Text
                $pv.Text = Invoke-IterationPlacement $pv.Text 1
            }else{
                $pv.Text = Invoke-IterationPlacement "Video_$($Project_TextBox.Text)-$($Bug_TextBox.Text)_$($Device_List.Text)_$($Branch_List.Text)_$($Build_TextBox.Text)" 1
            }
        }
        'Pictures'{
            $tb.Text = $v[1]
            if($tb.Text.length -gt 0){
                $pv.Text = &$Replace_AbbrevText -input_buffer($tb.Text)
                $pv.Text = Invoke-IterationPlacement $pv.Text 1
            }else{
                $pv.Text = Invoke-IterationPlacement "Screenshot_$($Project_TextBox.Text)-$($Bug_TextBox.Text)_$($Device_List.Text)_$($Branch_List.Text)_$($Build_TextBox.Text)" 1
            }
        }
        'Text'{
            $tb.Text = $v[2]
            if($tb.Text.length -gt 0){
                $pv.Text = &$Replace_AbbrevText -input_buffer($tb.Text)
                $pv.Text = Invoke-IterationPlacement $pv.Text 1
            }else{
                $pv.Text = Invoke-IterationPlacement "PROJ_$($Project_TextBox.Text)-$($Bug_TextBox.Text)_$($Build_TextBox.Text)" 1
            }
        }
        'INI'{
            $tb.Text = $v[3]
            if($tb.Text.length -gt 0){
                $pv.Text = &$Replace_AbbrevText -input_buffer($tb.Text)
                $pv.Text = Invoke-IterationPlacement $pv.Text 1
            }else{
                $pv.Text = Invoke-IterationPlacement "PROJ_$($Project_TextBox.Text)-$($Bug_TextBox.Text)_$($Build_TextBox.Text)" 1
            }
        }
        'Log'{
            $tb.Text = $v[4]
            if($tb.Text.length -gt 0){
                $pv.Text = &$Replace_AbbrevText -input_buffer($tb.Text)
                $pv.Text = Invoke-IterationPlacement $pv.Text 1
            }else{
                $pv.Text = Invoke-IterationPlacement "PROJ_$($Project_TextBox.Text)-$($Bug_TextBox.Text)_$($Build_TextBox.Text)" 1
            }
        }
        'CFG'{
            $tb.Text = $v[5]
            if($tb.Text.length -gt 0){
                $pv.Text = &$Replace_AbbrevText -input_buffer($tb.Text)
                $pv.Text = Invoke-IterationPlacement $pv.Text 1
            }else{
                $pv.Text = Invoke-IterationPlacement "PROJ_$($Project_TextBox.Text)-$($Bug_TextBox.Text)_$($Build_TextBox.Text)" 1
            }
        }
        'Config'{
            $tb.Text = $v[6]
            if($tb.Text.length -gt 0){
                $pv.Text = &$Replace_AbbrevText -input_buffer($tb.Text)
                $pv.Text = Invoke-IterationPlacement $pv.Text 1
            }else{
                $pv.Text = Invoke-IterationPlacement "PROJ_$($Project_TextBox.Text)-$($Bug_TextBox.Text)_$($Build_TextBox.Text)" 1
            }
        }
        Default {
            $cb.SelectedIndex 	= 0
            $tb.Text = ""
            $pv.Text = ""
            $tb.Enabled = $False
        }
    }
}

$save_event = {
    param([System.Windows.Forms.TextBox] $tb, [System.Windows.Forms.ComboBox] $cb, [string[]] $v ,[System.Windows.Forms.TextBox]$pv)
    $tb.Text = $tb.Text.Trim(" ")
    switch($cb.Text){
        'Video'{
            $v[0] = $tb.Text
        }
        'Pictures'{
            $v[1] = $tb.Text
        }
        'Text'{
            $v[2] = $tb.Text
        }
        'INI'{
            $v[3] = $tb.Text
        }
        'Log'{
            $v[4] = $tb.Text
        }
        'CFG'{
            $v[5] = $tb.Text
        }
        'Config'{
            $v[6] = $tb.Text
        }
        Default {
            $tb.Text = ""
            $pv.Text = ""
        }
    }
}

$Text_Limit = {
    param([System.Windows.forms.TextBox]$obj,[string]$abr)
        if($([system.string]::Concat($obj.Text,$abr)).Length -lt 256){
            if($obj.SelectionStart -eq $obj.Text.Length){
                $obj.Text = [system.string]::Concat($obj.Text,$abr)
            }else{
                [string] $left = $($obj.Text.SubString(0,$obj.SelectionStart)).Trim(" ")
                [string] $right = $($obj.Text.SubString([int]$($obj.SelectionStart))).Trim(" ")
                $obj.Text = [system.string]::Concat($left,$abr,$right)
            }
            return $obj.Text
    }
    else{
        return $obj.Text
    }
}

$file_tmi_open_1_click = {
    &$tmi_load_event;
    if($profile_tmi_jira.Checked){
        &$load_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Preset_values -pv $Preview_TextBox
    }else{
        &$load_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Regress_values -pv $Preview_TextBox
    }
}

$form_load = {
    if($profile_tmi_jira.Checked){
        &$load_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Preset_values -pv $Preview_TextBox
    }else{
        &$load_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Regress_values -pv $Preview_TextBox
    }
}

$file_tmi_save_1_click = {
    &$retain_values
    &$tmi_save_event
}

$file_tmi_saveas_1_click = {
    &$retain_values
    &$tmi_saveas_event
}

$profile_tmi_jira_click = {
    $profile_tmi_regression.Checked = $False
    $profile_tmi_jira.Checked = $True
    &$load_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Preset_values -pv $Preview_TextBox
}

$profile_tmi_regression_click = {
    $profile_tmi_regression.Checked = $True
    $profile_tmi_jira.Checked = $False
    &$load_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Regress_values -pv $Preview_TextBox
}

$settings_tmi_clear_1_click = {
    $Rename_TextBox.Text = ""
    if($profile_tmi_jira.Checked){
        &$save_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Preset_values -pv $Preview_TextBox
        &$load_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Preset_values -pv $Preview_TextBox
    }else{
        &$save_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Regress_values -pv $Preview_TextBox
        &$load_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Regress_values -pv $Preview_TextBox
    }
    $Rename_TextBox.SelectionStart = $Rename_TextBox.Text.Length
}

$settings_tmi_clearall_1_click = {
    $Rename_TextBox.Text = ""
    if($profile_tmi_jira.Checked){
        $global:Preset_values = &$clear_it -v $global:Preset_values
        &$save_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Preset_values -pv $Preview_TextBox
        &$load_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Preset_values -pv $Preview_TextBox
    }else{
        $global:Regress_values = &$clear_it -v $global:Regress_values
        &$save_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Regress_values -pv $Preview_TextBox
        &$load_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Regress_values -pv $Preview_TextBox
    }
    $Rename_TextBox.SelectionStart = $Rename_TextBox.Text.Length
}

$clear_it = {
    param([string[]] $v)
    for([int]$i = 0; $i -lt $v.length;$i++){
        $v[$i] = ""
    }
    return $v
}

$Type_ComboBox_SelectedIndexChanged = {
    if($profile_tmi_jira.Checked){
        &$load_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Preset_values -pv $Preview_TextBox
    }else{
        &$load_event -tb $Rename_TextBox -cb $Type_ComboBox -v $global:Regress_values -pv $Preview_TextBox
    }
}

$Rename_TextBox_keydown = {
    &$key_event -obj $_
    if($_.KeyCode -eq "Enter"){
        &$retain_values
    }
}

$Rename_Field_Button_click = {
    param([string] $field)
    $Rename_TextBox.Text = &$Text_Limit -obj $Rename_TextBox -abr $field
    $Preview_TextBox.Text = Invoke-IterationPlacement $(&$Replace_AbbrevText -input_buffer $Rename_TextBox.Text) 1
    $Rename_TextBox.SelectionStart = $Rename_TextBox.Text.Length
}

$jira_option_selected = {
    $profile_tmi_regression.Checked = $False
    $profile_tmi_jira.Checked = $True
    #$File_Rename_Form.ShowDialog()
}

$regression_option_selected = {
    $profile_tmi_regression.Checked = $True
    $profile_tmi_jira.Checked = $False
    #$File_Rename_Form.ShowDialog()
}