@echo off

set ENGINE_PATH=%cd%\engine
set PATH=%PATH%;%cd%\depot_tools

echo "Fetching engine"

setlocal enableextensions
md %ENGINE_PATH%
endlocal

cp gclientconfig %ENGINE_PATH%\.gclient

cd %ENGINE_PATH%
gclient sync
