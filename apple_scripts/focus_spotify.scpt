tell application "Spotify" to run 
	tell application "System Events" 
	if visible of application process "Spotify" is true then 
		set visible of application process "Spotify" to false 
	else 
		set visible of application process "Spotify" to true 
		set frontmost to true
	end if 
end tell

