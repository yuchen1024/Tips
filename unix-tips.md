## Unix通用规则

### 路径表示
* ./ 表示当前目录, 可以省略不写
* /表示根目录


### 软件编译常规步骤 (build from source)

1. ./configure
2. make 
3. make install

### 代码编译常规步骤

1. cmake ..
2. make


## Ubuntu常用命令

```
sudo apt-get install 软件名 安装软件命令
sudo nautilus 打开文件（有root权限）
su root 切换到“root” 

ls 列出当前目录文件（不包括隐含文件）
ls -a 列出当前目录文件（包括隐含文件）
ls -l 列出当前目录下文件的详细信息

cd .. 回当前目录的上一级目录
cd - 回上一次所在的目录
cd ~ 或 cd 回当前用户的宿主目录
mkdir 目录名 创建一个目录
rmdir 空目录名 删除一个空目录
rm 文件名 文件名 删除一个文件或多个文件
rm -rf 非空目录名 删除一个非空目录下的一切

mv 路径/文件 /路径/文件 移动相对路径下的文件到绝对路径下
mv 文件名 新名称 在当前目录下改名

find 路经 -name “字符串” 查找路经所在范围内满足字符串匹配的文件和目录

Useradd 创建一个新的用户
Groupadd 组名 创建一个新的组
Passwd 用户名 为用户创建密码
Passwd -d用户名 删除用户密码也能登陆
Passwd -S用户名 查询账号密码
Usermod -l 新用户名 老用户名 为用户改名
Userdel–r 用户名 删除用户一切

tar -c 创建包 –x 释放包 -v 显示命令过程 –z 代表压缩包
tar –cvf benet.tar /home/benet 把/home/benet目录打包
tar –zcvf benet.tar.gz /mnt 把目录打包并压缩
tar –zxvf benet.tar.gz 压缩包的文件解压恢复
tar –jxvf benet.tar.bz2 解压缩

uname -a 查看内核版本
cat /etc/issue 查看ubuntu版本
lsusb 查看usb设备
sudo ethtool eth0 查看网卡状态
cat /proc/cpuinfo 查看cpu信息
lshw 查看当前硬件信息
sudo fdisk -l 查看磁盘信息
df -h 查看硬盘剩余空间
free -m 查看当前的内存使用情况
ps -A 查看当前有哪些进程
kill 进程号(就是ps -A中的第一列的数字)或者 killall 进程名( 杀死一个进程)
kill -9 进程号 强制杀死一个进程
```
 
### 常用apt命令
```
apt-cache search package 搜索包
apt-cache show package 获取包的相关信息，如说明、大小、版本等
sudo apt-get install package 安装包
sudo apt-get install package - - reinstall 重新安装包
sudo apt-get -f install 修复安装”-f = –fix-missing”
sudo apt-get remove package 删除包
sudo apt-get remove package - - purge 删除包，包括删除配置文件等
sudo apt-get update 更新源
sudo apt-get upgrade 更新已安装的包
sudo apt-get dist-upgrade 升级系统
sudo apt-get dselect-upgrade 使用 dselect 升级
apt-cache depends package 了解使用依赖
apt-cache rdepends package 是查看该包被哪些包依赖
sudo apt-get build-dep package 安装相关的编译环境
apt-get source package 下载该包的源代码
sudo apt-get clean && sudo apt-get autoclean 清理无用的包
sudo apt-get check 检查是否有损坏的依赖

 
清理所有软件缓存（即缓存在/var/cache/apt/archives目录里的deb包 ）
sudo apt-get clean

 
删除系统不再使用的孤立软件
sudo apt-get autoremove
dpkg --list|awk '{ print $2 }'|grep "你要找的包名"


修改软件源
sudo gedit /etc/apt/sources.list

安装文件管理器
sudo apt-get install nautilus-open-terminal
sudo apt-get install nautilus-gksu

安装字体
sudo apt-get install msttcorefonts

安装编程环境

sudo apt-get install build-essential

安装gedit的latex插件
sudo apt-get install gedit-latex-plugin

如果不能启动插件, 删除/home/.local/gedit/下两个文件

安装gedit的默认插件

sudo apt-get install gedit-plugins

安装语言包
sudo apt-get install language-pack-zh


拼写检查语言支持
sudo apt-get install aspell-en


安装压缩和解压缩软件

sudo apt-get install unrar
sudo apt-get install rar
sudo apt-get install p7zip-full
```

