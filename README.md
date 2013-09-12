集合了插件 CVIM nerdtree pydiction  vim-powerline snipMate  omnicppcomplete
还要安装的软件:exuberant-ctags(即ctags) , taglist , astyle cscope

安装方法:

1) git clone git@github.com:bocai/vim.git 
 cd vim
把当前目录下的 vimrc 拷贝到用户家目录下，并改为隐藏文文件
cp vimrc ~/.vimrc

2) 把整个目录转移到家目录下，并改名为隐藏目录
mv vim ~./.vim

3) 修改(cvim)自动生成代码的模板
vim ~/.vim/c-support/templates/Templates
把相应的USER MACROS 改为自己的信息即可。

--------------------------------------------------
另外需要c++ STL 补全的请把stltags 拷贝到 /usr/include/c++/
更详细的使用参阅vimrc
