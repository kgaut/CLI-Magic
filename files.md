# Ajouter un suffix
```
for file in *; do mv "$file" "$(basename "$file")yourSuffix"; done;
```
Exmpale to add an underscore "_" at the end each text file:
```
for file in *.txt; do mv "$file" "$(basename "$file")_"; done;
```
# Ajouter un prefix
```
for file in *.txt; do mv "$file" "yourPrefix$file"; done;
```
Exmpale to add an underscore "_" in front of text each file name:
```
for file in *.txt; do mv "$file" "_$file"; done;
```
