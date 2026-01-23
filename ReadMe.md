# File Structure

|-- app/                               # main window (FluxConverter Forms)
    |-- main/
        |-- main_form.ps1              # Main form path integration, calls other scripts files
        |-- main_form.designer.ps1     # Main Form UI components
            |-- Forms
            |-- Menustrip
            |-- ToolStripMenuItem
            |-- ToolStripSeparator
            |-- ToolTip
            |-- ListBox
            |-- Label
            |-- Button
            |-- ComboBox
            |-- TextBox
            |-- PictureBox
            |-- Panel
            |-- Checkbox
        |-- main_form.events.ps1
            |-- load_values_fn         # Load UI values from config file
            |-- save_values_fn         # Save UI values to config file
            |-- drop_box_refresh       # Refresh Dropbox based on forms interaction
            |-- drop_box_add           # Add files to dropbox from drag/drop or root folder
            |-- coe_validator          # Returns string based on toolstrip options
            |-- dispose_form
            |-- form_opening
            |-- file_to_paint          # Open highlighted values in MS Paint
            |-- clear_selections       # Clear highlighted values when unfocused
            |-- rename_file            # Build string buffer based on GUI values
            |-- Flux                   # Extract GUI values and execute functions
            |-- ffmpeg                 # Encode/rename/place output files using ffmpeg
    |-- update/                         # Form to inform user about application update
        |-- update_form.ps1
        |-- update_form.designer.ps1
        |-- update_form.events.ps1
    |-- prompt/                         # Form to prompt user for conditions
        |-- prompt_form.ps1
        |-- prompt_form.designer.ps1
        |-- prompt_form.events.ps1
    |-- progress/
        |-- progressbar_form.ps1        # Progress indicator form
        |-- progress_form.designer.ps1
            |-- Forms
            |-- progressbar
            |-- Label
            |-- TextBox
        |-- progress_form.events.ps1
    |-- attention/                      # Form to notify user of finished process
        |-- attention_form.ps1
        |-- attention_form.designer.ps1
        |-- attention_form.events.ps1
    |-- file_rename/
        |-- file_rename_form.ps1
        |-- file_rename_form.designer.ps1
        |-- file_rename_form.events.ps1
    |-- restart/                        # Form to inform user to restart application
        |-- restart_form.ps1
        |-- restart_form.designer.ps1
        |-- restart_form.events.ps1
