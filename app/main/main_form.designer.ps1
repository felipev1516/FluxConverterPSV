# Main Form
$main_form = New-Object System.Windows.Forms.Form -Property @{
    Text = "Flux Converter"
    Size = "410,300"
    Font = "Segoe UI"
    StartPosition = "CenterScreen"
    FormBorderStyle = "Fixed3D"
    MaximizeBox = $false
    Icon = "$(Get-RootDirectory)\assets\icons\flux_cap_logo.ico"
    KeyPreview = $true
}
# Main Form Events
$main_form.Add_Activated($gui_refresh)
$main_form.Add_Shown($gui_refresh)
$main_form.Add_MouseClick($clear_selections)
$main_form.Add_MouseEnter($gui_refresh)
$main_form.Add_Deactivate($gui_refresh)
$main_form.Add_KeyDown($form_keystrokes)
$main_form.Add_FormClosing($form_closing)
$main_form.Add_Load($form_loading)

# msi - Menu Strip
# tmi - Tool Menu Item
#Main Form Menu Strip
$main_mst = New-Object System.Windows.Forms.MenuStrip -Property @{
    Width = $main_form.Width
    Height = 24
    GripStyle = "Visible"
}

#File
$main_tmi_file = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "File"
}

#Load Text Fields
$file_tmi_load = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Load Text Fields"
    ShortcutKeys = "Ctrl + O"
}; $file_tmi_load.Add_Click($tmi_load_event)

#Open Media Files
$file_tmi_open = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Open Media Files"
    ShortcutKeys = "Ctrl + Shift + O"
}; $file_tmi_open.Add_Click($tmi_open_event)

#save
$file_tmi_save = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Save"
    ShortcutKeys = "Ctrl + S"
}; $file_tmi_save.Add_click($tmi_save_event)

#save as
$file_tmi_saveas = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Save As"
    ShortcutKeys = "Ctrl + Shift + S"
}; $file_tmi_saveas.Add_click($tmi_saveas_event)

#separators
#light
$file_tmi_sep_light = New-Object System.Windows.Forms.ToolStripSeparator -Property @{
    Name = "file_tmi_sep_light"
}
#dark
$file_tmi_sep_dark = &$dark_theme_ToolStripSeperator -compare_object $file_tmi_saveas -name "file_tmi_sep_dark"
    
#exit 
$file_tmi_exit = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Exit"
    ShortcutKeys = "Alt, F4"
}; $file_tmi_exit.Add_Click({$main_form.Close()})

#Adding ToolStripItems into menu strip
@($file_tmi_load,$file_tmi_open,$file_tmi_save,$file_tmi_saveas,$file_tmi_sep_light,$file_tmi_sep_dark,$file_tmi_exit) | %{$main_tmi_file.DropDownItems.Add($_)}

#Rename format
$main_tmi_format = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Rename Format"
}; $main_tmi_format.Add_DropDownItemClicked($check_inputs)

#Jira / Regression
$format_tmi_jira_regress = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "New Ticket / Verify"
}; $format_tmi_jira_regress.Add_Click($hide_custom_ui)

#Custom
$format_tmi_custom = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Custom Label"
}; $format_tmi_custom.Add_Click($hide_base_ui)

#None
$format_tmi_none = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Keep Original Label"
}; $format_tmi_none.Add_Click($disable_base_custom_ui)

#separator
#light
$format_tmi_sep_light = New-Object System.Windows.Forms.ToolStripSeparator -Property @{
    Name = "format_tmi_sep_light"
}
#dark
$format_tmi_sep_dark = &$dark_theme_ToolStripSeperator -compare_object $format_tmi_none -name "format_tmi_sep_dark"

#Reset
$format_tmi_reset = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Reset All"
}; $format_tmi_reset.Add_Click($format_tmi_reset_click)

@($format_tmi_jira_regress, $format_tmi_custom,$format_tmi_none,$format_tmi_sep_light,$format_tmi_sep_dark,$format_tmi_reset) | %{$main_tmi_format.DropDownItems.Add($_)}

#Settings
$main_tmi_settings = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Settings"
}
#Change Renaming Format
$settings_tmi_theme = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Theme"
}

#Light
$theme_tmi_light = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Light"
}; $theme_tmi_light.Add_Click($light_theme)

#Dark
$theme_tmi_dark = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Dark"
}; $theme_tmi_dark.Add_Click($dark_theme)

$settings_tmi_theme.DropDownItems.AddRange(@($theme_tmi_light,$theme_tmi_dark))

