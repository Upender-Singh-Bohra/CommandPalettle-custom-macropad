; Prefixes (^ - Ctrl) (! - Alt) (# - Win) "<+modifier = left(modifier) & >+modifier = Right(modifier)"
; With single modifier actual names can be written e.g. Lctrl & f13.
; (Lctrl & Lsfhit & f13) - invalid

#Requires AutoHotkey v2.0

; #NoTrayIcon
#WinActivateForce
SendMode ("Input")
SetTitleMatchMode(2)
#SingleInstance Force
SetWorkingDir A_InitialWorkingDir

; ==============================================================================
; Ahk_exe definitions
; ==============================================================================

ahkexe_explorer := "ahk_exe explorer.exe"
ahkexe_chrome := "ahk_exe chrome.exe"
ahkexe_vscode := "ahk_exe Code.exe"
ahkexe_keepass := "ahk_exe KeePassXC.exe"
ahkexe_terminal := "ahk_exe WindowsTerminal.exe"
ahkexe_notion := "ahk_exe Notion.exe"
ahkexe_discord := "ahk_exe Discord.exe"

; ==============================================================================
; Playback Devices
; ==============================================================================

speaker := "Speakers"
headphones := "Realtek HD Audio 2nd output"

; ==============================================================================
; Boomarks URLS
; ==============================================================================

bookmark1 := " "
bookmark2 := " "

; ==============================================================================
; Powerplan GUIDs
; ==============================================================================

highperformance := "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
sound_highperformance := "power\power plans\audio\highperformance-notification.mp3"

powersaver := "a1841308-3541-4fab-bc81-f71556f20b4a"
sound_powersaver := "power\power plans\audio\powersaver-level-up.mp3"

studyplan := "9897998c-92de-4669-853f-b7cd3ecb2790" ; ryzen balanced (sleep = never)
sound_studyplan := "power\power plans\audio\studyplan-message-incoming.mp3"

; ==============================================================================
; Folders definitions
; ==============================================================================
ftitle_downloads1 := "Downloads"
path_downloads1 := "C:\Users\XANOUS\Downloads"

ftitle_downloads2 := "Downloads - 2"
path_downloads2 := "G:\Downloads - 2"

ftitle_prog := "Prog"
path_prog := "D:\Prog"

ftitle_projects := "Projects"
path_projects := "D:\Projects"

ftitle_datastructure := "Data Structure"
path_datastructure := "D:\Prog\Data Structure"

ftitle_webdev := "Web development"
path_webdev := "D:\Prog\Web development"

ftitle_scripts := "Macropad"
path_scripts := "C:\Program Files (others)\Automation\Macropad"

; ==============================================================================
; Apps definitions
; ==============================================================================

profile1 := '"Profile 5"'
profile2 := '"Profile 1"'

ptitle_chrome := "Google Chrome"
path_chrome := "C:\Program Files\Google\Chrome\Application\chrome.exe"

ptitle_keepass := "KeePassXC"
path_keepass := "C:\Program Files\KeePassXC\KeePassXC.exe"

ptitle_terminal := "Windows PowerShell"
path_terminal := "wt.exe"

ptitle_discord := "Discord"
path_discord := "C:\Users\XANOUS\AppData\Local\Discord\app-1.0.9147\Discord.exe"

ptitle_vscode := " "
path_vscode := "C:\Users\XANOUS\AppData\Local\Programs\Microsoft VS Code\Code.exe"

ptitle_notion := ""
path_notion := "C:\Users\XANOUS\AppData\Local\Programs\Notion\Notion.exe"

pagetitle_todo := "Today"
pageID_todo := "Today-8ad9eff7deff427ea6be2e947881686d?pvs=4"

pagetitle_deadlines := "Goals & Deadlines"
pageID_deadlines := "Goals-Deadlines-0faa17bbd634432baf8da2b396b7a278?pvs=4"

pagetitle_notes := "My Notes"
pageID_notes := "My-Notes-eee2830f44c941bb8215c7bf16e68323?pvs=4"

pagetitle_lifeforce := "Life Force"
pageID_lifeforce := "Life-Force-bb55a5c56e224055965bff5758bd3617?pvs=4"

; ==============================================================================
; Function calls + hotkeys
; ==============================================================================

::fff::obviouslynotmypassword123

ctrl & f13:: {
    terminateActiveWindow()
    Return
}

ctrl & f14:: {
    killActiveProgram()
    KeyWait ("ctrl")
    KeyWait ("f14")
    Return
}

; ---- Sound Controls ----

ctrl & f15:: {
    SoundSetVolume 18
    Return
}

ctrl & f16:: {
    RunWait("sound\mic_mute\mic_mute.exe")
    Return
}

ctrl & f17:: {
    swtichPlaybackdevice(speaker)
    Return
}

ctrl & f18:: {
    swtichPlaybackdevice(headphones)
    Return
}

; ---- vscode automation ----
ctrl & f19:: {
    openProgram(ptitle_vscode, ahkexe_vscode, path_vscode)
    Return
}

ctrl & f21:: {
    vscodeinCurrentFolder(path_vscode)
    Return
}

; vscode - D:\Prog
ctrl & f22:: {
    vscodeinFolder(ftitle_prog, path_vscode, path_prog)
    Return
}

; vscode - D:\Data Structures
ctrl & f23:: {
    vscodeinFolder(ftitle_datastructure, path_vscode, path_datastructure)
    Return
}

; vscode - D:\Web Development
ctrl & f24:: {
    vscodeinFolder(ftitle_webdev, path_vscode, path_webdev)
    Return
}

; vscode - D:\Projects
alt & f13:: {
    vscodeinFolder(ftitle_projects, path_vscode, path_projects)
    Return
}

; D:\Projects
alt & f14:: {
    openProgram(ftitle_projects, ahkexe_explorer, path_projects)
    KeyWait ("alt")
    KeyWait ("f13")
    Return
}

; ---- Notion App / Pages ----

alt & f15:: {
    openNotionPage(pagetitle_todo, pageID_todo, path_notion)
    Return
}

alt & f16:: {
    openNotionPage(pagetitle_deadlines, pageID_deadlines, path_notion)
    Return
}

alt & f17:: {
    openNotionPage(pagetitle_notes, pageID_notes, path_notion)
    Return
}

alt & f18:: {
    openProgram(ptitle_notion, ahkexe_notion, path_notion)
    Return
}

alt & f19:: {
    openNotionPage(pagetitle_lifeforce, pageID_lifeforce, path_notion)
    KeyWait ("alt")
    KeyWait ("f19")
    Return
}

; Chrome
alt & f20:: {
    openChrome(ptitle_chrome, ahkexe_chrome, path_chrome, profile1)
    Return
}

;links
alt & f21:: {
    wintitle := "ChatGPT - Google Chrome"
    openLink(profile1, "chatgpt.com", wintitle)
    Return
}


alt & f22:: {
    openLink(profile1, "gemini.google.com/app", "Gemini - Google Chrome")
    Return
}

alt & f23:: {
    openLink(profile1, "mail.google.com/mail/u/0/#inbox", "Gmail - Google Chrome")
    Return
}

alt & f24:: {
    openLink(profile2, "mail.google.com/mail/u/0/#inbox", "Gmail - Google Chrome")
    Return
}

shift & f14:: {
    openLink(profile1, "web.whatsapp.com/", "WhatsApp Web - Google Chrome")
    Return
}

shift & f15:: {
    openLink(profile1, "youtube.com/feed/subscriptions", "Subscriptions - YouTube - Google Chrome")
    Return
}

shift & f16:: { ; K
    openLink(profile1, bookmark1, "wintitle")
    Return
}

shift & f17:: {
    openLink(profile1, bookmark2, "wintitle")
    Return
}

shift & f18:: {
    openLink(profile2, "github.com", "GitHub - Google Chrome")
    Return
}

; shift & f19:: {
;     openLink(profile, url, "wintitle")
;     Return
; }

shift & f20:: {
    openProgram(ftitle_downloads1, ahkexe_explorer, path_downloads1)
    Return
}

shift & f21:: {
    openProgram(ftitle_downloads2, ahkexe_explorer, path_downloads2)
    KeyWait("Shift")
    KeyWait("f21")
    Return
}


^+v:: {
    openProgram(ftitle_datastructure, ahkexe_explorer, path_datastructure)
    Return
}

^+2:: {
    openProgram(ftitle_downloads1, ahkexe_explorer, path_downloads1)
    Return
}

^+3:: {
    openProgram(ftitle_downloads2, ahkexe_explorer, path_downloads2)
    Return
}


^+#5:: {
    openProgram(ptitle_keepass, ahkexe_keepass, path_keepass)
    Return
}