* 修改启动菜单
```
sudo gedit /boot/grub/menu.lst
```

* Ubuntu:evince打开中文PDF乱码的解决

1. 安装poppler-data
sudo apt-get install poppler-data  

2. 修改系统配置文件(/etc/fonts/conf.avail/49-sansserif.conf）

<edit name="family" mode="append_last">  
    <string>sans-serif</string>  
</edit>  
修改为：  
<edit name="family" mode="append_last">  
         <string>SimSun</string>                                           
</edit>  


彻底删除 libreoffice*
sudo apt-get -y purge libreoffice*

### 安装texlive

* 如果以前安装过, 清除

1. sudo rm -rf /usr/local/texlive/2012
2. rm -rf ~/.texlive2012
3. 下载Texlive 2012 镜像
4. 安装perl-tk包，以便使用图形界面进行安装.
5. sudo apt-get install perl-tk

* 解压下载到的压缩文件并挂载iso镜像(为了方便，这里把镜像重命名为texlive2012.iso)

```
sudo mount -o loop ~/Downloads/texlive2012.iso /mnt
cd /mnt
sudo ./install-tl -gui
```

* 之后出现图形界面。之后的操作就比较简单了，可以去掉不用的语言包以节省磁盘空间，注意 选择最后一项“Create symlinks in system directories“，
让安装程序自动创建语法链接。确定安装，等待……

* 创建符号链接到系统目录

binaries to /usr/local/bin
manpages to /usr/local/man
info to /usr/local/info

3. 配置环境变量。

sudo gedit /etc/bash.bashrc 　　　　
添加以下代码：
PATH=/usr/local/texlive/2012/bin/i386‐linux:$PATH; export PATH
MANPATH=/usr/local/texlive/2012/texmf/doc/man:$MANPATH; export MANPATH
INFOPATH=/usr/local/texlive/2012/texmf/doc/info:$INFOPATH; export INFOPATH

接下来:
sudo  gedit /etc/manpath.config
在# set up PATH to MANPATH mapping下输入
MANPATH_MAP /usr/local/texlive/2012/bin/i386-linux /usr/local/texlive/2012/texmf/doc/man
          

最后：
sudo gedit /etc/environment
加入
/usr/local/texlive/2012/bin/i386-linux

至此安装过程结束

4. 配置中文环境

* 字体配置
```
sudo apt-get install msttcorefonts
```
1. 到win的字体文件夹里面的拷贝.otf以及.ttf的字体到/usr/share/fonts/truetype下新建的文件夹"win"下. 

```
cd /usr/share/fonts/truetype
sudo cp -rf ~/Downloads/winfonts .
```

罗嗦一句，当你安装来adobe阅读器后，adobe的四个字体也会出现.

2. 增加权限 
```
sudo chmod -R 777 /usr/share/fonts/truetype/winfonts
```

3. 刷新字体缓存
```
sudo mkfontscale
sudo mkfontdir
sudo fc-cache -fv
```

4. 修改"ctex-xecjk-winfonts.def"
```
sudo gedit /usr/local/texlive/2012/texmf-dist/tex/latex/ctex/fontset/ctex-xecjk-winfonts.def
```

* 另开一终端，输入fc-list :lang=zh
参照列出来的中文字体，修改ctex-xecjk-winfonts.def:

* 测试
```
\documentclass{ctexart}
\begin{document}
	你好，TeX Live 2012~
\end{document}
```


## 安装Magma
```
0. su
1. cd /
2. tar xjvf magma.tar.bz2
3. gedit /etc/modules
    add one line: dummy
4. gedit /etc/network/interfaces
    auto dummy0
    iface dummy0 inet loopback
    pre-up ifconfig dummy0 hw ether 00:1a:a0:96:e7:16
```



### 修改hosts
sudo cp ~/Downloads/hosts /etc
sudo killall -HUP mDNSResponder

sublime text 3 latexplugin 配置文件修改
/Users/chenyu/Library/Application\ Support/Sublime\ Text\ 3/Packages/LaTeXTools/LaTeX.sublime-build 


## C++ 计时函数
```
auto start_time = chrono::steady_clock::now(); 

auto end_time = chrono::steady_clock::now(); 

auto running_time = end_time - start_time;
    cout << "average key generation takes time = " 
    << chrono::duration <double, milli> (running_time).count()/TEST_NUM << " ms" << endl;
```

## GitHub使用技巧

### 创建与提交的过程
```
1. git init
2. git add .
3. git commit -m "XXX"
4. git remote add origin git@github.com:yuchen1024/projectname.git
5. git push -u origin master -f

* 创建新分支
git branch new-branch
* 切换到新分支
git checkout new-branch

* 创建并切换
git checkout -b new-branch


* 创建local和remote的分支关联
git branch --set-upstream-to=origin/new-branch branch

* 推送
git push origin new-branch
```

### git瘦身

* 查找占用空间最多的五个文件
```
git rev-list --objects --all | grep "$(git verify-pack -v .git/objects/pack/*.idx | sort -k 3 -n | tail -5 | awk '{print$1}')"
```

* 从git历史中移除
```
git filter-branch --force --index-filter 'git rm -rf --cached --ignore-unmatch PGC_openssl/twisted_elgamal/point2index.table' --prune-empty --tag-name-filter cat -- --all
```

* 真正删除
```
rm -rf .git/refs/original/
git reflog expire --expire=now --all
git gc --prune=now
git gc --aggressive --prune=now
git push origin master --force
```

* 让远程仓库变小
```
git remote prune origin
```

## dokcer教程

### 如何创建image文件

* 方法1
1. 编写文本文件Dockerfile (注意在执行安装命令时要注意在命令末尾处加上-y模仿交互, 否则不成功)
2. docker image build -t [imageName] . (.表示Dockerfile在当前路径)
example: imageName=ubuntu:crypto (该镜像是基于ubuntu面向crypto开发的)

* 方法2是将container承诺为镜像, 该方法容易成功
docker commit [containerID] [imageName]

### 列出本机的所有image文件。
```
$ docker image ls
```

### 删除 image 文件
```
$ docker image rm -f [imageName]
```

### 从镜像创建容器
```
$ docker container run [imageName] 
```

### 挂载本地目录
```
$ docker container exec -it -v /localdir:/dockerdir [imageName] /bin/bash
```

### 在docker容器建好后, 使用如下命令获得系统中可以用的容器
```
$ docker container ls -all
```

### 启动容器 
```
$ docker container start [containerID]
```

### 进入容器的执行环境
```
$ docker container exec -it [containerID] /bin/bash
```

执行完成后, 输入exit退出bash

### 结束容器运行
```
$ docker container stop [containerID]
```

### 删除容器
```
docker container rm -f [containerID]
```

## you-get




## Install OpenSSL from source Mac OS X

* prepare workspace
```
mkdir -p ~/code/build-from-src/ && cd $_
```

* download source code
```
curl -LO https://www.openssl.org/source/openssl-1.1.1d.tar.gz
```

* expand tar
```
tar -xzvf openssl-1.1.1d.tar.gz
cd openssl-1.1.1d
```

* configure, make, install
```
perl ./Configure --prefix=/usr/local --openssldir=/usr/local/openssl no-ssl3 no-ssl3-method no-zlib darwin64-x86_64-cc enable-ec_nistp_64_gcc_128
make
make test
sudo make install MANDIR=/usr/share/man MANSUFFIX=ssl
```

* verify
```
openssl version
which -a openssl
```

* clean up
```
make clean
make distclean
cd ..
rm -fr openssl-1.1.1d
rm openssl-1.1.1d.tar.gz
```




### LaTeX技巧
* 中文字体名称问题
打开Font.book 找到字体, 点击i符号, 查看postscripts字体名称











