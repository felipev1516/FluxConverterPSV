<h2 align="center">
New Folder Layout
</h2>
<code>
|----- FluxConverter/
|		|--src/
|			|-- run.bat (<-- To run the program)
|			|-- app/ # main window (FluxConverter Forms)
|				|-- main/
|					|-- main_form.ps1 				# Main form path integration, calls other scripts files
|					|-- main_form.designer.ps1		# Main Form UI components
|						|-- Forms
|						|-- Menustrip
|						|-- ToolStripMenuItem
|						|-- ToolStripSeparator
|						|-- ToolTip
|						|-- ListBox
|						|-- Label
|						|-- Button
|						|-- ComboBox
|						|-- TextBox
|						|-- PictureBox
|						|-- Panel
|						|-- Checkbox
|					|-- main_form.events.ps1
|						|-- load_values_fn 			# When button is plessed, load UI values from config file
|						|-- save_values_fn 			# When button is pressed, save UI values to config file
|						|-- drop_box_refresh		# Refresh Dropbox based on forms interaction
|						|-- drop_box_add			# Refresh the drop box based on drag and drop and/or root folder findings
|						|-- coe_validator			# Returns a string value based on checked options on the toolstrip
|						|-- dispose_form
|						|-- form_opening
|						|-- file_to_paint			# Open highlight values in the drop box in microsoft paint
|						|-- clear_selections		# Clear Highlighted values on the GUI when unfocused
|						|-- rename_file				# Creates a string buffer based on values on the GUI
|						|-- Flux					# Extracts all values from the GUI and executes functions with the given values as arugments
|						|-- ffmpeg					# Extracts all media files from root folder and dropbox by pulling from there directory and uses the ffmpeg program to 
|													encode, rename and place the output files to the desired directory
|				|-- update/							# Form to inform user about application update
|					|-- update_form.ps1				# Update form path integration, calls other scripts files
|					|-- update_form.designer.ps1	# Update form UI components
|					|-- update_form.events.ps1
|				|-- prompt/							# Form to prompt user for conditions 
|					|-- prompt_form.ps1				# Prompt user form path integration
|					|-- prompt_form.designer.ps1	# Prompt form ui components
|					|-- prompt_form.events.ps1				
|				|-- progress/
|					|-- progressbar_form.ps1		# Progression Indicator Form
|					|-- progress_form.designer.ps1
|						|-- Forms
|						|-- progressbar
|						|-- Label
|						|-- TextBox
|					|-- progress_form.events.ps1
|				|-- attention/						# Form to send user status of a finished process
|					|-- attention_form.ps1
|					|-- attention_form.designer.ps1
|					|-- attention_form.events.ps1
|				|-- file_rename/
|					|-- file_rename_form.ps1
|					|-- file_rename_form.designer.ps1
|					|-- file_rename_form.events.ps1
|				|-- restart/						# Form to inform user to restart application
|					|-- restart_form.ps1
|					|-- restart_form.designer.ps1
|					|-- restart_form.events.ps1
|
|					
|		|-- lib/
|			|-- ffmpeg.exe								# The video encoder program
|			|-- Invoke-FluxConverterLibrary.ps1			# Calls all scripts from this lib\ directory
|			|-- Get-RootDirectory.ps1					# Returns root directory of the FluxConverter package
|			|-- Get-RootFolderItems.ps1					# Extract items in root directory
|			|-- Get-ConfigFileValues.ps1				# Extract items from a config file with a set value after a '=' character
|			|-- Remove-RootFolderItems.ps1				# Remove items in root directory
|			|-- Invoke-SaveFileDialog.ps1 				# Use the open file dialog to return a directory 
|			|-- Invoke-OpenFileDialog.ps1				# Use the open file dialog to return a directory
|			|-- Set-ReadOnlyValue.ps1					# Save value in run-time Memory 
|			|-- Remove-ReadOnlyValue.ps1				# Remove value in run-time memory
|			|-- Invoke-DupeFilePrevention.ps1			# Renames files with a integer if file with same name exist in directory
|			|-- Invoke-DecideFileOutcome.ps1			# Decide whither to keep a copy of media into a save_files folder for future use
|			|-- Remove-IllegalChar.ps1					# Removes Illegal characters from string and replaces them with "_"
|			|-- Invoke-IterationPlacement.ps1			# Strings with '{#}' will be replaced with a iterated integer
|			|-- Split-Path-Ext.ps1						# Powershell 5.4 does not have Split-Path -Ext
|			|-- Invoke-ConfigManager.ps1				# Check if config file exit and create config file if not with preset values set to default
|		|--config/
|			|-- default.cfg							# Format on UI stored values
|			|-- last_state.cfg						# UI values stored here from last session
|			|-- supported_video_ext.cfg				# Supported video media file types for ffmpeg
|			|-- supported_pic_ext.cfg				# Supported picture media file types for ffmpeg
|			|-- supported_txt_ext.cfg				# Supported text file types
|			|-- supported_file_types.cfg			# Values used in the renaming form for media output extention
|			|-- supported_branch_types.cfg			# Suppoted branch types
|			|-- supported_device_types.cfg			# Supported device types
|			|-- supported_qualities.cfg				# Quality identifiers for media output
|		|-- assets/
|			|-- icons\
|			|-- notes\
|				|-- patch-notes.log
|		|-- profiles\
|
</code>