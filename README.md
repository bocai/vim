《5分钟把你vim打造成一个集成开发环境》

这里已集合了插件 CVIM、 taglist、 nerdtree、 pydiction、  vim-powerline、 snipMate、  omnicppcomplete...
这些插件的功能找度娘或者谷哥，我就不多说了。。

还需在终端下安装的软件:exuberant-ctags(即ctags) , astyle, cscope

安装方法:

1) git clone git@github.com:bocai/vim.git 

或者 git clone https://github.com/bocai/vim

然后

cd vim

把当前目录下的 vimrc 拷贝到用户家目录下，并改为隐藏文文件

cp vimrc ~/.vimrc

2) 把整个目录转移到家目录下，并改名为隐藏目录

cd ..

mv vim ~/.vim

3) 修改(cvim)自动生成代码的模板

vim ~/.vim/c-support/templates/Templates

把相应的USER MACROS 改为自己的信息即可。

4) table键补全需要生成tags(其他的工程要生成tags方法类似): 

cd /usr/include 

sudo ctags -R --c++-kinds=+p --fields=+iaS --extra=+q  .

另外如果需要c++ STL 补全的请把stltags 拷贝到 /usr/include/c++/



好了，现在可以测试一把了

新建一个源文件,输入date然后按table键，输入for然后按table键......是不是高端霸气上档次呢。。更详细的用法(快捷键等)参阅vimrc，也可自行定制。