#Settings - Seperator 1
#light
$settings_tmi_sep_1_light = New-Object System.Windows.Forms.ToolStripSeparator -Property @{
    Name = "settings_tmi_sep_1_light"
}
#dark
$settings_tmi_sep_1_dark = &$dark_theme_ToolStripSeperator -compare_object $settings_tmi_theme -name "settings_tmi_sep_1_dark"

#Change Renaming Format
$settings_tmi_crf = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Change Renaming Format"
}

#Change Renaming Format - Jira
$crf_tmi_jira = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "New Ticket"
}; $crf_tmi_jira.Add_Click($crf_tmi_jira_click) # This is going to call the file_rename_form.events.ps1 function

#Change Renaming Format - Regression
$crf_tmi_regress = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Verify"
}; $crf_tmi_regress.Add_Click($crf_tmi_regress_click) # This is going to call the file_rename_form.events.ps1 function

$settings_tmi_crf.DropDownItems.AddRange(@($crf_tmi_jira,$crf_tmi_regress))

#Change Output Extentions
$settings_tmi_coe = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Change Output Extentions"
}

#Change Output Extentions - Video Extentions
$coe_tmi_video = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Video"
}

$video_tmi_mp4 = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "MP4"
    Checked = $False
}; $video_tmi_mp4.Add_Click($MP4)

$video_tmi_mov = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "MOV"
    Checked = $False
}; $video_tmi_mov.Add_Click($MOV)

$video_tmi_mkv = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "MKV"
    Checked = $False
}; $video_tmi_mkv.Add_Click($MKV)

$video_tmi_avi = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "AVI"
    Checked = $False
}; $video_tmi_avi.Add_Click($AVI)

$video_tmi_sep_light = New-Object System.Windows.Forms.ToolStripSeparator -Property @{
    Name = "video_tmi_sep_light"
}

$video_tmi_sep_dark = &$dark_theme_ToolStripSeperator -compare_object $video_tmi_avi -name "video_tmi_sep_dark"

$video_tmi_none = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "No Change"
    Checked = $False
}; $video_tmi_none.Add_Click($V_None)

$coe_tmi_video.DropDownItems.AddRange(@($video_tmi_mp4,$video_tmi_mov,$video_tmi_mkv,$video_tmi_avi,$video_tmi_sep_light,$video_tmi_sep_dark,$video_tmi_none))

#Change Output Extentions - Picture Extentions
$coe_tmi_pic = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Pictures"
}

$pic_tmi_jpg = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "JPG"
}; $pic_tmi_jpg.Add_Click($JPG)

$pic_tmi_jpeg = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "JPEG"
}; $pic_tmi_jpeg.Add_Click($JPEG)

$pic_tmi_png = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "PNG"
}; $pic_tmi_png.Add_Click($PNG)

$pic_tmi_sep_light = New-Object System.Windows.Forms.ToolStripSeparator -Property @{
    Name = "pic_tmi_sep_light"
}
$pic_tmi_sep_dark = &$dark_theme_ToolStripSeperator -compare_object $pic_tmi_png -name "pic_tmi_sep_dark"

$pic_tmi_none = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "No Change"
    Checked = $False
}; $pic_tmi_none.Add_Click($P_None)

$coe_tmi_pic.DropDownItems.Addrange(@($pic_tmi_jpg,$pic_tmi_jpeg,$pic_tmi_png,$pic_tmi_sep_light,$pic_tmi_sep_dark,$pic_tmi_none))

#Change Output Extentions -Text Extention
$coe_tmi_text = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Text"
}

$text_tmi_text = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "TXT"
}; $text_tmi_text.Add_Click($TEXT)

$text_tmi_log = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "LOG"
}; $text_tmi_log.Add_Click($LOG)

$text_tmi_ini = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "INI"
}; $text_tmi_ini.Add_Click($INI)

$text_tmi_cfg = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "CFG"
}; $text_tmi_cfg.Add_Click($CFG)

$text_tmi_config = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "CONFIG"
}; $text_tmi_config.Add_Click($CONFIG)

$text_tmi_sep_light = New-Object System.Windows.Forms.ToolStripSeparator -Property @{
    Name = "text_tmi_sep_light"
}

$text_tmi_sep_dark = &$dark_theme_ToolStripSeperator -compare_object $text_tmi_config -name "text_tmi_sep_dark"

$text_tmi_none = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "No Change"
}; $text_tmi_none.Add_Click($T_None)

