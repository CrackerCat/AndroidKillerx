@echo off
if "%PATH_BASE%" == "" set PATH_BASE=%PATH%
set PATH=%CD%;%PATH_BASE%;
set from=%2
cd %4
cd ..
set to=%cd%\ProjectSrc\
cd %~dp0
cd ..
set dell=%to%
set a=%cd%
set b=%a%\dex2jar\d2j-dex2jar.bat
set d=%a%\dex2jar\AUTO.bat
cd ..
set c=%cd%\zip\7za.exe
>%b% echo echo off
>>%b% echo call %c% x %from% -y -o%to% *.dex -aoa
>>%b% echo if exist %to%classes2.dex goto :moredex
>>%b% echo @"%%~dp0d2j_invoke.bat" com.googlecode.dex2jar.tools.Dex2jarCmd %%*
>>%b% echo goto :nomoredex 
>>%b% echo :moredex 
>%d% echo echo off
>>%d% echo @"%%~dp0d2j_invoke.bat" com.googlecode.dex2jar.tools.Dex2jarCmd %%*
>>%b% echo for /r %to% %%%%k in (*.dex) do call %d% -f %%%%k
>>%b% echo echo ..............................................×ª»»ÍêÁË......................................................
>>%b% echo call %c% x %to%*.jar -y -o%to%smali_*\ -aoa
>>%b% echo setlocal EnableDelayedExpansion
>>%b% echo set q=2 
>>%b% echo for /f "tokens=*" %%%%i in ('dir /ad /b %to%smali_classes?-dex2jar') do (ren "%%%%i" "smali_classes!q!"
>>%b% echo set /a q+=1 
>>%b% echo )
>>%b% echo set q=10
>>%b% echo for /f "tokens=*" %%%%i in ('dir /ad /b %to%smali_classes??-dex2jar') do (ren "%%%%i" "smali_classes!q!"
>>%b% echo set /a q+=1 
>>%b% echo )
::>>%b% echo del /f /s /q  %to%smali_classes-dex2jar
::>>%b% echo del /f /s /q  %to%*.jar
::>>%b% echo del /f /s /q  %to%classes?.dex
::>>%b% echo del /f /s /q  %to%classes??.dex
>>%b% echo :nomoredex
java -jar "%~dp0\apktool\apktool_2.6.1.jar" %1 %2 %3 %4 %5 %6 %7 %8 %9

