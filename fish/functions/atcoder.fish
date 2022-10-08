function atcoder -d "initialize files for a atcoder problem"
  # if there has already been a stdin.txt, delete it and make a new file
	mkdir $1 && touch $_/stdin.txt && cd $1
  nvim ./index.cpp -o ./stdin.txt -c "11 wincmd +" 
end

