param($type=$args[0])
. "$PSScriptroot\path_form.events.ps1"
. "$PSScriptroot\..\..\lib\Get-ServerPath.ps1"


switch($type){
    "server"{
        &$server
        $path_form.ShowDialog()
        }
    "support"{
        &$support
        $path_form.ShowDialog()
    }
    "ignore"{
        &$ignore
        $path_form.ShowDialog()
    }
    default{
        #$placeholder
    }
}

