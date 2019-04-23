#! /bin/sh -e
for ext in `cat extensions_list.txt`; do
  printf "\e[36;40;1m${ext}\e[m\n"
  array=( `echo "$ext" | sed -E 's/^(.*)\.(.*)@(.*)$/\1 \2 \3/g'` )
  curl -O "https://${array[0]}.gallery.vsassets.io/_apis/public/gallery/publisher/${array[0]}/extension/${array[1]}/${array[2]}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage" -Ss
  mv Microsoft.VisualStudio.Services.VSIXPackage Microsoft.VisualStudio.Services.VSIXPackage.vsix
  code --install-extension Microsoft.VisualStudio.Services.VSIXPackage.vsix
done
rm Microsoft.VisualStudio.Services.VSIXPackage.vsix
