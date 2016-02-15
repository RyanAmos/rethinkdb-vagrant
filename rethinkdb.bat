@echo off

:: Change CWD to the directory this script is in.
cd %~dp0
where vagrant >nul 2>nul

if not errorlevel 0 (
    echo vagrant: command not found
    echo Download ^& install vagrant from:
    echo http://vagrantup.com/
    exit /b 1
)

if not exist %cd%\Vagrantfile (
  echo Could not find 'Vagrantfile'.
  exit /b 1
)

vagrant up
