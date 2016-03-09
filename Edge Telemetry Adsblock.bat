ECHO OFF
TITLE Edge Ads Telemetry block
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
SET hostpath=%Windir%\System32\drivers\etc
ECHO.
ECHO  ___________________________________________________________________________
ECHO .
ECHO DEVELOPER MESSAGE: If requested select F as File! This will backup ur config 
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
ECHO To make this script working run bat file as admin.
ECHO Edge Adblock requires Windows 7, 8, 8.1 or 10.
ECHO Project on GitHub https://github.com/cttynul/
ECHO.
PAUSE
CLS
GOTO MENU
