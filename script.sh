a=[]
i=0
mkdir output-data
sed "4 d" data1.csv > output-data/data1.csv
sed "1 d" data2.csv > output-data/data2.csv
cp data3.csv ./output-data/data3.csv
echo "" >> ./output-data/data3.csv
for file in output-data/data*.csv
do
    x=1
    while read line; 
    do
        for section in $line 
        do
            a[$i]=$section
            i=$((i+1))
        done
        echo ${a[1]} > output-data/aux.csv
        for res in $(sed 's/,/ /g' output-data/aux.csv) 
        do  
            echo ${file##*/},$x,${a[0]},$res
        done
        x=$((x+1))
        i=0
    done < $file
done

rm -rf output-data