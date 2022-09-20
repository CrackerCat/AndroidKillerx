echo off
call F:\tool\AndroidKiller\AndroidKiller1.3.1_fix\AndroidKiller\zip\7za.exe x "E:\tool\androidtool\Coolapk-v10.4.apk" -y -oF:\tool\AndroidKiller\AndroidKiller1.3.1_fix\AndroidKiller\projects\Coolapk-v10.4\ProjectSrc\ *.dex -aoa
if exist F:\tool\AndroidKiller\AndroidKiller1.3.1_fix\AndroidKiller\projects\Coolapk-v10.4\ProjectSrc\classes2.dex goto :moredex
@"%~dp0d2j_invoke.bat" com.googlecode.dex2jar.tools.Dex2jarCmd %*
goto :nomoredex 
:moredex 
for /r F:\tool\AndroidKiller\AndroidKiller1.3.1_fix\AndroidKiller\projects\Coolapk-v10.4\ProjectSrc\ %%k in (*.dex) do call F:\tool\AndroidKiller\AndroidKiller1.3.1_fix\AndroidKiller\bin\dex2jar\AUTO.bat -f %%k
echo ..............................................×ª»»ÍêÁË......................................................
call F:\tool\AndroidKiller\AndroidKiller1.3.1_fix\AndroidKiller\zip\7za.exe x F:\tool\AndroidKiller\AndroidKiller1.3.1_fix\AndroidKiller\projects\Coolapk-v10.4\ProjectSrc\*.jar -y -oF:\tool\AndroidKiller\AndroidKiller1.3.1_fix\AndroidKiller\projects\Coolapk-v10.4\ProjectSrc\smali_*\ -aoa
setlocal EnableDelayedExpansion
set q=2 
for /f "tokens=*" %%i in ('dir /ad /b F:\tool\AndroidKiller\AndroidKiller1.3.1_fix\AndroidKiller\projects\Coolapk-v10.4\ProjectSrc\smali_classes?-dex2jar') do (ren "%%i" "smali_classes!q!"
set /a q+=1 
)
set q=10
for /f "tokens=*" %%i in ('dir /ad /b F:\tool\AndroidKiller\AndroidKiller1.3.1_fix\AndroidKiller\projects\Coolapk-v10.4\ProjectSrc\smali_classes??-dex2jar') do (ren "%%i" "smali_classes!q!"
set /a q+=1 
)
:nomoredex
