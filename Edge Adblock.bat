ECHO OFF
TITLE Edge Adblock
CLS
MODE con:cols=80 lines=30
COLOR f0
GOTO CHECKADMIN

:CHECKADMIN
ECHO       _____    _               ___      _ _     _            _    
ECHO      !  ___!  ! !             / _ \    ! ! !   ! !          ! !   
ECHO      ! !__  __! ! __ _  ___  / /_\ \ __! ! !__ ! ! ___   ___! ! __
ECHO      !  __!/ _` !/ _` !/ _ \ !  _  !/ _` ! '_ \! !/ _ \ / __! !/ /
ECHO      ! !__! (_! ! (_! !  __/ ! ! ! ! (_! ! !_) ! ! (_) ! (__!   \
ECHO      \____/\__,_!\__, !\___! \_! !_/\__,_!_.__/!_!\___/ \___!_!\_\
ECHO                   __/ !                                           
ECHO                  !___/                                    
ECHO  ___________________________________________________________________________
ECHO.
ECHO                                BY CTTYNUL                         
ECHO  ___________________________________________________________________________
ECHO.
ECHO Admin permissions required. Detecting permissions...

NET SESSION >nul 2>&1
IF %ERRORLEVEL% == 0 (
	ECHO.
    ECHO Success: Admin permissions confirmed.
    GOTO MENU
) ELSE (
	ECHO.
	ECHO ################ ERROR: ADMINISTRATOR PRIVILEGES REQUIRED ################
	ECHO Failure: Current permissions inadequate.
	ECHO This script needs to be run as admin. (Right click - Run as Admin)
	ECHO ##########################################################################
	ECHO.
	PAUSE
	GOTO EOF
)

:DOWNLOADHOSTS
:: Downloading hosts file
>"%temp%\gethosts.vbs" ECHO Set objArgs = WScript.Arguments
>>"%temp%\gethosts.vbs" ECHO url = objArgs(0)
>>"%temp%\gethosts.vbs" ECHO pix = objArgs(1)
>>"%temp%\gethosts.vbs" ECHO With CreateObject("MSXML2.XMLHTTP")
>>"%temp%\gethosts.vbs" ECHO .open "GET", url, False
>>"%temp%\gethosts.vbs" ECHO .send
>>"%temp%\gethosts.vbs" ECHO a = .ResponseBody
>>"%temp%\gethosts.vbs" ECHO End With
>>"%temp%\gethosts.vbs" ECHO With CreateObject("ADODB.Stream")
>>"%temp%\gethosts.vbs" ECHO .Type = 1 'adTypeBinary
>>"%temp%\gethosts.vbs" ECHO .Mode = 3 'adModeReadWrite
>>"%temp%\gethosts.vbs" ECHO .Open
>>"%temp%\gethosts.vbs" ECHO .Write a
>>"%temp%\gethosts.vbs" ECHO .SaveToFile pix, 2 'adSaveCreateOverwrite
>>"%temp%\gethosts.vbs" ECHO .Close
>>"%temp%\gethosts.vbs" ECHO End With
cscript /nologo "%temp%\gethosts.vbs" https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts "%~dp0hosts" 2>nul 
DEL "%temp%\gethosts.vbs"
GOTO EOF

:MENU
CLS
ECHO       _____    _               ___      _ _     _            _    
ECHO      !  ___!  ! !             / _ \    ! ! !   ! !          ! !   
ECHO      ! !__  __! ! __ _  ___  / /_\ \ __! ! !__ ! ! ___   ___! ! __
ECHO      !  __!/ _` !/ _` !/ _ \ !  _  !/ _` ! '_ \! !/ _ \ / __! !/ /
ECHO      ! !__! (_! ! (_! !  __/ ! ! ! ! (_! ! !_) ! ! (_) ! (__!   \
ECHO      \____/\__,_!\__, !\___! \_! !_/\__,_!_.__/!_!\___/ \___!_!\_\
ECHO                   __/ !                                           
ECHO                  !___/                                    
ECHO  ___________________________________________________________________________
ECHO.
ECHO                                BY CTTYNUL                         
ECHO  ___________________________________________________________________________
ECHO.
ECHO Edge Adblock makes the internet not suck. It provides blocking
ECHO malicious, ads website and Windows 10 Telemetry.
ECHO Hosts file used in this script is provided by www.someonewhocares.org
ECHO.
ECHO Run this at your own risk. I'm not responsible for any damages.
ECHO.
ECHO 1 - Enable
ECHO 2 - Disable
ECHO 3 - About
ECHO 4 - Exit
ECHO.

SET /P M=Type 1, 2, 3 or 4 and press ENTER: 
ECHO.
IF %M%==1 GOTO ENABLE
IF %M%==2 GOTO DISABLE
IF %M%==3 GOTO README
IF %M%==4 GOTO EOF

:ENABLE
CALL :DOWNLOADHOSTS
SET hostpath=%Windir%\System32\drivers\etc

IF EXIST "%~dp0hosts" (
	ECHO.
	ECHO  ___________________________________________________________________________
	ECHO.
	ECHO         If requested select F as File! This will backup ur config 
	ECHO  ___________________________________________________________________________
	ECHO.
	XCOPY /f /y %hostpath%\hosts %hostpath%\hosts_back
	TYPE "%~dp0hosts" >> %hostpath%\hosts
	REGEDIT "%~dp0regenable.reg"
	ECHO Edge Adblock Enabled - Launch dir: "%~dp0" >> %hostpath%\edgeadblock.log
	ECHO Done! Log file created %hostpath%\edgeadblock.log
	ECHO If it seems not working reboot your system! 
	ECHO.
	PAUSE
	CLS
	GOTO MENU
) ELSE (
	ECHO.
	ECHO ################## ERROR: CANNOT DOWNLOAD HOSTS FILE #####################
	ECHO Failure: Cannot download hosts file from someonewhocares.org
	ECHO Check your internet connection and retry.
	ECHO ##########################################################################
	ECHO.
	PAUSE
	GOTO EOF
)

:DISABLE
SET hostpath=%Windir%\System32\drivers\etc
DEL %hostpath%\hosts
REN %hostpath%\hosts_back hosts
REGEDIT "%~dp0regdisable.reg"
ECHO Edge Adblock Disabled - Launch dir: "%~dp0" >> %hostpath%\edgeadblock.log
ECHO Done! Log file created %hostpath%\edgeadblock.log
ECHO If it seems not working reboot your system! 
ECHO.
PAUSE
CLS
GOTO MENU

:README
CLS
ECHO       _____    _               ___      _ _     _            _    
ECHO      !  ___!  ! !             / _ \    ! ! !   ! !          ! !   
ECHO      ! !__  __! ! __ _  ___  / /_\ \ __! ! !__ ! ! ___   ___! ! __
ECHO      !  __!/ _` !/ _` !/ _ \ !  _  !/ _` ! '_ \! !/ _ \ / __! !/ /
ECHO      ! !__! (_! ! (_! !  __/ ! ! ! ! (_! ! !_) ! ! (_) ! (__!   \
ECHO      \____/\__,_!\__, !\___! \_! !_/\__,_!_.__/!_!\___/ \___!_!\_\
ECHO                   __/ !                                           
ECHO                  !___/                                    
ECHO  ___________________________________________________________________________
ECHO.
ECHO                                BY CTTYNUL                         
ECHO  ___________________________________________________________________________
ECHO.
ECHO Edge Adblock makes the internet not suck. It provides blocking
ECHO malicious, ads website and Windows 10 Telemetry.
ECHO Hosts file used in this script is provided by Dan Pollock 
ECHO www.someonewhocares.org
ECHO.
ECHO License: GNU General Public License
ECHO.
ECHO To make this script working run bat file as admin.
ECHO Edge Adblock requires Windows 7, 8, 8.1 or 10.
ECHO Project on GitHub https://github.com/cttynul/edge-adblock
ECHO.
PAUSE
CLS
GOTO MENU

