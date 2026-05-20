@echo off
setlocal
echo ============================================================
echo  IkiKaiso - remove signing certificate
echo ============================================================
echo.
echo This removes the IkiKaiso self-signed certificate that was
echo registered by install_cert.cmd (restores the PC to its
echo original state).
echo.

set "THUMB=4683B7EF9A1A3A07B05D59D732388F8C87613500"

echo [1/2] removing from Trusted Root Certification Authorities ...
"%SystemRoot%\System32\certutil.exe" -user -delstore Root "%THUMB%"

echo [2/2] removing from Trusted Publishers ...
"%SystemRoot%\System32\certutil.exe" -user -delstore TrustedPublisher "%THUMB%"

echo.
echo ============================================================
echo  Done. The IkiKaiso certificate has been removed.
echo  (If you want to fully uninstall the add-in itself, use
echo   Windows Settings - Apps - "階層化フォーム (Kaiso)".)
echo ============================================================
echo.
pause
