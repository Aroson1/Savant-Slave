-- Capture a genuine Terminal screenshot on macOS.
-- Args: <rows> <projectDir> <promptLabel> <command>
-- Opens a new Terminal window, sets the prompt to include promptLabel (name and roll),
-- runs the command, waits for it to finish, and returns the window bounds as
-- "left,top,right,bottom" so the caller can run: screencapture -R"l,t,w,h" out.png
on run argv
    set nRows to (item 1 of argv) as integer
    set projDir to item 2 of argv
    set promptLabel to item 3 of argv
    set theCmd to item 4 of argv
    set ps1cmd to "export PS1='[" & promptLabel & "] > '"
    tell application "Terminal"
        activate
        set t to do script ("cd " & quoted form of projDir & "; " & ps1cmd & "; clear")
        delay 0.6
        set number of columns of front window to 150
        set number of rows of front window to nRows
        delay 0.5
        do script theCmd in t
        repeat
            delay 0.3
            if not (busy of t) then exit repeat
        end repeat
        delay 0.8
        set b to bounds of front window
    end tell
    return ((item 1 of b) as text) & "," & ((item 2 of b) as text) & "," & ((item 3 of b) as text) & "," & ((item 4 of b) as text)
end run
