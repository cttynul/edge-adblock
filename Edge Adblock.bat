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
ECHO                          BY WWW.HEISENBUG.EU.ORG                          
ECHO  ___________________________________________________________________________
ECHO.
ECHO Admin permissions required. E I TERRENI GRAZIE...

NET SESSION >nul 2>&1
IF %ERRORLEVEL% == 0 (
	ECHO.
    ECHO Success: HO OTTENUTO I TERRENI.
    GOTO MENU
) ELSE (
	ECHO.
	ECHO ################ ERROR: CARMINE NON MI VUOLE DARE I TERRENI ##############
	ECHO Failure: Viva la topa.
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
ECHO                          BY WWW.HEISENBUG.EU.ORG                          
ECHO  ___________________________________________________________________________
ECHO.
ECHO Edge Adblock makes the internet not suck. It provides blocking
ECHO malicious and ads website.
ECHO Hosts file used in this script is provided by www.someonewhocares.org
ECHO.
ECHO Run this at your own risk. I'm not responsible for any damages.
ECHO.
ECHO 1 - COMPRA I TERRENI
ECHO 2 - VENDI I TERRENI
ECHO 3 - ABORTO
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
REN %hostpath%\hosts hosts.back
COPY "%~dp0hosts" %hostpath%\hosts
REGEDIT "%~dp0regenable.reg"
ECHO Edge Adblock Enabled - Launch dir: "%~dp0" >> %hostpath%\edgeadblock.log
ECHO Done! Log file created %hostpath%\edgeadblock.log
ECHO.
PAUSE
CLS
GOTO MENU

:DISABLE
SET hostpath=%Windir%\System32\drivers\etc
DEL %hostpath%\hosts
REN %hostpath%\hosts.back hosts
REGEDIT "%~dp0regdisable.reg"
ECHO Edge Adblock Disabled - Launch dir: "%~dp0" >> %hostpath%\edgeadblock.log
ECHO Done! Log file created %hostpath%\edgeadblock.log
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
ECHO                          BY WWW.HEISENBUG.EU.ORG                          
ECHO  ___________________________________________________________________________
ECHO.
ECHO Edge Adblock makes the internet not suck. It provides blocking
ECHO malicious and ads website.
ECHO Hosts file used in this script is provided by Dan Pollock 
ECHO www.someonewhocares.org
ECHO.
ECHO To make this script working run bat file as admin.
ECHO Edge Adblock requires Windows 7, 8, 8.1 or 10.
ECHO Project on GitHub https://github.com/zegt/
ECHO Visit https://www.heisenbug.eu.org
ECHO.
PAUSE
CLS
GOTO MENU
