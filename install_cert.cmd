@echo off
setlocal
echo ============================================================
echo  IkiKaiso - signing certificate setup
echo ============================================================
echo.
echo This registers the IkiKaiso self-signed certificate so that
echo the VSTO add-in can be installed on this PC.
echo Current-user stores only - administrator rights are NOT needed.
echo.

set "CER=%TEMP%\IkiKaiso.cer"
set "URL=https://yujifukami.github.io/IKI-Kaiso-VSTO/IkiKaiso.cer"

echo [1/3] downloading certificate ...
"%SystemRoot%\System32\curl.exe" -L -s -o "%CER%" "%URL%"
if not exist "%CER%" (
    echo.
    echo [ERROR] could not download the certificate.
    echo         Check your internet connection and try again.
    echo.
    pause
    exit /b 1
)

echo [2/3] registering to Trusted Root Certification Authorities ...
echo       (a security warning dialog may appear - click Yes)
"%SystemRoot%\System32\certutil.exe" -user -addstore -f Root "%CER%"

echo [3/3] registering to Trusted Publishers ...
"%SystemRoot%\System32\certutil.exe" -user -addstore -f TrustedPublisher "%CER%"

del "%CER%" >nul 2>&1

echo.
echo ============================================================
echo  Done. Now download and run setup.exe to install the add-in:
echo  https://yujifukami.github.io/IKI-Kaiso-VSTO/
echo.
echo  After testing, you can remove this certificate by running
echo  uninstall_cert.cmd.
echo ============================================================
echo.
pause
