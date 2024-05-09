$window = Get-Process | Where-Object {$_.Id -eq $args[0]} | Select-Object MainWindowHandle
$windowHandle = $window.MainWindowHandle
$gui = [Windows.Management.UI.Console.ConsoleWindowHelper]::new()
$gui.CloseConhostWindow($windowHandle)
