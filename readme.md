# 使い方  
## 設定ファイルをgit管理下のファイルに紐付ける
```sh
> cd {UserHome}\AppData\Roaming\Code
> mklink /D User {GitCloneDir}\User
```  
## Extensionsのインストール  
```sh
sh extensions_install.sh
```  
## インストール済みExtensionsリストの更新  
```sh
sh extensions_list.sh
git add extensions_list.txt
git commit -m 'hoge'
git push origin master
```  
## extensions のカスタマイズ
### zenkaku
全角スペースの強調表示を、vscode起動時に強制的に有効化する。  
ユーザ名、バージョンについては適宜読み替えること。  
```sh
vi /c/Users/username/.vscode/extensions/mosapride.zenkaku-0.0.3/extension.js

var enabled = true;
```
### Graphviz のインストール
markdwon で UML を扱うために必要。  
公式のダウンロードリンクが死んでいる場合は、[こちら](http://ruby.kyoto-wu.ac.jp/info-com/Softwares/Graphviz/)から DL する。  
### Git 関連
vscode の設定ファイルに git.exe の保存先を記述する必要がある。  
`c:\git\git.exe`
としているので、そこにシンボリックリンクで git.exe を設置する。  
基本的に msys2 上でインストールした git を使う。  
## シンボリックリンク作成コマンド
git 本体だけでは色々設定ファイルが不足してしまう。  
最終的には以下を用意すれば良い。  
```sh
ln -s /usr/bin/git.exe /c/git/git.exe
ln -s /usr/bin/msys-iconv-2.dll /c/git/msys-iconv-2.dll
ln -s /usr/bin/msys-intl-8.dll /c/git/msys-intl-8.dll
ln -s /usr/bin/msys-2.0.dll /c/git/msys-2.0.dll
ln -s /usr/bin/msys-pcre2-8-0.dll /c/git/msys-pcre2-8-0.dl
ln -s /usr/bin/msys-pcre2-8-0.dll /c/git/msys-pcre2-8-0.dll
ln -s /usr/bin/msys-z.dll /c/git/msys-z.dll
```
その後コマンドラインから以下が実行できれば良い。  
```sh
cd C:\git
git.exe --version
```
## merge 操作の hook
./git/hooks/post-merge の作成
```sh
echo -e '#!/bin/sh\nsh ./extensions_install.sh\nsh ./extensions_list.sh\ngit status' > .git/hooks/post-merge
```
