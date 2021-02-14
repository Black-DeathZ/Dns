# How To Remove Ban From computer after using games Cheats ?


* tip 1 : flush dns lot of games  gave ban in dns like pubg .(i notice that facebook is using this method to ban your device if you create lot of accounts ).. 

* tip 2 : use ware or TMAC applications for windows to change ur pc's hardware id (HDD-network adapter's mac address) ..  80% of games gave ban in mac so its too important to change it / if you playing a  high secure game like fortnite you should change the mac every 30sec or 1 min to "delay" the ban .
> Note: dont close TMAC after changing mac Adress.

* tip 3 : set Your  real date and time on pc .

* tip 4 :  don't download or use old cheats .

* tip 5 : clear temp files and junk files / use CCleaner

* tip 6: restart the route & your device

* tip 7:change hardware  serial number

* tip 8: Never Play with weak Internet , The Anti-Cheat will suspect you as using  Ddos Attack so its will give you Short time bane (Not All games use it for protection but most of them).....

* tip 9:  clean temp files a flush dns  every gameplay to  avoid ban  and if you playing too much better use  repeater its will flush dns every 300 seconds without stopping.

*  most Important Tip :  dont use Cheats when The Games is about to update or season end couz the game Value Change and when the Anti-Cheat  detect you its will instantly give you ban  no matter how the cheat are safe

*  All files that you need in Releases.

# Anti-Cheat

## About Anti-Cheat

* Anti-cheat software is designed to prevent players of online games from gaining unfair advantage through the use of third-party tools, usually taking the form of software hooks. It is challenged to run securely in an aggressively hostile environment. See Cheating in online games.

# Features of Anti-Cheat 

* File Integrity Checks
* String Detection for cheat tools
* Classic AntiDebug
* Obfuscation
* Signature Based Detection
* Hook Detection
* Memory Integrity Checks
* Virtualization
* Kernel Drivers which block process access token creation & more
* Virtualization Detection

# How to Bypass Anti-Cheat 

*  To bypass anticheat you must understand how it works,Anticheat work very similarly to Antivirus,and there is no trick or method to bypass them all ... !!

* File Integrity Checks
* Detecting Debuggers
* Stops debugger from attaching
* Detect Cheat Engine & memory editors
* Signature Based Detection
* Detect DLL injection
* Detect Hooks
* Block Read/WriteProcessMemory
* Memory integrity checks
* Statistical Anomaly Detection
* Heuristics

## For example  This code will patch "IsDebuggerPresent " and it will return false every time insted of true!

* this code is Taken from guidedhacking forum 
```
#include <iostream>
#include <Windows.h>
#include <TlHelp32.h>

DWORD GetProcId(const char* procName)
{
    DWORD procId = 0;
    HANDLE hSnap = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    if (hSnap != INVALID_HANDLE_VALUE)
    {
        PROCESSENTRY32 procEntry;
        procEntry.dwSize = sizeof(procEntry);

        if (Process32First(hSnap, &procEntry))
        {
            do
            {
                if (!_stricmp(procEntry.szExeFile, procName))
                {
                    procId = procEntry.th32ProcessID;
                    break;
                }
            } while (Process32Next(hSnap, &procEntry));

        }
    }
    CloseHandle(hSnap);
    return procId;
}

uintptr_t GetModuleBaseAddress(DWORD procId, const char* modName)
{
    uintptr_t modBaseAddr = 0;
    HANDLE hSnap = CreateToolhelp32Snapshot(TH32CS_SNAPMODULE | TH32CS_SNAPMODULE32, procId);
    if (hSnap != INVALID_HANDLE_VALUE)
    {
        MODULEENTRY32 modEntry;
        modEntry.dwSize = sizeof(modEntry);
        if (Module32First(hSnap, &modEntry))
        {
            do
            {
                if (!_stricmp(modEntry.szModule, modName))
                {
                    modBaseAddr = (uintptr_t)modEntry.modBaseAddr;
                    break;
                }
            } while (Module32Next(hSnap, &modEntry));
        }
    }
    CloseHandle(hSnap);
    return modBaseAddr;
}

void PatchEx(BYTE* dst, BYTE* src, unsigned int size, HANDLE hProcess)
{
    DWORD oldprotect;
    VirtualProtectEx(hProcess, dst, size, PAGE_EXECUTE_READWRITE, &oldprotect);
    WriteProcessMemory(hProcess, dst, src, size, nullptr);
    VirtualProtectEx(hProcess, dst, size, oldprotect, &oldprotect);
}

int main()
{
    DWORD procId = GetProcId("CS2D.exe");

    HANDLE hProc = OpenProcess(PROCESS_ALL_ACCESS, NULL, procId);

    //mov eax, 0
    //ret
    PatchEx((BYTE*)IsDebuggerPresent, (BYTE*)"\xB8\x0\x0\x0\x0\xC3", 6, hProc);

    std::getchar();
    return 0;
}

```



Enjoy !
