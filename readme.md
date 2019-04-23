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
## merge 操作の hook
./git/hooks/post-merge の作成
```sh
echo -e "sh ./extensions_install.sh\nsh ./extensions_list.sh\ngit status" > .git/hooks/post-merge
```
