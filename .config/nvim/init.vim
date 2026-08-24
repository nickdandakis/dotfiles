" bozo, restart TERMINAL to get this working
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua require("oils")
lua require("custom")
