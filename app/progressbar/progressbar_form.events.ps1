[int] $global:step = 0

$_process = {
    Start-Sleep -Seconds 3
    if($update.length -gt 0){
        $global:step = [math]::round(33/$update.length,0)
        foreach($obj in $update){
            if($obj -like "*.*"){
                $status_lbl.text = "Deleting:"
                $dir_tbx.text = "$($local)$($obj)"
                Remove-Item"$($local)$($obj)"
                Start-Sleep -Seconds 1
                $status_lbl.text = "Copying:"
                $dir_tbx.text = "$($remote)$($obj)"
                copy-item "$($remote)$($obj)" "$($local)$($obj)"
                if($ProgressBar1.value + $global:step -lt 100){
                    $ProgressBar1.value += $global:step
                    Start-Sleep -Seconds 1
                }else{
                    $ProgressBar1.value = 100
                    Start-Sleep -Seconds 1
                }
            }
        }
    }else{
        $status_lbl.text = ""
        $ProgressBar1.value += 33
        Start-Sleep -Seconds 1
    }
    if($delete.length -gt 0){
        $global:step = [math]::round(33/$delete.length,0)
        #Files
        if($delete.where{$_ -like "*.*"} -gt 0){
            foreach($obj in $delete.where{$_ -like "*.*"}){
                $status_lbl.text = "Deleting:"
                $dir_tbx.text = "$($local)$($obj)"
                Remove-Item"$($local)$($obj)"
                if($ProgressBar1.value + $global:step -lt 100){
                    $ProgressBar1.value += $global:step
                    Start-Sleep -Seconds 1
                }else{
                    $ProgressBar1.value = 100
                    Start-Sleep -Seconds 1
                }
            }
        }
        #Folders
        if($delete.where{$_ -notlike "*.*"} -gt 0){
            foreach($obj in $delete.where{$_ -notlike "*.*"}){
                if($(dir "$($local)$($obj)").count -eq 0){
                    $status_lbl.text = "Deleting:"
                    $dir_tbx.text = "$($local)$($obj)"
                    Remove-Item"$($local)$($obj)"
                    if($ProgressBar1.value + $global:step -lt 100){
                        $ProgressBar1.value += $global:step
                        Start-Sleep -Seconds 1
                    }else{
                        $status_lbl.text = "Finished:"
                        $ProgressBar1.value = 100
                        Start-Sleep -Seconds 1
                    }
                }
            }
        }
    }else{
        $status_lbl.text = ""
        $ProgressBar1.value += 33
        Start-Sleep -Seconds 1
    }
    if($add.length -gt 0){
        $global:step = [math]::round(33/$add.length,0)
        #Folders
        if($add.where{$_ -notlike "*.*"}.count -gt 0){
            foreach($obj in $add.where{$_ -notlike "*.*"}){
                if(!(Test-Path "$($local)$($obj)")){
                        $status_lbl.text = "Creating:"
                        $dir_tbx.text = "$($local)$($obj)"
                        mkdir "$($local)$($obj)"
                        Start-Sleep -Seconds 1
                    }
                if($ProgressBar1.value + $global:step -lt 100){
                    $ProgressBar1.value += $global:step
                    Start-Sleep -Seconds 1
                }else{
                    $status_lbl.text = "Finished:"
                    $ProgressBar1.value = 100
                    Start-Sleep -Seconds 1
                }
            }
        }
        #Files
        if($add.where{$_ -like "*.*"}.count -gt 0){
            foreach($obj in $add.where{$_ -like "*.*"}){
                if(!(Test-Path "$($local)$($obj)")){
                    $status_lbl.text = "Copying:"
                    $dir_tbx.text = "$($remote)$($obj)"
                    copy-item "$($remote)$($obj)" "$($local)$($obj)"
                }
                if($ProgressBar1.value + $global:step -lt 100){
                    $ProgressBar1.value += $global:step
                    Start-Sleep -Seconds 1
                }else{
                    $status_lbl.text = "Finished:"
                    $ProgressBar1.value = 100
                    Start-Sleep -Seconds 1
                }
            }
        }
        
    }else{
        $status_lbl.text = "Finished:"
        $ProgressBar1.value = 100
        Start-Sleep -Seconds 1
    }
}
# This will not Add, Update or Delete Files
$_test = {
    # Update Phase
    Start-Sleep -Seconds 3
    if($update.length -gt 0){
        $global:step = [math]::round(33/$update.length,0)
        foreach($obj in $update){
            if($obj -like "*.*"){
                $status_lbl.text = "Deleting:"
                $dir_tbx.text = "$($local)$($obj)"
                Start-Sleep -Seconds 1
                $status_lbl.text = "Copying:"
                $dir_tbx.text = "$($remote)$($obj)"
                if($ProgressBar1.value + $global:step -lt 100){
                    $ProgressBar1.value += $global:step
                    Start-Sleep -Seconds 1
                }else{
                    $ProgressBar1.value = 100
                    Start-Sleep -Seconds 1
                }
            }
        }
    }else{
        $global:step = 33
        $ProgressBar1.value += $global:step
    }

    # Delete Phase
    if($delete.length -gt 0){
        $global:step = [math]::round(33/$delete.length,0)
        #Files
        if($delete.where{$_ -like "*.*"} -gt 0){
            foreach($obj in $delete.where{$_ -like "*.*"}){
                $status_lbl.text = "Deleting:"
                $dir_tbx.text = "$($local)$($obj)"
                
                if($ProgressBar1.value + $global:step -lt 100){
                    $ProgressBar1.value += $global:step
                    Start-Sleep -Seconds 1
                }else{
                    $ProgressBar1.value = 100
                    Start-Sleep -Seconds 1
                }
            }
        }
        #Folders
        if($delete.where{$_ -notlike "*.*"} -gt 0){
            foreach($obj in $delete.where{$_ -notlike "*.*"}){
                if($(Get-ChildItem "$($local)$($obj)").count -eq 0){
                    $status_lbl.text = "Deleting:"
                    $dir_tbx.text = "$($local)$($obj)"
                    
                    if($ProgressBar1.value + $global:step -lt 100){
                        $ProgressBar1.value += $global:step
                        Start-Sleep -Seconds 1
                    }else{
                        $status_lbl.text = "Finished:"
                        $ProgressBar1.value = 100
                        Start-Sleep -Seconds 1
                    }
                }
            }
        }
    }else{
        $global:step = 33
        $ProgressBar1.value += $global:step
    }

    #Adding Phase
    if($add.length -gt 0){
        $global:step = [math]::round(33/$add.length,0)
        #Folders
        if($add.where{$_ -notlike "*.*"}.count -gt 0){
            foreach($obj in $add.where{$_ -notlike "*.*"}){
                if(!(Test-Path "$($local)$($obj)")){
                        $status_lbl.text = "Creating:"
                        $dir_tbx.text = "$($local)$($obj)"
                       
                        Start-Sleep -Seconds 1
                    }
                if($ProgressBar1.value + $global:step -lt 100){
                    $ProgressBar1.value += $global:step
                    Start-Sleep -Seconds 1
                }else{
                    $status_lbl.text = "Finished:"
                    $ProgressBar1.value = 100
                    Start-Sleep -Seconds 1
                }
            }
        }
        #Files
        if($add.where{$_ -like "*.*"}.count -gt 0){
            foreach($obj in $add.where{$_ -like "*.*"}){
                if(!(Test-Path "$($local)$($obj)")){
                    $status_lbl.text = "Copying:"
                    $dir_tbx.text = "$($remote)$($obj)"
                    
                }
                if($ProgressBar1.value + $global:step -lt 100){
                    $ProgressBar1.value += $global:step
                    Start-Sleep -Seconds 1
                }else{
                    $status_lbl.text = "Finished:"
                    $ProgressBar1.value = 100
                    Start-Sleep -Seconds 1
                }
            }
        }
        
    }else{
        $status_lbl.text = "Finished:"
        $ProgressBar1.value = 100
        Start-Sleep -Seconds 1
    }
}

$check_directories_files = {
    if($update){
        foreach($item in $update)
        {
            if(!(Test-Path "$($local)$($item)")){
                return $False
            }
            if(-not ((Compare-Object (Cat "$($remote)$($item)") (Cat "$($local)$($item)") -IncludeEqual).SideIndicator.contains("=="))){
                return $False
            }
        }
    }
    if($delete){
        foreach($item in $delete)
        {
            if(!(Test-Path "$($local)$($item)")){
                return $false
            }
        }
    }
    if($add){
        foreach($item in $add)
        {
            if(!(Test-Path "$($local)$($item)")){
                return $false
            }
        }
    }
    return $True
}
$progress_form_Shown = {
    #&$_process
    &$_test
    $progress_form.Close()
}
$progress_form_FormClosing = {
    $main_panel.Dispose()
}

Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'progressbar_form.designer.ps1')