^+!2:: {
    openProgram(ptitle_discord, ahkexe_discord, path_discord)
    Return
}


; Powerstates ----------------------------------------------

;powerplans
^!f18:: {
    traytip_text := "High Performance Plan (Active)"
    switchPowerplan(highperformance, sound_highperformance, traytip_text)
    Return
}

^!f11:: {
    traytip_text := "Power Saver Plan (Active)"
    switchPowerplan(powersaver, sound_powersaver, traytip_text)
    Return
}

^!f:: {
    traytip_text := "Study Plan (Active)"
    switchPowerplan(Studyplan, sound_studyplan, traytip_text)
    Return
}

; shutdown
^!g:: {
    Loop 3
        Send "#x"
    Sleep 400
    Send "u"
    Send "u"
    Return
}

; sleep
^!k:: {
    Loop 3
        Send "#x"
    Sleep 400
    Send "u"
    Send "s"
    Return
}

; Full shutdown / No faststartup

^!.:: {
    Run ("power\power states\full shutdown\full_shutdown.exe")
    Return
}

^!/:: {
    Run ("power\power states\restart\restart.exe")
    Return
}

; ==============================================================================
; Function definitions
; ==============================================================================

openProgram(programTitle, ahkexe, programPath) {
    winID := programTitle " " ahkexe
    if WinExist(winID) {
        if WinActive(winID) {
            WinMinimize(winID)
        } else {
            WinActivate(winID)
        }
    } else {
        Run(programPath)
        WinWait(winID)
        WinActivate(winID)
    }
}

