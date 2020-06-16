:: Hello Comcave. How are you?
:: This little and dirty script is nothing about you, but there is an problem :(
:: There are several days where is nothing to do!
:: But i must sit at home to make sure that i can solve your CCLauncher Captchas.
:: That´s ok but Captchas are for Bots and not for Humans :p
:: Those things steal my time, that i can 
:: "use for Playing xBox"
:: "use with my family"
:: "use with my dog or cat"
:: and if i really nothing to do, maybe i use my free time with my wife. <3
::
:: Anyway this is the simplest solution to trick your CC-Launcher.
:: Please don´t change your running system.
:: I wouldn´t like it, when i must use my free time to write another script that will simply solve your captchas.
::
:: Stay fresh an be cool!
:: Anyone including you and your technicals can learning from those things and can search for new things to prevent such actions.
::
:: <L-Pow> Hey, my name is L-Pow and i updated the scripts to the v3.0 Version of the CCLauncher
:: <L-Pow> all comment lines without the <L-Pow> infront of it are from the original scripter 
:: <L-Pow> since v3.0 of the CCLauncher is running on Java i made a couple of changes to get this script running again
:: <L-Pow> i also added delay between inputs in the input script 
:: <L-Pow> on top of that the windows focus didnt work with the new version if there are any other programms running
:: <L-Pow> especially with a skype for business conversation window open 
:: <L-Pow> i made the input script change the focus to the skype conversation window first
:: <L-Pow> then it switches the focus back to the input window, enters credentials, waits for a couple of seconds
:: <L-Pow> and finally it switches back to the skype conversation window. This way you can be logged into skype without problems
@echo off
SETLOCAL enableextensions enabledelayedexpansion
:: <L-Pow> Since CCLauncher v3 is running in Java you have to kill Java.exe, be aware that this might also kill other running java applications
set EXE=Java.exe
:: <L-Pow> you might need to change the path depending on where you have installed the CCLauncher
set START_CCLauncher="" "C:\CCLauncher-Client-3\CCLauncher_Client_3.0"

FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto ComcaveFound

goto ComcaveNotFound

:ComcaveFound
set string=CCLauncher ist aktiv und muss nicht gestartet werden.
:: <L-Pow> since java is pretty responsive i lowered the time for killing and relaunching
for /L %%a in (1, 1, 25) do (
set sting=!string:~0,%%a! 
echo ^>!sting!
ping localhost -n 1 >nul
if %%a GEQ 25 goto END
cls 
)

:ComcaveNotFound
set string=CCLauncher ist nicht aktiv :(
:: <L-Pow> since java is pretty responsive i lowered the time for killing and relaunching
for /L %%a in (1, 1, 25) do (
set sting=!string:~0,%%a! 
echo ^>!sting!
ping localhost -n 1 >nul
if %%a GEQ 25 goto OpenComcave
cls 
)

:OpenComcave
start %START_CCLauncher%
:: <L-Pow> i added dots to the string so you can see its still waiting/working
:: <L-Pow> i also made the wait time to start the input longer due to running it on a slow Comcave Laptop
set string=CCLauncher wurde erfolgreich gestartet. Die Automatische Eingabe der Zugangsdaten wird gestartet......................................................................................................................

for /L %%a in (1, 1, 200) do (
set sting=!string:~0,%%a! 
echo ^>!sting!
ping localhost -n 1 >nul
if %%a GEQ 200 goto UserDetails
cls 
)

:UserDetails
:: i have no plan how to do it in batch. so we use vbscript for input of your details (username / password)
wscript "userinput.vbs"
goto END

:END
:: As user requests, i moved the restart interval to an random time between 10 to 60 minutes.
:: <L-Pow> i changed the restart time to a random time between 30 and 60 minutes
set /a rand=%random%%% 1801 +1800
echo Script startet in %rand% Sekunden automatisch von neuem.
echo Enter zum sofortigen Neustart.
timeout /t %rand%
taskkill /f /im %EXE% >nul
:: make sure launcher is closed
timeout /t 3
%0