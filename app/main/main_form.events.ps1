

# Configuration Path
$config_path = "$(Get-RootDirectory)\config"

# Profile Path
$profile_path = "$(Get-RootDirectory)\profiles"

# Supported Extensions Arrays
[string[]] $supported_video_ext = $(Get-content "$config_path\supported_video_ext.cfg" | %{"*.$_"})
[string[]] $supported_pic_ext = $(Get-content "$config_path\supported_pic_ext.cfg" | %{"*.$_"})
[string[]] $supported_txt_ext = $(Get-content "$config_path\supported_txt_ext.cfg" | %{"*.$_"})
[string[]] $supported_ext = $($supported_video_ext) + $($supported_pic_ext) + $($supported_txt_ext)

#write-host $supported_ext

# Global Variables
# These arrays will hold preset and regression values for renaming files
# These will also be used in the file_rename_form.ps1 events
[string[]] $global:Preset_values = @("","","","","","","")
[string[]] $global:Regress_values = @("","","","","","","")

[string] $global:new_video_label
[string] $global:new_picture_label
[string] $global:new_txt_label
[string] $global:new_ini_label
[string] $global:new_log_label
[string] $global:new_cfg_label
[string] $global:new_config_label 
# These variables will hold the selected extensions for each file type during conversion
[string] $global:vid_select = ""
[string] $global:pic_select = ""
[string] $global:text_select = ""

# After using the OpenFileDialog, this variable will hold the last path used
[string] $global:last_path = ""
[string] $global:last_file = ""
[string] $global:full_last_file_path = ""
#write-host "Root Directory: $(Get-RootDirectory)"
#write-host "Last Path: $global:last_path | Result $(Test-Path $global:last_path)"
#pause

# $global:full_path will hold all files that are currently in the DropBox Listbox and Root Folder
[string[]] $global:full_path = (Get-RootFolderItems -SupportedExtensions $supported_ext)
# DropBox.Items will collect only file names for better readability

# MenuStrip Events on main form
# Load Text Fields with Config Data
$tmi_load_event = {
    [System.Windows.Forms.OpenFileDialog] $Load_dir = $(Invoke-OpenFileDialog -initialDirectory $profile_path -multiSelect $False)
    
    if($Load_dir.ShowDialog() -eq "OK"){
        # load_gui_values function called here
        if(Test-Path $Load_dir.FileName){
            $global:full_last_file_path = ($Load_dir.FileName)
            &$load_gui_values -Load_dir $Load_dir.FileName
        }
    }
    $Load_dir.Dispose()
}

$tmi_open_event = {
    [System.Windows.Forms.OpenFileDialog] $Load_dir = $(Invoke-OpenFileDialog -initialDirectory $global:last_path -multiSelect $True)
    
    if($Load_dir.ShowDialog() -eq "OK"){
        if(Test-Path $Load_dir.filenames[0]){
            foreach($file in $Load_dir.filenames){
                &$add_to_dropbox -files $file
            }
        }
        &$check_if_change
    }
    $Load_dir.Dispose()
}

$tmi_save_event = {
    if(!(Test-Path $global:full_last_file_path)){
        &$tmi_saveas_event
    }else{
        &$save_gui_values -Save_dir $global:full_last_file_path
    }
}

# Save Text Fields in the New Profile Folder
$tmi_saveas_event = {

    [System.Windows.Forms.SaveFileDialog] $Save_dir = $(Invoke-SaveFileDialog -initialDirectory $global:last_path)
    if(!($Save_dir.filename -eq "")){
        $global:full_last_file_path = $Save_dir.FileName
        &$save_gui_values -Save_dir $Save_dir.FileName
       
    }
    $Save_dir.dispose()
}
# $format_tmi_reset Click Event
$format_tmi_reset_click = {
     # This will call the attention form to prompt user for reset confirmation
    . "$PSScriptRoot\..\attention\attention_form.ps1" "flux_reset_prompt"
}

# Change Rename File Jira Click Event
$crf_tmi_jira_click = {
    . "$PSScriptRoot\..\file_rename\file_rename_form.ps1" "jira"
}

# Change Rename File Regression Click Event
$crf_tmi_regress_click = {
    . "$PSScriptRoot\..\file_rename\file_rename_form.ps1" "regression"
}

# Video Format Selection Events
$MP4 = {
    $video_tmi_mp4.Checked = $True
    $video_tmi_mkv.Checked = $False
    $video_tmi_mov.Checked = $False
    $video_tmi_avi.Checked = $False
    $video_tmi_none.Checked = $False
}
$MOV = {
    $video_tmi_mov.Checked = $True
    $video_tmi_mkv.Checked = $False
    $video_tmi_mp4.Checked = $False
    $video_tmi_avi.Checked = $False
    $video_tmi_none.Checked = $False
}
$MKV = {
    $video_tmi_mkv.Checked = $True
    $video_tmi_mov.Checked = $False
    $video_tmi_mp4.Checked = $False
    $video_tmi_avi.Checked = $False
    $video_tmi_none.Checked = $False
}
$AVI = {
    $video_tmi_avi.Checked = $True
    $video_tmi_mkv.Checked = $False
    $video_tmi_mov.Checked = $False
    $video_tmi_mp4.Checked = $False
    $video_tmi_none.Checked = $False
}
$V_None = {
    $video_tmi_none.Checked = $True
    $video_tmi_mkv.Checked = $False
    $video_tmi_mov.Checked = $False
    $video_tmi_mp4.Checked = $False
    $video_tmi_avi.Checked = $False
}
# Picture Format Selection Events
$JPG = {
    $pic_tmi_jpg.Checked = $True
    $pic_tmi_jpeg.Checked = $False
    $pic_tmi_png.Checked = $False
    $pic_tmi_none.Checked = $False
}
$JPEG = {
    $pic_tmi_jpeg.Checked = $True
    $pic_tmi_jpg.Checked = $False
    $pic_tmi_png.Checked = $False
    $pic_tmi_none.Checked = $False
}
$PNG = {
    $pic_tmi_png.Checked = $True
    $pic_tmi_jpg.Checked = $False
    $pic_tmi_jpeg.Checked = $False
    $pic_tmi_none.Checked = $False
}
$P_None = {
    $pic_tmi_none.Checked = $True
    $pic_tmi_jpg.Checked = $False
    $pic_tmi_jpeg.Checked = $False
    $pic_tmi_png.Checked = $False
}
# Text Format Selection Events
$TEXT = {
    $text_tmi_text.Checked = $true
    $text_tmi_log.Checked = $false
    $text_tmi_ini.Checked = $false
    $text_tmi_cfg.Checked = $false
    $text_tmi_config.Checked = $false
    $text_tmi_none.Checked = $False
}
$LOG = {
    $text_tmi_text.Checked = $False
    $text_tmi_log.Checked = $True
    $text_tmi_ini.Checked = $false
    $text_tmi_cfg.Checked = $false
    $text_tmi_config.Checked = $false
    $text_tmi_none.Checked = $False
}
$INI = {
    $text_tmi_text.Checked = $False
    $text_tmi_log.Checked = $false
    $text_tmi_ini.Checked = $True
    $text_tmi_cfg.Checked = $false
    $text_tmi_config.Checked = $false
    $text_tmi_none.Checked = $False
}
$CFG = {
    $text_tmi_text.Checked = $False
    $text_tmi_log.Checked = $false
    $text_tmi_ini.Checked = $false
    $text_tmi_cfg.Checked = $True
    $text_tmi_config.Checked = $false
    $text_tmi_none.Checked = $False
}
$CONFIG = {
    $text_tmi_text.Checked = $false
    $text_tmi_log.Checked = $false
    $text_tmi_ini.Checked = $false
    $text_tmi_cfg.Checked = $false
    $text_tmi_config.Checked = $true
    $text_tmi_none.Checked = $False
}
$T_None = {
    $text_tmi_text.Checked = $false
    $text_tmi_log.Checked = $false
    $text_tmi_ini.Checked = $false
    $text_tmi_cfg.Checked = $false
    $text_tmi_config.Checked = $false
    $text_tmi_none.Checked = $True
}

