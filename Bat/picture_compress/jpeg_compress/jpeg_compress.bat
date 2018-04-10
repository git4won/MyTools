@echo off
for %%i in (in\*.jpg) do (
	jpegtran.exe -copy none -optimize -perfect %%i out\%%~nxi
	echo compress %%~nxi OK
	)
pause