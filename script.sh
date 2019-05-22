mkdir output-data
sed "4 d" data1.csv > output-data/data1.csv
sed "1 d" data2.csv > output-data/data2.csv
cp data3.csv ./output-data/data3.csv
for file in output-data/data*.csv
do
    awk -v x=$file '{print x ";" FNR ";" $0}' $file | sed 's#output-data/data#data#g' | sed 's#[[:space:]]#|#g' | sed 's/|\+/-/g' | sed 's/,/-/g' | awk -F- '{for(i=2;i<=NF;i++){printf("%s,%s\n", $1, $i)}}' | sed 's/;/,/g'
done
rm -rf output-data