# Backup - Yes Option Event
$backup_yes_click = {
    $backup_tmi_yes.Checked = $True
    $backup_tmi_no.Checked = $False
}

# Backup - No Option Event
$backup_no_click = {
    $backup_tmi_yes.Checked = $False
    $backup_tmi_no.Checked = $True
}
# Patch Notes Option Event
$patch_option_click = {
    notepad "$(Get-RootDirectory)\assets\notes\patch-notes.txt"
}

# Help Option Event
$help_option_click = {
    # Will post URL soon
}

# Renaming Form Event
# Panels will be shown/hidden based on the selected renaming rule
# Show Custom Panel & Hide Jira Panel
$hide_base_ui = {
    $format_tmi_jira_regress.Checked = $false
    $format_tmi_none.Checked = $false
    $format_tmi_custom.Checked = $True
    
    $Jira_Panel.Enabled = $False
    $Jira_Panel.Visible = $False
    
    $Custom_Panel.Enabled = $True
    $Custom_Panel.Visible = $True
    $Media_Panel.Location = "15,130"
    $video_panel.location = "18,220"
    
    &$quality_list_checker
}

# Show Jira Panel & Hide Custom Panel
$hide_custom_ui = {
    $format_tmi_none.Checked = $false
    $format_tmi_custom.Checked = $false
    $format_tmi_jira_regress.Checked = $True
    
    $Jira_Panel.Enabled = $True
    $Jira_Panel.Visible = $True
    
    $Custom_Panel.Enabled = $False
    $Custom_Panel.Visible = $False
    $Media_Panel.Location = "15,130"
    $video_panel.location = "18,220"
    
    &$quality_list_checker
}

# Hide Both Jira & Custom Panels
$disable_base_custom_ui = {
    $format_tmi_custom.Checked = $false
    $format_tmi_jira_regress.Checked = $false
    $format_tmi_none.Checked = $True
    
    $Jira_Panel.Enabled = $False
    $Jira_Panel.Visible = $False
    
    $Custom_Panel.Enabled = $False
    $Custom_Panel.Visible = $False
    
    $Media_Panel.Location = "15,70"
    $video_panel.Location = "5,160"
    
    &$quality_list_checker
}

# Show Video Panel if Quality is set to 'Custom'
$quality_list_checker = {
    if($Quality_List.SelectedIndex -eq 6){
        if(!($Custom_Panel.Visible -eq $False -and $Jira_Panel.Visible -eq $False)){
            $main_form.height = 370
            $DropBox.Height = 260
            $Drop_Prompt.Height = 185
            $Drop_Prompt.Location = "410,65"
            $Version_Lable.Location	= "15,310"
            $video_panel.Visible = $True
        }
        else{
            $main_form.height = 300
            $DropBox.Height = 210
            $Drop_Prompt.Height = 160
            $Drop_Prompt.Location = "410,45"
            $Version_Lable.Location	= "15,240"
            
            $video_panel.Visible = $True
            $Media_Panel.Location = "15,70"
            $video_panel.Location = "5,160"
            
        }
    }else{
        $main_form.height = 300
        $DropBox.Height = 210
        $Drop_Prompt.Height = 160
        $Drop_Prompt.Location = "410,45"
        $Version_Lable.Location	= "15,240"
        $video_panel.Visible = $False
    }
}

# Calling Update Form 
$Check_For_Update = {
    . "$PSScriptroot\..\update\update_form.ps1" 
}

# DropBox Events
# Handle KeyDown Event
$DropBox_KeyDown ={
     if($_.control -and $_.KeyCode -eq "A"){
        for([int] $i = 0; $i -lt $DropBox.Items.Count; $i++){
            $DropBox.SelectedItem = $DropBox.Items[$i]
        }
    }
    if($_.Control -and  $_.keycode -eq "M"){
        &$ms_paint_event
    }
}

# Handle DragEnter Event
$DropBox_DragEnter = [System.Windows.Forms.DragEventHandler]{
    if ($(Get-RootFolderItems $supported_ext).length -gt 0) {
        Get-RootFolderItems $supported_ext | ForEach-Object { &$add_to_dropbox -files $_ }
    }  
}

# Handle DragOver Event
$DropBox_DragOver = [System.Windows.Forms.DragEventHandler]{
    if ($_.Data.GetDataPresent([Windows.Forms.DataFormats]::FileDrop)){
        $_.Effect = 'Copy'
        $Drop_Prompt.Visible = $False
    }
    else{
        $_.Effect = 'None'
    }
}

# Handle DragDrop Event
$DropBox_DragDrop = [System.Windows.Forms.DragEventHandler]{
    foreach($files in $_.Data.GetFileDropList()) {
        &$add_to_dropbox -files $files
    }if($DropBox.Items.Count -lt 1){
        $Drop_Prompt.Visible = $True
    }
}

# Show DropBox UI Elements
$Show_DropBox = {
		$Upload_Button.Visible						= $False
		$Collapse_Button.Visible					= $True
		$main_form.Width 							= 650
		$main_mst.Width								= $main_form.width
		if($Quality_List.SelectedIndex -eq 6){
			$Drop_Prompt.Height 					= 210
			$Drop_Prompt.Location 					= "410,65"
		}else{
			$Drop_Prompt.Height 					= 160
			$Drop_Prompt.Location 					= "410,45"
		}
		
		$DropBox.Visible 							= $True
		$Drop_Prompt.Visible						= $True
		$Clear_Drop_Button.Visible 					= $True
		$Add_Drop_Button.Visible 					= $True
		$Delete_Drop_Button.Visible 				= $True
		$Paint_Button.Visible 						= $True
		$Snip_Button.Visible						= $True
}

# Hide DropBox UI Elements
$Hide_DropBox = {
		$Upload_Button.Visible						= $True
		$Collapse_Button.Visible					= $False
		$main_form.Width 							= 410
		$main_mst.Width								= $main_form.width
		
		$DropBox.Visible 							= $False
		$Clear_Drop_Button.Visible 					= $False
		$Add_Drop_Button.Visible 					= $False
		$Delete_Drop_Button.Visible 				= $False
		$Paint_Button.Visible 						= $False
		$Snip_Button.Visible						= $False
		$Drop_Prompt.Visible						= $False
}

# Clear Drop Box Button Event
$clear_dropbox_click = {
    $DropBox.Items.clear();
    $global:full_path = @()
    $Drop_Prompt.Visible = $True
    $Clear_Drop_Button.Enabled = $False
    $Delete_Drop_Button.Enabled = $False
}

# Add Drop Box Button Event
$add_drop_button_click = {

    $global:last_path = (Resolve-Path $global:last_path).Path
    
    if ($global:last_path -eq "" -or $global:last_path -eq $config_path){
        $global:last_path = "$env:USERPROFILE\Downloads"
    }
    
    $Load_dir = Invoke-OpenFileDialog -initialDirectory $global:last_path -multiSelect $True
    
    if($Load_dir.ShowDialog() -eq "OK"){
        if ($load_dir.filenames.count -gt 0) {
            $global:last_path = (Split-Path $Load_dir.filenames[0] -parent)
        }

        if(!($Load_dir.filenames[0] -eq "")){
            foreach($file in $Load_dir.filenames)
            {
                &$add_to_dropbox -files $file
            }
        }
    }
    &$check_if_change
}

# Delete Drop Box Button Event
$delete_dropbox_click = {
    &$check_if_change
    &$remove_from_list -delete $False
    if($DropBox.Items.Count -eq 0){
        $Drop_Prompt.Visible = $True
        $Clear_Drop_Button.Enabled = $False
        $Delete_Drop_Button.Enabled = $False
    }
}

