#! /bin/bash

# Get the last seven days record
echo $(tail -7 historical_fc_accuracy.tsv  | cut -f6) > scratch.txt

# Find the difference between the forecast temperature and actual temperature
# Store the result in week_fc
week_fc=($(echo $(cat scratch.txt)))

for i in {0..6}; do
    echo ${week_fc[$i]}
done

for i in {0..6}; do
  if [[ ${week_fc[$i]} < 0 ]]
  then
    week_fc[$i]=$(((-1)*week_fc[$i]))
  fi

  echo ${week_fc[$i]}
done

# Find the minimum and maximum absolute errors
minimum=${week_fc[1]}
maximum=${week_fc[1]}
for item in ${week_fc[@]}; do
   if [[ $minimum > $item ]]
   then
     minimum=$item
   fi
   if [[ $maximum < $item ]]
   then
     maximum=$item
   fi
done

# Print the maximum and minimum absolute errors
echo "minimum ebsolute error = $minimum"
echo "maximum absolute error = $maximum"