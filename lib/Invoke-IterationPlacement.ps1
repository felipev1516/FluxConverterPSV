function Invoke-IterationPlacement([string]$input_buffer,[int]$integer){
	if(($input_buffer).contains("{#}")){
			$input_buffer = $input_buffer.replace("{#}",$integer)
			$input_buffer = $input_buffer.trim(" ")
	}
	return $input_buffer
}