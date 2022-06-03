@echo off
pushd .

SET scriptPath=%~dp0
SET scriptPath=%scriptPath:~0,-1%
cd /D %scriptPath%

type version.txt 
set /P release="Set release version ['X.Y.Z' or empty for no release]: "
IF "%release%"=="" goto :END

echo %release% > version.txt
git add version.txt
git commit -m "%release%"
git push
git checkout -b release/%release%
git stash
git push --set-upstream origin release/%release%
git checkout master
git stash pop

:END
set scriptPath=
pause

popd
