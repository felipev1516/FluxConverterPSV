$Form1 = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Button]$Button1 = $null
[System.Windows.Forms.Label]$Label1 = $null
[System.Windows.Forms.ComboBox]$ComboBox1 = $null
[System.Windows.Forms.ListBox]$ListBox1 = $null
[System.Windows.Forms.MenuStrip]$MenuStrip1 = $null
[System.Windows.Forms.ToolStripMenuItem]$FileToolStripMenuItem = $null
[System.Windows.Forms.ToolStripMenuItem]$ToolStripMenuItem1 = $null
[System.Windows.Forms.ToolStripMenuItem]$EditToolStripMenuItem = $null
[System.Windows.Forms.ToolStripMenuItem]$SettingsToolStripMenuItem = $null
[System.Windows.Forms.ToolStripMenuItem]$ToolStripMenuItem2 = $null
[System.Windows.Forms.ToolStripSeparator]$ToolStripSeparator1 = $null
[System.Windows.Forms.ToolStripMenuItem]$ToolStripMenuItem3 = $null
[System.Windows.Forms.Button]$Button2 = $null
[System.Windows.Forms.TextBox]$TextBox1 = $null
[System.Windows.Forms.CheckBox]$CheckBox1 = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot 'test_form.resources.ps1')
$Button1 = (New-Object -TypeName System.Windows.Forms.Button)
$Label1 = (New-Object -TypeName System.Windows.Forms.Label)
$ComboBox1 = (New-Object -TypeName System.Windows.Forms.ComboBox)
$ListBox1 = (New-Object -TypeName System.Windows.Forms.ListBox)
$MenuStrip1 = (New-Object -TypeName System.Windows.Forms.MenuStrip)
$FileToolStripMenuItem = (New-Object -TypeName System.Windows.Forms.ToolStripMenuItem)
$ToolStripMenuItem1 = (New-Object -TypeName System.Windows.Forms.ToolStripMenuItem)
$EditToolStripMenuItem = (New-Object -TypeName System.Windows.Forms.ToolStripMenuItem)
$SettingsToolStripMenuItem = (New-Object -TypeName System.Windows.Forms.ToolStripMenuItem)
$ToolStripMenuItem2 = (New-Object -TypeName System.Windows.Forms.ToolStripMenuItem)
$ToolStripSeparator1 = (New-Object -TypeName System.Windows.Forms.ToolStripSeparator)
$Button2 = (New-Object -TypeName System.Windows.Forms.Button)
$TextBox1 = (New-Object -TypeName System.Windows.Forms.TextBox)
$CheckBox1 = (New-Object -TypeName System.Windows.Forms.CheckBox)
$ToolStripMenuItem3 = (New-Object -TypeName System.Windows.Forms.ToolStripMenuItem)
$MenuStrip1.SuspendLayout()
$Form1.SuspendLayout()
#
#Button1
#
$Button1.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)))

$Button1.FlatAppearance.BorderColor = [System.Drawing.SystemColors]::AppWorkspace
$Button1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$Button1.ForeColor = [System.Drawing.SystemColors]::Window
$Button1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]38,[System.Int32]210))
$Button1.Name = [System.String]'Button1'
$Button1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]141,[System.Int32]51))
$Button1.TabIndex = [System.Int32]0
$Button1.Text = [System.String]'Button1'
$Button1.UseVisualStyleBackColor = $false
$Button1.add_Click($Button1_Click)
#
#Label1
#
$Label1.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)))

$Label1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$Label1.ForeColor = [System.Drawing.Color]::White
$Label1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]38,[System.Int32]54))
$Label1.Name = [System.String]'Label1'
$Label1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]68,[System.Int32]33))
$Label1.TabIndex = [System.Int32]1
$Label1.Text = [System.String]'Label1'
$Label1.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
#
#ComboBox1
#
$ComboBox1.BackColor = [System.Drawing.SystemColors]::AppWorkspace
$ComboBox1.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$ComboBox1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]8.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$ComboBox1.ForeColor = [System.Drawing.SystemColors]::Window
$ComboBox1.FormattingEnabled = $true
$ComboBox1.Items.AddRange([System.Object[]]@([System.String]'Item1',[System.String]'Item2',[System.String]'Item3'))
$ComboBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]112,[System.Int32]63))
$ComboBox1.Name = [System.String]'ComboBox1'
$ComboBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]146,[System.Int32]21))
$ComboBox1.TabIndex = [System.Int32]2
#
#ListBox1
#
$ListBox1.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)))