#Clear Text Selection on Text Boxes
$clear_selections = {
    $Dropbox.ClearSelected()
	$Project_TextBox.SelectionLength = 0
	$Bug_TextBox.SelectionLength = 0
	$Device_List.SelectionLength = 0
	$Branch_List.SelectionLength = 0
	$Build_TextBox.SelectionLength = 0
	$Video_TextBox.SelectionLength = 0
	$Picture_TextBox.SelectionLength = 0
	$Text_TextBox.SelectionLength = 0
	$Quality_List.SelectionLength = 0
	$fps_cbx.SelectionLength = 0
	$bit_cbx.SelectionLength = 0
	$frame_cbx.SelectionLength = 0
	$ratio_cbx.SelectionLength = 0
}

#Checks if all GUI inputs are filled such that the flux button & Rename Button gets enabled
#Checks if all inputs on every TextBox are valid
$check_inputs = {
	if($DropBox.items.count -eq 0 -and (Get-RootFolderItems -SupportedExtensions $supported_ext).count -eq 0){
		$Rename_Button.Enabled = $False;$Flux_Button.Enabled = $false
		$Clear_Drop_Button.Enabled = $False;$Delete_Drop_Button.Enabled = $False
		return
	}
	if($Jira_Panel.Visible -eq $True){
		if($Project_TextBox.Text -ne "" -and $Bug_TextBox.Text -ne "" -and $Device_List.SelectedIndex -ne 0 -and $Branch_List.SelectedIndex -ne 0){
			$Rename_Button.Enabled = $True}else{$Rename_Button.Enabled = $False}
		if($Device_List.Text -eq "" -or $Branch_List.Text -eq ""){$Rename_Button.Enabled = $False}
		
		if($Quality_List.Text -ne "" -and $Quality_List.SelectedIndex -ne 0 -and $Rename_Button.Enabled -eq $True){$Flux_Button.Enabled = $True}Else{$Flux_Button.Enabled = $false}
	}
	else{
		if($Custom_Panel.Visible -eq $True){
			$Rename_Button.Enabled = $True
			if($Quality_List.Text -ne "" -and $Quality_List.SelectedIndex -ne 0){
				$Flux_Button.Enabled = $True}Else{$Flux_Button.Enabled = $false}
		}else{
			if($Quality_List.Text -ne "" -and $Quality_List.SelectedIndex -ne 0){
				$Flux_Button.Enabled = $True}Else{$Flux_Button.Enabled = $false}
		}
	}
}

# Paint Button Click Event
$ms_paint_event = {
    &$check_if_change;
    if($DropBox.SelectedItems.count -gt 0){&$file_to_paint}Else{mspaint}
}

# Open selected files in MS Paint
$file_to_paint = {
    [string[]] $supported_pic_ext = $(cat "$config_path\supported_pic_ext.cfg" | %{"*.$_"})
    [string[]] $files_to_paint = $global:full_path.where{(split-path $_ -leaf) -in $DropBox.SelectedItems}
    foreach($items in ($files_to_paint)){
		foreach($case in $supported_pic_ext){
			if($items -like $case){
				mspaint $items -wait
			}
		}
	}
	$DropBox.ClearSelected();
}

# Add files to the DropBox Listbox
# Input is the full path of the file
$add_to_dropbox = {
    param([string]$files)
    # Drop Box will get the leaf name of the file only for better readability
    if((Split-Path $files -parent) -eq ""){
        # To view this message for debugging, uncomment the line below
        # write-host "No Parent Directory Found, Skipping File Addition"
        return
    }
	$DropBox.BeginUpdate();
	foreach($case in $supported_ext){
		if($files -like $case){
			if($files -notin $DropBox.Items){ #Prevent Duplicating Drag&Drop Item with Existing file in Root folder
                if($files -notin $global:full_path){
                    $global:full_path += $files
                }
				$DropBox.Items.Add((Split-Path $files -leaf)) # Adding only leaf name to DropBox
                $Drop_Prompt.Visible = $False
			}
		}
	}
	$DropBox.EndUpdate();
	$Clear_Drop_Button.Enabled = $True;$Delete_Drop_Button.Enabled = $True
}

# Remove Files from DropBox Listbox
$remove_from_list = {
    param([bool] $delete)
    [string[]] $root_files = (Get-RootFolderItems -SupportedExtensions $supported_ext)
	$DropBox.BeginUpdate();
		if($DropBox.SelectedItems.count -eq $DropBox.Items.count){
			foreach($item in $global:full_path){
                #Check Root first
                if($root_files.length -gt 0 -and $root_files.contains($item)){
                    Invoke-DecideFileOutcome -path $item -delete $delete
                } 
			}
			$DropBox.Items.clear()
			$DropBox.EndUpdate();
			return
		}
		else{
			for($index = ($DropBox.Items.count - 1); $index -ge 0; $index--)
			{ 
                if($($global:full_path[$index] | split-path -leaf) -in $DropBox.SelectedItems){
                    # In-real time values of $global:full_path might change so we need to recheck each time
                    if($root_files.length -gt 0 -and $root_files.contains($global:full_path[$index])){
                        Invoke-DecideFileOutcome -path $global:full_path[$index] -delete $delete
                    }
                    $DropBox.Items.RemoveAt($index)
                    $global:full_path = $global:full_path.where{$_ -ne $global:full_path[$index]}
                }
                
			}
		}
	$DropBox.EndUpdate();
  $DropBox.ClearSelected();
}

# Flux Button Click Event
# In Development 2/6/2026
# |-------- Flux Process --------------|
# Folder Creation Output (Required), saved_files (Required)
# Pre-Defined Objects are now getting values
# Label Extraction (Optional)
# FFMPEG Endcoding (Optional)
# New Mechanism: Non-Root Directory Items will no longer be deleted if Save a copy option is defined
$rename_button_click = {
    if($format_tmi_jira_regress.checked -or $format_tmi_custom.checked){
        &$flux_process -only_rename $true -get_new_label $true
    }else{
        &$flux_process -only_rename $true -get_new_label $false
    }
}

$flux_button_click = {
    if($format_tmi_jira_regress.checked -or $format_tmi_custom.checked){
        &$flux_process -only_rename $false -get_new_label $true
    }else{
        &$flux_process -only_rename $false -get_new_label $false
    }
}

