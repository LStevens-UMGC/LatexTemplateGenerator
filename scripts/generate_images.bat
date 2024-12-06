@echo off
setlocal

rem Define the path to the screenshots directory
set "DIR=.\screenshots"
rem Output LaTeX file where the image inclusion commands will be appended
set "LATEX_FILE=include_images.tex"

rem Create or clear the output LaTeX file
echo % Automatically generated LaTeX file > "%LATEX_FILE%"

rem Loop through all PNG files in the directory
for %%i in ("%DIR%\*.png") do (
    rem Extract the filename without the path
    set "filename=%%~nxi"
    rem Append LaTeX command to include the image
    echo \begin{figure}[H] >> "%LATEX_FILE%"
    echo   \centering >> "%LATEX_FILE%"
    echo   \includegraphics[width=0.8\textwidth]{screenshots/%%~nxi} >> "%LATEX_FILE%"
    echo   \caption{%%~nxi} >> "%LATEX_FILE%"
    echo   \label{fig:/%%~nxi} >> "%LATEX_FILE%"
    echo \end{figure} >> "%LATEX_FILE%"
    echo. >> "%LATEX_FILE%"
)

endlocal
