 #!/bin/sh

# model from SpaceEx web interface: timed bouncing ball

model="bball_timed.xml"

config='bball_timed.cfg'
# sleep is used for display purposes
echo " "
echo "For list of options, write ./spaceex --help "
echo " "
sleep 2
echo "Run original xml + cfg with out"
echo " "


sleep 0.2
./spaceex -g $config -m $model -o out1

echo " "
echo "Run original xml + cfg with txt output "
echo " "
./spaceex -g $config -m $model -o out.txt

sleep 2
echo " "
echo "Overwrite parameters/options " # instead of original 3 iterations, perform 5
echo " "

./spaceex -g $config -m $model -o out2 --iter-max 5
echo " "


echo "Change iterations and initial conditions "
echo " "

./spaceex -g $config -m $model -o out3 --iter-max 5 --initially  "12<=x<=12.2 & v==0 & t==0"
echo " "

### use of loop
## For example, initial conditions for x should be tested between 9-11. Step is 0.2.

h=0.2
END=30

for ((i=0; i<=END-1; i++))
do
#let "x_min=9+$h*$i" # if h is integer
x_min=$(echo "9 + $h * $i"|bc) # use awk for floating arithmetics
#let "x_max=9+h*(i+1)"
x_max=$(echo "9 + $h * $[i+1]"|bc)
output_name1="out_${x_min}_x_$x_max"
output_name2="out_x_$i"
output_name=$output_name1 # naming the output file is a matter of preference

./spaceex -g $config -m $model -o $output_name --iter-max 5 --initially  "$x_min<=x<=$x_max & v==0 & t==0"
echo " "
done

# example for arrays http://stackoverflow.com/questions/16487258/how-to-declare-2d-array-in-bash


