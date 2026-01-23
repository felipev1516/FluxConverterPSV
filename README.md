<pre>
|-- lib/
    |-- ffmpeg.exe                         # The video encoder program
    |-- Invoke-FluxConverterLibrary.ps1    # Calls all scripts from this lib\ directory
    |-- Get-RootDirectory.ps1              # Returns root directory of the FluxConverter package
    |-- Get-RootFolderItems.ps1            # Extract items in root directory
    |-- Get-ConfigFileValues.ps1           # Extract items from a config file after '='
    |-- Remove-RootFolderItems.ps1         # Remove items in root directory
    |-- Invoke-SaveFileDialog.ps1          # Use the open file dialog to return a directory
    |-- Invoke-OpenFileDialog.ps1          # Use the open file dialog to return a directory
    |-- Set-ReadOnlyValue.ps1              # Save value in run-time memory
    |-- Remove-ReadOnlyValue.ps1           # Remove value from run-time memory
    |-- Invoke-DupeFilePrevention.ps1      # Renames files with an integer if duplicate exists
    |-- Invoke-DecideFileOutcome.ps1       # Decide whether to keep a copy of media in save_files
    |-- Remove-IllegalChar.ps1             # Removes illegal characters and replaces with "_"
    |-- Invoke-IterationPlacement.ps1      # Replace '{#}' with an iterated integer
    |-- Split-Path-Ext.ps1                 # PowerShell 5.4 lacks Split-Path -Ext
    |-- Invoke-ConfigManager.ps1           # Create config file if missing, load defaults
</pre>
