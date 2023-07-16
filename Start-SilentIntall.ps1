# Simple line that starts an exe with silent flags

Start-Process -Wait -FilePath "PathToExe.exe" -ArgumentList "/S /v/qn" -PassThru