$flux_process = {
    param([boolean] $only_rename, [boolean] $get_new_label)
    
    # Check if saved_files Folder exist
    if(!(Test-Path "$(Get-RootDirectory)\saved_files\")){
        mkdir "$(Get-RootDirectory)\saved_files\"
    }

    # Check if output Folder exist
    if(!(Test-Path "$(Get-RootDirectory)\output\")){
        mkdir "$(Get-RootDirectory)\output\"
    }

    # Check If Build Text Box is defined sothe output destination is defined
    if($Build_TextBox.Text -eq "" -or $format_tmi_custom.Checked -or $format_tmi_none.Checked){
        [string] $output_location = &$define_output_destination
        if ($output_location -eq "0x1"){
            # Call Prompt Form
            return
        }else{
            $global:last_path = $output_location
        }
    }else{
        [string] $output_location = "$(Get-RootDirectory)\output\$($Build_TextBox.Text)"
        if(!(Test-Path $output_location)){
            mkdir $output_location
        }
    }
    
    # Get Future Items: New Title, New Extention, FFMPEG Parameters, Save Copy Option
    [string] $temp_ext = ""
	[boolean] $result
    [int] $file_counter = 0
	[int] $file_transferred = $DropBox.Items.Count
	$global:vid_select = &$coe_validator_video # Future Video extention defined from the menu strip item
    $global:pic_select = &$coe_validator_picture # Future Picture Extention Defined
    $global:text_select = &$coe_validator_text # Future Text Extention Defined
    
    #Backup Option
    if($backup_tmi_yes.Checked){
        [boolean] $create_copy = $True
    }else{
        [boolean] $create_copy = $False
    }
    
    # Audio Option
    if($Check_Box.Checked){
        [boolean] $audio = $True
    }else{
        [boolean] $audio = $False
    }

    # Encoder Option
    if($Nvidia_Box.Checked){
        [boolean] $encoder = $True
    }else{
        [boolean] $encoder = $False
    }

   
    # Extract new labels
    &$extract_new_labels # Global variable gets values
    
    # Desired Quality
    [string] $desired_quality = $Quality_List.Text

    # Video Panel Extraction
    if($video_panel.Visible){
        [string] $frame_rate = $fps_cbx.Text
        [string] $scale = $frame_cbx.Text
        [string] $bit_rate = $bit_cbx.Text
        [string] $ratio = $ratio_cbx.Text
    }else{
        [string] $frame_rate = ""
        [string] $scale = ""
        [string] $bit_rate = ""
        [string] $ratio = ""
    }

    # Flip Full Array
    [system.array]::Reverse($global:full_path)
    # Rearrange DropBox to respect FIFO
    $DropBox.Items.Clear()
	$DropBox.Items.AddRange($($global:full_path | Split-Path -leaf))
	
    # Label Extraction Process per item in full path array
    # Start with extracting the first item

    for([int] $index = $($DropBox.Items.Count - 1); $index -ge 0; $index--){
        # Pull the full path
        [string] $item = $global:full_path[$index]
        [string] $new_label
        [string] $new_extension
        [string] $new_leaf
        # Check if pulled path has a leaf in the drop box
        if((Split-Path $item -leaf) -notin $DropBox.Items){
            continue # <-- Caution
        }else{
            # Full path will be fluxed then update the dropbox
            # Check the extension to determine the file type
            [string] $temp_ext = [system.string]::Concat("*", (Split-Path-Ext($item)))
            
            # Pull new Label and extension based on file type
            if($temp_ext -in $supported_video_ext){
                if($global:vid_select -eq "None"){
                    $new_extension = Split-Path-Ext($item)
                }else{
                    $new_extension = $global:vid_select
                }
                # Pull the new label
                if($get_new_label){
                    $new_label = $global:new_video_label
                }else{
                    $new_label = $(Get-Item $item).BaseName
                 }
            
            }elseif($temp_ext -in $supported_pic_ext){
                if($global:pic_select -eq "None"){
                    $new_extension = Split-Path-Ext($item)
                }else{
                    $new_extension = $global:pic_select
                }
                
                # Pull the new label
                if($get_new_label){
                    $new_label = $global:new_picture_label
                }else{
                    $new_label = $(Get-Item $item).BaseName
                 }
                				
            }elseif($temp_ext -in $supported_txt_ext){
                if($global:text_select -eq "None"){
                    $new_extension = Split-Path-Ext($item)
                }else{
                    $new_extension = $global:txt_select
                }
                 # Pull the new label
                 if($get_new_label){
                    switch(Split-Path-Ext($item)){
                        ".txt"{
                            $new_label = $global:new_txt_label
                        }
                        ".log"{
                            $new_label = $global:new_txt_label
                        }
                        ".ini"{
                            $new_label = $global:new_ini_label
                        }
                        ".cfg"{
                            $new_label = $global:new_cfg_label
                        }
                        ".config"{
                            $new_label = $global:new_config_label
                        }
                    }
                    $new_label = $global:new_txt_label
                 }else{
                    $new_label = $(Get-Item $item).BaseName
                 }
            }
                
            # Determine if the label needs to be translated
            $new_label = &$Replace_AbbrevText -input_buffer $new_label
            # Create a leaf
            $new_leaf = [System.String]::Concat($new_label,$new_extension)
            # Ensure the leaf is not in the destination output
            $new_leaf = Invoke-DupeFilePrevention -leaf $new_leaf -destination $output_location
            
            # Save a copy of the File
            if($create_copy){
                [string] $original_leaf = (Split-Path $item -leaf)
                if(Test-Path "$(Get-RootDirectory)\saved_files\$original_leaf"){
                    $original_leaf = (Invoke-DupeFilePrevention -leaf $original_leaf -destination "$(Get-RootDirectory)\saved_files\")
                    Copy-Item $item "$(Get-RootDirectory)\saved_files\$original_leaf"
                }else{
                    Copy-Item $item "$(Get-RootDirectory)\saved_files\$original_leaf"
                }
            }
            
            if(!($only_rename) -and ($temp_ext -notin $supported_txt_ext)){
                # Flux Process, This will also move the file to destination
                # Text Files Not Supported
                $result = (Invoke-FluxProcess -file_path $item -new_leaf $new_leaf -destination $output_location -desired_quality $desired_quality `
                -audio $audio -frame_rate $frame_rate -scale $scale -bit_rate $bit_rate -ratio $ratio -encoder $encoder)
            }else{
                # Move Process
                Copy-Item $item "$output_location\$new_leaf"
                if(Test-Path "$output_location\$new_leaf"){
                    $result = $true
                }else{
                    $result = $false
                }
            }
            
            if(!$result){
                # Call the Attention Form
                . "$PSScriptroot\..\attention\attention_form.ps1" "flux_file_transfer_error"
                return
            }else{
                #Update the dropbox 
                $DropBox.BeginUpdate()
                $DropBox.Items.RemoveAt($index)
                $DropBox.EndUpdate()
            } 
        }
        $file_counter += 1				
    }
	
    # Post Process
    # Check if all files made it over to the destination
	if ($file_counter -ne $file_transferred){
        . "$PSScriptRoot\..\attention\attention_form.ps1" "flux_file_transfer_error"
        $file_counter = 0
	}
	else{
		explorer $output_location
		$DropBox.items.clear()
		$global:full_path = @()
		$Drop_Prompt.Visible = $True
        if($(Get-RootFolderItems $supported_ext).length -gt 0){
            Get-RootFolderItems $supported_ext | Foreach-Object{
                Invoke-DecideFileOutcome -path $_ -delete $True
            }
        }
	}
	return
}

#Extract New Labels 
$extract_new_labels = {
    if($format_tmi_custom.Checked){
        if($Video_TextBox.Text -eq ""){
            $global:new_video_label = "{project}-{bug}_{device}_{build}_{1}"
        }else{
            $global:new_video_label = $Video_TextBox.Text
        }
        if($Picture_TextBox.Text -eq ""){
            $global:new_picture_label = "{project}-{bug}_{device}_{build}_{1}"
        }else{
            $global:new_picture_label = $Picture_TextBox.Text
        }
        if($Text_TextBox.Text -eq ""){
            $global:new_txt_label = "{project}-{bug}_{device}_{build}_{1}"
            $global:new_ini_label = $global:new_txt_label
            $global:new_log_label = $global:new_txt_label
            $global:new_cfg_label = $global:new_txt_label
            $global:new_config_label = $global:new_txt_label
        }else{
            $global:new_txt_label = $Text_TextBox.Text
            $global:new_ini_label = $global:new_txt_label
            $global:new_log_label = $global:new_txt_label
            $global:new_cfg_label = $global:new_txt_label
            $global:new_config_label = $global:new_txt_label
        }
        return
    }
    if($verify_cbx.Checked -and $format_tmi_jira_regres.Checked){
        if($global:Regress_values[0].length -gt 0){
              $global:new_video_label = $global:Regress_values[0]
        }else{
             $global:new_video_label = "{project}-{bug}_{device}_{build}_{1}"
        }
        if($global:Regress_values[1].length -gt 0){
              $global:new_picture_label = $global:Regress_values[0]
        }else{
             $global:new_picture_label = "{project}-{bug}_{device}_{build}_{1}"
        }
        if($global:Regress_values[2].length -gt 0){
              $global:new_txt_label = $global:Regress_values[0]
        }else{
             $global:new_txt_label = "{project}-{bug}_{device}_{build}_{1}"
        }
        if($global:Regress_values[3].length -gt 0){
              $global:new_ini_label = $global:Regress_values[0]
        }else{
             $global:new_ini_label = "{project}-{bug}_{device}_{build}_{1}"
        }
        if($global:Regress_values[4].length -gt 0){
              $global:new_log_label = $global:Regress_values[0]
        }else{
             $global:new_log_label = "{project}-{bug}_{device}_{build}_{1}"
        }
        if($global:Regress_values[5].length -gt 0){
              $global:new_cfg_label = $global:Regress_values[0]
        }else{
             $global:new_cfg_label = "{project}-{bug}_{device}_{build}_{1}"
        }
        if($global:Regress_values[6].length -gt 0){
              $global:new_config_label = $global:Regress_values[0]
        }else{
             $global:new_config_label = "{project}-{bug}_{device}_{build}_{1}"
        }
    }else{
        if($global:Preset_values[0].length -gt 0){
             $global:new_video_label = $global:Preset_values[0]
        }else{
            $global:new_video_label = "{project}-{bug}_{device}_{build}_{1}"
        }
        if($global:Preset_values[1].length -gt 0){
              $global:new_picture_label = $global:Preset_values[0]
        }else{
             $global:new_picture_label = "{project}-{bug}_{device}_{build}_{1}"
        }
        if($global:Preset_values[2].length -gt 0){
              $global:new_txt_label = $global:Preset_values[0]
        }else{
             $global:new_txt_label = "{project}-{bug}_{device}_{build}_{1}"
        }
        if($global:Preset_values[3].length -gt 0){
              $global:new_ini_label = $global:Preset_values[0]
        }else{
             $global:new_ini_label = "{project}-{bug}_{device}_{build}_{1}"
        }
        if($global:Preset_values[4].length -gt 0){
              $global:new_log_label = $global:Preset_values[0]
        }else{
             $global:new_log_label = "{project}-{bug}_{device}_{build}_{1}"
        }
        if($global:Preset_values[5].length -gt 0){
              $global:new_cfg_label = $global:Preset_values[0]
        }else{
             $global:new_cfg_label = "{project}-{bug}_{device}_{build}_{1}"
        }
        if($global:Preset_values[6].length -gt 0){
              $global:new_config_label = $global:Preset_values[0]
        }else{
             $global:new_config_label = "{project}-{bug}_{device}_{build}_{1}"
        }
    }
    return
}

# Determine the file output destination
$define_output_destination = {
    [System.Windows.Forms.OpenFileDialog] $output_directory = $(Invoke-OpenFolderDialog -InitialDirectory $(Get-RootDirectory))
    if($output_directory.ShowDialog() -eq "OK"){
        [string] $output_directory = (Split-Path $output_directory.FileName -Parent)
        if(Test-Path $output_directory){
            return $output_directory
        }
        else{
            return "0x1" # Call Prompt to define a output location
        }
    }else{
        return "0x1" # Call Prompt to define a output location
    }
}
# Checks if listed items from drop box are still in the directories
# Also checks if root folder items are still valid
$check_if_change = {
	if($DropBox.Items.count -lt 1 -and $Collapse_Button.Visible -eq $True){$Drop_Prompt.Visible = $True}else{$Drop_Prompt.Visible = $False}
	$DropBox.BeginUpdate();
	for($index = ($DropBox.Items.count - 1); $index -ge 0; $index--)
	{
		if(!(Test-Path($DropBox.Items[$index])))
		{
			#Check Root first
			if($global:full_path -like "*$($DropBox.Items[$index])")
			{
				continue 
			}
			else{
				$DropBox.Items.RemoveAt($index)
			}
		}
	}
	$DropBox.EndUpdate();
	if(!($Quality_List.Items.contains($Quality_List.Text))){$Quality_List.Text = '-- Select --'}
}

#Checks if any file was added to the root folder regardless if DropBox was used
$check_root_folder =  { 
    #There Exist supported files in the root folder
   
    [string[]] $root_files = $(Get-RootFolderItems $supported_ext)
    
    if($root_files.count -gt 0){
		foreach($files in $root_files){
			if((Split-Path $files -leaf) -notin $DropBox.Items){
				&$add_to_dropbox -files $files
			}
		}
		$Drop_Prompt.Visible = $False
	}
	else{
		return
	}
}

# Project TextBox Text Change
$Project_TextBox_TextChanged ={
    $Project_TextBox.Text = $Project_TextBox.Text.Trim(" ")
}

# Bug TextBox Text Change
$Bug_TextBox_TextChanged ={
    $Bug_TextBox.Text = $Bug_TextBox.Text.Trim(" ")
}

# Build TextBox Text Change
$Build_TextBox_TextChanged ={
    $Build_TextBox.text = $Build_TextBox.text.trim(" ")
}

# Build TextBox Text Change
$Video_TextBox_TextChanged ={
    $Video_TextBox.Text = $Video_TextBox.Text.Trim(" ")
}

# Build TextBox Text Change
$Picture_TextBox_TextChanged ={
    $Picture_TextBox.Text = $Picture_TextBox.Text.Trim(" ")
}

# Build TextBox Text Change
$Text_TextBox_TextChanged ={
    $Text_TextBox.Text = $Text_TextBox.Text.Trim(" ")
}

#Quality TextBox Text Change
$Quality_List_TextChange = {
    if($Quality_List.Text -notin $Quality_List.Items){
        $Quality_List.SelectedIndex = 0
    }
}

# Frames Per Second Combo Box Changed
$fps_cbx_TextChanged = {
    if($fps_cbx.Text -notin $fps_cbx.Items){
        $fps_cbx.SelectedIndex = 0
    }
}

# Bit Rate Combo Box Changed
$bit_cbx_TextChanged = {
    if($bit_cbx.Text -notin $bits_cbx.Items){
        $bit_cbx.SelectedIndex = 0
    }
}

# Frame Rate Combo Box Changed
$frame_cbx_TextChanged = {
    if($frame_cbx.Text -notin $frame_cbx.Items){
        $frame_cbx.SelectedIndex = 0
    }
}

# Frame Rate Combo Box Changed
$ratio_cbx_TextChanged = {
    if($ratio_cbx.Text -notin $ratio_cbx.Items){
        $ratio_cbx.SelectedIndex = 0
    }
}

#Remove unneccessary Spaces after the text
$trim_textboxes = {
    $Project_TextBox.Text = $Project_TextBox.Text.Trim(" ")
    $Build_TextBox.text = $Build_TextBox.text.trim(" ")
    $Bug_TextBox.Text = $Bug_TextBox.Text.Trim(" ")
    $Video_TextBox.Text = $Video_TextBox.Text.Trim(" ")
    $Picture_TextBox.Text = $Picture_TextBox.Text.Trim(" ")
    $Text_TextBox.Text = $Text_TextBox.Text.Trim(" ")
}
# Checks and replaces abbreviation texts in the input buffer
$Replace_AbbrevText = {
	param([string]$input_buffer)
	$input_buffer = &$Replace_LegacyAbbrevText -buffer $input_buffer
	$abbrev = Get-Content "$(Get-RootDirectory)\config\abbreviations.cfg"
	$input_buffer = Remove-IllegalChar -buffer $input_buffer
	foreach($items in $abbrev){
        if($items -eq "{project}"){
            $input_buffer = $input_buffer.replace($items,"$($Project_TextBox.Text)")
        }
        if($items -eq "{bug}"){
            $input_buffer = $input_buffer.replace($items,"$($Bug_TextBox.Text)")
        }
        if($items -eq "{device}"){
            $input_buffer = $input_buffer.replace($items,"$($Device_List.Text)")
        }
        if($items-eq "{branch}"){
            $input_buffer = $input_buffer.replace($items,"$($Branch_List.Text)")
        }
        if($items -eq "{build}"){
            $input_buffer = $input_buffer.replace($items,"$($Build_TextBox.Text)")
        }
        if($items -eq "{computername}"){
            $input_buffer = $input_buffer.replace($items,"$($env:COMPUTERNAME)")
        }
	}
	return $input_buffer
}

# Checks and replaces legacy abbreviation texts in the input buffer
$Replace_LegacyAbbrevText = {
    param([string]$buffer)
    $abbrev_legacy = Get-Content "$(Get-RootDirectory)\config\legacy_abbreviations.cfg"
    foreach($items in $abbrev_legacy){
        switch($items){
            "{Pro}" { $buffer = $buffer.replace($items,"$($Project_TextBox.Text)")}
            "{Bug}" { $buffer = $buffer.replace($items,"$($Bug_TextBox.Text)")}
            "{Dev}" { $buffer = $buffer.replace($items,"$($Device_List.Text)")}
            "{Bra}" { $buffer = $buffer.replace($items,"$($Branch_List.Text)")}
            "{Bui}" { $buffer = $buffer.replace($items,"$($Build_TextBox.Text)")}
        }
    }
	return $buffer
}

# Load GUI Values from Config File
# 1/27/2026 In-Development
# Will Return a parent directory
$load_gui_values = {
    param([string] $Load_dir)
    if (!(Test-Path($Load_dir))){
        return
    }
	
    if($(cat $load_dir).count -lt 1){
        &$Remove_DropBox
        &$hide_custom_ui
        &$blank_ui
        
        $global:Preset_values = @()
        $global:Regress_values = @()
        return
    }
    # Extract config values using Get-ConfigFileValues function
    [String[]] $values = Get-ConfigFileValues([string]$Load_dir)
    # With the values array populated, we can now load the GUI elements

    #New Format
    if($values.length -gt 22){
        [string[]]$buffer = &$format -old $False -values $values
        $global:vid_select = $buffer[0]
        $global:pic_select = $buffer[1]
        $global:text_select = $buffer[2]
    }else{
        [string[]]$buffer = &$format -old $True -values $values
        $global:vid_select = $buffer[0]
        $global:pic_select = $buffer[1]
        $global:text_select = $buffer[2]
    }
    switch($values[32]){
        "3"{&$disable_base_custom_ui}
        "2"{&$hide_base_ui}
        "1"{&$hide_custom_ui}
        Default{&$hide_custom_ui}
    }
    switch($values[36]){
        "Dark"{&$dark_theme}
        "Light"{&$light_theme}
        Default{&$light_theme}
    }
    $global:last_path = $values[36]
    if($global:vid_select -eq ""){
        $global:vid_select = ".mp4"
    }
    if($global:pic_select -eq ""){
        $global:pic_select = ".jpg"
    }
    if($global:text_select -eq ""){
        $global:text_select = ".txt"
    }
    switch($global:vid_select){
        ".mp4"{
            &$MP4
        }
        ".mov"{
            &$MOV
        }
        ".mkv"{
            &$MKV
        }
        ".avi"{
            &$AVI
        }
        Default{
            &$V_None
        }
    }
    switch($global:pic_select){
        ".jpg"{
            &$JPG
        }
        ".jpeg"{
            &$JPEG
        }
        ".png"{
            &$PNG
        }
        Default{
            &$P_None
        }
    }
    switch($global:text_select){
        ".txt"{
            &$TEXT
        }
        ".log"{
            &$LOG
        }
        ".ini"{
            &$INI
        }
        ".cfg"{
            &$CFG
        }
        ".config"{
            &$CONFIG
        }
        Default{
            &$T_None
        }
    }
    
    return [string]$(Split-Path $($Load_dir) -Parent)
}

# Blank all UI Elements
$blank_ui = {
    $Project_TextBox.Text = ""
    $Bug_TextBox.Text = ""
    $Device_List.SelectedIndex = 0
    $Branch_List.SelectedIndex = 0
    $Build_TextBox.Text = ""
    $Check_Box.Checked = $False
    $Quality_List.SelectedIndex = 0
    $Nvidia_Box.Checked = $False
    $backup_tmi_yes.Checked = $False
    $verify_cbx.Checked = $False
    $Video_TextBox.Text = ""
    $Picture_TextBox.Text = ""
    $Text_TextBox.Text = ""
    $fps_cbx.SelectedIndex = 0
    $bit_cbx.SelectedIndex = 3
    $frame_cbx.SelectedIndex = 1
    $ratio_cbx.SelectedIndex = 0
    $global:Preset_values = @()
    $global:Regress_values = @()
}

# Format and load GUI values into respective elements
$format = {
    param([Boolean]$old, [String[]]$values)
    
    $Project_TextBox.Text 	= $values[0]
    $Bug_TextBox.Text 		= $values[1]
    $Device_List.Text 		= $values[2]
    $Branch_List.Text 		= $values[3]
    $Build_TextBox.Text 	= $values[4]
    if($values[5] -eq "1"){$Check_Box.Checked = $True}Else{$Check_Box.Checked = $False}
    $Quality_List.Text 		= $values[6]
    if($values[7] -eq "1"){$Nvidia_Box.Checked = $True}Else{$Nvidia_Box.Checked = $False}
    if($values[8] -eq "1"){$backup_tmi_yes.Checked = $True; $backup_tmi_no.Checked = $False}Else{
        $backup_tmi_yes.Checked = $False; $backup_tmi_no.Checked = $True}
    if($values[9] -eq "True"){&$Show_DropBox}Else{&$Hide_DropBox}
    if($old){
        switch($values[10]){
            "3"{&$disable_base_custom_ui}
            "2"{&$hide_base_ui}
            "1"{&$hide_custom_ui}
            Default{&$hide_custom_ui}
        }
        $verify_cbx.Checked = $False

    }else{
        if($values[10] -eq "1"){$verify_cbx.Checked = $True}Else{$verify_cbx.Checked = $False}
    }
    $Video_TextBox.Text = $values[11]
    $Picture_TextBox.Text = $values[12]
    $Text_TextBox.Text = $values[13]
    if($old){
        $fps_cbx.SelectedIndex = 0
        $bit_cbx.SelectedIndex = 3
        $frame_cbx.SelectedIndex = 1
        $ratio_cbx.SelectedIndex = 0
        for($i = 0; $i -le 6; $i++){
            if(!$values[15+$i].Trim(" ").length -lt 1){
                $global:Preset_values[$i] = $values[15+$i].Trim(" ")
            }
        }
        return ".mp4",".jpg",".txt"
    }else{
        $fps_cbx.Text = $values[14]
        $bit_cbx.Text = $values[15]
        $frame_cbx.Text = $values[16]
        $ratio_cbx.Text = $values[17]
        for($i = 0; $i -le 6; $i++){
            if(!$values[18+$i].Trim(" ").length -lt 1){
                $global:Preset_values[$i] = $values[18+$i].Trim(" ")
            }
        }
        for($i = 0; $i -le 6; $i++){
            if(!$values[25+$i].Trim(" ").length -lt 1){
                $global:Regress_values[$i] = $values[25+$i].Trim(" ")
            }
        }
        return $values[33],$values[34],$values[35]
    }
				
}

# Save GUI Values to Config File
# 1/27/2026 In-Development
$save_gui_values = {
    param([string] $Save_dir)
   
    if(!(Test-Path($Save_dir))){
		New-Item -Itemtype File -Path $Save_dir
	}else{
        Remove-Item $Save_dir
        New-Item -Name "$(Split-Path $Save_dir -leaf)"`
        -Itemtype File `
        -Path (Split-Path $Save_dir -parent)
    }
    
    
    $global:vid_select = &$coe_validator_video
    $global:pic_select = &$coe_validator_picture
    $global:text_select = &$coe_validator_text

    if($Check_Box.Checked){[string] $temp_1 = "1"}Else{[string] $temp_1 = "0"}
    if($Nvidia_Box.Checked){[string] $temp_2 = "1"}Else{[string] $temp_2 = "0"}
    if($backup_tmi_yes.Checked){[string] $temp_3 = "1"}Else{[string] $temp_3 = "0"}
    if($verify_cbx.Checked -eq  $True){$temp_4 = "1"}Else{$temp_4 = "0"}

    if($theme_tmi_light.Checked){
        [string] $theme_name = $theme_tmi_light.Text
    }else{
        [string] $theme_name = $theme_tmi_dark.Text
    }
    
    switch($Jira_Panel){
		{$_.visible -eq $false}{
			if($Custom_Panel.Visible -eq $false){
				$temp_5 = "3"
			}else{
				$temp_5 = "2"
			}
		}
		Default{
			$temp_5 = "1"
		}
	}
    "project=$($Project_TextBox.Text)" >> $Save_dir
    "bug_number=$($Bug_TextBox.Text)" >> $Save_dir
    "device=$($Device_List.Text)" >> $Save_dir
    "build_type=$($Branch_List.Text)" >> $Save_dir
    "build_number=$($Build_TextBox.Text)" >> $Save_dir 
    "audio=$($temp_1)" >> $Save_dir
    "quality=$($Quality_List.Text)" >> $Save_dir
    "encoder=$($temp_2)" >> $Save_dir
    "save=$($temp_3)" >> $Save_dir
    "extended=$($Collapse_Button.Visible)" >> $Save_dir
    "verify=$($temp_4)" >> $Save_dir
    "video_text=$($Video_TextBox.Text)" >> $Save_dir
    "pic_text=$($Picture_TextBox.Text)" >> $Save_dir
    "text_text=$($Text_TextBox.Text)" >> $Save_dir
    "fps=$($fps_cbx.Text)" >> $Save_dir
    "bit=$($bit_cbx.Text)" >> $Save_dir
    "frame=$($frame_cbx.Text)" >> $Save_dir
    "ratio=$($ratio_cbx.Text)" >> $Save_dir
    "preset_vid=$($Preset_values[0])" >> $Save_dir
    "preset_pic=$($Preset_values[1])" >> $Save_dir
    "preset_txt=$($Preset_values[2])" >> $Save_dir
    "preset_ini=$($Preset_values[3])" >> $Save_dir
    "preset_log=$($Preset_values[4])" >> $Save_dir
    "preset_cfg=$($Preset_values[5])" >> $Save_dir
    "preset_config=$($Preset_values[6])" >> $Save_dir
    "regress_vid=$($Regress_values[0])" >> $Save_dir
    "regress_pic=$($Regress_values[1])" >> $Save_dir
    "regress_txt=$($Regress_values[2])" >> $Save_dir
    "regress_ini=$($Regress_values[3])" >> $Save_dir
    "regress_log=$($Regress_values[4])" >> $Save_dir
    "regress_cfg=$($Regress_values[5])" >> $Save_dir
    "regress_config=$($Regress_values[6])" >> $Save_dir
    "rename_format=$temp_5" >> $Save_dir
    "vid_ext=$($global:vid_select)" >> $Save_dir
    "pic_ext=$($global:pic_select)" >> $Save_dir
    "text_ext=$($global:text_select)" >> $Save_dir
    "theme=$($theme_name)" >> $Save_dir
    "last_path=$($global:last_path)" >> $Save_dir
}

# Validate selected extensions for fluxing
$coe_validator_video = {
    foreach($type in $coe_tmi_video.DropDownItems){
        if($type.Checked){
            switch($type.Text){
                "MP4"{
                    return ".mp4"
                }
                "MOV"{
                    return ".mov"
                }
                "MKV"{
                    return ".mkv"
                }
                "AVI"{
                    return ".avi"
                }
                "No Change"{
                    return "None"
                }
            }
        }
    }
}
$coe_validator_picture = {
    foreach($type in $coe_tmi_pic.DropDownItems){
        if($type.Checked){
            switch($type.Text){
                "JPG"{
                    return ".jpg"
                }
                "JPEG"{
                    return ".jpeg"
                }
                "PNG"{
                    return ".png"
                }
                "No Change"{
                    return "None"
                }
            }
        }
    }
}
$coe_validator_text = {
    foreach($type in $coe_tmi_text.DropDownItems){
        if($type.Checked){
            switch($type.Text){
                "TXT"{
                    return ".txt"
                }
                "LOG"{
                    return ".log"
                }
                "INI"{
                    return ".ini"
                }
                "CFG"{
                    return ".cfg"
                }
                "CONFIG"{
                    return ".config"
                }
                "No Change"{
                    return "None"
                }
            }
        }
    }
}

# Main Form Keydown Event
$form_keystrokes = {
    if($_.Control -and $_.Shift -and $_.KeyCode -eq "Delete"){
        &$Clear_Event
    }
    if($_.Control -and $_.Shift -and $_.KeyCode -eq "Back"){
        &$Clear_Event
    }
    if($_.keycode -eq "Back" -or $_.keycode -eq "Delete"){
        &$delete_dropbox_click
    }
    if($_.Control -and  $_.keycode -eq "M"){
        &$ms_paint_event
    } 
}

# Keyboard Shortcut for TextBoxes to Select All Text
$key_event = { 
    param($obj)
    if($_.Control -and $_.KeyCode -eq "A"){
        $obj.SelectionStart = 0
        $obj.SelectionLength = $obj.SelectionStart + $obj.Text.length
    }
}

# Form Loading Event
# 1/27/2026 In-Development
$form_loading = {
    # Initialize Config Manager
    . Invoke-ConfigManager
    [string] $Load_dir = "$(Get-RootDirectory)\config\last_state.cfg"
    #Write-Host "Extract Directory: $Save_dir Result: $(Test-Path $Save_dir)"
    
    # Populate Combobox with values from Config files
    # Device Types
    [string[]] $supported_device_types = Get-Content "$config_path\supported_device_types.cfg"
    @(' -- Select -- ')  + $supported_device_types | %{$Device_List.Items.Add($_)}
    $Device_List.SelectedIndex = 0

    #Branch Types
    [string[]] $supported_branch_types = Get-Content "$config_path\supported_branch_types.cfg"
    @(' -- Select -- ')  + $supported_branch_types | %{$Branch_List.Items.Add($_)}
    $Branch_List.SelectedIndex = 0

    # Quality Types
    [string[]] $supported_quality_types = Get-Content "$config_path\supported_quality_types.cfg"
    
    @(' -- Select -- ')  + $supported_quality_types | %{$Quality_List.Items.Add($_)}
    $Quality_List.SelectedIndex = 0
    # Load Values from last session
    # UI elements will be populated based on the last saved session
	$global:last_path = &$load_gui_values -Load_dir $Load_dir
    
    # If GUI Load Phase does not initialize the desired output types
    if($global:vid_select -eq ""){
		$global:vid_select = ".mp4"
	}
	if($global:pic_select -eq ""){
		$global:pic_select = ".jpg"
	}
	if($global:text_select -eq ""){
		$global:text_select = ".txt"
	}

    # Remove any Extra Spaces on Input Values if config file was modified
    &$trim_textboxes

    &$check_root_folder
    
    # Uncomment to get logs
    #clear-Host 
}

# Form Refresh Event
$gui_refresh = {
    # Check if any files were added to the root folder while the form was closed
    &$check_root_folder
    # check if any files were removed from the root folder while the form was closed
    &$check_if_change
    # Adjust UI based on Quality selection
    &$quality_list_checker
    # Check if all inputs are filled to enable Rename & Flux Buttons
    &$check_inputs
    
}

# Form Closing Event
# 1/27/2026 In-Development
$form_closing = {
    # Save current GUI values to last_state.txt
    [string] $Save_dir = "$(Get-RootDirectory)\config\last_state.cfg"
    &$save_gui_values -Save_dir $Save_dir
    #write-host "Last State Values: $(Get-ConfigFileValues $Save_dir)"
    &$clear_selections
    &$form_dispose
}

# Dispose Form and its components
$form_dispose = {
	$Jira_Panel.Dispose()
	$Custom_Panel.Dispose()
	$Media_Panel.Dispose()
	$main_form.Dispose()
}

$light_theme = {
    $theme_tmi_light.Checked = $True
    $theme_tmi_dark.Checked = $False

    $main_form.BackColor = "Control"
    $main_form.ForeColor = "Black"
    $main_mst.BackColor = "Black"
    #$main_mst.Items | 
    $main_tmi_file.DropDownItems | %{
        if(($_.GetType()).Name -eq "ToolStripSeparator"){
            if($_.name -like "*light*"){
                $_.Visible = $True
            }else{
                $_.Visible = $False
            }
        }
        $_.BackColor = "Control"
        $_.ForeColor = "Black"
    }
    $main_tmi_format.DropDownItems | %{
         if(($_.GetType()).Name -eq "ToolStripSeparator"){
            if($_.name -like "*light*"){
                $_.Visible = $True
            }else{
                $_.Visible = $False
            }
        }
        $_.BackColor = "Control"
        $_.ForeColor = "Black"
    }
    $coe_tmi_video.DropDownItems | %{
        if(($_.GetType()).Name -eq "ToolStripSeparator"){
            if($_.name -like "*light*"){
                $_.Visible = $True
            }else{
                $_.Visible = $False
            }
        }
        $_.BackColor = "Control"
        $_.ForeColor = "Black"
    }
    $settings_tmi_theme.DropDownItems | %{
        $_.BackColor = "Control"
        $_.ForeColor = "Black"
    }
    $settings_tmi_crf.DropDownItems | %{
        $_.BackColor = "Control"
        $_.ForeColor = "Black"
    }
    $coe_tmi_pic.DropDownItems | %{
        if(($_.GetType()).Name -eq "ToolStripSeparator"){
            if($_.name -like "*light*"){
                $_.Visible = $True
            }else{
                $_.Visible = $False
            }
        }
        $_.BackColor = "Control"
        $_.ForeColor = "Black"
    }
    $coe_tmi_text.DropDownItems | %{
        if(($_.GetType()).Name -eq "ToolStripSeparator"){
            if($_.name -like "*light*"){
                $_.Visible = $True
            }else{
                $_.Visible = $False
            }
        }
        $_.BackColor = "Control"
        $_.ForeColor = "Black"
    }
    $settings_tmi_backup.DropDownItems | %{
        
        $_.BackColor = "Control"
        $_.ForeColor = "Black"
    }
    $settings_tmi_coe.DropDownItems | %{
         if(($_.GetType()).Name -eq "ToolStripSeparator"){
            if($_.name -like "*light*"){
                $_.Visible = $True
            }else{
                $_.Visible = $False
            }
        }
        $_.BackColor = "Control"
        $_.ForeColor = "Black"
    }
    $main_tmi_settings.DropDownItems | %{
        if(($_.GetType()).Name -eq "ToolStripSeparator"){
            if($_.name -like "*light*"){
                $_.Visible = $True
            }else{
                $_.Visible = $False
            }
        }
        $_.BackColor = "Control"
        $_.ForeColor = "Black"
    }
    $Jira_Panel.Controls | %{
        if(($_.GetType()).Name -in @("TextBox","ComboBox")){
            $_.BackColor = "Window"
        }else{
            $_.BackColor = "Control"
        }
        $_.ForeColor = "Black"
    }
   
    $Custom_Panel.Controls | %{
        if(($_.GetType()).Name -in @("TextBox","ComboBox")){
            $_.BackColor = "Window"
        }else{
            $_.BackColor = "Control"
        }
        $_.ForeColor = "Black"
    }

    $Media_Panel.Controls | %{
        if(($_.GetType()).Name -in @("TextBox","ComboBox")){
            $_.BackColor = "Window"
        }else{
            $_.BackColor = "Control"
        }
        $_.ForeColor = "Black"
    }

    $main_form.Controls | %{
        $_.BackColor = "Control"
        $_.ForeColor = "Black"
    }
}

$dark_theme = {
    $theme_tmi_light.Checked = $False
    $theme_tmi_dark.Checked = $True

    $main_form.BackColor = "64,64,64"
    $main_form.ForeColor = "Window"

    $main_tmi_file.DropDownItems | %{
        if(($_.GetType()).Name -eq "ToolStripSeparator"){
            if($_.name -like "*dark*"){
                $_.Visible = $True
            }else{
                $_.Visible = $False
            }
        }
        $_.BackColor = "64,64,64"
        $_.ForeColor = "Window"
    }
    $main_tmi_format.DropDownItems | %{
        if(($_.GetType()).Name -eq "ToolStripSeparator"){
            if($_.name -like "*dark*"){
                $_.Visible = $True
            }else{
                $_.Visible = $False
            }
        }
        $_.BackColor = "64,64,64"
        $_.ForeColor = "Window"
    }
    $coe_tmi_video.DropDownItems | %{
        if(($_.GetType()).Name -eq "ToolStripSeparator"){
            if($_.name -like "*dark*"){
                $_.Visible = $True
            }else{
                $_.Visible = $False
            }
        }
        $_.BackColor = "64,64,64"
        $_.ForeColor = "Window"
    }
    $settings_tmi_theme.DropDownItems | %{
        $_.BackColor = "64,64,64"
        $_.ForeColor = "Window"
    }
    $settings_tmi_crf.DropDownItems | %{
        $_.BackColor = "64,64,64"
        $_.ForeColor = "Window"
    }
    $coe_tmi_pic.DropDownItems | %{
        if(($_.GetType()).Name -eq "ToolStripSeparator"){
            if($_.name -like "*dark*"){
                $_.Visible = $True
            }else{
                $_.Visible = $False
            }
        }
        $_.BackColor = "64,64,64"
        $_.ForeColor = "Window"
    }
    $coe_tmi_text.DropDownItems | %{
        if(($_.GetType()).Name -eq "ToolStripSeparator"){
            if($_.name -like "*dark*"){
                $_.Visible = $True
            }else{
                $_.Visible = $False
            }
        }
        $_.BackColor = "64,64,64"
        $_.ForeColor = "Window"
    }
    $settings_tmi_backup.DropDownItems | %{
        $_.BackColor = "64,64,64"
        $_.ForeColor = "Window"
    }
    $settings_tmi_coe.DropDownItems | %{
        if(($_.GetType()).Name -eq "ToolStripSeparator"){
            if($_.name -like "*dark*"){
                $_.Visible = $True
            }else{
                $_.Visible = $False
            }
        }
        $_.BackColor = "64,64,64"
        $_.ForeColor = "Window"
    }
    $main_tmi_settings.DropDownItems | %{
        if(($_.GetType()).Name -eq "ToolStripSeparator"){
            if($_.name -like "*dark*"){
                $_.Visible = $True
            }else{
                $_.Visible = $False
            }
        }
        $_.BackColor = "64,64,64"
        $_.ForeColor = "Window"
    }
    $Jira_Panel.Controls | %{
        $_.BackColor = "64,64,64"
        $_.ForeColor = "Window"
    }
    $Custom_Panel.Controls | %{
        $_.BackColor = "64,64,64"
        $_.ForeColor = "Window"
    }
    $Media_Panel.Controls | %{
        $_.BackColor = "64,64,64"
        $_.ForeColor = "Window"
    }
    $main_form.Controls | %{
        $_.BackColor = "64,64,64"
        $_.ForeColor = "Black"
    }
}
$dark_theme_ToolStripSeperator = {
    param([System.Windows.Forms.ToolStripMenuItem]$compare_object, [string] $name)
    $object = New-Object System.Windows.Forms.ToolStripSeparator
    $object.Name = $name
    $object.Tag = $compare_object
    $object.Visible = $false
    $object.Add_Paint($dark_paint)
    return $object
}
$dark_paint = [System.Windows.Forms.PaintEventHandler]{
    param($sender, $e)
    $width = $($sender.tag).Width
    $height = $(New-Object System.Windows.Forms.ToolStripSeparator).Height
    $brush = New-Object System.Drawing.SolidBrush("64,64,64")
    $pen = New-Object System.Drawing.Pen("Window")

    $e.Graphics.FillRectangle($brush, 0, 0, $width, $height);
    $e.Graphics.DrawLine($pen, 10, $height/2, $width -10, $height/2)
}


. (Join-Path $PSScriptRoot "main_form.designer.ps1")