$coe_tmi_text.DropDownItems.AddRange(@($text_tmi_text,$text_tmi_log,$text_tmi_ini,$text_tmi_cfg,$text_tmi_config,$text_tmi_sep_light,$text_tmi_sep_dark,$text_tmi_none))
$settings_tmi_coe.DropDownItems.AddRange(@($coe_tmi_video,$coe_tmi_pic,$coe_tmi_text))

#In-Development 1/29/2026
#Settings - Backup
$settings_tmi_backup = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Save A Backup"
}

#Backup - Yes 
$backup_tmi_yes = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Yes"
    ToolTipText = "Save a copy of your pre-fluxed files `n(Located in saved_files folder in Flux Converter directory)"
};$backup_tmi_yes.Add_Click($backup_yes_click)

#Backup - No
$backup_tmi_no = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "No"
};$backup_tmi_no.Add_Click($backup_no_click)

$settings_tmi_backup.DropDownItems.AddRange((@($backup_tmi_yes,$backup_tmi_no)))

#Settings - Seperator 2
$settings_tmi_sep_2_light = New-Object System.Windows.Forms.ToolStripSeparator -Property @{
    Name = "settings_tmi_sep_2_light"
}
$settings_tmi_sep_2_dark = &$dark_theme_ToolStripSeperator -compare_object $settings_tmi_backup -name "settings_tmi_sep_2_dark"
#Settings - Check For Update
$settings_tmi_cfu = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Check For Update"
}; $settings_tmi_cfu.Add_Click($Check_For_Update)

#Settings - Patch Notes
$settings_tmi_patch = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Patch Notes"
}; $settings_tmi_patch.Add_Click($patch_option_click)

#Settings - Help
$settings_tmi_help = New-Object System.Windows.Forms.ToolStripMenuItem -Property @{
    Text = "Help"
}; $settings_tmi_help.Add_Click($help_option_click)

@(
    $settings_tmi_theme,
    $settings_tmi_sep_1_light,
    $settings_tmi_sep_1_dark,
    $settings_tmi_crf,
    $settings_tmi_coe,
    $settings_tmi_cfu,
    $settings_tmi_backup,
    $settings_tmi_sep_2_light,
    $settings_tmi_sep_2_dark,
    $settings_tmi_patch,
    $settings_tmi_help
    ) | %{$main_tmi_settings.DropDownItems.Add($_)}

@($main_tmi_file,$main_tmi_format,$main_tmi_settings) | %{$main_mst.Items.Add($_)}

#Tooltip for Mouse Cursor
$Tooltip = New-Object System.Windows.Forms.ToolTip -Property @{
    AutoPopDelay  = 5000
    InitialDelay  = 1000
    ReshowDelay   = 500
    ShowAlways    = $true
}

#Drop Box
$DropBox = New-Object System.Windows.Forms.ListBox -Property @{
    Location            = New-Object System.Drawing.Point(385,40)
    Width               = 200
    Height              = 205
    IntegralHeight      = $True
    AllowDrop           = $True
    HorizontalScrollbar = $True
    SelectionMode       = "MultiExtended"
    Visible             = $False
    BackColor = "Control"
}

# Drop Prompt (Drop File Icon)
$Drop_Prompt = New-Object System.Windows.Forms.PictureBox -Property @{
    Image     = [System.Drawing.Image]::FromFile("$PSScriptroot\..\..\assets\icons\Drop_File_Icon.png")
    Size      = New-Object System.Drawing.Point(150,210)
    BackColor = "Control"
    Visible   = $False
    AllowDrop = $True
}

$DropBox.Add_KeyDown($DropBox_KeyDown)
$DropBox.add_DragEnter($DropBox_DragEnter)
$DropBox.add_DragOver($DropBox_DragOver)
$DropBox.add_DragDrop($DropBox_DragDrop)

#Clear Drop Box Button
$Clear_Drop_Button = New-Object System.Windows.Forms.Button -Property @{
    Size       = New-Object System.Drawing.Size(30,30)
    Location   = New-Object System.Drawing.Point(350,40)
    Image      = [System.Drawing.Image]::FromFile("$PSScriptroot\..\..\assets\icons\reset_icon_16_16_px.png")
    ImageAlign = [System.Drawing.ContentAlignment]::MiddleCenter
    FlatStyle  = "Standard"
    Visible    = $False
}; $Clear_Drop_Button.Add_MouseClick($clear_dropbox_click)
$Tooltip.SetToolTip($Clear_Drop_Button,"Clear Drop Box List Contents (Ctrl + Shift + D)")

