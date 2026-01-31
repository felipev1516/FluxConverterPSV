. "$PSScriptroot\path_form.events.ps1"
. "$PSScriptroot\..\..\lib\Get-ServerPath.ps1"


switch($args[0]){
    "server"{

        }
    "supported"{

    }
    "ignore"{

    }
    default{
        #$placeholder
    }
}
$path_form.ShowDialog()
