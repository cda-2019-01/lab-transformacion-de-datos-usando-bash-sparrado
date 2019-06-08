# Escriba su código aquí
for file in *.csv;do sed '/^.$/d' $file > "$(basename "$file" .csv).1.csv"; done 
for file in *.1.csv; do awk '{print NR "," $s}' $file > "$(basename "$file" .csv).2.csv"; done
for file in *.2.csv;do sed "s/^/"${file}\,"/" $file > "$(basename "$file" .csv).3.csv";done
for file in *.3.csv;do sed 's/[[:space:]]//g' $file > "$(basename "$file" .csv).4.csv";done
for file in *.4.csv;do sed 's/\([A-Z]\)/\1,/g' $file > "$(basename "$file" .csv).5.csv";done
awk -F',' '{ for(i=4;i<=NF;i++) print $1,$2,$3,$i}' OFS=',' *.5.csv > data_final.csv
sed -e 's/.1.2//g' data_final.csv > solucion.csv
rm {*.1.csv,*.2.csv,*.3.csv,*.4.csv,*.5.csv,data_final.csv}
cat solucion.csv