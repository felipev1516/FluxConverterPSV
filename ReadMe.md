<pre>

|-- app/                               # main window (FluxConverter Forms)

&nbsp;   |-- main/

&nbsp;       |-- main\_form.ps1              # Main form path integration, calls other scripts files

&nbsp;       |-- main\_form.designer.ps1     # Main Form UI components

&nbsp;           |-- Forms

&nbsp;           |-- Menustrip

&nbsp;           |-- ToolStripMenuItem

&nbsp;           |-- ToolStripSeparator

&nbsp;           |-- ToolTip

&nbsp;           |-- ListBox

&nbsp;           |-- Label

&nbsp;           |-- Button

&nbsp;           |-- ComboBox

&nbsp;           |-- TextBox

&nbsp;           |-- PictureBox

&nbsp;           |-- Panel

&nbsp;           |-- Checkbox

&nbsp;       |-- main\_form.events.ps1

&nbsp;           |-- load\_values\_fn         # Load UI values from config file

&nbsp;           |-- save\_values\_fn         # Save UI values to config file

&nbsp;           |-- drop\_box\_refresh       # Refresh Dropbox based on forms interaction

&nbsp;           |-- drop\_box\_add           # Add files to dropbox from drag/drop or root folder

&nbsp;           |-- coe\_validator          # Returns string based on toolstrip options

&nbsp;           |-- dispose\_form

&nbsp;           |-- form\_opening

&nbsp;           |-- file\_to\_paint          # Open highlighted values in MS Paint

&nbsp;           |-- clear\_selections       # Clear highlighted values when unfocused

&nbsp;           |-- rename\_file            # Build string buffer based on GUI values

&nbsp;           |-- Flux                   # Extract GUI values and execute functions

&nbsp;           |-- ffmpeg                 # Encode/rename/place output files using ffmpeg

&nbsp;   |-- update/                         # Form to inform user about application update

&nbsp;       |-- update\_form.ps1

&nbsp;       |-- update\_form.designer.ps1

&nbsp;       |-- update\_form.events.ps1

&nbsp;   |-- prompt/                         # Form to prompt user for conditions

&nbsp;       |-- prompt\_form.ps1

&nbsp;       |-- prompt\_form.designer.ps1

&nbsp;       |-- prompt\_form.events.ps1

&nbsp;   |-- progress/

&nbsp;       |-- progressbar\_form.ps1        # Progress indicator form

&nbsp;       |-- progress\_form.designer.ps1

&nbsp;           |-- Forms

&nbsp;           |-- progressbar

&nbsp;           |-- Label

&nbsp;           |-- TextBox

&nbsp;       |-- progress\_form.events.ps1

&nbsp;   |-- attention/                      # Form to notify user of finished process

&nbsp;       |-- attention\_form.ps1

&nbsp;       |-- attention\_form.designer.ps1

&nbsp;       |-- attention\_form.events.ps1

&nbsp;   |-- file\_rename/

&nbsp;       |-- file\_rename\_form.ps1

&nbsp;       |-- file\_rename\_form.designer.ps1

&nbsp;       |-- file\_rename\_form.events.ps1

&nbsp;   |-- restart/                        # Form to inform user to restart application

&nbsp;       |-- restart\_form.ps1

&nbsp;       |-- restart\_form.designer.ps1

&nbsp;       |-- restart\_form.events.ps1

</pre>

