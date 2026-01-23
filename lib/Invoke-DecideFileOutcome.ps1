# This function is directory dependable
. "$PSScriptRoot\Split-Path-Ext.ps1"
. "$PSScriptRoot\Invoke-IterationPlacement.ps1"
. "$PSScriptRoot\Invoke-DupeFilePrevention.ps1"

# This function will decide the outcome of a file based on user preference
# delete or move to saved_files folder
Function Invoke-DecideFileOutcome {
	Param([string]$path, [bool]$delete)
	# $path = full path to file
	# $delete = boolean, if true delete file, if false move to saved_files directory
	$save_files_dir = "$PSScriptRoot\..\saved_files"
    
	if(!(Test-Path $save_files_dir)){
        mkdir $save_files_dir | Out-Null
    }
	
	if(!$delete){
		if($($path | Split-path -Leaf) -notin $(dir "$($save_files_dir)\*" -name)){
			Move-Item $path -Destination $save_files_dir
		}else{
			$new_name = Invoke-DupeFilePrevention -path $path -new_extention Split-Path-Ext($path) -destination "$save_files_dir"
			Move-Item $path -Destination "$($save_files_dir)\$($new_name)"
		}	
	}else{
        Remove-Item $path
    }
	return
}