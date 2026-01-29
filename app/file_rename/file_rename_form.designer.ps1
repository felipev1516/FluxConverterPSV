Add-Type -assembly System.Windows.Forms
Add-Type -assembly System.Drawing

$icon_directory = "$(Get-RootDirectory)\assets\icons"
$supported_file_types = (Get-Content "$config_path\supported_file_types.cfg")

# File Rename Form
$File_Rename_Form =  New-Object System.Windows.Forms.Form -Property @{
    Text = "Label Editor"
    Size = "620,240"
    FormBorderStyle = "Fixed3D"
    MaximizeBox = $false
    Visible = $false
    StartPosition = "CenterScreen"
    Icon = "$icon_directory\flux_cap_logo.ico"
}
$File_Rename_Form.Add_Load({&$form_load})
#$File_Rename_Form.Add_Shown($File_Rename_Form_Shown)
$File_Rename_Form.Add_Click({&$retain_values})

# Rename Form Menu Strip
$File_Rename_mst = New-Object System.Windows.Forms.MenuStrip -Property @{
    Width = $File_Rename_Form.Width
    Height = 24
    GripStyle = "Visible"
}
# File
$mst_tmi_file = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "File"
}

# Load Text Files
$file_tmi_open_1 = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Load Text Fields"
    ShortcutKeys = "Ctrl + O"
};$file_tmi_open_1.Add_Click({&$file_tmi_open_1_click})

# Save
$file_tmi_save_1 = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Save"
    ShortcutKeys = "Ctrl + S"
};$file_tmi_save_1.Add_Click({&$file_tmi_save_1_click})

# Save As
$file_tmi_saveas_1 = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Save As"
    ShortcutKeys = "Ctrl + Shift + S"
};$file_tmi_saveas_1.Add_Click({&$file_tmi_saveas_1_click})

$file_tmi_sep_1 = New-Object System.Windows.Forms.ToolStripSeparator

$file_tmi_exit_1 = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Exit"
    ShortcutKeys = "Alt, F4"
};$file_tmi_exit_1.Add_Click({&$File_Rename_Form.Close()})

$mst_tmi_file.DropDownItems.AddRange(@($file_tmi_open_1;$file_tmi_save_1;$file_tmi_saveas_1;$file_tmi_sep_1;$file_tmi_exit_1))

$mst_tmi_profile = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Profile"
}

$profile_tmi_jira = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "New Ticket"
};$profile_tmi_jira.Add_Click({&$profile_tmi_jira_click})

$profile_tmi_regression = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Verify"
};$profile_tmi_regression.Add_Click({&$profile_tmi_regression_click})

$mst_tmi_profile.DropDownItems.AddRange(@($profile_tmi_jira,$profile_tmi_regression))

$mst_tmi_settings = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Settings"
}

$settings_tmi_clear_1 = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Clear"
};$settings_tmi_clear_1.Add_Click({&$settings_tmi_clear_1_click})

$settings_tmi_sep_1 = New-Object System.Windows.Forms.ToolStripSeparator 

$settings_tmi_clearall_1 = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Clear All"
};$settings_tmi_clearall_1.Add_Click({&$settings_tmi_clearall_1_click})

$mst_tmi_settings.DropDownItems.AddRange(@($settings_tmi_clear_1,$settings_tmi_sep_1,$settings_tmi_clearall_1))

$File_Rename_mst.Items.AddRange(@($mst_tmi_file,$mst_tmi_profile,$mst_tmi_settings))

$Preview_Label = New-Object System.Windows.Forms.Label -Property @{
    Text = "Preview:"
    TextAlign = "MiddleCenter"
    Font = "Microsoft Aldhabi, 11"
    Location = "115,40"
    Visible = $True
    Size = "75,21"
}

$Preview_TextBox = New-Object System.Windows.Forms.TextBox -Property @{
    Text = ""
    Font = "Microsoft Aldhabi, 8"
    Location = "190,40"
    Visible = $True
    Size = "310,23"
    ReadOnly = $True
}

$Type_Label = New-Object System.Windows.Forms.Label -Property @{
    Text = "Type:"
    TextAlign = "MiddleCenter"
    Font = "Microsoft Aldhabi, 11"
    Location = "50,63"
    Visible = $True
    Size = "50,25"
}

$Type_ComboBox = New-Object System.Windows.Forms.ComboBox -Property @{
    Width = 75
    AutoSize = $True
    Font = "Microsoft Aldhabi, 8"
    Location = "100,65"
    Visible = $True
}
@('- Select -') + $supported_file_types | %{$Type_ComboBox.Items.Add($_)}
$Type_ComboBox.SelectedIndex = 0
$Type_ComboBox.MaxDropDownItems = 4
$Type_ComboBox.Add_SelectedIndexChanged({&$Type_ComboBox_SelectedIndexChanged})
$Type_ComboBox.Add_Click({&$retain_values})

