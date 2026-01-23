function Split-Path-Ext([string] $path){
	[string[]] $buffer = $($path | Split-Path -Leaf).split(".")
	$path = $buffer[$buffer.count - 1]
	$path = [System.String]::Concat(".",$path)
	return $path
}