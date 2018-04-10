@echo off
for %%i in (in\*.gif) do (
	gifsicle.exe -O3 %%i -o out\%%~nxi
	echo compress %%~nxi OK
	)
pause


