#supp le cache du serveur FiveM
Remove-Item -Path "C:\Serveur_FiveM\txData\CFXDefault_162851.base\cache\*" -Force -Recurse -ErrorAction SilentlyContinue
#démare le serveur
Start-Process -FilePath "C:\Serveur_FiveM\FXServer.exe"