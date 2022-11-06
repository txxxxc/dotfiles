tell application "Notion" to run 
	tell application "System Events" 
	if visible of application process "Notion" is true then 
		set visible of application process "Notion" to false 
	else 
		set visible of application process "Notion" to true 
	end if 
end tell
