Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

 
public class MouseSimulator
{
    [DllImport("user32.dll")]
    public static extern void mouse_event(uint dwFlags, int dx, int dy, uint dwData, UIntPtr dwExtraInfo);

 
    public const uint MOUSEEVENTF_MOVE = 0x0001;

 
    public static void MoveMouse(int dx, int dy)
    {
        mouse_event(MOUSEEVENTF_MOVE, dx, dy, 0, UIntPtr.Zero);
    }
}

 
public class SendInputHelper
{
    [DllImport("user32.dll")]
    public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, IntPtr dwExtraInfo);
}
"@

 
while($true) {

 
    [MouseSimulator]::MoveMouse(100, 50)

 
Start-Sleep -Seconds 5

 
    [MouseSimulator]::MoveMouse(-120, -55)

 

 

 
    [SendInputHelper]::keybd_event(0x10, 0, 0, 0)  # Press Shift key
    [SendInputHelper]::keybd_event(0x10, 0, 2, 0)  # Release Shift key

 

 
}