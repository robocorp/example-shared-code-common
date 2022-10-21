@ECHO OFF
PUSHD .

SET scriptPath=%~dp0
SET scriptPath=%scriptPath:~0,-1%
SET sourcePath=%scriptPath%\docs\source
SET buildPath=%scriptPath%\docs\build
CD /D %scriptPath%

REM build robot framework documentation using robotframework-docgen
docgen --no-patches --format html --output %sourcePath%\include\libdoc ^
--template %sourcePath%\template\libdoc\libdoc.html UserLibrary
REM build robot frameowrk docs as JSON for JSON merge tool
docgen --no-patches --format json-html --output %sourcePath%\json UserLibrary
python merge.py %sourcePath%\json %sourcePath%\include\latest.json

REM build documentation with sphinx
sphinx-build -b html -j auto %sourcePath% %buildPath%

:END
SET scriptPath=
SET sourcePath=
SET buildPath=

POPD
