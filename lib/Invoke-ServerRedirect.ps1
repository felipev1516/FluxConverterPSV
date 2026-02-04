# This function checks if the directory specified in the argument ($server_dir)
# contains the folder ($server_folder_name) if so created a new path
# This redirects the path specified and reachable
function Invoke-ServerRedirect{
    param(
    [string]$server_dir=$args[0],
    [string]$server_folder_name=$args[1]
    )
    
    # Test if Server Directory is reachable
    if($server_dir -eq ""){
        return "0x1" # Error Code 0x1: No value in server_path file
    }else{
        if(!(Test-Path $server_dir)){
            return "0x2" # Error Code 0x2: Server Unreachable
        }
    }
    
    # Check if Server Directory has the folder name
    if($(Get-ChildItem "$server_dir\*").name.contains($server_folder_name)){
        
        #Server Directory is now starting at the root folder
        $server_dir = [system.string]::Concat($server_dir,"\",$server_folder_name)
        $server_dir = [string] $(convert-path $server_dir)
    }
    
    # Check if Folder in Server Directory has items
    if((Get-ChildItem $server_dir).length -eq 0){
        return "0x3" # Error Code 0x3: Server directory is empty
    }
    
    return $server_dir
}
