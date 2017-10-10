devFile=$1
featureName=$2

IFS=$'
'

nl='
'

cd $featureName/;
baseStrings=( $(grep "." base) );

devFileName=${devFile##*/};
extension="${devFileName##*.}"

for f in Translations/*; do
  target="$(cat $devFile)";  
  fileName=${f##*/};
  translatedStrings=( $(grep "." Translations/$fileName) );
  for i in "${!translatedStrings[@]}"; do
    target=$(echo "$target" | sed s/${baseStrings[$i]}/${translatedStrings[$i]}/g);
  done
  echo "Writing result to"
  echo $fileName.$extension;
  echo "$target" > $fileName.$extension;
done

