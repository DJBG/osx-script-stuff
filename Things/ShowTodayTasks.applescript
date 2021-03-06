(*
	Displays a dialog with a list of all tasks in the today list
*)

set grwlTitle to "0 Tasks for today"
set taskList to "No tasks left for today"

tell application "Things"
	set todayCount to (count to do of list "Today")
	set todayTasks to to dos of list "Today"
	
	if todayCount is greater than 0 then
		set grwlTitle to (todayCount & " tasks for today") as text
		set taskList to ""
		repeat with taskItem in todayTasks
			set taskName to name of taskItem
			if taskList is "No tasks left for today" then
				set taskList to "- " & taskName
			else
				set taskList to taskList & return & "- " & taskName
			end if
		end repeat
	end if
end tell

display dialog grwlTitle & return & taskList with title "ShowTodayTasks"