#Add Drop Box Button
$Add_Drop_Button = New-Object System.Windows.Forms.Button -Property @{
    Size       = New-Object System.Drawing.Size(30,30)
    Location   = New-Object System.Drawing.Point(350,75)
    Image      = [System.Drawing.Image]::FromFile("$PSScriptroot\..\..\assets\icons\add_icon_16_16_px.png")
    ImageAlign = [System.Drawing.ContentAlignment]::MiddleCenter
    FlatStyle  = "Standard"
    Visible    = $False
}
$Add_Drop_Button.Add_MouseClick($add_drop_button_click)
$Tooltip.SetToolTip($Add_Drop_Button,"Add Files to Drop Box (Ctrl + D)")

#Delete Drop Box Button
$Delete_Drop_Button = New-Object System.Windows.Forms.Button -Property @{
    Size       = New-Object System.Drawing.Size(30,30)
    Location   = New-Object System.Drawing.Point(350,110)
    Image      = [System.Drawing.Image]::FromFile("$PSScriptroot\..\..\assets\icons\minus_icon_16_16_px.png")
    ImageAlign = [System.Drawing.ContentAlignment]::MiddleCenter
    FlatStyle  = "Standard"
    Visible    = $False
}; $Delete_Drop_Button.Add_MouseClick($delete_dropbox_click)
$Tooltip.SetToolTip($Delete_Drop_Button,"Remove Files from Drop Box List (Ctrl + D)")

#Paint Button
$Paint_Button = New-Object System.Windows.Forms.Button -Property @{
    Size       = New-Object System.Drawing.Size(30,30)
    Location   = New-Object System.Drawing.Point(350,145)
    Image      = [System.Drawing.Image]::FromFile("$PSScriptroot\..\..\assets\icons\paint_icon_16_16_px.png")
    ImageAlign = [System.Drawing.ContentAlignment]::MiddleCenter
    FlatStyle  = "Standard"
    Visible    = $False
}; $Paint_Button.Add_MouseClick($ms_paint_event)
$Tooltip.SetToolTip($Paint_Button,"Open MS Paint (Ctrl + M)")

#Upload Button Pull up Drop Box
$Upload_Button = New-Object System.Windows.Forms.Button -Property @{
    Size       = New-Object System.Drawing.Size(30,30)
    Location   = New-Object System.Drawing.Point(335,40)
    Image      = [System.Drawing.Image]::FromFile("$PSScriptroot\..\..\assets\icons\upload_icon_16_16_px.png")
    ImageAlign = [System.Drawing.ContentAlignment]::MiddleCenter
    FlatStyle  = "Standard"
    Visible    = $True
}
$Tooltip.SetToolTip($Upload_Button, "Activate the File Drop Box")
$Upload_Button.Add_Click($Show_DropBox)

#Collapse button (Expand/Collapse) Removes Drop Box
$Collapse_Button = New-Object System.Windows.Forms.Button -Property @{
    Size       = New-Object System.Drawing.Size(30,30)
    Location   = New-Object System.Drawing.Point(310,40)
    Image      = [System.Drawing.Image]::FromFile("$PSScriptroot\..\..\assets\icons\collapse_icon_16_16_px.png")
    ImageAlign = [System.Drawing.ContentAlignment]::MiddleCenter
    FlatStyle  = "Standard"
    Visible    = $True
}
$Tooltip.SetToolTip($Collapse_Button,"Hide the File Drop Box")
$Collapse_Button.Add_Click($Hide_DropBox)

#Snipping Tool Button c:Windows\system32\SnippingTool.exe
$Snip_Button = New-Object System.Windows.Forms.Button -Property @{
    Size       = New-Object System.Drawing.Size(30,30)
    Location   = New-Object System.Drawing.Point(350,180)
    Image      = [System.Drawing.Image]::FromFile("$PSScriptroot\..\..\assets\icons\snip_icon_16_16_px.png")
    ImageAlign = [System.Drawing.ContentAlignment]::MiddleCenter
    FlatStyle  = "Standard"
    Visible    = $False
}; $Snip_Button.Add_MouseClick({snippingtool})
$Tooltip.SetToolTip($Snip_Button,"Open Snipping Tool")

###################### Jira Panel ################################################

$Jira_Panel = New-Object System.Windows.Forms.Panel -Property @{
    Size     = New-Object System.Drawing.Size(330,90)
    Location = New-Object System.Drawing.Point(15,35)
    Visible  = $True
}; $Jira_Panel.Add_MouseClick($clear_selections)

