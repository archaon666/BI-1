#!/bin/bash

#splits the input file into seperate files for every class
#uses weka filter on every split to calculate the mean per class
#finally merges split files back together

#save header
cat $1 | grep "@" > $1.header

cat $1.header > $1.split1.arff
grep -e "1$" $1 >> $1.split1.arff

cat $1.header > $1.split2.arff
grep -e "2$" $1 >> $1.split2.arff

cat $1.header > $1.split3.arff
grep -e "3$" $1 >> $1.split3.arff

cat $1.header > $1.split4.arff
grep -e "4$" $1 >> $1.split4.arff

cat $1.header > $1.split5.arff
grep -e "5$" $1 >> $1.split5.arff

cat $1.header > $1.split6.arff
grep -e "6$" $1 >> $1.split6.arff

cat $1.header > $1.split7.arff
grep -e "7$" $1 >> $1.split7.arff

#apply filter
java -cp weka.jar weka.filters.unsupervised.attribute.ReplaceMissingValues -i $1.split1.arff -o $1.split1.mean.arff -unset-class-temporarily
java -cp weka.jar weka.filters.unsupervised.attribute.ReplaceMissingValues -i $1.split2.arff -o $1.split2.mean.arff -unset-class-temporarily
java -cp weka.jar weka.filters.unsupervised.attribute.ReplaceMissingValues -i $1.split3.arff -o $1.split3.mean.arff -unset-class-temporarily
java -cp weka.jar weka.filters.unsupervised.attribute.ReplaceMissingValues -i $1.split4.arff -o $1.split4.mean.arff -unset-class-temporarily
java -cp weka.jar weka.filters.unsupervised.attribute.ReplaceMissingValues -i $1.split5.arff -o $1.split5.mean.arff -unset-class-temporarily
java -cp weka.jar weka.filters.unsupervised.attribute.ReplaceMissingValues -i $1.split6.arff -o $1.split6.mean.arff -unset-class-temporarily
java -cp weka.jar weka.filters.unsupervised.attribute.ReplaceMissingValues -i $1.split7.arff -o $1.split7.mean.arff -unset-class-temporarily

#merge files
cat $1.header > $2
grep -v "@" $1.split1.mean.arff >> $2
grep -v "@" $1.split2.mean.arff >> $2
grep -v "@" $1.split3.mean.arff >> $2
grep -v "@" $1.split4.mean.arff >> $2
grep -v "@" $1.split5.mean.arff >> $2
grep -v "@" $1.split6.mean.arff >> $2
grep -v "@" $1.split7.mean.arff >> $2

#delete tmp files
rm $1.split1.mean.arff
rm $1.split2.mean.arff
rm $1.split3.mean.arff
rm $1.split4.mean.arff
rm $1.split5.mean.arff
rm $1.split6.mean.arff
rm $1.split7.mean.arff

rm $1.split1.arff
rm $1.split2.arff
rm $1.split3.arff
rm $1.split4.arff
rm $1.split5.arff
rm $1.split6.arff
rm $1.split7.arff

rm $1.header
