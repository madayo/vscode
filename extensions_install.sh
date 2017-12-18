#! /bin/sh -e
for ext in `cat extensions_list.txt`; do
  array=( `echo "$ext" | sed -E 's/^(.*)\.(.*)@(.*)$/\1 \2 \3/g'` )
  echo "http://${array[0]}.gallery.vsassets.io/_apis/public/gallery/publisher/${array[0]}/extension/${array[1]}/${array[2]}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
done
