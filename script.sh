# Escriba su código aquí

# for file in data*.csv
# do
#     while read line; 
#     do
#         for section in $line
#         do
#             for character in $section
#             do  
#                 echo $file,$character
#             done
#         done
#     done < $file
# done

x=1
a=[]
i=0
mkdir output-data
sed "4 d" input-data/data1.csv > output-data/data1.csv
sed "1 d" input-data/data2.csv > output-data/data2.csv
cp input-data/data3.csv ./output-data/data3.csv
for file in output-data/data*.csv
do
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
            echo $file,$x,${a[0]},$res
        done
        x=$((x+1))
        x=1
        i=0
    done < $file
done