
There are two ways to run multiple reachable computations. Either creating new
cfg files with multiple configurations (e.g. different initial conditions) or
run spaceex with different arguments in the terminal. 

If you want to automatically run different configurations, you can run a
[bash](https://ryanstutorials.net/bash-scripting-tutorial/bash-script.php) file.
A practical option is to have a parametrized bash file that concerns different configurations. 

One way to automatically create several cfg files with different initial conditions and names can be found at the [Github repository](https://github.com/nikos-kekatos/SpaceEx-tutorials/blob/master/Files/AutomatedExecution/Examples/Bouncing_Ball/run_spaceex.sh).
It employs the *timed bouncing ball* example.

The file can be executed by writing in the terminal the following command `$ ./run_spaceex.sh`. If you have problem with permissions, try the command `$ sh run_spaceex.sh`.

