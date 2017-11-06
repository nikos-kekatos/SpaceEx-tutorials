# SpaceEx Tutorials
    - __*Example 1*__ **(Timed bouncing ball)**.
We illustrate the necessary commands on an example from the SpaceEx website (files enclosed in the github repository as well).

     - `$ ./spaceex -g bball\_timed.cfg -m bball\_timed.xml -o out.gen` This command creates and saves the reachability results to a GEN file (the name of the file is *out*).
     - `$ ./spaceex -g bball\_timed.cfg -m bball\_timed.xml -o out2.gen -v D6 --flowpipe-tolerance 0.01`. This command creates the *out2* GEN file, while specifying the accuracy of the computations and the verbosity level.
     - `$ ./spaceex -g bball\_timed.cfg -m bball\_timed.xml -o out3.gen --initially  "12<=x<=12.2 \& v==0 \& t==0"`. This command conducts reachability analysis for the specified initial conditions and creates the *out3* GEN file.
