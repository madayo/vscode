#! /bin/sh -e
installed_list=$(curl -s uuid.jp)
code --list-extensions | sort > $installed_list
# 削除されたもの
for ext in $(comm -23 $installed_list ./extensions_list.txt); do
  printf "\e[36;40;1m${ext} will be uninstalled. \e[m\n"
  echo "Do you want to continue [Y/n]?"
  read -p "$PROMPT" yn
  case $yn in
    'Y' )
      code --uninstall-extension $ext
    ;;
    '*' ) break ;;
  esac
done
# 追加されたもの
for ext in $(comm -13 $installed_list ./extensions_list.txt); do
  printf "\e[36;40;1mInstalling ${ext} ...\e[m\n"
  code --install-extension $ext
done
rm $installed_list
