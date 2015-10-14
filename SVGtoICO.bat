@ECHO off
REM ###################################################################
REM #
REM #  Author:		ND
REM #  Created:		2015-09-22
REM #  Filename:	SVGtoICO.bat
REM #
REM ###################################################################
REM #
REM #  Uses imagemagick and inkscape command line to convert SVG images
REM #  to Windows Icon (.ico) files containing icons of all appropriate
REM #  sizes used by Windows programmes.
REM #
REM #  Notes
REM #  =====
REM #  This script assumes that imagemagick and inkscape are both 
REM #  installed and registered against the PATH environment variables
REM #
REM ###################################################################

IF NOT EXIST temp MD temp

SET "sizes=16 24 32 48 57 64 72 96 120 128 144 152 195 228 256 512"

FOR /r %%i in (*.svg) DO (

	FOR %%s IN (%sizes%) DO (
		inkscape -z -e temp/%%~ni-%%s.png -w %%s -h %%s %%i
	)
	convert temp/%%~ni-16.png temp/%%~ni-24.png temp/%%~ni-32.png temp/%%~ni-48.png temp/%%~ni-64.png %%~ni.ico
)
RMDIR temp /S /Q
