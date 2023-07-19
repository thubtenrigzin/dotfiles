@echo off

del /q "%USERPROFILE%\AppData\Local\nvim\*"
del /q "%USERPROFILE%\AppData\Local\nvim-data\*"

FOR /D %%p IN ("%USERPROFILE%\AppData\Local\nvim\*.*") DO rmdir "%%p" /s /q
FOR /D %%p IN ("%USERPROFILE%\AppData\Local\nvim-data\*.*") DO rmdir "%%p" /s /q

rmdir /s /q "%USERPROFILE%\AppData\Local\nvim\.git"

git clone https://github.com/NvChad/NvChad %USERPROFILE%\AppData\Local\nvim --depth 1

xcopy /e /i /q .\spell %USERPROFILE%\AppData\Local\nvim\spell\
xcopy /e /i /q /y .\lua\custom %USERPROFILE%\AppData\Local\nvim\lua\custom

setlocal
:PROMPT
SET /P NVIM=Run Neovim (Y/[N])?
IF /I "%NVIM%" NEQ "Y" GOTO END
nvim
:END
endlocal