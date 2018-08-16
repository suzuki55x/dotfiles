# thefuck設定
# eval $(thefuck --alias)
# windowsのgit bashではこちら。minttyの問題らしい
#eval $(winpty thefuck --alias)

# エディタ設定
export EDITOR=vim

# windowsファイル用エイリアス
alias vimdos='vi -c"e ++enc=cp932" -c"set ff=dos"'

# 日ごとメモ(profile側で有効にしておく)
# alias dia='vi ~/doc/diary/$(date "+%Y/%m/%d.md")'

# 追加用シェルスクリプトにパスを通す
export PATH=$PATH:~/dotfiles/bin/
# phpunitのエイリアス設定
alias phpunit='phpunit.sh --colors=auto'