$Rename_TextBox = New-Object System.Windows.Forms.TextBox -Property @{
    Text = ""
    Font = "Microsoft Aldhabi, 8"
    Location = "190,65"
    Visible = $True
    Size = "310,23"
};$Rename_TextBox.Add_Keydown({&$Rename_TextBox_keydown})

$Rename_Project_Label = New-Object System.Windows.forms.Label -Property @{
    Text = "Project:"
    Location = "25,95"
    Size = "65,28"
    Font = "Microsoft Aldhabi, 11"
    Visible = $True
    TextAlign = "MiddleCenter"
}

$Rename_Project_TextBox = New-Object System.Windows.Forms.TextBox -Property @{
    Text = ""
    Font = "Microsoft Aldhabi, 9"
    Location = "90,100"
    Visible = $True
    Size = "50,23"
    ReadOnly = $False

};$Rename_Project_TextBox.Add_Keydown({&$Rename_TextBox_keydown})

$Rename_Project_Button = New-Object System.Windows.Forms.Button -Property @{
    Text = ""
    Font = "Microsoft Aldhabi, 9"
    Location = "145,98"
    Visible = $True
    Size = "30,25"
    Image = [System.Drawing.Image]::FromFile("$icon_directory\add_icon_16_16_px.png")
    ImageAlign = "MiddleCenter"
    Enabled = $True
};$Rename_Project_Button.Add_Click({&$Rename_Field_Button_click -field "{project}"})

$Rename_Increment_Label = New-Object System.Windows.forms.Label -Property @{
    Text = "Increment:"
    Location = "185,96"
    Size = "80,28"
    Font = "Microsoft Aldhabi, 11"
    Visible = $True
    TextAlign = "MiddleCenter"
}

$Rename_Increment_TextBox = New-Object System.Windows.Forms.TextBox -Property @{
    Text = "1"
    Font = "Microsoft Aldhabi, 9"
    Location = "265,100"
    Visible = $True
    Size = "30,20"
    ReadOnly = $True
}

$Rename_Increment_Button = New-Object System.Windows.Forms.Button -Property @{
    Font = "Microsoft Aldhabi, 9"
    Location = "300,95"
    Visible = $True
    Size = "30,25"
    Image = [System.Drawing.Image]::FromFile("$icon_directory\add_icon_16_16_px.png")
    ImageAlign = "MiddleCenter"
    Enabled = $True
};$Rename_Increment_Button.Add_Click({&$Rename_Field_Button_click -field "{#}"})

$Rename_Bug_Label = New-Object System.Windows.forms.Label -Property @{
    Text = "Bug #:"
    Location = "45,125"
    Size = "60,30"
    Font = "Microsoft Aldhabi, 11"
    Visible = $True
    TextAlign = "MiddleCenter"
}

$Rename_Bug_TextBox = New-Object System.Windows.Forms.TextBox -Property @{
    Text = ""
    Font = "Microsoft Aldhabi, 9"
    Location = "115,127"
    Visible = $True
    Size = "100,23"
    ReadOnly = $False
};$Rename_Bug_Textbox.Add_KeyDown({&$Rename_TextBox_keydown})

$Rename_Bug_Button = New-Object System.Windows.Forms.Button -Property @{
    Text = ""
    Font = "Microsoft Aldhabi, 9"
    Location = "220,123"
    Visible = $True
    Size = "30,25"
    Image = [System.Drawing.Image]::FromFile("$icon_directory\add_icon_16_16_px.png")
    ImageAlign = "MiddleCenter"
    Enabled = $True
};$Rename_Bug_Button.Add_Click({&$Rename_Field_Button_click -field "{bug}"})

$Rename_Device_Label = New-Object System.Windows.forms.Label -Property @{
    Text = "Device:"
    Location = "45,150"
    Size = "65,30"
    Font = "Microsoft Aldhabi, 11"
    Visible = $True
    TextAlign = "MiddleCenter"
}

$Rename_Device_TextBox = New-Object System.Windows.Forms.TextBox -Property @{
    Text = ""
    Font = "Microsoft Aldhabi, 9"
    Location = "115,153"
    Visible = $True
    Size = "100,23"
    ReadOnly = $False
};$Rename_Device_Textbox.Add_KeyDown({&$Rename_TextBox_keydown})

$Rename_Device_Button = New-Object System.Windows.Forms.Button -Property @{
    Text = ""
    Font = "Microsoft Aldhabi, 9"
    Location = "220,152"
    Visible = $True
    Size = "30,25"
    Image = [System.Drawing.Image]::FromFile("$icon_directory\add_icon_16_16_px.png")
    ImageAlign = "MiddleCenter"
    Enabled = $True
};$Rename_Device_Button.Add_Click({&$Rename_Field_Button_click -field "{device}"})

$Rename_Branch_Label = New-Object System.Windows.forms.Label -Property @{
    Text = "Branch:"
    Location = "335,95"
    Size = "65,30"
    Font = "Microsoft Aldhabi, 11"
    Visible = $True
    TextAlign = "MiddleCenter"
}

