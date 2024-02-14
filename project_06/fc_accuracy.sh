#! /bin/bash

# Get the forecast and actual temperature
yesterday_fc=$(tail -2 rx_poc.log | head -1 | cut -d " " -f4)
today_temp=$(tail -1 rx_poc.log | cut -d " " -f4)

# Find the temperature difference
diff=$(($yesterday_fc-$today_temp))

echo "Difference between forecast and actual values: $diff"

# Assign the accuracy range
if [ -1 -le $diff ] && [ $diff -le 1 ]
then
    accuracy_range=excellent
elif [ -2 -le $diff ] && [ $diff -le 2 ]
then
    accuracy_range=good
elif [ -3 -le $diff ] && [ $diff -le 3 ]
then
    accuracy_range=fair
else
    accuracy_range=poor
fi

echo "Forecast accuracy is $accuracy_range"

# Append the result to a tsv file
row=$(tail -1 rx_poc.log)
year=$( echo $row | cut -d " " -f1)
month=$( echo $row | cut -d " " -f2)
day=$( echo $row | cut -d " " -f3)
echo -e "$year\t$month\t$day\t$today_temp\t$yesterday_fc\t$accuracy\t$accuracy_range" >> historical_fc_accuracy.tsv