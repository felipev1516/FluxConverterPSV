param($type=$args[0])

. "$PSScriptroot\prompt_form.events.ps1"

switch($type){
    "server"{
        &$server_prompt
        $prompt_form.ShowDialog()
    }
    "support"{
        &$support_prompt
        $prompt_form.ShowDialog()
    }
    "ignore"{
        &$ignore_prompt
        $prompt_form.ShowDialog()
    }
    "missing"{
        &$missing_prompt
        $prompt_form.ShowDialog()
    }
    "wait"{
        &$wait_prompt
        $prompt_form.ShowDialog()
    }
    default{
        #&$placeholder_prompt
        $prompt_form.ShowDialog()
    }
}