openChrome(programTitle, ahkexe, programPath, profile) {
    winID := programTitle " " ahkexe
    if WinExist(winID) {
        if WinActive(winID) {
            WinMinimize(winID)
        } else {
            WinActivate(winID)
        }
    } else {
        Run(programPath . " --profile-directory=" profile)
        WinWait(winID)
        WinActivate(winID)
    }
}

openLink(profile, url, wintitle) {
    if WinExist(wintitle) {
        WinActivate(wintitle)
    } else {
        Run(path_chrome " --profile-directory=" profile " " url)
        WinWait(wintitle)
        WinActivate(wintitle)
    }
}

openNotionPage(pageTitle, pageID, notionapath) {
    winID := pageTitle " " ahkexe_notion
    if WinExist(winID) {
        if WinActive(winID) {
            WinMinimize(winID)
        } else {
            WinActivate(winID)
        }
    } else {
        if WinExist(ahkexe_notion) {
            Run("notion://www.notion.so/" . pageID)
            WinWait(ahkexe_notion)
            WinActivate(ahkexe_notion) ;
        } else {
            Run(path_notion . " " . "notion://www.notion.so/" . pageID)
            WinWait(ahkexe_notion)
            WinActivate(ahkexe_notion)
        }
    }
}

vscodeinFolder(foldertitle, vscodepath, folder) {
    command := foldertitle " " ahkexe_vscode
    if WinExist(command) {
        if WinActive(command) {
            WinMinimize(command)
        } else {
            WinActivate(command)
        }
    } else {
        Run('"' vscodepath '"' " " ' "' folder '"')
        WinWait(command)
        WinActivate(command)
    }
}

vscodeinCurrentFolder(path_vscode) {
    DetectHiddenWindows True
    if !WinExist("ahk_class CabinetWClass") {
        MsgBox "Explorer isn't active", "Warning"
        Return
    }
    A_Clipboard := ""
    ErrorLevel := 0

    Send "!d"
    Sleep 100
    Send "^c"

    if !ClipWait(1) {
        MsgBox "Clipboard did not contain text. Invalid path", "Warning", 64
        Return
    }
    explorer_path := A_Clipboard
    ; Run Visual Studio Code with the current working directory as parameter
    Run('"' path_vscode '"' " " ' "' explorer_path '"')
    if (ErrorLevel) {
        MsgBox "Failed to launch Visual Studio Code. ErrorLevel: " . ErrorLevel
    }
}

terminateActiveWindow()
{
    active_class := WinGetClass("A")
    ; Check if the active window is the desktop or Start menu
    if (active_class = "Progman" || active_class = "WorkerW" || active_class = "DV2ControlHost" || active_class = "RainmeterMeterWindow") {
        MsgBox("The active window is the desktop or Start menu. Exiting script.", "Warning", 64)
        return
    }
    active_id := WinGetID("A")
    result := WinClose("ahk_id " active_id)
    if (result == 0)
        MsgBox("Failed to close the active window.", "Warning", 48)
}

killActiveProgram() {
    PID := WinGetPID("A")
    active_class := WinGetClass("A")
    excluded_classes := "^(Progman|WorkerW|DV2ControlHost|CabinetWClass|Shell_TrayWnd|RainmeterMeterWindow)$"
    if (RegExMatch(active_class, excluded_classes)) {
        MsgBox("The active window can not be closed. Exiting script.", "Warning", 64)
        return
    }
    ProcessClose(PID)
}

switchPowerplan(powerplanGUID, sound, description) {
    RunWait("powercfg /s " powerplanGUID, , "Hide")
    SoundPlay(sound)
    TrayTip(description, "Power plan changed", 17)
    Sleep 3000
    TrayTip()
}

swtichPlaybackdevice(devicename) {
    command := "nircmd.exe setdefaultsounddevice `"" devicename . "`" 1"
    RunWait(command, , "Hide")
    TrayTip("Playback Device Changed", "Switched to: " devicename, 17)
    Sleep 3000
    TrayTip()
}