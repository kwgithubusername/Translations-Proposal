# Translations-Proposal

Process:
1. New strings are added in the format:

    "This is a new string"

    "This is another new string"
    
    "This is a string with a general placeholder: %placeholder%"

2. New strings are sent to translation service, ignoring all instances of %placeholder%:

    "Translated String 1"
    
    "Translated String 2 with %placeholder%"
    
3. Run appropriate script with file containing all translations in base language (e.g. English):

    sh scripts/build.sh file-containing-all-english-translations
    
4. Manually replace instances of %placeholder% with platform-appropriate specifier.

5. Commit new files.
 
