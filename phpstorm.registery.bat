@echo off

SET PhpStormPath="C:\Users\Ahmed\AppData\Local\JetBrains\Toolbox\apps\PhpStorm\ch-0\213.5744.279\bin\phpstorm64.exe"
 
echo Adding file entries
@reg add "HKEY_CLASSES_ROOT\*\shell\PhpStorm" /t REG_SZ /v "" /d "Open in PhpStorm"   /f
@reg add "HKEY_CLASSES_ROOT\*\shell\PhpStorm" /t REG_EXPAND_SZ /v "Icon" /d "%PhpStormPath%,0" /f
@reg add "HKEY_CLASSES_ROOT\*\shell\PhpStorm\command" /t REG_SZ /v "" /d "%PhpStormPath% \"%%1\"" /f
 
echo Adding within a folder entries
@reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\PhpStorm" /t REG_SZ /v "" /d "Open with PhpStorm"   /f
@reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\PhpStorm" /t REG_EXPAND_SZ /v "Icon" /d "%PhpStormPath%,0" /f
@reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\PhpStorm\command" /t REG_SZ /v "" /d "%PhpStormPath% \"%%V\"" /f

echo Adding folder entries
@reg add "HKEY_CLASSES_ROOT\Directory\shell\PhpStorm" /t REG_SZ /v "" /d "Open with PhpStorm"   /f
@reg add "HKEY_CLASSES_ROOT\Directory\shell\PhpStorm" /t REG_EXPAND_SZ /v "Icon" /d "%PhpStormPath%,0" /f
@reg add "HKEY_CLASSES_ROOT\Directory\shell\PhpStorm\command" /t REG_SZ /v "" /d "%PhpStormPath% \"%%1\"" /f