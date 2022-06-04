## dock显示效果
* dock and menu bar: scale effect

## 安装homebrew (今后可用brew install安装各种包)
* /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


## 终端配置

1. term(默认)
	- 设置字体SF Mono Regular 16
	- 设置窗口 150 60

2. iterm2 
	- 安装 https://iterm2.com/index.html

3. oh-my-zsh (shell)
	- 安装 sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	- 安装插件
		* git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
		* git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
		* 使之生效  source ~/.zshrc


	- 颜色设置
		* color preset solarized dark
		* 补全命令的字体不太清晰, 与背景颜色太过相近, 调整字体颜色: Preferences -> Profiles -> Colors 中有Foreground是标准字体颜色，ANSI Colors中Bright的第一个是补全的字体颜色

## Skim配置
* set the initial pdf view setting
> PDF menu => use current PDF view setting as default

* 逆向搜索pdf -> tex 快捷键command + shift + 单击: skim preference里面的sync设置逆向搜索

## LaTeX环境配置
* 下载并安装MacTex.pkg
* 下载并安装Sublime Text (安装后将sublime拖进Applications)

1. 增加命令行启动支持(可用subl命令直接打开编辑文本)
```
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
echo 'export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"' >> ~/.zprofile
echo 'export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"' >> ~/.bash_profile
```

2. 在Tools标签下面安装package control

3. 安装theme
    
4. Preference下的基本设置(在user的配置文件中添加)
	"font_size": 18,
    "open_files_in_new_window": false,
    "show_tabs": true

5. 使用package control安装latextools, 并配置latex plugin
	viewer setting
	"viewer": "skim",

	builder setting
	"program" : "xelatex",
	"command" : ["latexmk", "-cd", "-e", "$pdflatex = 'xelatex -intersection=nonstopmode -synctex=1 %S %O'", 
                 "-f", "=pdf"], 

## 编程环境配置
* 安装cmake 
> brew install cmake


## 显示隐藏文件
```
defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder
```

### 搜索文件命令
```
find ~/Library/ -iname "com.apple.syncedpreferences.plist"
```



