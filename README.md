# Bash-scripts
 Set of bash scripts for different use cases

# rename2directory.sh
  A script to name files according to their parent folder name. 

# sort-move2parent-directory.sh
  Scan a directory and sort + move + filter by name.
  Filters:    
    - dir name until first period
    - Checks if a date format is in the dir name: YY.MM.DD
    - Checks if there are no spaces in the dir name
    - Checks for some keywords specified
  Create a new directory, if not already existing, with the dir name until the period and move the directory in that directory.