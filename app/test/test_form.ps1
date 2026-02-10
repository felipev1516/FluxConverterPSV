Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$ToolStripSeparator1_Paint = [System.Windows.Forms.PaintEventHandler]{
    $sep = $ToolStripMenuItem1
    $sep2 = New-Object System.Windows.Forms.ToolStripSeparator
    write-host $sep.Width
    write-host $sep.Height
    $brush = New-Object System.Drawing.SolidBrush("64,64,64")
    $pen = New-Object System.Drawing.Pen("Window")

    $_.Graphics.FillRectangle($brush, 0, 0, $sep.Width, $sep.Height);
    $_.Graphics.DrawLine($pen, 10, $sep2.height/2, $sep.width -10, $sep2.height/2)
    #e.Graphics.FillRectangle(new SolidBrush(BackColor), 0, 0, width, height);
    #e.Graphics.DrawLine(new Pen(ForeColor), 4, height / 2, width - 4, height / 2);
}
$TextBox1_TextChanged = {
}
$MenuStrip1_ItemClicked = {
}
$FileToolStripMenuItem_Click = {
}
$Button1_Click = {
}

. (Join-Path $PSScriptRoot 'test_form.designer.ps1')
$Form1.ShowDialog()