#Project Label
$Project_Label = New-Object System.Windows.Forms.Label -Property @{
    Text     = "Project:"
    Location = New-Object System.Drawing.Point(5,10)
    AutoSize = $False
    Font     = "Segoe UI, 11"
    Size     = New-Object System.Drawing.Size(63,22)
}; $Project_Label.Add_MouseClick($clear_selections)

#Project TextBox
$Project_TextBox = New-Object System.Windows.Forms.TextBox -Property @{
    Location = New-Object System.Drawing.Point(70,12)
    Size     = New-Object System.Drawing.Size(50,20)
    AutoSize = $False
    Text     = ""
    Font     = "Segoe UI, 9"
}

$Project_TextBox.Add_TextChanged($Project_TextBox_TextChanged)
$Project_TextBox.Add_KeyDown({ &$key_event -obj $Project_TextBox })

#Bug Label
$Bug_Label = New-Object System.Windows.Forms.Label -Property @{
    Text     = "Bug #:"
    Location = New-Object System.Drawing.Point(127,10)
    AutoSize = $False
    Font     = "Segoe UI, 11"
    Size     = New-Object System.Drawing.Size(55,20)
}; $Bug_Label.Add_MouseClick($clear_selections)

#Bug TextBox
$Bug_TextBox = New-Object System.Windows.Forms.TextBox -Property @{
    Location = New-Object System.Drawing.Point(182,10)
    Width    = 100
    AutoSize = $true
    Text     = ""
    Font     = "Segoe UI, 9"
}
$Bug_TextBox.Add_TextChanged($Bug_TextBox_TextChanged)
$Bug_TextBox.Add_KeyDown({ &$key_event -obj $Bug_TextBox })

#Device Label
$Device_Label = New-Object System.Windows.Forms.Label -Property @{
    Text     = "Device:"
    Location = New-Object System.Drawing.Point(5,37)
    AutoSize = $true
    Font     = "Segoe UI, 11"
    Size     = New-Object System.Drawing.Size(60,22)
}
$Device_Label.Add_MouseClick($clear_selections)

#Device List ComboBox
$Device_List = New-Object System.Windows.Forms.ComboBox -Property @{
    Width            = 100
    AutoSize         = $true
    Font             = "Segoe UI, 9"
    Location         = New-Object System.Drawing.Point(70,37)
    MaxDropDownItems = 5
}
$Device_List.Add_TextChanged($check_inputs)
$Device_List.Add_KeyDown({ &$key_event -obj $Device_List })

#Verify Label
$verify_lbl = New-Object System.Windows.Forms.Label -Property @{
    Text     = "Verify:"
    Font     = "Segoe UI, 11"
    Size     = New-object System.Drawing.Size(55,20)
    Location = New-Object System.Drawing.Point(178,35)
}; $verify_lbl.Add_MouseClick($clear_selections)

#Verify Checkbox
$verify_cbx = New-Object System.Windows.Forms.CheckBox -Property @{
    Size     = New-object System.Drawing.Size(22,20)
    Location = New-Object System.Drawing.Point(233,37)
}; $verify_cbx.Add_CheckedChanged($check_inputs)

#Verify Info PictureBox
$ver_info_pbx = New-Object System.Windows.Forms.PictureBox -Property @{
    Size     = New-object System.Drawing.Size(23,18)
    Location = New-Object System.Drawing.Point(254,38)
    Image    = [System.Drawing.Image]::FromFile("$PSScriptRoot\..\..\assets\icons\question_mark_icon_16_16_px.png")
}
$Tooltip.SetToolTip($ver_info_pbx, "Place a custom verify name on media `nExample: New_Media_1234_VO")

#Build Label
$Branch_Label = New-Object System.Windows.Forms.Label -Property @{
    Text     = "Branch:"
    Location = New-Object System.Drawing.Point(5,63)
    AutoSize = $true
    Font     = "Segoe UI, 11"
}; $Branch_Label.Add_MouseClick($clear_selections)

#Branch List ComboBox
$Branch_List = New-Object System.Windows.Forms.ComboBox -Property @{
    Text             = ""
    Width            = 100
    AutoSize         = $true
    MaxDropDownItems = 5
    Font             = "Segoe UI, 9"
    Location         = New-Object System.Drawing.Point(70,65)
}
$Branch_List.Add_TextChanged($check_inputs)
$Branch_List.Add_KeyDown({ &$key_event -obj $Branch_List })

