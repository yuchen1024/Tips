MAC OS技巧


软件安装与配置

1. Chrome
2. Backup
3. Google helper Lantern
4. Sogou input
5. MacTeX
6. Sublime
7. Office
8. Wechat and QQ 

iTerm2 + Oh My Zsh

## https://www.jianshu.com/p/9c3439cc3bdb



Sublime Text 3
## 安装

## 命令行启动
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

## 破解
1. 屏蔽hosts
subl /etc/hosts

127.0.0.1 license.sublimehq.com
127.0.0.1 www.sublimetext.com
50.116.34.243 sublime.wbond.net
50.116.34.243 packagecontrol.io

2. subl /Applications/Sublime Text.app/Contents/MacOS/Sublime Text
搜索16进制 97 94 0D 00  改为  00 00 00 00

----- BEGIN LICENSE -----
TwitterInc
200 User License
EA7E-890007
1D77F72E 390CDD93 4DCBA022 FAF60790
61AA12C0 A37081C5 D0316412 4584D136
94D7F7D4 95BC8C1C 527DA828 560BB037
D1EDDD8C AE7B379F 50C9D69D B35179EF
2FE898C4 8E4277A8 555CE714 E1FB0E43
D5D52613 C3D12E98 BC49967F 7652EED2
9D2D2E61 67610860 6D338B72 5CF95C69
E36B85CC 84991F19 7575D828 470A92AB
------ END LICENSE ------

## package control

## 安装latex plugin

## 安装theme


Skim配置技巧
# set the initial pdf view setting
PDF menu => use current PDF view setting as default


LaTeX技巧
## 中文字体名称问题
打开Font.book 找到字体, 点击i符号, 查看postscripts字体名称
