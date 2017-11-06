# Using SpaceEx from the terminal



## Steps

The necessary steps are as follows.

1. **Set up Virtual Machine (necessary only for Window users)**. Note that it is not possible to directly run the executable file in Windows. The executables are created for Linux and macOS. It might be possible with cygwin but not advised. On the contrary, the recommended way would be to create a new Virtual Machine and install Linux (also possible with macOS). 
 
    - **Download OS**. The first step is to download a 32- or 64-bit Linux distribution (e.g. [Ubuntu](https://www.ubuntu.com/download/desktop) or [Debian](https://www.debian.org/distrib/). We recommend the 64-bit version as it supports the latest SpaceEx version.
    - **Download VM**. There are several options, notably Oracle [VirtualBox](https://www.virtualbox.org/wiki/Downloads) (1st option for Windows host) or [VMmare Player](https://my.vmware.com/en/web/vmware/downloads). Our recommendation would be the former.
    - **Set up new VM**. Once the VM application is downloaded, a new VM should be created and set up. For VirtualBox, simply open the application, navigate to option *New*  (on top-left), select *Linux* and version (e.g. 64-debian), memory size (over 2 GB is typically enough), *Create a virtual machine now*, *VDI*, *dynamically allocated* and size over *8GB*.
    - **Install OS**. Now, a new virtual machine should be created (appears on the left) and you shall select *start*. The option *Select Start-up disk* pops up and you should add the location of the downloaded ISO file (64-bit Linux). Now, it is possible to install Linux. There will be several questions similar to a Windows installation.
    - **Set up Linux**. There are numerous  tutorials on the [basic Linux commands](http://www.makeuseof.com/tag/an-a-z-of-linux-40-essential-commands-you-should-know/). The necessary actions to setup your Linux for SpaceEx use follow.
      - Open terminal (Ubuntu: press Dash, Debian: press  Activities, and then search for Terminal).
      - Gain root access by `$ su`  
(`$` is used for clarity, it should not be added in the terminal) and insert your password.

      - `$ apt-get install sudo`
      - `$ sudo apt-get install build-essential`
      - `$ sudo apt-get update`

     


2. **Download SpaceEx**. Depending on the OS you have downloaded, select the corresponding executable file from [SpaceEx website](http://spaceex.imag.fr/download-6). That is *SpaceEx command line executable v0.9.8f* for 64 bit Linux or *SpaceEx command line executable v0.9.8e* (64 bit Mac OS X)

3. **Use SpaceEx from command line**.

    + **_Run SpaceEx_**
     - use command `cd` to change directory (to the folder you saved the spaceex files). For example, `$ cd /home/user/Downloads/spaceex\_exe`.
If you cannot cd with root privilege, press exit (to leave root) and then write the aforementioned command.  

     - until you get familiar with paths and directories, save your xml and cfg files in */home/user/Downloads/spaceex\_exe*

     - now, you are ready to run spaceex by writing in the terminal: ` ./spaceex -g config.cfg -m model.xml -o output`

     - Spaceex will run, show the steps on the terminal screen and save the results in the output file. The results could be numbers (representing the vertices of the reachable sets) or text. 
More information can be found  at the [FAQ](http://spaceex.imag.fr/documentation/user-documentation/frequently-asked-questions-21).
    + **_Extra Options_**
       - All the options can be found by writing the command `$ ./spaceex --help` on the terminal.
       
     - Plotting; there are different ways to plot the reachable sets. For MATLAB users, it is possible to save the 2D results in GEN format and use the [Matlab script](http://spaceex.imag.fr/sites/default/files/downloads/plot_2d_vertices.m) for visualization (i.e. *plot\_2d\_vertices*).



     - To obtain the flattened/composed hybrid automaton in XML format, you can add the argument `--output-system-file new_name`


4. **Run multiple files**.

    - There are two ways to run multiple reachable computations. Either creating new cfg files with multiple configurations (e.g. different initial conditions) or run spaceex with different arguments in the terminal. 
    -  If you want to automatically run different configurations, you can run a bash file. Attached you can find a bash file with different configurations. Also, a way to automatically create several cfg files with different initial conditions and names is proposed.
The file can be executed by writing in the terminal the following command  `$ ./run\_spaceex.sh`. If you have problem with permissions, try the command `$ sh run\_spaceex.sh`.



