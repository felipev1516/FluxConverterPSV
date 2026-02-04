@echo off
SET FCroot=%~dp0
SET FCpath=%FCroot%app\main\main_form.ps1

powershell -ExecutionPolicy bypass -command "%FCpath%"
cls