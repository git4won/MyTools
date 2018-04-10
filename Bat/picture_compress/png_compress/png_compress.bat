@echo off
for %%i in (in\*.png) do (
	TruePNG.exe %%i /o max /dir out
	echo compress %%~nxi OK
	)
pause