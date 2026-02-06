$prompt_form = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Label]$ignore_prompt_lbl1 = $null
[System.Windows.Forms.Label]$ignore_prompt_lbl2 = $null
[System.Windows.Forms.Panel]$server_button_panel = $null
[System.Windows.Forms.Button]$server_button_no = $null
[System.Windows.Forms.Button]$server_button_yes = $null
[System.Windows.Forms.Panel]$support_button_panel = $null
[System.Windows.Forms.Button]$no_support_btn = $null
[System.Windows.Forms.Button]$yes_support_btn = $null
[System.Windows.Forms.Panel]$ignore_button_panel = $null
[System.Windows.Forms.Button]$no_ignore_btn = $null
[System.Windows.Forms.Button]$yes_ignore_btn = $null
[System.Windows.Forms.Button]$missing_folder_button = $null
[System.Windows.Forms.Panel]$missing_prompt_panel = $null
[System.Windows.Forms.Label]$missing_prompt_lbl2 = $null
[System.Windows.Forms.Label]$missing_prompt_lbl1 = $null
[System.Windows.Forms.Panel]$missing_button_panel = $null
[System.Windows.Forms.Button]$okay_button = $null
[System.Windows.Forms.Panel]$ignore_prompt_panel = $null
[System.Windows.Forms.Panel]$server_prompt_panel = $null
[System.Windows.Forms.Label]$server_prompt_lbl2 = $null
[System.Windows.Forms.Label]$server_prompt_lbl1 = $null
[System.Windows.Forms.Panel]$support_prompt_panel = $null
[System.Windows.Forms.Label]$support_prompt_lbl2 = $null
[System.Windows.Forms.Label]$support_prompt_lbl1 = $null
[System.Windows.Forms.Panel]$wait_panel = $null
[System.Windows.Forms.Label]$wait_prompt_lbl2 = $null
[System.Windows.Forms.Label]$wait_prompt_lbl1 = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot 'prompt_form.resources.ps1')
$ignore_prompt_lbl1 = (New-Object -TypeName System.Windows.Forms.Label)
$ignore_prompt_lbl2 = (New-Object -TypeName System.Windows.Forms.Label)
$server_button_panel = (New-Object -TypeName System.Windows.Forms.Panel)
$server_button_no = (New-Object -TypeName System.Windows.Forms.Button)
$server_button_yes = (New-Object -TypeName System.Windows.Forms.Button)
$support_button_panel = (New-Object -TypeName System.Windows.Forms.Panel)
$no_support_btn = (New-Object -TypeName System.Windows.Forms.Button)
$yes_support_btn = (New-Object -TypeName System.Windows.Forms.Button)
$ignore_button_panel = (New-Object -TypeName System.Windows.Forms.Panel)
$no_ignore_btn = (New-Object -TypeName System.Windows.Forms.Button)
$yes_ignore_btn = (New-Object -TypeName System.Windows.Forms.Button)
$missing_folder_button = (New-Object -TypeName System.Windows.Forms.Button)
$missing_prompt_panel = (New-Object -TypeName System.Windows.Forms.Panel)
$missing_prompt_lbl2 = (New-Object -TypeName System.Windows.Forms.Label)
$missing_prompt_lbl1 = (New-Object -TypeName System.Windows.Forms.Label)
$missing_button_panel = (New-Object -TypeName System.Windows.Forms.Panel)
$okay_button = (New-Object -TypeName System.Windows.Forms.Button)
$ignore_prompt_panel = (New-Object -TypeName System.Windows.Forms.Panel)
$server_prompt_panel = (New-Object -TypeName System.Windows.Forms.Panel)
$server_prompt_lbl2 = (New-Object -TypeName System.Windows.Forms.Label)
$server_prompt_lbl1 = (New-Object -TypeName System.Windows.Forms.Label)
$support_prompt_panel = (New-Object -TypeName System.Windows.Forms.Panel)
$support_prompt_lbl2 = (New-Object -TypeName System.Windows.Forms.Label)
$support_prompt_lbl1 = (New-Object -TypeName System.Windows.Forms.Label)
$wait_panel = (New-Object -TypeName System.Windows.Forms.Panel)
$wait_prompt_lbl1 = (New-Object -TypeName System.Windows.Forms.Label)
$wait_prompt_lbl2 = (New-Object -TypeName System.Windows.Forms.Label)
$server_button_panel.SuspendLayout()
$support_button_panel.SuspendLayout()
$ignore_button_panel.SuspendLayout()
$missing_prompt_panel.SuspendLayout()
$missing_button_panel.SuspendLayout()
$ignore_prompt_panel.SuspendLayout()
$server_prompt_panel.SuspendLayout()
$support_prompt_panel.SuspendLayout()
$wait_panel.SuspendLayout()
$prompt_form.SuspendLayout()
#
#ignore_prompt_lbl1
#
$ignore_prompt_lbl1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]24,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$ignore_prompt_lbl1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]3,[System.Int32]10))
$ignore_prompt_lbl1.Name = [System.String]'ignore_prompt_lbl1'
$ignore_prompt_lbl1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]463,[System.Int32]61))
$ignore_prompt_lbl1.TabIndex = [System.Int32]0
$ignore_prompt_lbl1.Tag = [System.String]'ignore'
$ignore_prompt_lbl1.Text = [System.String]'Ignore file is not defined'
$ignore_prompt_lbl1.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$ignore_prompt_lbl1.add_Click($status_lbl_Click)
#
#ignore_prompt_lbl2
#
$ignore_prompt_lbl2.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$ignore_prompt_lbl2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]39,[System.Int32]81))
$ignore_prompt_lbl2.Name = [System.String]'ignore_prompt_lbl2'
$ignore_prompt_lbl2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]387,[System.Int32]42))
$ignore_prompt_lbl2.TabIndex = [System.Int32]1
$ignore_prompt_lbl2.Tag = [System.String]'ignore'
$ignore_prompt_lbl2.Text = [System.String]'Would you like to locate the file? (Optional)'
$ignore_prompt_lbl2.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$ignore_prompt_lbl2.add_Click($desc_lbl_Click)
#
#server_button_panel
#
$server_button_panel.Controls.Add($server_button_no)
$server_button_panel.Controls.Add($server_button_yes)
$server_button_panel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]30,[System.Int32]425))
$server_button_panel.Name = [System.String]'server_button_panel'
$server_button_panel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]424,[System.Int32]88))
$server_button_panel.TabIndex = [System.Int32]2
$server_button_panel.Tag = [System.String]'server'
#
#server_button_no
#
$server_button_no.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$server_button_no.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]228,[System.Int32]13))
$server_button_no.Name = [System.String]'server_button_no'
$server_button_no.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]147,[System.Int32]59))
$server_button_no.TabIndex = [System.Int32]1
$server_button_no.Tag = [System.String]'server'
$server_button_no.Text = [System.String]'No'
$server_button_no.UseVisualStyleBackColor = $true
$server_button_no.add_Click($path_button_no_Click)
#
#server_button_yes
#
$server_button_yes.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$server_button_yes.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]30,[System.Int32]13))
$server_button_yes.Name = [System.String]'server_button_yes'
$server_button_yes.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]147,[System.Int32]59))
$server_button_yes.TabIndex = [System.Int32]0
$server_button_yes.Tag = [System.String]'server'
$server_button_yes.Text = [System.String]'Yes'
$server_button_yes.UseVisualStyleBackColor = $true
$server_button_yes.add_Click($path_button_yes_Click)
#
#support_button_panel
#
$support_button_panel.Controls.Add($no_support_btn)
$support_button_panel.Controls.Add($yes_support_btn)
$support_button_panel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]532,[System.Int32]425))
$support_button_panel.Name = [System.String]'support_button_panel'
$support_button_panel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]424,[System.Int32]88))
$support_button_panel.TabIndex = [System.Int32]3
$support_button_panel.Tag = [System.String]'support'
$support_button_panel.Visible = $false
#
#no_support_btn
#
$no_support_btn.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$no_support_btn.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]228,[System.Int32]13))
$no_support_btn.Name = [System.String]'no_support_btn'
$no_support_btn.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]147,[System.Int32]59))
$no_support_btn.TabIndex = [System.Int32]1
$no_support_btn.Tag = [System.String]'support'
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
$yes_support_btn.Tag = [System.String]'support'
$yes_support_btn.Text = [System.String]'Yes'
$yes_support_btn.UseVisualStyleBackColor = $true
$yes_support_btn.add_Click($yes_support_btn_Click)
#
#ignore_button_panel
#
$ignore_button_panel.Controls.Add($no_ignore_btn)
$ignore_button_panel.Controls.Add($yes_ignore_btn)
$ignore_button_panel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]527,[System.Int32]168))
$ignore_button_panel.Name = [System.String]'ignore_button_panel'
$ignore_button_panel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]424,[System.Int32]88))
$ignore_button_panel.TabIndex = [System.Int32]4
$ignore_button_panel.Tag = [System.String]'ignore'
#
#no_ignore_btn
#
$no_ignore_btn.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$no_ignore_btn.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]230,[System.Int32]15))
$no_ignore_btn.Name = [System.String]'no_ignore_btn'
$no_ignore_btn.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]147,[System.Int32]57))
$no_ignore_btn.TabIndex = [System.Int32]1
$no_ignore_btn.Tag = [System.String]'ignore'
$no_ignore_btn.Text = [System.String]'No'
$no_ignore_btn.UseVisualStyleBackColor = $true
$no_ignore_btn.add_Click($no_ignore_btn_Click)
#
#yes_ignore_btn
#
$yes_ignore_btn.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$yes_ignore_btn.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]30,[System.Int32]13))
$yes_ignore_btn.Name = [System.String]'yes_ignore_btn'
$yes_ignore_btn.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]147,[System.Int32]59))
$yes_ignore_btn.TabIndex = [System.Int32]0
$yes_ignore_btn.Tag = [System.String]'ignore'
$yes_ignore_btn.Text = [System.String]'Yes'
$yes_ignore_btn.UseVisualStyleBackColor = $true
$yes_ignore_btn.add_Click($yes_ignore_btn_Click)
#
#missing_folder_button
#
$missing_folder_button.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$missing_folder_button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]135,[System.Int32]16))
$missing_folder_button.Name = [System.String]'missing_folder_button'
$missing_folder_button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]147,[System.Int32]57))
$missing_folder_button.TabIndex = [System.Int32]0
$missing_folder_button.Text = [System.String]'Okay'
$missing_folder_button.UseVisualStyleBackColor = $true
$missing_folder_button.add_Click($missing_folder_button_Click)
#
#missing_prompt_panel
#
$missing_prompt_panel.Controls.Add($missing_prompt_lbl2)
$missing_prompt_panel.Controls.Add($missing_prompt_lbl1)
$missing_prompt_panel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]513,[System.Int32]519))
$missing_prompt_panel.Name = [System.String]'missing_prompt_panel'
$missing_prompt_panel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]424,[System.Int32]139))
$missing_prompt_panel.TabIndex = [System.Int32]5
$missing_prompt_panel.Tag = [System.String]'missing'
$missing_prompt_panel.add_Paint($missing_folder_panel_Paint)
#
#missing_prompt_lbl2
#
$missing_prompt_lbl2.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$missing_prompt_lbl2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]23,[System.Int32]59))
$missing_prompt_lbl2.Name = [System.String]'missing_prompt_lbl2'
$missing_prompt_lbl2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]373,[System.Int32]70))
$missing_prompt_lbl2.TabIndex = [System.Int32]1
$missing_prompt_lbl2.Tag = [System.String]'missing'
$missing_prompt_lbl2.Text = [System.String]'The folder was not found in the server directory or all files are missing. Please contact your system administrator.'
$missing_prompt_lbl2.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$missing_prompt_lbl2.add_Click($missing_prompt2_Click)
#
#missing_prompt_lbl1
#
$missing_prompt_lbl1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]24,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$missing_prompt_lbl1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]21,[System.Int32]6))
$missing_prompt_lbl1.Name = [System.String]'missing_prompt_lbl1'
$missing_prompt_lbl1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]395,[System.Int32]53))
$missing_prompt_lbl1.TabIndex = [System.Int32]0
$missing_prompt_lbl1.Tag = [System.String]'missing'
$missing_prompt_lbl1.Text = [System.String]'Missing Components'
$missing_prompt_lbl1.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#missing_button_panel
#
$missing_button_panel.Controls.Add($okay_button)
$missing_button_panel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]623,[System.Int32]664))
$missing_button_panel.Name = [System.String]'missing_button_panel'
$missing_button_panel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]193,[System.Int32]76))
$missing_button_panel.TabIndex = [System.Int32]6
$missing_button_panel.Tag = [System.String]'missing'
#
#okay_button
#
$okay_button.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$okay_button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]22,[System.Int32]9))
$okay_button.Name = [System.String]'okay_button'
$okay_button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]147,[System.Int32]57))
$okay_button.TabIndex = [System.Int32]0
$okay_button.Tag = [System.String]'missing'
$okay_button.Text = [System.String]'Okay'
$okay_button.UseVisualStyleBackColor = $true
$okay_button.add_Click($okay_button_Click)
#
#ignore_prompt_panel
#
$ignore_prompt_panel.Controls.Add($ignore_prompt_lbl1)
$ignore_prompt_panel.Controls.Add($ignore_prompt_lbl2)
$ignore_prompt_panel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]509,[System.Int32]18))
$ignore_prompt_panel.Name = [System.String]'ignore_prompt_panel'
$ignore_prompt_panel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]469,[System.Int32]145))
$ignore_prompt_panel.TabIndex = [System.Int32]7
$ignore_prompt_panel.Tag = [System.String]'ignore'
#
#server_prompt_panel
#
$server_prompt_panel.Controls.Add($server_prompt_lbl2)
$server_prompt_panel.Controls.Add($server_prompt_lbl1)
$server_prompt_panel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]277))
$server_prompt_panel.Name = [System.String]'server_prompt_panel'
$server_prompt_panel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]471,[System.Int32]142))
$server_prompt_panel.TabIndex = [System.Int32]8
#
#server_prompt_lbl2
#
$server_prompt_lbl2.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$server_prompt_lbl2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]58,[System.Int32]86))
$server_prompt_lbl2.Name = [System.String]'server_prompt_lbl2'
$server_prompt_lbl2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]358,[System.Int32]32))
$server_prompt_lbl2.TabIndex = [System.Int32]1
$server_prompt_lbl2.Tag = [System.String]'server'
$server_prompt_lbl2.Text = [System.String]'Would you like to change the directory?'
$server_prompt_lbl2.add_Click($Label2_Click)
#
#server_prompt_lbl1
#
$server_prompt_lbl1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]21.75,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$server_prompt_lbl1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]18,[System.Int32]6))
$server_prompt_lbl1.Name = [System.String]'server_prompt_lbl1'
$server_prompt_lbl1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]434,[System.Int32]71))
$server_prompt_lbl1.TabIndex = [System.Int32]0
$server_prompt_lbl1.Tag = [System.String]'server'
$server_prompt_lbl1.Text = [System.String]'Server directory unreachable or unavailable'
$server_prompt_lbl1.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#support_prompt_panel
#
$support_prompt_panel.Controls.Add($support_prompt_lbl2)
$support_prompt_panel.Controls.Add($support_prompt_lbl1)
$support_prompt_panel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]504,[System.Int32]277))
$support_prompt_panel.Name = [System.String]'support_prompt_panel'
$support_prompt_panel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]474,[System.Int32]142))
$support_prompt_panel.TabIndex = [System.Int32]9
#
#support_prompt_lbl2
#
$support_prompt_lbl2.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$support_prompt_lbl2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]58,[System.Int32]104))
$support_prompt_lbl2.Name = [System.String]'support_prompt_lbl2'
$support_prompt_lbl2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]345,[System.Int32]29))
$support_prompt_lbl2.TabIndex = [System.Int32]1
$support_prompt_lbl2.Tag = [System.String]'support'
$support_prompt_lbl2.Text = [System.String]'Would you like to locate the file?'
$support_prompt_lbl2.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#support_prompt_lbl1
#
$support_prompt_lbl1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]20.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$support_prompt_lbl1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]10))
$support_prompt_lbl1.Name = [System.String]'support_prompt_lbl1'
$support_prompt_lbl1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]453,[System.Int32]77))
$support_prompt_lbl1.TabIndex = [System.Int32]0
$support_prompt_lbl1.Tag = [System.String]'support'
$support_prompt_lbl1.Text = [System.String]'You need to locate the supported extentions file'
$support_prompt_lbl1.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#wait_panel
#
$wait_panel.Controls.Add($wait_prompt_lbl2)
$wait_panel.Controls.Add($wait_prompt_lbl1)
$wait_panel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]30,[System.Int32]18))
$wait_panel.Name = [System.String]'wait_panel'
$wait_panel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]375,[System.Int32]145))
$wait_panel.TabIndex = [System.Int32]10
#
#wait_prompt_lbl1
#
$wait_prompt_lbl1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]24,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$wait_prompt_lbl1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]58,[System.Int32]18))
$wait_prompt_lbl1.Name = [System.String]'wait_prompt_lbl1'
$wait_prompt_lbl1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]260,[System.Int32]51))
$wait_prompt_lbl1.TabIndex = [System.Int32]0
$wait_prompt_lbl1.Text = [System.String]'Please Wait'
$wait_prompt_lbl1.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#wait_prompt_lbl2
#
$wait_prompt_lbl2.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]15.75,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$wait_prompt_lbl2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]55,[System.Int32]81))
$wait_prompt_lbl2.Name = [System.String]'wait_prompt_lbl2'
$wait_prompt_lbl2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]254,[System.Int32]43))
$wait_prompt_lbl2.TabIndex = [System.Int32]1
$wait_prompt_lbl2.Text = [System.String]'Searching for eligible files'
$wait_prompt_lbl2.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#prompt_form
#
$prompt_form.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]438,[System.Int32]185))
$prompt_form.Controls.Add($wait_panel)
$prompt_form.Controls.Add($support_prompt_panel)
$prompt_form.Controls.Add($server_prompt_panel)
$prompt_form.Controls.Add($ignore_prompt_panel)
$prompt_form.Controls.Add($missing_button_panel)
$prompt_form.Controls.Add($missing_prompt_panel)
$prompt_form.Controls.Add($support_button_panel)
$prompt_form.Controls.Add($ignore_button_panel)
$prompt_form.Controls.Add($server_button_panel)
$prompt_form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$prompt_form.Icon = ([System.Drawing.Icon]$resources.'$this.Icon')
$prompt_form.MaximizeBox = $false
$prompt_form.StartPosition = "CenterScreen"
$prompt_form.Text = [System.String]'Folder Error'
$prompt_form.add_Load($prompt_form_Load)
$server_button_panel.ResumeLayout($false)
$support_button_panel.ResumeLayout($false)
$ignore_button_panel.ResumeLayout($false)
$missing_prompt_panel.ResumeLayout($false)
$missing_button_panel.ResumeLayout($false)
$ignore_prompt_panel.ResumeLayout($false)
$server_prompt_panel.ResumeLayout($false)
$support_prompt_panel.ResumeLayout($false)
$wait_panel.ResumeLayout($false)
$prompt_form.ResumeLayout($false)
Add-Member -InputObject $prompt_form -Name ignore_prompt_lbl1 -Value $ignore_prompt_lbl1 -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name ignore_prompt_lbl2 -Value $ignore_prompt_lbl2 -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name server_button_panel -Value $server_button_panel -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name server_button_no -Value $server_button_no -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name server_button_yes -Value $server_button_yes -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name support_button_panel -Value $support_button_panel -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name no_support_btn -Value $no_support_btn -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name yes_support_btn -Value $yes_support_btn -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name ignore_button_panel -Value $ignore_button_panel -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name no_ignore_btn -Value $no_ignore_btn -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name yes_ignore_btn -Value $yes_ignore_btn -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name missing_folder_button -Value $missing_folder_button -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name missing_prompt_panel -Value $missing_prompt_panel -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name missing_prompt_lbl2 -Value $missing_prompt_lbl2 -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name missing_prompt_lbl1 -Value $missing_prompt_lbl1 -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name missing_button_panel -Value $missing_button_panel -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name okay_button -Value $okay_button -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name ignore_prompt_panel -Value $ignore_prompt_panel -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name server_prompt_panel -Value $server_prompt_panel -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name server_prompt_lbl2 -Value $server_prompt_lbl2 -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name server_prompt_lbl1 -Value $server_prompt_lbl1 -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name support_prompt_panel -Value $support_prompt_panel -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name support_prompt_lbl2 -Value $support_prompt_lbl2 -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name support_prompt_lbl1 -Value $support_prompt_lbl1 -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name wait_panel -Value $wait_panel -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name wait_prompt_lbl2 -Value $wait_prompt_lbl2 -MemberType NoteProperty
Add-Member -InputObject $prompt_form -Name wait_prompt_lbl1 -Value $wait_prompt_lbl1 -MemberType NoteProperty
}
. InitializeComponent
