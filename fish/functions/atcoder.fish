function atcoder -d "initialize files for a atcoder problem"
  # if there has already been a stdin.txt, delete it and make a new file
	mkdir $argv[1] && touch $argv[1]/stdin.txt && cd $argv[1]
  svim ./index.cpp -o ./stdin.txt -c "11 wincmd +" 
end

