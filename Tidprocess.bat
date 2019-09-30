@Echo off
Set version=2.0

:Sort

Set ignore=0

If "%LTR:~0,8%"=="--Backup" set Backup=%LTR:~9%
REM If "%LTR:~0,8%"=="--Pickup" set Pickup=%LTR:~9%
If "%LTR:~0,10%"=="--Delivery" set Delivery=%LTR:~11%
If "%LTR:~0,14%"=="--Copylocation" set copylocation=%LTR:~15%
If "%LTR:~0,14%"=="--Copylocation" set copyswitch=on
If "%LTR:~0,11%"=="--Endoflist" Goto :EndReport
If "%LTR:~0,2%"=="--" set ignore=1

If "%ignore%"=="0" goto variablesort
If "%ignore%"=="1" goto :ignoreoutput

:variablesort

Set Tiddly=%LTR%

Goto :VariableOutput

:ignoreoutput
Echo Line ignored: %LTR:~2% >> %TiddlyCodefolder%\outputlog.txt 

If "%LTR:~0,8%"=="--Pickup" Goto :Pickupaction

Goto :End

:VariableOutput
Echo Settings Tiddly: %Tiddly% Picked up from %Pickup% deliver to %Delivery% and back up to %Backup%  >> %TiddlyCodefolder%\outputlog.txt

:CheckAction

If exist %Pickup%\%Tiddly% goto :Action
Goto :End

:action

Set /A actionlog = %actionlog% + 1
Move "%Delivery%"\%Tiddly% %Backup%\Backup-%timestamp%-%Tiddly%
If "%Copyswitch%"=="on" Copy %Pickup%\%Tiddly% "%copylocation%"\%Tiddly%
Move %Pickup%\%Tiddly% "%Delivery%"
echo Tiddly Updated: %Tiddly% 
echo Tiddly Updated: %Tiddly% >> %TiddlyCodefolder%\outputlog.txt
If "%Copyswitch%"=="on" echo %Tiddly% copied to %copylocation%
If "%Copyswitch%"=="on" Set copyswitch=off

CD %TiddlyCodefolder%

Goto :End 

:Pickupaction
Echo Pickup action detected >> %TidSupport%outputlog.txt
if "%Pickup%"=="start" set Pickup=%LTR:~9%&&Goto End 

Echo In %Pickup% location >> %TidSupport%tempreport.txt
dir/b %Pickup%\*.html >> %TidSupport%tempreport.txt
set Pickup=%LTR:~9%
Goto End

:EndReport

Echo In %Pickup% location >> %TidSupport%tempreport.txt
dir/b %Pickup%\*.html >> %TidSupport%tempreport.txt
CD %TiddlyCodefolder%

:End
