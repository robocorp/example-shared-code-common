@ECHO OFF
PUSHD .

SET scriptPath=%~dp0
SET scriptPath=%scriptPath:~0,-1%
SET sourcePath=%scriptPath%\docs\source
SET buildPath=%scriptPath%\docs\build
SET libPattern=UserLibrary
CD /D %scriptPath%

REM build robot framework documentation using robotframework-docgen
docgen --format html --output %sourcePath%\include\libdoc ^
--template %sourcePath%\template\libdoc\libdoc.html %libPattern%
docgen --no-patches --format libspec --output %sourcePath%\libspec %libPattern%
REM build robot framework docs as JSON for JSON merge tool
docgen --no-patches --format json-html --output %sourcePath%\json %libPattern%
ECHO Executing Python merge
python %sourcePath%\merge.py %sourcePath%\json %sourcePath%\include\latest.json

REM build documentation with sphinx
sphinx-build -aE -b html -j auto %sourcePath% %buildPath%

:END
SET scriptPath=
SET sourcePath=
SET buildPath=

POPD
