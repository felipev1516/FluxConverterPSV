. "$PSScriptRoot\main_form.designer.ps1"

# Configuration Path
$config_path = "$(Get-RootDirectory)\config"

# Supported Extensions Arrays
[string[]] $supported_ext = $(cat "$config_path\supported_pic_ext.cfg" | %{"*.$_"}) + `
                            $(cat "$config_path\supported_video_ext.cfg" | %{"*.$_"}) + `
                            $(cat "$config_path\supported_txt_ext.cfg" | %{"*.$_"})

#write-host $supported_ext

# Global Variables
# These arrays will hold preset and regression values for renaming files
# These will also be used in the file_rename_form.ps1 events
[string[]] $global:Preset_values = @("","","","","","","")
[string[]] $global:Regress_values = @("","","","","","","")

# These variables will hold the selected extensions for each file type during conversion
[string] $global:vid_select = ""
[string] $global:pic_select = ""
[string] $global:text_select = ""

# After using the OpenFileDialog, this variable will hold the last path used
[string] $global:last_path = ""

# $global:full_path will hold all files that are currently in the DropBox Listbox and Root Folder
$global:full_path = (Get-RootFolderItems -SupportedExtensions $supported_ext)
# DropBox.Items will collect only file names for better readability

# MenuStrip Events on main form
# Load Text Fields with Config Data
$tmi_load_event = {
    $Load_dir = $(Invoke-OpenFileDialog -initialDirectory "$(Get-RootDirectory)\profiles\" -multiSelect $False).filename
    $global:last_path = (Split-Path $Load_dir -parent)
    # load_gui_values function called here
    if(!($Load_dir -eq "")){&$load_gui_values -Load_dir $Load_dir}
}

$tmi_open_event = {
    $Load_dir = $(Invoke-OpenFileDialog -initialDirectory "$home\Downloads" -multiSelect $True).filename
    if(!($Load_dir.filenames -eq "")){
        foreach($file in $Load_dir.filenames){
            &$add_to_dropbox -files $file
        }
    }
    &$check_if_change
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
    $Jira_Panel.Enabled = $False
    $Jira_Panel.Visible = $False
    
    $Custom_Panel.Enabled = $False
    $Custom_Panel.Visible = $False
    
    $Media_Panel.Location = "15,70"
    $video_panel.Location = "5,160"
    
    &$quality_list_checker
}

# Show Video Panel if Quality is set to 'Media'
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

# Calling Update Form Event, Redo this later to make it cleaner
$Check_For_Update = {
    if(!(Test-Path "$PWD/data/update.ps1")){
        if(!(Test-Path "$($remote)\data\update.ps1")){
            ./data/UI/prompt.ps1 -pass $False
        }else{
            copy "$($remote)\data\update.ps1" $PSScriptRoot
            if(!(Test-Path "$PWD/data/update.ps1")){
                ./data/UI/prompt.ps1 -pass $False
            }else{
                ./data/update.ps1 -remote $remote -local $local -rule $rule
            }
        }
    }else{
        ./data/update.ps1 -remote $remote -local $local -rule $rule
        if((Compare-Object $Version $(cat $PWD/data/Version.txt) -IncludeEqual).SideIndicator.contains("<=") `
        -or (Compare-Object $Version $(cat $PWD/data/Version.txt) -IncludeEqual).SideIndicator.contains("=>")){
            ./data/UI/prompt.ps1 -pass $True
            $main_form.close()
        }
    }
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
    Get-RootFolderItems -SupportedExtensions $supported_ext | ForEach-Object { &$add_to_dropbox -files $_ }
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
    if ($global:last_path -eq ""){
        $global:last_path = "$env:USERPROFILE\Downloads"
    }
    
    $Load_dir = Invoke-OpenFileDialog -initialDirectory $global:last_path -multiSelect $True
    
    if ($load_dir.filenames.count -gt 0) {
        $global:last_path = (Split-Path $Load_dir.filenames[0] -parent)
    }

    if(!($Load_dir.filenames -eq "")){
        foreach($file in $Load_dir.filenames)
        {
            &$add_to_dropbox -files $file
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
	foreach($case in $supported_ext)
	{
		if($files -like $case){
			if($files -notin $global:full_path){ #Prevent Duplicating Drag&Drop Item with Existing file in Root folder
                $global:full_path += $files
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
	$DropBox.BeginUpdate();
		if($DropBox.SelectedItems.count -eq $DropBox.Items.count){
					foreach($item in $global:full_path){
						#Check Root first
						if((Get-RootFolderItems -SupportedExtensions $supported_ext).contains($item)){
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
				#Check Root first
				if($($global:full_path[$index] | split-path -leaf) -in $DropBox.SelectedItems){
                    # In-real time values of $global:full_path might change so we need to recheck each time
					if((Get-RootFolderItems -SupportedExtensions $supported_ext).contains($global:full_path[$index])){
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
$flux_button_click = {
    [string] $temp_ext = ""
	[boolean] $result
	[string[]] $buffer = coe_validator
	[int] $file_transferred = $DropBox.Items.Count; [int] $file_index = 0
	$global:vid_select = $buffer[0];$global:pic_select = $buffer[1];$global:text_select = $buffer[2]

	if($global:vid_select -eq ""){
		$global:vid_select = ".mp4"
	}
	if($global:pic_select -eq ""){
		$global:pic_select = ".jpg"
	}
	if($global:text_select -eq ""){
		$global:text_select = ".txt"
	}

	$Build_TextBox.text = $Build_TextBox.text.trim(" ")
	if($Build_TextBox.Text -eq "" -or $Build_TextBox.Visible -eq $False)
	{
		$global:file_destination = New-Object System.Windows.Forms.OpenFileDialog -Property @{
			InitialDirectory = "$home\Downloads"
			CheckFileExists = 0
			ValidateNames = 0
			FileName = "Choose Folder"
		}
		if( $global:file_destination.ShowDialog() -eq "OK"){
			$global:file_destination = $global:file_destination.Filename | Split-path -parent 
			if($global:file_destination -eq "" -or !(Test-Path $global:file_destination)){
				return
			}
		}else{
			return
		}
	}
	else{
		$global:file_destination = "$PWD\output\$($Build_TextBox.text)"
		if(!(Test-Path($global:file_destination))){
			mkdir $global:file_destination
		}
	}
	
	#Move Items on Drop List into Root folder
	if($global:array.count -gt 0)
	{
		# Temp Fix
		[string[]] $_temp = @()
		for($_i = 0; $_i -lt $global:array.count; $_i++){
			$_temp += $global:array[$_i]
		}
		[system.array]::Reverse($_temp)
		$DropBox.Items.Clear()
		$DropBox.Items.AddRange($($_temp | Split-Path -leaf))
		
		for([int] $index = $($DropBox.Items.Count - 1); $index -ge 0; $index--)
		{
			[string] $item = $global:array[$index]
			$DropBox.BeginUpdate();
			$temp_ext = [system.string]::Concat("*", (Split-Path-Ext($item)))
			
			$ffmpeg_process = {
				param([string] $in, [string] $out, [string] $extention)
				[string] $newname = ""
				#Keep a copy of media with the original title
				if($in -like "*$PWD*" -and $Save_Files_Box.Checked){
					$newname = duplicate_file_prevention $in "$PWD\saved_files\" $(Split-Path-Ext($in))
					Copy-Item $in -Destination "$PWD\saved_files\$($newname)"
				}
				if($Jira_Panel.Visible -eq $True -or $Custom_Panel.Visible -eq $True){
					$newname = rename_file($in)
					$newname = duplicate_file_prevention $newname $out $extention
					
				}else{
					$newname = duplicate_file_prevention $in $out $extention
				}
				if($just_rename -or $temp_ext -in $supported_txt_ext){
					$newname = $newname.replace($(Split-Path-Ext($newname)),$extention)
					if(!$Save_Files_Box.Checked){
						Move-Item $in -Destination "$($out)\$($newname)"
					}else{
						Copy-Item $in -Destination "$($out)\$($newname)"
					}
					$DropBox.Items.RemoveAt($index)
					$global:array = $global:array.where{$_ -ne $global:array[$index]}
					if(Test-Path "$($out)\$($newname)"){
						return $True
					}else{
						return $false
					}
				}else{
					if(!$(ffmpeg $in $newname $out $extention)){
						return $false
					}else{
						if(!$Save_Files_Box.Checked){
							Remove-Item $in
							$DropBox.Items.RemoveAt($index)
							$global:array = $global:array.where{$_ -ne $global:array[$index]}
						}
						return $true
					}
				}
					
			}
			
			if($temp_ext -in $supported_video_ext){
				if($global:vid_select -eq "None"){
					$global:vid_select = Split-Path-Ext($item)
				}
				$result = &$ffmpeg_process -in $item -out $global:file_destination -extention $global:vid_select
			}elseif($temp_ext -in $supported_pic_ext){
				if($global:pic_select -eq "None"){
					$global:pic_select = Split-Path-Ext($item)
				}
				$result = &$ffmpeg_process -in $item -out $global:file_destination -extention $global:pic_select				
			}elseif($temp_ext -in $supported_txt_ext){
				if($global:text_select -eq "None"){
					$global:text_select = Split-Path-Ext($item)
				}
				$result = &$ffmpeg_process -in $item -out $global:file_destination -extention $global:text_select
			}else{
				write-error "File has a unsupported extention"
				$result = $False
			}
			if($result){
				$file_index++
			}
			$DropBox.EndUpdate();					
		}
	}
	if ($file_transferred -ne $file_index){
		&$flux_warning_prompt
		$Flux_form.ShowDialog() | Out-null
	}
	else{
		start $global:file_destination
		$DropBox.items.clear()
		$global:array = @()
		$Drop_Prompt.Visible = $True
		remove_root_files
	}
	return
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
    if($global:full_path.count -gt 0){
		foreach($files in $global:full_path)
		{
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

# Checks and replaces abbreviation texts in the input buffer
$Replace_AbbrevText = {
	param([string]$input_buffer)
	$input_buffer = &$Replace_LegacyAbbrevText -buffer $input_buffer
	$abbrev = Get-Content "$PSScriptRoot\..\config\abbreviations.cfg"
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
    $abbrev_legacy = Get-Content "$PSScriptRoot\..\config\legacy_abbreviations.cfg"
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
    #Set_ReadOnly_Value "save_file_dir" $Load_dir
	
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
    $Save_Files_Box.Checked = $False
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
    if($values[8] -eq "1"){$Save_Files_Box.Checked = $True}Else{$Save_Files_Box.Checked = $False}
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
$save_gui_values = {
    param([string] $Save_dir)
    if(!(Test-Path($Save_dir))){
		New-Item -Itemtype File -Path $Save_dir
	}
    $buffer = @(); $buffer = &$coe_validator
    $global:vid_select = $buffer[0];$global:pic_select = $buffer[1];$global:text_select = $buffer[2]

    if($Check_Box.Checked){[string] $temp_1 = "1"}Else{[string] $temp_1 = "0"}
    if($Nvidia_Box.Checked){[string] $temp_2 = "1"}Else{[string] $temp_2 = "0"}
    if($Save_Files_Box.Checked){[string] $temp_3 = "1"}Else{[string] $temp_3 = "0"}
    if($verify_cbx.Checked -eq  $True){$temp_4 = "1"}Else{$temp_4 = "0"}
    
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

    $global:last_path = (Split-Path $Save_dir -parent)
}

# Validate selected extensions for fluxing
$coe_validator = {
	if(!$video_tmi_mp4.Checked){
		if(!$video_tmi_mov.Checked){
			if(!$video_tmi_mkv.Checked){
				if(!$video_tmi_avi.Checked){
					[string] $vid = "None"
				}else{[string] $vid = ".avi"}
			}else{[string] $vid = ".mkv"}
		}else{[string] $vid = ".mov"}
	}else{[string] $vid = ".mp4"}
	if(!$pic_tmi_jpg.Checked){
		if(!$pic_tmi_jpeg.Checked){
			if(!$pic_tmi_png.Checked){
				[string] $pic = "None"
			}else{[string] $pic = ".png"}
		}else{[string] $pic = ".jpeg"}
	}else{[string] $pic = ".jpg"}
	if(!$text_tmi_text.Checked){
		if(!$text_tmi_log.Checked){
			if(!$text_tmi_ini.Checked){
				if(!$text_tmi_cfg.Checked){
					if(!$text_tmi_config.Checked){
						[string] $text = "None"
					}else{[string] $text = ".config"}
				}else{[string] $text = ".cfg"}
			}else{[string] $text = ".ini"}
		}else{[string] $text = ".log"}
	}else{[string] $text = ".txt"}
	return $vid, $pic, $text
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
        &$delete_event
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
$form_loading = {
    # Initialize Config Manager
    . Invoke-ConfigManager
    [string] $Save_dir = "$(Get-RootDirectory)\config\last_state.txt"

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
	&$load_gui_values -Load_dir $Save_dir
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
$form_closing = {
    # Save current GUI values to last_state.txt
    [string] $Save_dir = "$(Get-RootDirectory)\config\last_state.txt"
    &$save_gui_values -Save_dir $Save_dir
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
