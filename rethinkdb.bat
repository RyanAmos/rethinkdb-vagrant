@echo off

where vagrant >nul 2>nul

if not errorlevel 0 (
    echo vagrant: command not found
    echo Download ^& install vagrant from:
    echo http://vagrantup.com/
    exit /b 1
)
    
if not exist %0\..\Vagrantfile (
  echo Could not find 'Vagrantfile'.
  exit /b 1
)

vagrant up
