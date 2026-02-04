$progress_form = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.ProgressBar]$ProgressBar1 = $null
[System.Windows.Forms.Label]$prompt_lbl = $null
[System.Windows.Forms.Label]$status_lbl = $null
[System.Windows.Forms.TextBox]$dir_tbx = $null
[System.Windows.Forms.Panel]$main_panel = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot 'progressbar_form.resources.ps1')
$ProgressBar1 = (New-Object -TypeName System.Windows.Forms.ProgressBar)
$prompt_lbl = (New-Object -TypeName System.Windows.Forms.Label)
$status_lbl = (New-Object -TypeName System.Windows.Forms.Label)
$dir_tbx = (New-Object -TypeName System.Windows.Forms.TextBox)
$main_panel = (New-Object -TypeName System.Windows.Forms.Panel)
$main_panel.SuspendLayout()
$progress_form.SuspendLayout()
#
#ProgressBar1
#
$ProgressBar1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]47,[System.Int32]171))
$ProgressBar1.Name = [System.String]'ProgressBar1'
$ProgressBar1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]457,[System.Int32]26))
$ProgressBar1.TabIndex = [System.Int32]0
#
#prompt_lbl
#
$prompt_lbl.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]20.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$prompt_lbl.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]47,[System.Int32]15))
$prompt_lbl.Name = [System.String]'prompt_lbl'
$prompt_lbl.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]443,[System.Int32]99))
$prompt_lbl.TabIndex = [System.Int32]1
$prompt_lbl.Text = [System.String]'Downloading Please Wait'
$prompt_lbl.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#status_lbl
#
$status_lbl.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]9.75,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$status_lbl.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]20,[System.Int32]131))
$status_lbl.Name = [System.String]'status_lbl'
$status_lbl.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]60,[System.Int32]20))
$status_lbl.TabIndex = [System.Int32]2
$status_lbl.Text = [System.String]'Status'
$status_lbl.TextAlign = [System.Drawing.ContentAlignment]::MiddleRight
#
#dir_tbx
#
$dir_tbx.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]8.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$dir_tbx.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]96,[System.Int32]129))
$dir_tbx.Name = [System.String]'dir_tbx'
$dir_tbx.ReadOnly = $true
$dir_tbx.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]408,[System.Int32]22))
$dir_tbx.TabIndex = [System.Int32]3
#
#main_panel
#
$main_panel.Controls.Add($prompt_lbl)
$main_panel.Controls.Add($dir_tbx)
$main_panel.Controls.Add($ProgressBar1)
$main_panel.Controls.Add($status_lbl)
$main_panel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]12))
$main_panel.Name = [System.String]'main_panel'
$main_panel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]534,[System.Int32]223))
$main_panel.TabIndex = [System.Int32]4
#
#progress_form
#
$progress_form.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]565,[System.Int32]250))
$progress_form.Controls.Add($main_panel)
$progress_form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$progress_form.Icon = ([System.Drawing.Icon]$resources.'$this.Icon')
$progress_form.MaximizeBox = $false
$progress_form.Text = [System.String]'Updating....'
$progress_form.add_Shown($progress_form_Shown)
$progress_form.add_FormClosing($progress_form_FormClosing)
$main_panel.ResumeLayout($false)
$main_panel.PerformLayout()
$progress_form.ResumeLayout($false)
Add-Member -InputObject $progress_form -Name ProgressBar1 -Value $ProgressBar1 -MemberType NoteProperty
Add-Member -InputObject $progress_form -Name prompt_lbl -Value $prompt_lbl -MemberType NoteProperty
Add-Member -InputObject $progress_form -Name status_lbl -Value $status_lbl -MemberType NoteProperty
Add-Member -InputObject $progress_form -Name dir_tbx -Value $dir_tbx -MemberType NoteProperty
Add-Member -InputObject $progress_form -Name main_panel -Value $main_panel -MemberType NoteProperty
}
. InitializeComponent
