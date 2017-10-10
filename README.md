# Translations-Proposal

## Process
1. New strings are added in the format:
```
    "This is a new string"

    "This is another new string"
    
    "This is a string with a general placeholder: %placeholder%"
```
2a. Dev adds strings in base language (e.g. English) to project, replacing placeholders as appropriate.

2b. New strings are sent to translation service, ignoring all instances of %placeholder%:
```
    "Translated String 1"
    
    "Translated String 2 with %placeholder%"
```    
3. Run appropriate script with dev-generated file containing all strings in step 1:
```
    sh scripts/build.sh featureName devFile targetDirectory
``` 

## Example
```
sh scripts/build.sh NewFeature ../exampleDevFile.json ../
```

## TODO:
1. Ignore %placeholder% during find and replace
2. Save each language output as copy of original file type
