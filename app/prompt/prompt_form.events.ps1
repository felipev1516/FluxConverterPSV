$path_button_no_Click = {
    $prompt_form.Close()
}
$path_button_yes_Click = {
    . "$PSScriptroot\..\path\path_form.ps1" "server"
    $prompt_form.Close()
}

$no_support_btn_Click = {
    $prompt_form.Close()
}

$yes_support_btn_Click = {
    . "$PSScriptroot\..\path\path_form.ps1" "support"
    $prompt_form.Close()
}
$yes_ignore_btn_Click = {
    . "$PSScriptroot\..\path\path_form.ps1" "ignore"
    $prompt_form.Close()
}
$no_ignore_btn_Click = {
    $prompt_form.Close()
}
$okay_button_Click = {
    $prompt_form.Close()
}
# Server Unavailable
$server_prompt = {

    $prompt_form | ForEach-Object{
        $_.ClientSize = "496,250"
        $_.Text = [System.String]'Server Unavailable'
    }

    $server_prompt_panel | ForEach-Object{
        $_.size = "471, 142"
        $_.location = "12,18"
        $_.Visible = $True
    }
    
    $server_prompt_lbl1 | ForEach-Object{
        $_.size = "434,71"
        $_.location = "18,6"
    }

    $server_prompt_lbl2 | ForEach-Object{
        $_.size = "358,32"
        $_.location = "58,86"
    }
    
    $server_button_panel | ForEach-Object{
        $_.location = "30, 145"
        $_.size = "424,88"
        $_.Visible = $True
    }

    $server_button_no | ForEach-Object{
        $_.location = "228, 13"
        $_.size = "147, 59"
    }

    $server_button_yes | ForEach-Object{
        $_.location = "30, 13"
        $_.size = "147, 59"
    }

    $support_prompt_panel.Visible = $False
    $support_button_panel.Visible = $False

    $ignore_prompt_panel.Visible = $false
    $ignore_button_panel.Visible = $false

    $missing_prompt_panel.Visible = $false
    $missing_button_panel.Visible = $false

    $wait_panel.Visible = $False

}

# Supported extentions during update
$support_prompt = {

    $prompt_form | ForEach-Object{
        $_.ClientSize = "500,266"
        $_.Text = [System.String]'Unknown Supported Extensions'
    }

    $support_prompt_panel | ForEach-Object{
        $_.size = "474, 142"
        $_.location = "12, 18"
        $_.Visible = $True
    }
    
    $support_prompt_lbl1 | ForEach-Object{
        $_.size = "453,77"
        $_.location = "9,10"
    }

    $support_prompt_lbl2 | ForEach-Object{
        $_.size = "345,29"
        $_.location = "58,104"
    }
    
    $support_button_panel | ForEach-Object{
        $_.location = "40, 166"
        $_.size = "424,88"
        $_.Visible = $True
    }

    $no_support_btn | ForEach-Object{
        $_.location = "228, 13"
        $_.size = "147, 59"
    }

    $yes_support_btn | ForEach-Object{
        $_.location = "30, 13"
        $_.size = "147, 59"
    }
     
    $server_prompt_panel.Visible = $False
    $server_button_panel.Visible = $False

    $ignore_prompt_panel.Visible = $false
    $ignore_button_panel.Visible = $false

    $missing_prompt_panel.Visible = $false
    $missing_button_panel.Visible = $false
    
    $wait_panel.Visible = $False

}

# Updatable File Path not define
$ignore_prompt = {
    
    $prompt_form | ForEach-Object{
        $_.ClientSize = "495,263"
        $_.Text = [System.String]'Undefined ignore file types'
    }

    $ignore_prompt_panel | ForEach-Object{
        $_.size = "469, 145"
        $_.location = "12, 12"
        $_.Visible = $True
    }
    
    $ignore_prompt_lbl1 | ForEach-Object{
        $_.size = "463,61"
        $_.location = "3,10"
    }

    $ignore_prompt_lbl2 | ForEach-Object{
        $_.size = "387,42"
        $_.location = "39,81"
    }
    
    $ignore_button_panel | ForEach-Object{
        $_.location = "30, 162"
        $_.size = "424,88"
        $_.Visible = $True
    }

    $no_ignore_btn | ForEach-Object{
        $_.location = "230, 15"
        $_.size = "147, 59"
    }

    $yes_ignore_btn | ForEach-Object{
        $_.location = "30, 13"
        $_.size = "147, 59"
    }
     
    $server_prompt_panel.Visible = $False
    $server_button_panel.Visible = $False

    $support_prompt_panel.Visible = $false
    $support_button_panel.Visible = $false

    $missing_prompt_panel.Visible = $false
    $missing_button_panel.Visible = $false

    $wait_panel.Visible = $False

}

# Folder Missing
$missing_prompt = {

    $prompt_form | ForEach-Object{
        $_.ClientSize = "448,244"
        $_.Text = [System.String]'Folder Error'
    }

    $missing_prompt_panel | ForEach-Object{
        $_.size = "424, 139"
        $_.location = "12, 12"
        $_.Visible = $True
    }
    
    $missing_prompt_lbl1 | ForEach-Object{
        $_.size = "395,53"
        $_.location = "16,6"
    }

    $missing_prompt_lbl2 | ForEach-Object{
        $_.size = "373,70"
        $_.location = "23,59"
    }
    
    $missing_button_panel | ForEach-Object{
        $_.location = "122, 157"
        $_.size = "193,76"
        $_.Visible = $True
    }

    $okay_button | ForEach-Object{
        $_.location = "22, 9"
        $_.size = "147, 57"
    }

    $server_prompt_panel.Visible = $False
    $server_button_panel.Visible = $False

    $support_prompt_panel.Visible = $false
    $support_button_panel.Visible = $false

    $ignore_prompt_panel.Visible = $false
    $ignore_button_panel.Visible = $false

    $wait_panel.Visible = $False
}

# Please Wait 
$wait_prompt = {
    
    $prompt_form | ForEach-Object{
        $_.ClientSize = "438,185"
        $_.Text = [System.String]'Flux Converter'
    }

    $wait_panel | ForEach-Object{
        $_.size = "375, 145"
        $_.location = "30, 18"
        $_.Visible = $True
    }
    
    $wait_prompt_lbl1 | ForEach-Object{
        $_.size = "260, 51"
        $_.location = "58, 18"
    }

    $wait_prompt_lbl2 | ForEach-Object{
        $_.size = "254, 43"
        $_.location = "55, 81"
    }
    
    $server_prompt_panel.Visible = $False
    $server_button_panel.Visible = $False

    $support_prompt_panel.Visible = $false
    $support_button_panel.Visible = $false

    $ignore_prompt_panel.Visible = $false
    $ignore_button_panel.Visible = $false

    $missing_prompt_panel.Visible = $False
    $missing_button_panel.Visible = $False
}
# Placeholder
$placeholder_prompt = {
    $prompt_form.Text = [System.String]'Placeholder'
    $status_lbl.Text = [System.String]'PLACEHOLDER'
    $desc_lbl.Text = [System.String]'Respect the PLACEHOLDER!!'
    $path_panel.visible = $False
    $path_support_panel.Visible = $False
    $ignore_panel.Visible = $False
}

$prompt_form_Load = {
    
}
Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'prompt_form.designer.ps1')

