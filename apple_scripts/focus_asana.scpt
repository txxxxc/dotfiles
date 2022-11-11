tell application "Asana" to run 
	tell application "System Events" 
	if visible of application process "Asana" is true then 
		set visible of application process "Asana" to false 
	else 
		set visible of application process "Asana" to true 
	end if 
end tell
