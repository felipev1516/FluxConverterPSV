Function Remove-IllegalChar {
    Param([string]$buffer)
    (":","\","/","?","<",">",'"',"|","*") | %{$buffer = $buffer.replace($_,"_")}
    return $buffer
}