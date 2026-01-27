<<<<<<< HEAD
<body>
  <p align="center">
  <img width="624" height="350" alt="image" src="https://github.com/user-attachments/assets/53e789ed-05b0-41be-9af5-714d90a66699" />
</p>
<h2 align="center"> Important:</h2>
<p>
  We are migrating from a old private repository in GitHub and removing media, directories and other content to wipe all previous commits. This application was created on June 2023 and is going through a new filing structure. To monitor the tasking and project progression via Jira click <a href="https://valadezf3031.atlassian.net/jira/software/projects/FLUX/boards/68?atlOrigin=eyJpIjoiZWM0ZTVmNDJjNGNlNDIxMWFhMTgyYTU3YmFjOTEzOTYiLCJwIjoiaiJ9">valadezf3031/FluxConverter</a>
</p>
<h2 align="center">Latest Patch Notes:</h2>
<pre>
  4.0.0
- Change Drop Box Items Name into just Name not Full directory 
- Add a drag/move on listview to change ranking
Test-Path : Cannot bind argument to parameter 'Path' because it is null.
At C:\Users\felip\Downloads\GitHub\FluxConverter\data\gui.ps1:456 char:17
+         if(!(Test-Path($array[$index])))
+                       ~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidData: (:) [Test-Path], ParameterBindingValidationException
    + FullyQualifiedErrorId : ParameterArgumentValidationErrorNullNotAllowed,Microsoft.PowerShell.Commands.TestPa  
   thCommand
</pre>

<h2>
  Installation:
</h2>
<p>
  I will post as soon as the new directory structure is completed
</p>
</body>
=======
<pre>
# File Structure in this directory
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
>>>>>>> FLUX-6-lib
