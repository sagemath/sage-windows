##############################################################################
#       Copyright (C) 2024 Sebastian Oehms <seb.oehms@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#                  http://www.gnu.org/licenses/
##############################################################################

# Copy-Paste from here including the final Blankline

$proj_name = "SageMath"

$path = "$HOME\AppData\Local\SageMathDockerGuide"
$psfile = "sagemath_docker_guide.ps1"; $icofile = "sage.ico"
$ps = "${path}\${psfile}"; $ico = "${path}\${icofile}"

$url = "https://raw.githubusercontent.com/sagemath/sage-windows/main/src"
$urlps = "${url}/${psfile}"; $urlico = "${url}/ico/${icofile}"

New-Item -ItemType Directory -Force -Path $path
Start-BitsTransfer -Source $urlps -Destination $ps
Start-BitsTransfer -Source $urlico -Destination $ico

$ShortcutPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Desktop"), "${proj_name}DockerGuide.lnk")
$WScriptObj = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptObj.CreateShortcut($ShortcutPath)
$SourceFilePath = "C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe"
$SourceArguments = "-ExecutionPolicy Bypass -File $ps"
$Shortcut.TargetPath = $SourceFilePath
$Shortcut.Arguments = $SourceArguments
$Shortcut.WorkingDirectory = "%HOMEDRIVE%%HOMEPATH%"
$Shortcut.IconLocation = "$ico"
$Shortcut.Save()
