function Invoke-ConfigManager {
    # Get the root folder directory
    $root_dir = $(resolve-path (join-path "$PSScriptRoot" "..")).path
    $config_dir = [system.string]::Concat($root_dir,"\config")

    if (!(Test-Path "$config_dir\")){
        mkdir $config_dir
    }
    if(!(Test-Path "$config_dir\default.cfg")){
        ni "$config_dir\default.cfg" -type File
        [string[]] $default = @(
        "project=",`
        "bug_number=",`
        "device=",`
        "build_type=", `
        "build_number=",`
        "audio=",`
        "quality=",`
        "encoder=",`
        "save=",`
        "extended=",`
        "verify=",`
        "video_text=",`
        "pic_text=",`
        "text_text=",`
        "fps=15",`
        "bit=3500",`
        "frame=720",`
        "ratio=auto",`
        "preset_vid={project}-{bug}_{device}_{build}_{1}",`
        "preset_pic={project}-{bug}_{device}_{build}_{1}",`
        "preset_txt={project}-{bug}_{device}_{build}_{1}",`
        "preset_ini={project}-{bug}_{device}_{build}_{1}",`
        "preset_log={project}-{bug}_{device}_{build}_{1}",`
        "preset_cfg={project}-{bug}_{device}_{build}_{1}",`
        "preset_config={project}-{bug}_{device}_{build}_{1}",`
        "regress_vid=Open_Issue_{project}-{bug}_{device}_{build}_{1}",`
        "regress_pic=Open_Issue_{project}-{bug}_{device}_{build}_{1}",`
        "regress_txt=Open_Issue_{project}-{bug}_{device}_{build}_{1}",`
        "regress_ini=Open_Issue_{project}-{bug}_{device}_{build}_{1}",`
        "regress_log=Open_Issue_{project}-{bug}_{device}_{build}_{1}",`
        "regress_cfg=Open_Issue_{project}-{bug}_{device}_{build}_{1}",`
        "regress_config=Open_Issue_{project}-{bug}_{device}_{build}_{1}",`
        "rename_format=1",`
        "vid_ext=None",`
        "pic_ext=None",`
        "text_ext=None"
        )
        $default | %{$_ >> "$config_dir\default.cfg"}
        
    }
    
    if(!(Test-Path "$config_dir\last_state.cfg")){
            New-Item "$config_dir\last_state.cfg" -type File
            $(cat "$config_dir\default.cfg") >> "$config_dir\last_state.cfg"
    }

    if(!(Test-Path "$config_dir\supported_video_ext.cfg")){
        ni "$config_dir\supported_video_ext.cfg" -type File
        @("mp4", "mov","webm","mkv","gif","avi") | %{$_ >> "$config_dir\supported_video_ext.cfg"}
    }

    if(!(Test-Path "$config_dir\supported_pic_ext.cfg")){
        ni "$config_dir\supported_pic_ext.cfg" -type File
        @("png", "jpg", "gif","jpeg","bmp","heic","tiff","webp") | %{$_ >> "$config_dir\supported_pic_ext.cfg"}
    }

    if(!(Test-Path "$config_dir\supported_txt_ext.cfg")){
        ni "$config_dir\supported_txt_ext.cfg" -type File
        @("txt","log","ini","cfg", "config") | %{$_ >> "$config_dir\supported_txt_ext.cfg"}
    }

    if(!(Test-Path "$config_dir\supported_file_types.cfg")){
        ni "$config_dir\supported_file_types.cfg" -type File
        @('Video','Pictures','Text','INI','Log','CFG','Config') | %{$_ >> "$config_dir\supported_file_types.cfg"}
    }

    if(!(Test-Path "$config_dir\supported_branch_types.cfg")){
        ni "$config_dir\supported_branch_types.cfg" -type File
        @('Main', 'Release', 'Developer','Staging')| %{$_ >> "$config_dir\supported_branch_types.cfg"}
    }

    if(!(Test-Path "$config_dir\supported_device_types.cfg")){
        ni "$config_dir\supported_device_types.cfg" -type File
        @('iOS','Android','Xbox','PC','PS5')| %{$_ >> "$config_dir\supported_device_types.cfg"}
    }

    if(!(Test-Path "$config_dir\supported_quality_types.cfg")){
        ni "$config_dir\supported_quality_types.cfg" -type File
        @('Ultra','High','Medium','Low','Ultra-Low','Custom')| %{$_ >> "$config_dir\supported_quality_types.cfg"}
    }
    if(!(Test-Path "$config_dir\legacy_abbreviations.cfg")){
        ni "$config_dir\legacy_abbreviations.cfg" -type File
        @("{Pro}","{Bug}","{Dev}","{Bra}", "{Bui}") | %{$_ >> "$config_dir\legacy_abbreviations.cfg"}
    }
    if(!(Test-Path "$config_dir\abbreviations.cfg")){
        ni "$config_dir\abbreviations.cfg" -type File
        @("{projects}","{bug}","{device}","{branch}", "{build}","{computername}") | %{$_ >> "$config_dir\abbreviations.cfg"}
    }
    return $true
}