#Build Label
$Build_Label = New-Object System.Windows.Forms.Label -Property @{
    Text     = "Build:"
    Location = New-Object System.Drawing.Point(172,63)
    AutoSize = $true
    Font     = "Segoe UI, 11"
}; $Build_Label.Add_MouseClick($clear_selections)

#Build Textbox
$Build_TextBox = New-Object System.Windows.Forms.TextBox -Property @{
    Location = New-Object System.Drawing.Point(220,63)
    Width    = 100
    AutoSize = $true
    Text     = ""
    Font     = "Segoe UI, 9"
}
$Build_TextBox.Add_TextChanged($Build_TextBox_TextChanged)
$Build_TextBox.Add_KeyDown({ &$key_event -obj $Build_TextBox })

##################### Custom Panel ################################################

# Custom Panel
$Custom_Panel = New-Object System.Windows.Forms.Panel -Property @{
    Size     = New-Object System.Drawing.Size(330,90)
    Location = New-Object System.Drawing.Point(15,35)
    Visible  = $False
}
$Custom_Panel.Add_MouseClick($clear_selections)

# Video Label
$Video_Label = New-Object System.Windows.Forms.Label -Property @{
    Location = New-Object System.Drawing.Point(5,15)
    Font     = "Segoe UI, 11"
    Text     = "Videos:"
    AutoSize = $True
}
$Video_Label.Add_MouseClick($clear_selections)

# Video TextBox
$Video_TextBox = New-Object System.Windows.Forms.TextBox -Property @{
    Location = New-Object System.Drawing.Point(75,15)
    Size     = "215,20"
    Font     = "Segoe UI, 9"
    AutoSize = $True
}
$Video_TextBox.Add_TextChanged($Video_TextBox_TextChanged)
$Video_TextBox.Add_KeyDown({ &$key_event -obj $Video_TextBox })

# Picture Label
$Picture_Label = New-Object System.Windows.Forms.Label -Property @{
    Location = New-Object System.Drawing.Point(5,37)
    Font     = "Segoe UI, 11"
    Text     = "Pictures:"
    AutoSize = $True
}
$Picture_Label.Add_MouseClick($clear_selections)

# Picture TextBox
$Picture_TextBox = New-Object System.Windows.Forms.TextBox -Property @{
    Location = New-Object System.Drawing.Point(75,39)
    Font     = "Segoe UI, 9"
    Size     = "215,20"
    AutoSize = $True
}
$Picture_TextBox.Add_TextChanged($Picture_TextBox_TextChanged)
$Picture_TextBox.Add_KeyDown({ &$key_event -obj $Picture_TextBox })

# Text Label
$Text_Label = New-Object System.Windows.Forms.Label -Property @{
    Location = New-Object System.Drawing.Point(5,60)
    Font     = "Segoe UI, 11"
    Text     = "Text:"
    AutoSize = $True
}
$Text_Label.Add_MouseClick($clear_selections)

# Text TextBox
$Text_TextBox = New-Object System.Windows.Forms.TextBox -Property @{
    Location = New-Object System.Drawing.Point(75,63)
    Font     = "Segoe UI, 9"
    Size     = "215,20"
    AutoSize = $True
}
$Text_TextBox.Add_TextChanged($Text_TextBox_TextChanged)
$Text_TextBox.Add_KeyDown({ &$key_event -obj $Text_TextBox })

##################### Media Panel 1 ################################################

# Media Panel
$Media_Panel = New-Object System.Windows.Forms.Panel -Property @{
    Size     = "330,90"
    Location = "15,130"
    Visible  = $True
}
$Media_Panel.Add_MouseClick($clear_selections)

# Audio Label
$Audio_Label = New-Object System.Windows.Forms.Label -Property @{
    Text     = "With Audio"
    Location = New-Object System.Drawing.Point(23,6)
    AutoSize = $true
    Font     = "Segoe UI, 11"
}
$Audio_Label.Add_MouseClick($clear_selections)

# Action List CheckBox
$Check_Box = New-Object System.Windows.Forms.CheckBox -Property @{
    AutoSize = $true
    Location = New-Object System.Drawing.Point(5,10)
    Checked  = $false
}
$Check_Box.Add_Click($check_inputs)

# Quality Label
$Quality_Label = New-Object System.Windows.Forms.Label -Property @{
    Text     = "Visual Quality:"
    Location = New-Object System.Drawing.Point(117,10)
    AutoSize = $true
    Font     = "Segoe UI, 11"
}

