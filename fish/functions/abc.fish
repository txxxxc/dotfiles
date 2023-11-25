function abc -d "mkdir and cd"
  # 引数を受け取って、その先頭にABC_をつけてディレクトリを作成する
  mkdir ABC_$argv[1]
  cd ABC_$argv[1]
  mkdir a b c
end

