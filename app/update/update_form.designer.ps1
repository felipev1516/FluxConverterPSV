update_form = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Label]$placeholder_lbl = $null
[System.Windows.Forms.Button]$yes_btn = $null
[System.Windows.Forms.Button]$no_btn = $null
[System.Windows.Forms.Button]$okay_btn = $null
#function InitializeComponent
#{
$placeholder_lbl = (New-Object -TypeName System.Windows.Forms.Label)
$yes_btn = (New-Object -TypeName System.Windows.Forms.Button)
$no_btn = (New-Object -TypeName System.Windows.Forms.Button)
$okay_btn = (New-Object -TypeName System.Windows.Forms.Button)
$update_form.SuspendLayout()
#
#placeholder_lbl
#
$placeholder_lbl.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$placeholder_lbl.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]9))
$placeholder_lbl.Name = [System.String]'placeholder_lbl'
$placeholder_lbl.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]460,[System.Int32]143))
$placeholder_lbl.TabIndex = [System.Int32]0
$placeholder_lbl.Text = [System.String]'Placeholder'
$placeholder_lbl.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#yes_btn
#
$yes_btn.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$yes_btn.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]40,[System.Int32]155))
$yes_btn.Name = [System.String]'yes_btn'
$yes_btn.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]130,[System.Int32]50))
$yes_btn.TabIndex = [System.Int32]3
$yes_btn.Text = [System.String]'YES'
$yes_btn.UseVisualStyleBackColor = $true
#$yes_btn.add_Click($yes_btn_Click)
#
#no_btn
#
$no_btn.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$no_btn.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]312,[System.Int32]157))
$no_btn.Name = [System.String]'no_btn'
$no_btn.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]130,[System.Int32]50))
$no_btn.TabIndex = [System.Int32]4
$no_btn.Text = [System.String]'NO'
$no_btn.UseVisualStyleBackColor = $true
#$no_btn.add_Click($no_btn_Click)
#
#okay_btn
#
$okay_btn.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$okay_btn.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]176,[System.Int32]158))
$okay_btn.Name = [System.String]'okay_btn'
$okay_btn.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]130,[System.Int32]48))
$okay_btn.TabIndex = [System.Int32]5
$okay_btn.Text = [System.String]'OKAY'
$okay_btn.UseVisualStyleBackColor = $true
#$okay_btn.add_Click($okay_btn_Click)
#
#update_form
#
$update_form.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]484,[System.Int32]236))
$update_form.Controls.Add($okay_btn)
$update_form.Controls.Add($no_btn)
$update_form.Controls.Add($yes_btn)
$update_form.Controls.Add($placeholder_lbl)
$update_form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$update_form.MaximizeBox = $false
$update_form.ShowIcon = $false
$update_form.Text = [System.String]'Update Tool'

$update_form.ResumeLayout($false)
Add-Member -InputObject $update_form -Name placeholder_lbl -Value $placeholder_lbl -MemberType NoteProperty
Add-Member -InputObject $update_form -Name yes_btn -Value $yes_btn -MemberType NoteProperty
Add-Member -InputObject $update_form -Name no_btn -Value $no_btn -MemberType NoteProperty
Add-Member -InputObject $update_form -Name okay_btn -Value $okay_btn -MemberType NoteProperty
#}

#. InitializeComponent