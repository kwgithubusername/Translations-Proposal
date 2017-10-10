devFile=$1
featureName=$2

IFS=$'
'

nl='
'

cd $featureName/;
baseStrings=( $(grep "." base) );

target="$(cat $devFile)";
devFileName=${devFile##*/};
extension="${devFileName##*.}"
echo "Writing to file type"
echo $extension
for f in Translations/*; do
  fileName=${f##*/};
  translatedStrings=( $(grep "." Translations/$fileName) );
  for i in "${!translatedStrings[@]}"; do
    target=$(echo "$target" | sed s/${baseStrings[$i]}/${translatedStrings[$i]}/g);
  done
  echo "$target" > result.$extension;
done