# Quality List ComboBox
$Quality_List = New-Object System.Windows.Forms.ComboBox -Property @{
    Text             = ""
    Width            = 100
    AutoSize         = $true
    Font             = "Segoe UI, 9"
    Location         = New-Object System.Drawing.Point(227,10)
}
# Event handlers
$Quality_List.Add_TextChanged($Quality_List_TextChange)
$Quality_List.Add_SelectedIndexChanged($quality_list_checker)
$Quality_List.Add_KeyDown({ &$key_event -obj $Quality_List })

# Nvidia Encoder CheckBox
$Nvidia_Box = New-Object System.Windows.Forms.CheckBox -Property @{
    AutoSize = $true
    Location = New-Object System.Drawing.Point(5,35)
    Checked  = $false
}
$Tooltip.SetToolTip(
    $Nvidia_Box,
    "Have fluxed video media encoded by Nvidia devices `n(Warning: Radeon devices will not open these types of files)"
)

# Nvidia Label
$Nvidia_Lable = New-Object System.Windows.Forms.Label -Property @{
    Text     = "Nvidia Encoder"
    Location = New-Object System.Drawing.Point(22,33)
    AutoSize = $true
    Font     = "Segoe UI, 11"
}

# 1/29/2026
# Removed Save Files Check Box

# Rename Only Button
$Rename_Button = New-Object System.Windows.Forms.Button -Property @{
    Text     = "Rename Only"
    Size     = New-Object System.Drawing.Size(85,35)
    Font     = "Segoe UI, 7"
    Location = New-Object System.Drawing.Point(150,45)
    Enabled  = $false
}
$Rename_Button.Add_Click($rename_button_click)

# Flux Button
$Flux_Button = New-Object System.Windows.Forms.Button -Property @{
    Text     = "Flux"
    Size     = New-Object System.Drawing.Size(85,35)
    Font     = "Segoe UI, 8"
    Location = New-Object System.Drawing.Point(240,45)
    Enabled  = $false
}
$Flux_Button.Add_Click($flux_button_click)

###################### Media Panel 2 ################################################

# Video Panel
$video_panel = New-Object System.Windows.Forms.Panel -Property @{
    BorderStyle = "FixedSingle"
    Location    = "18,220"
    Size        = "335,75"
    Visible     = $False
}

# FPS Label
$fps_lbl = New-Object System.Windows.Forms.Label -Property @{
    Font     = "Segoe UI, 11"
    Text     = "FPS:"
    Location = "5,10"
    Size     = "40,21"
}

# FPS ComboBox
$fps_cbx = New-Object System.Windows.Forms.ComboBox -Property @{
    Location = "50,10"
    Size     = "50,23"
    Font     = "Segoe UI, 9"
}
$fps_cbx.Items.AddRange(@(15,30,45,60))
$fps_cbx.SelectedIndex = 0
$fps_cbx.Add_KeyDown({ &$key_event -obj $fps_cbx })
$fps_cbx.Add_TextChanged($fps_cbx_TextChanged)

# Bitrate Label
$bit_lbl = New-Object System.Windows.Forms.Label -Property @{
    Text     = "Bitrate kbits/s:"
    Font     = "Segoe UI, 11"
    Location = "150,10"
    Size     = "100,20"
}

# Bitrate ComboBox
$bit_cbx = New-Object System.Windows.Forms.ComboBox -Property @{
    Location = "255,10"
    Size     = "60,23"
    MaxDropDownItems = 4
    Font             = "Segoe UI, 9"
}
$bit_cbx.Items.AddRange(@(5000,4500,4000,3500,3000,2500,2000,1500,1000))
$bit_cbx.SelectedIndex = 3
$bit_cbx.Add_KeyDown({ &$key_event -obj $bit_cbx })
$bit_cbx.Add_TextChanged($bit_cbx_TextChanged)

# Frame Size Label
$frame_lbl = New-Object System.Windows.Forms.Label -Property @{
    Text     = "Frame Size:"
    Font     = "Segoe UI, 11"
    Location = "5,40"
    Size     = "88,21"
}

# Frame ComboBox
$frame_cbx = New-Object System.Windows.Forms.ComboBox -Property @{
    Location = "95,40"
    Size     = "55,23"
    Font     = "Segoe UI, 9"
}
$frame_cbx.Items.AddRange(@(1080,720,480))
$frame_cbx.SelectedIndex = 1
$frame_cbx.Add_KeyDown({ &$key_event -obj $frame_cbx })
$frame_cbx.Add_TextChanged($frame_cbx_TextChanged)

