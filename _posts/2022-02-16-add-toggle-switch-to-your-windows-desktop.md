---
title: Add toggle switch for everything to your Windows desktop
date: 2022-02-16 18:56:55 +0800
---

The idea is simple:
1. With powershell script, you can do almost everything on Windows,
   for instance, start/stop a service:
   ```powershell
   Start-Service -Name FortiSslvpnDaemon
   Stop-Service -Name FortiSslvpnDaemon
   ```
2. Create a desktop shortcut for that script
3. You can change the look of shortcut on clicking!! That makes a
   switch with visual state

Here an example powershell script that start/stop a service:

```powershell
$shortCutFile = "C:\Users\xxx\Desktop\ToggleFortiVPNDaemon.lnk"
$svcName = "FortiSslvpnDaemon"

function Change-Shortcut-Icon($scFile, $iconNo) {
    $WScriptShell = New-Object -ComObject WScript.Shell
    $shortcut = $WScriptShell.CreateShortcut($scFile)
    $shortcut.IconLocation = "C:\Windows\System32\imageres.dll, $iconNo"
    $shortcut.Save()
}

$svc = Get-Service -Name $svcName
if ($svc.Status -eq 'Running') {
    Stop-Service -Name $svcName
    echo "stoped"
    Change-Shortcut-Icon $shortCutFile 26
} elseif ($svc.Status -eq 'Stopped') {
    Start-Service -Name $svcName
    echo "started"
    Change-Shortcut-Icon $shortCutFile 28
}
```

Store this script as `ToggleFortiVPNDaemon.ps1` somewhere like
`C:/myscripts`, and create Desktop shortcut for it, rename the
shortcut to `ToggleFortiVPNDaemon`.

To run the shortcut as Admin (required by service commands), open
property dialog of the shortcut, in the `Target` field, add
`powershell` before the script name, and click `Advanced` button,
check the `Run as Admin`.

Now, double click the Desktop shortcut, after a confirmation for admin
permission, the service is under control.

The shortcut icon changes as you click, to reflect the service state,
and that's the fantastic part, let's examine it a bit more.

The `Change-Shortcut-Icon` function accepts a `$iconNo` argument,
which is the index into icons in resource file `imageres.dll`, you can
use a separate `*.ico` file for this, but the builtin icon resource is
just easier for maintain, it's already there.

To view all icons in `imageres.dll`, I recommand
[IconViewer](https://www.botproductions.com/iconview/iconview.html),
after install, it's integreted in windows property dialog. In above
script, I use number 26 and 28, those are:
- red cross icon for `Stopped` status
- green check icon for `Running` status

But I still don't know how to get the icon number, the #number shown
in IconViewer is not right, I tried it out, tell me if you know how.
