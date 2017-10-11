featureName=$1
devFile=$2
directory=$3

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
    if [ "$extension" == "xml" ]; then
      baseString=$(sed -e 's/^"//' -e 's/"$//' <<<${baseStrings[$i]})
      translatedString=$(sed -e 's/^"//' -e 's/"$//' <<<${translatedStrings[$i]})
      target=$(echo "$target" | sed "s/\(<string name=.*\)\>$baseString/\1>$translatedString/g");
    else
      baseString=${baseStrings[$i]}
      translatedString=${translatedStrings[$i]}
      target=$(echo "$target" | sed s/$baseString/$translatedString/g);
    fi
  done
  echo "Writing result to"
  echo $fileName.$extension;
  echo "$target" > $directory/$fileName.$extension;
done

