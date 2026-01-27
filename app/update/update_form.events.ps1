param(`
[string]$name,`
[string]$version,`
[string]$remote,`
[string]$local,`
[string[]]$compare = @(),`
[string[]]$update = @(),`
[string[]]$delete = @(),`
[string[]]$add = @(),`
[string[]]$extentions = @(),`
[string[]]$ignore = @(),`
[string]$prompt,`
[string]$rule
)

# $(((.\ffmpeg6_1_1.exe -version | sls -pattern 'version (\d\.\d\.\d)').matches.value) -split " ")[1]

Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot '\UI\update.designer.ps1')
[string[]]$item_to_update = @()
[string[]]$item_to_add = @()
[string[]]$item_to_delete = @()

switch($args[0]){
    "-h"{
        write-host "
        # Update.ps1 -remote <string> -local <string> -update <string[]> -extentions <string[]> (Focus on a specific directory on both remote and local. Update files with/without a specific extention)
        # Update.ps1 -remote <string> -local <string> -a (Focus on all remote directory and compare with local directory, mainly for full installation.) 
        # Update.ps1 -remote <string> -rule <string[]> (Focus on a set of directories and extentions in a file) 
        # Update.ps1 -remote <string> -local <string> -repair <Boolean> (If folders are missing on local)
        "
        exit
    }
}
$update_form_Shown = {
    $update_form.Text = "$($name) Update Tool"
}
$no_btn_Click = {
    $update_form.Close()
}
$okay_btn_Click = {
    $update_form.Close()
}
$yes_btn_Click = {
    if($(. $PWD\data\UI\progressbar.ps1 -remote $remote -local $local -update $item_to_update -delete $item_to_delete -add $item_to_add -name $name)){
        .$PWD\data\UI\prompt.ps1 -pass $True
        $update_form.Close()
    }else{
        .$PWD\data\UI\prompt.ps1 -pass $False
        $update_form.Close()
    }
}
$button_switch = {
    param([boolean]$y,[boolean]$o,[boolean]$n)
    $yes_btn.Visible = $y
    $okay_btn.Visible = $o
    $no_btn.Visible = $n
}
$file_extract = {
    param([string]$_dir,[string]$_update,[string[]]$_extentions = @(),[string[]]$_ignore = @(), [string]$_recurse)
    [string[]] $buffer = @()
    if($_update -eq "\"){
        $_update = ""
    }
    if($_recurse -eq "-a"){
        if($(dir "$($_dir)\$($_update)" -recurse).fullname.length -gt 0){
            $buffer = $((dir "$($_dir)\$($_update)" -recurse).fullname).replace($_dir,"")
        }else{
            return [string[]] @()
        }
        
    }else{
        if( $(dir "$($_dir)\$($_update)*").fullname.replace($_dir,"").length -gt 0){
             $buffer = $(dir "$($_dir)\$($_update)*").fullname.replace($_dir,"")
        }else{
            return [string[]] @()
        }
        
    }
    if($_extentions){
        [string[]] $buffer2 = @()
        foreach($i in $buffer){
            foreach($j in $_extentions){
                if($i -like "*$($j)*"){
                    $buffer2 += $i
                }
            }
        }
        $buffer = $buffer2
    }
    if($_ignore){
        [string[]] $buffer3 = @()
        foreach($i in $buffer){
            foreach($j in $_ignore){
                if($i -like ("*$($j)*").replace("\","")){
                    $buffer3 += $i
                }
            }
        }
        $buffer = $buffer | ?{$_ -notin $buffer3}
    }
    return $buffer
}

$file_compare = {
    param([string]$_remote, [string]$_local,[string]$_update,[string[]]$_extentions, [string[]]$_ignore, [string]$_recurse)
    
    [string[]] $r = & $file_extract -_dir $_remote -_update $_update -_extentions $_extentions -_ignore $_ignore -_recurse $_recurse
    [string[]] $l = & $file_extract -_dir $_local -_update $_update -_extentions $_extentions -_ignore $_ignore -_recurse $_recurse
    [string[]] $__update = @()
    
    if($r.length -eq 0){
        if($l.length -eq 0){
           return @()
        }else{
            return $_local
        }    
    }
    if($l.length -eq 0){
        return $_remote
    }
    [string[]] $union = @(); $union = $($l | ?{$_ -in $r})
    
   foreach($file in $union){
        foreach($i in $compare){
            if($file -like "*$($i)*"){
                if($(Cat "$($_remote)$($file)").length -ne 0 -and $(Cat "$($_local)$($file)").length -ne 0){
                    if((Compare-Object (Cat "$($_remote)$($file)") (Cat "$($_local)$($file)") -IncludeEqual).SideIndicator.contains("<=")`
                    -or (Compare-Object (Cat "$($_remote)$($file)") (Cat "$($_local)$($file)") -IncludeEqual).SideIndicator.contains("=>")){
                        $__update += $file
                    }
                }else{
                    if($(Cat "$($_remote)$($file)").length -eq 0 -and $(Cat "$($_local)$($file)").length -eq 0){
                        continue
                    }else{
                        $__update += $file
                    }
                }    
            }
        }    
    }
    return $__update
}
$directory_difference = {
    param([string]$_remote, [string]$_local,[string] $_update, [string[]]$_extentions = @(), [string[]]$_ignore = @(), [string]$_recurse)
    [string[]] $r = @()
    [string[]] $l = @()
    [string[]] $diff = @()

    $r = (& $file_extract -_dir $_remote -_update $_update -_extentions $_extentions -_ignore $_ignore -_recurse $_recurse)
    $l = (& $file_extract -_dir $_local -_update $_update -_extentions $_extentions -_ignore $_ignore -_recurse $_recurse)
    $diff = $($l | ?{$_ -notin $r})
    return $diff
}

if(!(Test-Path $remote)){
    $placeholder_lbl.Text = "Directory Not Found"
    .$button_switch -y $false -o $True -n $false
}else{
    $remote = $((dir $remote).fullname |split-path -parent)[0]
    if($rule){
        if(Test-Path $rule){
            if((cat $rule).length -gt 0){
                [string[]] $buffer = @()
                $buffer = (cat $rule).split("`n").trim(" ")
                for($i = 0; $i -lt $buffer.length; $i++){
                    if($buffer[$i] -like "-compare*"){
                        $compare = $buffer[$i].split(" ").where{$_ -ne "-compare"}
                    }

                    if($buffer[$i] -like "-update*"){
                        $update = $buffer[$i].split(" ").where{$_ -ne "-update"}
                        if("-a" -in $update){
                            $args += "-a"
                            $update = $update.where{$_ -ne "-a"}
                        }
                    }
                    if($buffer[$i] -like "-extention*"){
                        $extentions = $buffer[$i].split(" ").where{$_ -ne "-extentions"}
                    }
                    if($buffer[$i] -like "-version*"){
                        $version = $buffer[$i].split(" ").where{$_ -ne "-version"}
                    }
                    if($buffer[$i] -like "-name*"){
                        $name = $buffer[$i].split(" ").where{$_ -ne "-name"}
                    }
                    if($buffer[$i] -like "-ignore*"){
                        $ignore = $buffer[$i].split(" ").where{$_ -ne "-ignore"}
                    }
					if($buffer[$i] -like "-add*"){
                        $add = $buffer[$i].split(" ").where{$_ -ne "-add"}
                    }
                }
            }
        }
    }
    if($add){
        foreach($item in $add){
            if(Test-Path "$(local)\$($item)" -and Test-Path "$(remote)\$($item)"){
                foreach($i in $compare){
                    if($item -like "*$($i)*"){
                        if($(Cat "$($_remote)$($file)").length -ne 0 -and $(Cat "$($_local)$($file)").length -ne 0){
                            if((Compare-Object (Cat "$($_remote)$($file)") (Cat "$($_local)$($file)") -IncludeEqual).SideIndicator.contains("<=")`
                            -or (Compare-Object (Cat "$($_remote)$($file)") (Cat "$($_local)$($file)") -IncludeEqual).SideIndicator.contains("=>")){
                                $item_to_update += $item
                            }
                        }
                    }
                }
            }
            if(Test-Path "$(remote)\$($item)" -and !(Test-Path "$(local)\$($item)")){
                $item_to_add += $item
            }
        }
    }
    #Check if update parameter was filled with a directory
    if($update){
        if(Test-Path "$($remote)\$($update[0])"){
            if(Test-Path "$($local)\$($update[0])"){
                $item_to_update += $(& $file_compare -_remote $remote -_local $local -_update $update[0] -_extentions $extentions -_ignore $ignore -_recurse $args[0])
                if($item_to_update.length -gt 0){
                    switch($item_to_update){
                        {$_[0] -eq $local}{
                            $item_to_delete += & $file_extract -_dir $local -_extentions $extentions -_update $update[0] -_ignore $ignore -_recurse $args[0]
                        }
                        {$_[0] -eq $remote}{
                            $item_to_add += & $file_extract -_dir $remote -_extentions $extentions -_update $update[0] -_ignore $ignore -_recurse $args[0]
                        }
                    }
                }
                if($item_to_add.Length -eq 0){$item_to_add += & $directory_difference -_remote $local -_local $remote -_update $update[0] -_extentions $extentions -_ignore $ignore -_recurse $args[0]}
                if($update[0] -ne "\"){
                    if($item_to_delete.Length -eq 0){$item_to_delete +=  & $directory_difference -_remote $remote -_local $local -_update $update[0] -_extentions $extentions -_ignore $ignore -_recurse $args[0]}
                }
            }else{
                #If Local Directory is Missing
                $item_to_add += & $file_extract -_dir $remote -_update $update[0] -_extentions $extentions -_ignore $ignore -_recurse $args[0]
            }
        }else{
            #Make sure base of Remote Directory Exist
            if(Test-Path $local){
                $item_to_delete += & $file_extract -_dir $local -_update $update[0] -_extentions $extentions -_ignore $ignore -_recurse $args[0]
            }
        }
    }
    
    if($item_to_update -or $item_to_delete -or $item_to_add){
        $placeholder_lbl.text = "Version $version is available !`n`nWould you like to update`nthe $($name)?"
        &$button_switch -y $True -o $False -n $True
    }else{
        if($prompt.ToLower() -eq "off"){
            return
        }
        $placeholder_lbl.text = "$($name) is up-to-date"
        &$button_switch -y $False -o $True -n $False
    }
}


$no_btn.add_Click($no_btn_Click)
$yes_btn.add_Click($yes_btn_Click)
$okay_btn.add_Click($okay_btn_Click)
$update_form.add_Shown($update_form_Shown)

$update_form.ShowDialog()