# Aspect Ratio Label
$ratio_lbl = New-Object System.Windows.Forms.Label -Property @{
    Text     = "Aspect Ratio:"
    Font     = "Segoe UI, 11"
    Location = "155,40"
    Size     = "95,20"
}

# Aspect Ratio ComboBox
$ratio_cbx = New-Object System.Windows.Forms.ComboBox -Property @{
    Location        = "255,40"
    Size            = "60,23"
    MaxDropDownItems = 4
    Font             = "Segoe UI, 9"
}
$ratio_cbx.Items.AddRange(@("Auto","1.85:1","2.35:1","3:2","4:3","5:4","9:16","16:9","16:10"))
$ratio_cbx.SelectedIndex = 0
$ratio_cbx.Add_KeyDown({ &$key_event -obj $ratio_cbx })
$ratio_cbx.Add_TextChanged($ratio_cbx_TextChanged)


# Version Label
$Version_Lable = New-Object System.Windows.Forms.Label -Property @{
    Text     = "V - 4.0.0 MAIN"
    Location = New-Object System.Drawing.Point(15,240)
    Font     = "Segoe UI, 8"
    AutoSize = $True
}

# Tooltip for Flux Button
$Tooltip.SetToolTip($Flux_Button, "Convert media files to the appropiate quality and new title")

#Adding Controls to Jira Panel
# (Keyboard Tab Update)
$Jira_Panel.Controls.Add($Project_Label)
$Jira_Panel.Controls.Add($Project_TextBox)
$Jira_Panel.Controls.Add($Bug_Label)
$Jira_Panel.Controls.Add($Bug_TextBox)
$Jira_Panel.Controls.Add($Device_Label)
$Jira_Panel.Controls.Add($Device_List)
$Jira_Panel.Controls.Add($verify_lbl)
$Jira_Panel.Controls.Add($verify_cbx)
$Jira_Panel.Controls.Add($ver_info_pbx)
$Jira_Panel.Controls.Add($Branch_Label)
$Jira_Panel.Controls.Add($Branch_List)
$Jira_Panel.Controls.Add($Build_Label)
$Jira_Panel.Controls.Add($Build_TextBox)

$main_form.Controls.Add($Jira_Panel)

#Custom Selection Panel
$Custom_Panel.Controls.Add($Video_Label)
$Custom_Panel.Controls.Add($Picture_Label)
$Custom_Panel.Controls.Add($Text_Label)
$Custom_Panel.Controls.Add($Video_TextBox)
$Custom_Panel.Controls.Add($Picture_TextBox)
$Custom_Panel.Controls.Add($Text_TextBox)

$main_form.Controls.Add($Custom_Panel)



#Bottom of Tab
# Media Panel
$Media_Panel.Controls.Add($Audio_Label)
$Media_Panel.Controls.Add($Check_Box)
$Media_Panel.Controls.Add($Nvidia_Lable)
$Media_Panel.Controls.Add($Nvidia_Box)
$Media_Panel.Controls.Add($Save_Files_Lable)
$Media_Panel.Controls.Add($Quality_List)
$Media_Panel.Controls.Add($Quality_Label)
$Media_Panel.Controls.Add($Rename_Button)
$Media_Panel.Controls.Add($Flux_Button)

$main_form.Controls.Add($Media_Panel)

# Add controls to panel
$video_panel.Controls.Add($fps_lbl)
$video_panel.Controls.Add($fps_cbx)
$video_panel.Controls.Add($bit_lbl)
$video_panel.Controls.Add($bit_cbx)
$video_panel.Controls.Add($frame_lbl)
$video_panel.Controls.Add($frame_cbx)
$video_panel.Controls.Add($ratio_lbl)
$video_panel.Controls.Add($ratio_cbx)


$main_form.Controls.Add($video_panel)
$main_form.Controls.Add($Upload_Button)
$Upload_Button.BringToFront()
$main_form.Controls.Add($Collapse_Button)
$Collapse_Button.BringToFront()
$main_form.Controls.Add($Clear_Drop_Button)
$main_form.Controls.Add($Add_Drop_Button)
$main_form.Controls.Add($Delete_Drop_Button)
$main_form.Controls.Add($Paint_Button)
$main_form.Controls.Add($Snip_Button)

$main_form.Controls.Add($DropBox)
$main_form.controls.Add($Drop_Prompt)
$Drop_Prompt.BringToFront()
$main_form.Controls.Add($Version_Lable)

# Add Controls to main Form

$main_form.Controls.Add($main_mst)