function atcoder () {
  # if there has already been a stdin.txt, delete it and make a new file
	mkdir $1 && touch $_/stdin.txt
  nvim $1/index.cpp -o $1/stdin.txt -c "11 wincmd +" 
}
