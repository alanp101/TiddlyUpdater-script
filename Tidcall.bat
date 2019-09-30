@Echo Off
REM Some of this code was written with help from Stackoverflow searches. 
REM replace messages in {} with your variables
Title TiddlyUpdater
:Time

SET HOUR=%TIME:~0,2%
IF "%HOUR:~0,1%" == " " SET HOUR=0%HOUR:~1,1%
Set timestamp=%date:~-4%%date:~0,2%%date:~3,2%.%HOUR%%time:~3,2%%time:~6,2%%time:~-2%

:Tiddlycode

Set TiddlyCodefolder={your code folder}
Set Processforline=Tidprocess.bat
set TidSupport={your support folder}
set FiletoProcess=tiddlylist.txt
set actionlog=0
set pickup=start
set copylocation=%TiddlyCodefolder%
Set copyswitch=off


Echo Related files in download directory > %TidSupport%tempreport.txt 
Echo New test at %Date% %Time% for version %version% >> %TiddlyCodefolder%\outputlog.txt
Echo. >> %TiddlyCodefolder%\outputlog.txt

for /F "usebackq tokens=*" %%A in ("%TidSupport%%FiletoProcess%") do Set LTR=%%A&&call %TiddlyCodefolder%\%Processforline%

REM call %TiddlyCodefolder%\DuplicateRemover.bat %TidSupport%tempreport.txt

if "%actionlog%"=="0" set actionlog=No&&color E4

Type %TidSupport%tempreport.txt >> %TiddlyCodefolder%\outputlog.txt 
Echo Updates complete. %actionlog% wikis were updated >> %TiddlyCodefolder%\outputlog.txt 

Type %TidSupport%tempreport.txt 
Echo Updates complete. %actionlog% wikis were updated 
Pause
exit
