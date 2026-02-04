$update_form = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Label]$update_prompt_lbl1 = $null
[System.Windows.Forms.Panel]$update_prompt_panel = $null
[System.Windows.Forms.Label]$update_prompt_lbl2 = $null
[System.Windows.Forms.Panel]$update_btn_panel = $null
[System.Windows.Forms.Button]$update_btn_no = $null
[System.Windows.Forms.Button]$update_btn_yes = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot 'update_form.resources.ps1')
$update_prompt_lbl1 = (New-Object -TypeName System.Windows.Forms.Label)
$update_prompt_panel = (New-Object -TypeName System.Windows.Forms.Panel)
$update_prompt_lbl2 = (New-Object -TypeName System.Windows.Forms.Label)
$update_btn_panel = (New-Object -TypeName System.Windows.Forms.Panel)
$update_btn_yes = (New-Object -TypeName System.Windows.Forms.Button)
$update_btn_no = (New-Object -TypeName System.Windows.Forms.Button)
$update_prompt_panel.SuspendLayout()
$update_btn_panel.SuspendLayout()
$update_form.SuspendLayout()
#
#update_prompt_lbl1
#
$update_prompt_lbl1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]21.75,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$update_prompt_lbl1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]27,[System.Int32]10))
$update_prompt_lbl1.Name = [System.String]'update_prompt_lbl1'
$update_prompt_lbl1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]330,[System.Int32]50))
$update_prompt_lbl1.TabIndex = [System.Int32]0
$update_prompt_lbl1.Text = [System.String]'An Update Is Available'
$update_prompt_lbl1.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$update_prompt_lbl1.add_Click($update_prompt_lbl1_Click)
#
#update_prompt_panel
#
$update_prompt_panel.Controls.Add($update_prompt_lbl2)
$update_prompt_panel.Controls.Add($update_prompt_lbl1)
$update_prompt_panel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]30,[System.Int32]15))
$update_prompt_panel.Name = [System.String]'update_prompt_panel'
$update_prompt_panel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]390,[System.Int32]113))
$update_prompt_panel.TabIndex = [System.Int32]1
#
#update_prompt_lbl2
#
$update_prompt_lbl2.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$update_prompt_lbl2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]27,[System.Int32]70))
$update_prompt_lbl2.Name = [System.String]'update_prompt_lbl2'
$update_prompt_lbl2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]330,[System.Int32]33))
$update_prompt_lbl2.TabIndex = [System.Int32]1
$update_prompt_lbl2.Text = [System.String]'Would You Like To Update?'
$update_prompt_lbl2.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#update_btn_panel
#
$update_btn_panel.Controls.Add($update_btn_no)
$update_btn_panel.Controls.Add($update_btn_yes)
$update_btn_panel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]38,[System.Int32]133))
$update_btn_panel.Name = [System.String]'update_btn_panel'
$update_btn_panel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]374,[System.Int32]81))
$update_btn_panel.TabIndex = [System.Int32]2
#
#update_btn_yes
#
$update_btn_yes.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$update_btn_yes.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]27,[System.Int32]14))
$update_btn_yes.Name = [System.String]'update_btn_yes'
$update_btn_yes.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]138,[System.Int32]53))
$update_btn_yes.TabIndex = [System.Int32]0
$update_btn_yes.Text = [System.String]'Yes'
$update_btn_yes.UseVisualStyleBackColor = $true
$update_btn_yes.add_Click($update_btn_yes_Click)
#
#update_btn_no
#
$update_btn_no.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$update_btn_no.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]204,[System.Int32]14))
$update_btn_no.Name = [System.String]'update_btn_no'
$update_btn_no.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]138,[System.Int32]53))
$update_btn_no.TabIndex = [System.Int32]1
$update_btn_no.Text = [System.String]'No'
$update_btn_no.UseVisualStyleBackColor = $true
$update_btn_no.add_Click($update_btn_no_Click)
#
#update_form
#
$update_form.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]451,[System.Int32]238))
$update_form.Controls.Add($update_btn_panel)
$update_form.Controls.Add($update_prompt_panel)
$update_form.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]8.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$update_form.Icon = ([System.Drawing.Icon]$resources.'$this.Icon')
$update_form.MaximizeBox = $false
$update_form.Name = [System.String]'update_form'
$update_form.Text = [System.String]'Update Available'
$update_prompt_panel.ResumeLayout($false)
$update_btn_panel.ResumeLayout($false)
$update_form.ResumeLayout($false)
Add-Member -InputObject $update_form -Name update_prompt_lbl1 -Value $update_prompt_lbl1 -MemberType NoteProperty
Add-Member -InputObject $update_form -Name update_prompt_panel -Value $update_prompt_panel -MemberType NoteProperty
Add-Member -InputObject $update_form -Name update_prompt_lbl2 -Value $update_prompt_lbl2 -MemberType NoteProperty
Add-Member -InputObject $update_form -Name update_btn_panel -Value $update_btn_panel -MemberType NoteProperty
Add-Member -InputObject $update_form -Name update_btn_no -Value $update_btn_no -MemberType NoteProperty
Add-Member -InputObject $update_form -Name update_btn_yes -Value $update_btn_yes -MemberType NoteProperty
}
. InitializeComponent