$Rename_Branch_TextBox = New-Object System.Windows.Forms.TextBox -Property @{
    Text = ""
    Font = "Microsoft Aldhabi, 9"
    Location = "400,100"
    Visible = $True
    Size = "100,23"
};$Rename_Branch_Textbox.Add_KeyDown({&$Rename_TextBox_keydown})

$Rename_Branch_Button = New-Object System.Windows.Forms.Button -Property @{
    Text = ""
    Font = "Microsoft Aldhabi, 9"
    Location = "505,95"
    Visible = $True
    Size = "30,25"
    Image = [System.Drawing.Image]::FromFile("$icon_directory\add_icon_16_16_px.png")
    ImageAlign = "MiddleCenter"
    Enabled = $True
};$Rename_Branch_Button.Add_Click({&$Rename_Field_Button_click -field "{branch}"})

$Rename_Build_Label = New-Object System.Windows.forms.Label -Property @{
    Text = "Build:"
    Location = "340,125"
    Size = "60,30"
    Font = "Microsoft Aldhabi, 11"
    Visible = $True
    TextAlign = "MiddleCenter"
}

$Rename_Build_TextBox = New-Object System.Windows.Forms.TextBox -Property @{
    Text = ""
    Font = "Microsoft Aldhabi, 9"
    Location = "400,127"
    Visible = $True
    Size = "100,23"
};$Rename_Build_Textbox.Add_KeyDown({&$Rename_TextBox_keydown})

$Rename_Build_Button = New-Object System.Windows.Forms.Button -Property @{
    Text = ""
    Font = "Microsoft Aldhabi, 9"
    Location = "505,123"
    Visible = $True
    Size = "30,25"
    Image = [System.Drawing.Image]::FromFile("$icon_directory\add_icon_16_16_px.png")
    ImageAlign = "MiddleCenter"
    Enabled = $True
};$Rename_Build_Button.Add_Click({&$Rename_Field_Button_click -field "{build}"})

$Rename_COM_Label = New-Object System.Windows.forms.Label -Property @{
    Text = "Computer Name:"
    Location = "270,154"
    Size = "125,22"
    Font = "Microsoft Aldhabi, 11"
    Visible = $True
    TextAlign = "MiddleCenter"
}

$Rename_COM_TextBox = New-Object System.Windows.Forms.TextBox -Property @{
    Text = ""
    Font = "Microsoft Aldhabi, 9"
    Location = "400,153"
    Visible = $True
    Size = "100,23"
    ReadOnly = $True
}

$Rename_COM_Button = New-Object System.Windows.Forms.Button -Property @{
    Text = ""
    Font = "Microsoft Aldhabi, 9"
    Location = "505,150"
    Visible = $True
    Size = "30,25"
    Image = [System.Drawing.Image]::FromFile("$icon_directory\add_icon_16_16_px.png")
    ImageAlign = "MiddleCenter"
    Enabled = $True
};$Rename_COM_Button.Add_Click({&$Rename_Field_Button_click -field "{computername}"})

# File Renaming Form
$File_Rename_Form.Controls.Add($File_Rename_mst)
$File_Rename_Form.Controls.Add($Preview_Label)
$File_Rename_Form.Controls.Add($Preview_TextBox)
$File_Rename_Form.Controls.Add($Type_Label)
$File_Rename_Form.Controls.Add($Type_ComboBox)
$File_Rename_Form.Controls.Add($Rename_TextBox)
$File_Rename_Form.Controls.Add($Rename_Add_Button)
$File_Rename_Form.Controls.Add($Rename_Delete_Button)
$File_Rename_Form.Controls.Add($Rename_Project_Label)
$File_Rename_Form.Controls.Add($Rename_Project_TextBox)
$File_Rename_Form.Controls.Add($Rename_Project_Button)
$File_Rename_Form.Controls.Add($Rename_Increment_Label)
$File_Rename_Form.Controls.Add($Rename_Increment_TextBox)
$File_Rename_Form.Controls.Add($Rename_Increment_Button)
$File_Rename_Form.Controls.Add($Rename_Branch_Label)
$File_Rename_Form.Controls.Add($Rename_Branch_TextBox)
$File_Rename_Form.Controls.Add($Rename_Branch_Button)
$File_Rename_Form.Controls.Add($Rename_Bug_Label)
$File_Rename_Form.Controls.Add($Rename_Bug_TextBox)
$File_Rename_Form.Controls.Add($Rename_Bug_Button)
$File_Rename_Form.Controls.Add($Rename_Build_Label)
$File_Rename_Form.Controls.Add($Rename_Build_TextBox)
$File_Rename_Form.Controls.Add($Rename_Build_Button)
$File_Rename_Form.Controls.Add($Rename_Device_Label)
$File_Rename_Form.Controls.Add($Rename_Device_TextBox)
$File_Rename_Form.Controls.Add($Rename_Device_Button)
$File_Rename_Form.Controls.Add($Rename_COM_Label)
$File_Rename_Form.Controls.Add($Rename_COM_TextBox)
$File_Rename_Form.Controls.Add($Rename_COM_Button)
