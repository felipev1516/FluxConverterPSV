function Invoke-FluxProcess{
    param(
        [string] $file_path=$args[0],
        [string] $new_leaf=$args[1],
		[string] $destination=$args[2],
        [string] $desired_quality=$args[3],
        [boolean] $audio=$args[4],
        [string] $frame_rate=$args[5],
        [string] $scale=$args[6],
        [string] $bit_rate=$args[7],
        [string] $ratio=$args[8],
		[boolean] $encoder=$args[9]
    )
	# [string] $(((ffmpeg -i "$home\Downloads\Video.mp4" -vf "cropdetect" -f null - 2>&1) | Select-String "crop=")[-1] -split "crop=")[1]
	# ffmpeg -i "$home\Downloads\Video2.mp4" -vf "crop=$crop,scale=hd480,setsar=1" -y "$PWD\Test2.mp4"
	# Test if Pictures can also be cropped 
	# 
	[string] $ffmpeg_path = "$PSScriptroot\ffmpeg.exe"
	[string] $ffmpegaudio = ""
	[string] $ffmpegimage = ""
	[string] $ffmpegvideo = ""
	[string] $ffmpegencoder = ""
	[string] $ffmpegaspect = ""
	[string] $ffmpegcrop_vid = ""
	[string] $ffmpegcrop_img = ""
	
	[boolean] $crop_is_auto
	if($ratio -eq "Auto"){
		$crop_is_auto = $True
	}else{
		$crop_is_auto = $False
	}
	
	#Video Quality Parameter
	switch($desired_quality)
	{
		{$_ -like 'Ultra'}{
			$ffmpegvideo = "-r 60 -s hd1080 -b:v 5000k -movflags +faststart"
			$ffmpegimage = "-vf scale=hd1080 -q:v 1"
		}
		{$_ -like 'High'}{
			$ffmpegvideo = "-r 30 -s hd1080 -b:v 3500k -movflags +faststart"
			$ffmpegimage = "-vf scale=hd1080 -q:v 5"
		}
		{$_ -like 'Medium'}{
			$ffmpegvideo = "-r 30 -s hd720 -b:v 2500k -movflags +faststart"
			$ffmpegimage = "-vf scale=hd720 -q:v 10"
		}
		{$_ -like 'Low'}{
			$ffmpegvideo = "-r 30 -s hd720 -b:v 1500k -movflags +faststart"
			$ffmpegimage = "-vf scale=hd720 -q:v 20"
		}
		{$_ -like 'Ultra-Low'}{
			$ffmpegvideo = "-r 15 -s hd480 -b:v 1000k -movflags +faststart"
			$ffmpegimage = "-vf scale=hd480 -q:v 30"
		}
		{$_ -like 'Custom'}{
			$ffmpegvideo = "-r  -s hd$($frame_rate) -b:v $($bit_rate)k"
			if($crop_is_auto){
				$ffmpegaspect = ""
			}else{
				if($ratio -like "*:*"){
					$ffmpegaspect = "-aspect $($ratio.Replace(":","/"))"
				}else{
					if($ratio -ne "Auto"){
						$ffmpegaspect = "-aspect $($ratio)"
					}
				}
			}
		}
	}
	
	#Audio Quality Parameter
	if($audio){$ffmpegaudio = "-acodec aac"}else{$ffmpegaudio = "-an"}
	
	#Encoder Parameter
	if($encoder){$ffmpegencoder = "-vcodec h264_nvenc"}else{$ffmpegencoder = "-vcodec libx264"}
	
	switch($file_path)
	{
		{$_ -like "*.mp4" -or $_ -like "*.MOV" -or $_ -like "*.webm" -or $_ -like "*.gif" -or $_ -like "*.mkv"}
			{
				if($crop_is_auto){
					$ffmpegcrop_vid = $((((. $ffmpeg_path -i $file_path -vf "cropdetect" -f null - 2>&1) | Select-String "crop="))[-1] -split "crop=")[-1]
					$ffmpegvideo = "-r $($frame_rate) -vf crop=$($ffmpegcrop_vid),scale=hd$($frame_rate),setsar=1 -b:v $($bit_rate)k -movflags +faststart"
					$ffmpegaspect = ""
				}
				Start-Process -Filepath "$ffmpeg_path"`
				-ArgumentList "-i `"$($file_path)`" $($ffmpegaudio) $($ffmpegencoder) $($ffmpegvideo) $($ffmpegaspect) -y `"$($destination)\$($new_leaf)`""`
				-wait
			}
		{$_ -like "*.png" -or $_ -like "*.jpg" -or $_ -like "*.jpeg" -or $_ -like "*.bmp" `
		-or $_ -like "*.heic" -or $_ -like "*.tiff" -or $_ -like "*.webp"}
			{
				if($crop_is_auto){
					$ffmpegcrop_img = $((((. $ffmpeg_path -loop 1 -t 1 -i $file_path -vf "cropdetect" -frames:v 10 -f null - 2>&1) | Select-String "crop="))[-1] -split "crop=")[-1]
					$ffmpegimage = "-vf crop=$($ffmpegcrop_img),scale=hd$($frame_rate),setsar=1 -q:v 10"
				}
				
				Start-Process -Filepath "$ffmpeg_path"`
				-ArgumentList "-i `"$($file_path)`" $($ffmpegimage) -y `"$($destination)\$($new_leaf)`""`
				-wait
			}
	}

	if(Test-Path "$destination\$new_leaf"){
		return $True
	}else{
		return $False
	}
}