function fgh -d 'cd to directory under projects using fzf'
  set REPO_NAME "$(ghq list | fzf-tmux --reverse +m)"; or begin
  	return 1
	end

	if test -d "$(ghq root)/$REPO_NAME"
		echo "found"
		cd "$(ghq root)/$REPO_NAME"
	else 
		echo "not found"
	end
end
