. "$PSScriptRoot\Split-Path-Ext.ps1"
. "$PSScriptRoot\Invoke-IterationPlacement.ps1"

function Invoke-DupeFilePrevention{
	param([string] $path,[string] $new_extention, [string] $destination)
	[string] $buffer = $path | Split-Path -Leaf
	[string] $buffer_ext = Split-Path-Ext($path)

    if($buffer_ext -ne $new_extention){
		$buffer = $buffer.replace($buffer_ext,$new_extention).trim(" ")
        $buffer_ext = $new_extention
	}
	
    if(!($path -like "*{#}*")){
		if(Test-Path "$($destination)\$($buffer)"){
			$buffer = $buffer.replace($buffer_ext,"")
			$buffer = $([system.string]::Concat($buffer,"({#})",$buffer_ext)).trim(" ")
		}
	}

	[int] $iter = 1
	for(;;$iter++){
		$tempname =  $(Invoke-IterationPlacement $buffer $iter)
		if(Test-Path "$($destination)\$($tempname)"){continue}else{break}
	}
	$buffer = $tempname
	
	return $buffer
	 #returns new name without parent and interated with the same extention
}