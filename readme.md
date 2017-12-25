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
