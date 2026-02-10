. "$PSScriptRoot\Split-Path-Ext.ps1"
. "$PSScriptRoot\Invoke-IterationPlacement.ps1"
# Input is leaf value ex: title.extension
function Invoke-DupeFilePrevention{
	param([string] $leaf, [string] $destination)
	[string] $buffer = $leaf
	[string] $buffer_ext = Split-Path-Ext($leaf)

    if(!($leaf -like "*{#}*")){
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
	 #returns leaf iterated if there exist a file of the same name in the destination
}