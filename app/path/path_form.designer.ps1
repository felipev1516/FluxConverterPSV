$path_form = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.TextBox]$path_tbx = $null
[System.Windows.Forms.Label]$path_label = $null
[System.Windows.Forms.Label]$path_prompt1 = $null
[System.Windows.Forms.Button]$path_button = $null
[System.Windows.Forms.Label]$path_prompt_2 = $null
[System.Windows.Forms.Label]$status_label = $null
[System.Windows.Forms.TextBox]$status_tbx = $null
[System.Windows.Forms.Label]$status_desc = $null
[System.Windows.Forms.Button]$folder_button = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot 'path_form.resources.ps1')
$path_tbx = (New-Object -TypeName System.Windows.Forms.TextBox)
$path_label = (New-Object -TypeName System.Windows.Forms.Label)
$path_prompt1 = (New-Object -TypeName System.Windows.Forms.Label)
$path_button = (New-Object -TypeName System.Windows.Forms.Button)
$path_prompt_2 = (New-Object -TypeName System.Windows.Forms.Label)
$status_label = (New-Object -TypeName System.Windows.Forms.Label)
$status_tbx = (New-Object -TypeName System.Windows.Forms.TextBox)
$status_desc = (New-Object -TypeName System.Windows.Forms.Label)
$folder_button = (New-Object -TypeName System.Windows.Forms.Button)
$path_form.SuspendLayout()
#
#path_tbx
#
$path_tbx.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]115,[System.Int32]143))
$path_tbx.Name = [System.String]'path_tbx'
$path_tbx.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]351,[System.Int32]21))
$path_tbx.TabIndex = [System.Int32]0
$path_tbx.add_TextChanged($path_tbx_TextChanged)
#
#path_label
#
$path_label.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]15.75,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$path_label.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]43,[System.Int32]133))
$path_label.Name = [System.String]'path_label'
$path_label.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]68,[System.Int32]34))
$path_label.TabIndex = [System.Int32]1
$path_label.Text = [System.String]'Path:'
$path_label.TextAlign = [System.Drawing.ContentAlignment]::MiddleRight
$path_label.add_Click($Label1_Click)
#
#path_prompt1
#
$path_prompt1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]21.75,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$path_prompt1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]55,[System.Int32]32))
$path_prompt1.Name = [System.String]'path_prompt1'
$path_prompt1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]428,[System.Int32]40))
$path_prompt1.TabIndex = [System.Int32]2
$path_prompt1.Text = [System.String]'Please Insert Server Directory'
$path_prompt1.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$path_prompt1.add_Click($Label2_Click)
#
#path_button
#
$path_button.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$path_button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]203,[System.Int32]260))
$path_button.Name = [System.String]'path_button'
$path_button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]126,[System.Int32]52))
$path_button.TabIndex = [System.Int32]3
$path_button.Text = [System.String]'Okay'
$path_button.UseVisualStyleBackColor = $true
$path_button.add_Click($path_button_Click)
#
#path_prompt_2
#
$path_prompt_2.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$path_prompt_2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]110,[System.Int32]83))
$path_prompt_2.Name = [System.String]'path_prompt_2'
$path_prompt_2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]307,[System.Int32]42))
$path_prompt_2.TabIndex = [System.Int32]4
$path_prompt_2.Text = [System.String]'The Flux Converter will not receive updates if directory is not define.'
$path_prompt_2.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$path_prompt_2.add_Click($path_prompt_2_Click)
#
#status_label
#
$status_label.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]15.75,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$status_label.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]112,[System.Int32]214))
$status_label.Name = [System.String]'status_label'
$status_label.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]88,[System.Int32]32))
$status_label.TabIndex = [System.Int32]5
$status_label.Text = [System.String]'Status:'
$status_label.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$status_label.add_Click($status_label_Click)
#
#status_tbx
#
$status_tbx.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]195,[System.Int32]222))
$status_tbx.Name = [System.String]'status_tbx'
$status_tbx.ReadOnly = $true
$status_tbx.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]139,[System.Int32]21))
$status_tbx.TabIndex = [System.Int32]6
$status_tbx.add_TextChanged($status_tbx_TextChanged)
#
#status_desc
#
$status_desc.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$status_desc.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]128,[System.Int32]176))
$status_desc.Name = [System.String]'status_desc'
$status_desc.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]289,[System.Int32]28))
$status_desc.TabIndex = [System.Int32]7
$status_desc.Text = [System.String]'Indicates if path exist and reachable'
$status_desc.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$status_desc.add_Click($status_desc_Click)
#
#folder_button
#
$folder_button.Image = ([System.Drawing.Image]$resources.'folder_button.Image')
$folder_button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]472,[System.Int32]137))
$folder_button.Name = [System.String]'folder_button'
$folder_button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]30,[System.Int32]30))
$folder_button.TabIndex = [System.Int32]8
$folder_button.UseVisualStyleBackColor = $true
$folder_button.add_Click($folder_button_Click)
#
#path_form
#
$path_form.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]535,[System.Int32]330))
$path_form.Controls.Add($folder_button)
$path_form.Controls.Add($status_desc)
$path_form.Controls.Add($status_tbx)
$path_form.Controls.Add($status_label)
$path_form.Controls.Add($path_prompt_2)
$path_form.Controls.Add($path_button)
$path_form.Controls.Add($path_prompt1)
$path_form.Controls.Add($path_label)
$path_form.Controls.Add($path_tbx)
$path_form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$path_form.Icon = ([System.Drawing.Icon]$resources.'$this.Icon')
$path_form.MaximizeBox = $false
$path_form.Text = [System.String]'Insert Path'
$path_form.add_Closing($path_form_Closing)
$path_form.add_Load($path_form_Load)
$path_form.ResumeLayout($false)
$path_form.PerformLayout()
Add-Member -InputObject $path_form -Name path_tbx -Value $path_tbx -MemberType NoteProperty
Add-Member -InputObject $path_form -Name path_label -Value $path_label -MemberType NoteProperty
Add-Member -InputObject $path_form -Name path_prompt1 -Value $path_prompt1 -MemberType NoteProperty
Add-Member -InputObject $path_form -Name path_button -Value $path_button -MemberType NoteProperty
Add-Member -InputObject $path_form -Name path_prompt_2 -Value $path_prompt_2 -MemberType NoteProperty
Add-Member -InputObject $path_form -Name status_label -Value $status_label -MemberType NoteProperty
Add-Member -InputObject $path_form -Name status_tbx -Value $status_tbx -MemberType NoteProperty
Add-Member -InputObject $path_form -Name status_desc -Value $status_desc -MemberType NoteProperty
Add-Member -InputObject $path_form -Name folder_button -Value $folder_button -MemberType NoteProperty
}
. InitializeComponent