$ListBox1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$ListBox1.ForeColor = [System.Drawing.SystemColors]::Window
$ListBox1.FormattingEnabled = $true
$ListBox1.ItemHeight = [System.Int32]21
$ListBox1.Items.AddRange([System.Object[]]@([System.String]'Item1',[System.String]'Item2',[System.String]'Item3'))
$ListBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]435,[System.Int32]50))
$ListBox1.Name = [System.String]'ListBox1'
$ListBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]284,[System.Int32]193))
$ListBox1.TabIndex = [System.Int32]3
#
#MenuStrip1
#
$MenuStrip1.BackColor = [System.Drawing.SystemColors]::WindowFrame
$MenuStrip1.Items.AddRange([System.Windows.Forms.ToolStripItem[]]@($FileToolStripMenuItem,$EditToolStripMenuItem,$SettingsToolStripMenuItem))
$MenuStrip1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]0))
$MenuStrip1.Name = [System.String]'MenuStrip1'
$MenuStrip1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]741,[System.Int32]24))
$MenuStrip1.TabIndex = [System.Int32]4
$MenuStrip1.Text = [System.String]'MenuStrip1'
$MenuStrip1.add_ItemClicked($MenuStrip1_ItemClicked)
#
#FileToolStripMenuItem
#
$FileToolStripMenuItem.DropDownItems.AddRange([System.Windows.Forms.ToolStripItem[]]@($ToolStripMenuItem1))
$FileToolStripMenuItem.Name = [System.String]'FileToolStripMenuItem'
$FileToolStripMenuItem.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]37,[System.Int32]20))
$FileToolStripMenuItem.Text = [System.String]'File'
$FileToolStripMenuItem.add_Click($FileToolStripMenuItem_Click)
#
#ToolStripMenuItem1
#
$ToolStripMenuItem1.BackColor = [System.Drawing.SystemColors]::WindowFrame
$ToolStripMenuItem1.Name = [System.String]'ToolStripMenuItem1'
$ToolStripMenuItem1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]182,[System.Int32]22))
$ToolStripMenuItem1.Text = [System.String]'ToolStripMenuItem1'
#
#EditToolStripMenuItem
#
$EditToolStripMenuItem.Name = [System.String]'EditToolStripMenuItem'
$EditToolStripMenuItem.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]39,[System.Int32]20))
$EditToolStripMenuItem.Text = [System.String]'Edit'
#
#SettingsToolStripMenuItem
#
$SettingsToolStripMenuItem.BackColor = [System.Drawing.SystemColors]::WindowFrame
$SettingsToolStripMenuItem.DropDownItems.AddRange([System.Windows.Forms.ToolStripItem[]]@($ToolStripMenuItem2,$ToolStripSeparator1,$ToolStripMenuItem3))
$SettingsToolStripMenuItem.Name = [System.String]'SettingsToolStripMenuItem'
$SettingsToolStripMenuItem.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]61,[System.Int32]20))
$SettingsToolStripMenuItem.Text = [System.String]'Settings'
#
#ToolStripMenuItem2
#
$ToolStripMenuItem2.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)))

$ToolStripMenuItem2.Name = [System.String]'ToolStripMenuItem2'
$ToolStripMenuItem2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]182,[System.Int32]22))
$ToolStripMenuItem2.Text = [System.String]'ToolStripMenuItem2'
#
#ToolStripSeparator1
#
$ToolStripSeparator1.BackColor = [System.Drawing.SystemColors]::Desktop
$ToolStripSeparator1.ForeColor = [System.Drawing.SystemColors]::Desktop
$ToolStripSeparator1.Name = [System.String]'ToolStripSeparator1'
$ToolStripSeparator1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]179,[System.Int32]6))
$ToolStripSeparator1.add_Paint($ToolStripSeparator1_Paint)
#
#Button2
#
$Button2.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)))

$Button2.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$Button2.ForeColor = [System.Drawing.SystemColors]::Window
$Button2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]200,[System.Int32]210))
$Button2.Name = [System.String]'Button2'
$Button2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]141,[System.Int32]51))
$Button2.TabIndex = [System.Int32]5
$Button2.Text = [System.String]'Button2'
$Button2.UseVisualStyleBackColor = $false
#
#TextBox1
#
$TextBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]49,[System.Int32]112))
$TextBox1.Name = [System.String]'TextBox1'
$TextBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]100,[System.Int32]21))
$TextBox1.TabIndex = [System.Int32]6
$TextBox1.Text = [System.String]'Text'
$TextBox1.add_TextChanged($TextBox1_TextChanged)
#
#CheckBox1
#
$CheckBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]237,[System.Int32]139))
$CheckBox1.Name = [System.String]'CheckBox1'
$CheckBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]21,[System.Int32]24))
$CheckBox1.TabIndex = [System.Int32]7
$CheckBox1.Text = [System.String]'CheckBox1'
$CheckBox1.UseVisualStyleBackColor = $true
#
#ToolStripMenuItem3
#
$ToolStripMenuItem3.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)))

$ToolStripMenuItem3.Name = [System.String]'ToolStripMenuItem3'
$ToolStripMenuItem3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]182,[System.Int32]22))
$ToolStripMenuItem3.Text = [System.String]'ToolStripMenuItem3'
#
#Form1
#
$Form1.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)))

$Form1.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]741,[System.Int32]287))
$Form1.Controls.Add($CheckBox1)
$Form1.Controls.Add($TextBox1)
$Form1.Controls.Add($Button2)
$Form1.Controls.Add($ListBox1)
$Form1.Controls.Add($ComboBox1)
$Form1.Controls.Add($Label1)
$Form1.Controls.Add($Button1)
$Form1.Controls.Add($MenuStrip1)
$Form1.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$Form1.Icon = ([System.Drawing.Icon]$resources.'$this.Icon')
$Form1.MainMenuStrip = $MenuStrip1
$Form1.Text = [System.String]'Form1'
$MenuStrip1.ResumeLayout($false)
$MenuStrip1.PerformLayout()
$Form1.ResumeLayout($false)
$Form1.PerformLayout()
Add-Member -InputObject $Form1 -Name Button1 -Value $Button1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Label1 -Value $Label1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ComboBox1 -Value $ComboBox1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ListBox1 -Value $ListBox1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name MenuStrip1 -Value $MenuStrip1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name FileToolStripMenuItem -Value $FileToolStripMenuItem -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ToolStripMenuItem1 -Value $ToolStripMenuItem1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name EditToolStripMenuItem -Value $EditToolStripMenuItem -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name SettingsToolStripMenuItem -Value $SettingsToolStripMenuItem -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ToolStripMenuItem2 -Value $ToolStripMenuItem2 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ToolStripSeparator1 -Value $ToolStripSeparator1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ToolStripMenuItem3 -Value $ToolStripMenuItem3 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button2 -Value $Button2 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name TextBox1 -Value $TextBox1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name CheckBox1 -Value $CheckBox1 -MemberType NoteProperty
}
. InitializeComponent
