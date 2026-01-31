$prompt_form = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Label]$status_lbl = $null
[System.Windows.Forms.Label]$desc_lbl = $null
[System.Windows.Forms.Panel]$path_panel = $null
[System.Windows.Forms.Button]$path_button_no = $null
[System.Windows.Forms.Button]$path_button_yes = $null
[System.Windows.Forms.Panel]$path_support_panel = $null
[System.Windows.Forms.Button]$no_support_btn = $null
[System.Windows.Forms.Button]$yes_support_btn = $null
[System.Windows.Forms.Panel]$ignore_panel = $null
[System.Windows.Forms.Button]$no_ignore_btn = $null
[System.Windows.Forms.Button]$yes_ignore_btn = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot 'prompt_form.resources.ps1')
$status_lbl = (New-Object -TypeName System.Windows.Forms.Label)
$desc_lbl = (New-Object -TypeName System.Windows.Forms.Label)
$path_panel = (New-Object -TypeName System.Windows.Forms.Panel)
$path_button_no = (New-Object -TypeName System.Windows.Forms.Button)
$path_button_yes = (New-Object -TypeName System.Windows.Forms.Button)
$path_support_panel = (New-Object -TypeName System.Windows.Forms.Panel)
$no_support_btn = (New-Object -TypeName System.Windows.Forms.Button)
$yes_support_btn = (New-Object -TypeName System.Windows.Forms.Button)
$ignore_panel = (New-Object -TypeName System.Windows.Forms.Panel)
$no_ignore_btn = (New-Object -TypeName System.Windows.Forms.Button)
$yes_ignore_btn = (New-Object -TypeName System.Windows.Forms.Button)
$path_panel.SuspendLayout()
$path_support_panel.SuspendLayout()
$ignore_panel.SuspendLayout()
$prompt_form.SuspendLayout()
#
#status_lbl
#
$status_lbl.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]20.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$status_lbl.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]27,[System.Int32]18))
$status_lbl.Name = [System.String]'status_lbl'
$status_lbl.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]460,[System.Int32]61))
$status_lbl.TabIndex = [System.Int32]0
$status_lbl.Text = [System.String]'The ignore file is not defined'
$status_lbl.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$status_lbl.add_Click($status_lbl_Click)
#
#desc_lbl
#
$desc_lbl.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$desc_lbl.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]65,[System.Int32]88))
$desc_lbl.Name = [System.String]'desc_lbl'
$desc_lbl.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]387,[System.Int32]42))
$desc_lbl.TabIndex = [System.Int32]1
$desc_lbl.Text = [System.String]'Would you like to locate the file? (Optional)'
$desc_lbl.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$desc_lbl.add_Click($desc_lbl_Click)
#
#path_panel
#
$path_panel.Controls.Add($path_button_no)
$path_panel.Controls.Add($path_button_yes)
$path_panel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]49,[System.Int32]139))
$path_panel.Name = [System.String]'path_panel'
$path_panel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]424,[System.Int32]88))
$path_panel.TabIndex = [System.Int32]2
#
#path_button_no
#
$path_button_no.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$path_button_no.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]228,[System.Int32]13))
$path_button_no.Name = [System.String]'path_button_no'
$path_button_no.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]147,[System.Int32]59))
$path_button_no.TabIndex = [System.Int32]1
$path_button_no.Text = [System.String]'No'
$path_button_no.UseVisualStyleBackColor = $true
$path_button_no.Visible = $True
$path_button_no.add_Click($path_button_no_Click)
#
#path_button_yes
#
$path_button_yes.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$path_button_yes.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]30,[System.Int32]13))
$path_button_yes.Name = [System.String]'path_button_yes'
$path_button_yes.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]147,[System.Int32]59))
$path_button_yes.TabIndex = [System.Int32]0
$path_button_yes.Text = [System.String]'Yes'
$path_button_yes.UseVisualStyleBackColor = $true
$path_button_yes.Visible = $True
$path_button_yes.add_Click($path_button_yes_Click)
#
#path_support_panel
#
$path_support_panel.Controls.Add($no_support_btn)
$path_support_panel.Controls.Add($yes_support_btn)
$path_support_panel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]49,[System.Int32]139))
$path_support_panel.Name = [System.String]'path_support_panel'
$path_support_panel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]424,[System.Int32]88))
$path_support_panel.TabIndex = [System.Int32]3
$path_support_panel.Visible = $false
#
#no_support_btn
#
$no_support_btn.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$no_support_btn.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]228,[System.Int32]13))
$no_support_btn.Name = [System.String]'no_support_btn'
$no_support_btn.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]147,[System.Int32]59))
$no_support_btn.TabIndex = [System.Int32]1
$no_support_btn.Text = [System.String]'No'
$no_support_btn.UseVisualStyleBackColor = $true
$no_support_btn.add_Click($no_support_btn_Click)
#
#yes_support_btn
#
$yes_support_btn.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$yes_support_btn.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]30,[System.Int32]13))
$yes_support_btn.Name = [System.String]'yes_support_btn'
$yes_support_btn.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]147,[System.Int32]59))
$yes_support_btn.TabIndex = [System.Int32]0
$yes_support_btn.Text = [System.String]'Yes'
$yes_support_btn.UseVisualStyleBackColor = $true
$yes_support_btn.add_Click($yes_support_btn_Click)
#
#ignore_panel
#
$ignore_panel.Controls.Add($no_ignore_btn)
$ignore_panel.Controls.Add($yes_ignore_btn)
$ignore_panel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]49,[System.Int32]139))
$ignore_panel.Name = [System.String]'ignore_panel'
$ignore_panel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]424,[System.Int32]88))
$ignore_panel.TabIndex = [System.Int32]4
$ignore_panel.Visible = $false
#
#no_ignore_btn
#
$no_ignore_btn.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$no_ignore_btn.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]228,[System.Int32]18))
$no_ignore_btn.Name = [System.String]'no_ignore_btn'
$no_ignore_btn.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]147,[System.Int32]59))
$no_ignore_btn.TabIndex = [System.Int32]1
$no_ignore_btn.Text = [System.String]'No'
$no_ignore_btn.UseVisualStyleBackColor = $true
$no_ignore_btn.add_Click($no_ignore_btn_Click)
#
#yes_ignore_btn
#
$yes_ignore_btn.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$yes_ignore_btn.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]30,[System.Int32]15))
$yes_ignore_btn.Name = [System.String]'yes_ignore_btn'
$yes_ignore_btn.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]147,[System.Int32]59))
$yes_ignore_btn.TabIndex = [System.Int32]0
$yes_ignore_btn.Text = [System.String]'Yes'
$yes_ignore_btn.UseVisualStyleBackColor = $true
$yes_ignore_btn.add_Click($yes_ignore_btn_Click)
#
#prompt_form
#
$prompt_form.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]519,[System.Int32]244))
$prompt_form.Controls.Add($ignore_panel)
$prompt_form.Controls.Add($path_support_panel)
$prompt_form.Controls.Add($path_panel)
$prompt_form.Controls.Add($desc_lbl)
$prompt_form.Controls.Add($status_lbl)
$prompt_form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$prompt_form.Icon = ([System.Drawing.Icon]$resources.'$this.Icon')
$prompt_form.MaximizeBox = $false
$prompt_form.Text = [System.String]'Ignore File Undefined'
$prompt_form.add_Load($prompt_form_Load)
$path_panel.ResumeLayout($false)
$path_support_panel.ResumeLayout($false)
$ignore_panel.ResumeLayout($false)
$prompt_form.ResumeLayout($false)
Add-Member -InputObject $prompt_form -Name status_lbl -Value $status_lbl -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name desc_lbl -Value $desc_lbl -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name path_panel -Value $path_panel -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name path_button_no -Value $path_button_no -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name path_button_yes -Value $path_button_yes -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name path_support_panel -Value $path_support_panel -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name no_support_btn -Value $no_support_btn -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name yes_support_btn -Value $yes_support_btn -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name ignore_panel -Value $ignore_panel -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name no_ignore_btn -Value $no_ignore_btn -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name yes_ignore_btn -Value $yes_ignore_btn -MemberType NoteProperty
}
. InitializeComponent
