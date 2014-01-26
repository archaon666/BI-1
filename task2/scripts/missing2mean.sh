#!/bin/bash

#replace missing values with the mean values using a weka filter
java -cp weka.jar weka.filters.unsupervised.attribute.ReplaceMissingValues -i $1 -o $2
