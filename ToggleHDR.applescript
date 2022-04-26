#!/usr/bin/osascript

tell application "System Preferences"
	activate
	delay 0.5
	set the current pane to pane id "com.apple.preference.displays"
	delay 1
	
	tell application "System Events" to tell window "Displays" of application process "System Preferences"
		
		set target_button to a reference to (first button whose name is "Display Settings…")
		if target_button exists then
			click target_button
			delay 0.5
			tell application "System Events" to tell sheet 1 of window "Displays" of application process "System Preferences"
				click checkbox "High Dynamic Range, Automatically adjust the display to show high dynamic range content."
			end tell
			delay 1
			tell application "System Events" to tell sheet 1 of window "Displays" of application process "System Preferences"
				click button "Done"
			end tell
		else
			tell application "System Events" to tell group 1 of window "Displays" of application process "System Preferences"
				click checkbox "High Dynamic Range, Automatically adjust the display to show high dynamic range content."
			end tell
		end if
	end tell
end tell

delay 1

tell application "System Preferences"
	quit
end tell