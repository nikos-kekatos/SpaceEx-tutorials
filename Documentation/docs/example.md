# Example

We illustrate the necessary commands on the *Timed Bouncing Ball* example from the [SpaceEx website](http://spaceex.imag.fr/download-6).  The files (xml & cfg) can also be found at the [repository](https://github.com/nikos-kekatos/SpaceEx-tutorials/tree/master/Examples/Bouncing_Ball).

The first command creates and saves the reachability results to a gen file (the name of the file is *out*).
`$ ./spaceex -g bball\_timed.cfg -m bball\_timed.xml -o out.gen` 

The second command creates the *out2*  gen file, while specifying the accuracy of the computations and the verbosity level.      
 `$ ./spaceex -g bball\_timed.cfg -m bball\_timed.xml -o out2.gen -v D6 --flowpipe-tolerance 0.01`. 

The third command conducts reachability analysis for the specified initial conditions and creates the *out3* gen file.
`$ ./spaceex -g bball\_timed.cfg -m bball\_timed.xml -o out3.gen --initially  "12<=x<=12.2 \& v==0 \& t==0"`. 

