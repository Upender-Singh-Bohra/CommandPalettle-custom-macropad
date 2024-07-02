#Requires AutoHotkey v2.0+

GetCurrentFolderPath() {
    path := ""
    activeWindow := WinGetTitle("A")
    if InStr(activeWindow, " - File Explorer") {
        SplitPath activeWindow, , &path
    } else {
        path := A_Desktop
    }
    return path
}

RunGitBash(path) {
    gitBashPath := "C:\Program Files\Git\git-bash.exe"
    Run(gitBashPath " " "--cd=" . path)
}

alt & `:: {
    currentPath := GetCurrentFolderPath()
    RunGitBash(currentPath)
}
