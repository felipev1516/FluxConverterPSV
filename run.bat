@echo off
SET FCroot=%~dp0
SET FCpath=%FCroot%app\main\main_form.ps1
cmd /c start /min "" powershell -ExecutionPolicy bypass -WindowStyle Hidden -command "&{unblock-file %FCpath%; . %FCpath%}"
cls