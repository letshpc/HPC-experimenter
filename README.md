# HPC-experimenter
This repository contains Python codes that allow users to conduct HPC experiments (for shared-memory systems) without worrying about any mundane bookkeeping work. 

The scripts run serial and parallel codes multiple times to remove effects on performance due to non-deterministic factors. Provided the codes print logging information in a particular format, the scripts also allow generation of plots for analysis of performance.

This repository has the scripts and a sample code to show the ease of use for the task of benchmarking a code for the platform.

## Instructions to Run
1. First get the scripts either by downloading the `zip` file or running a `git clone` command on your system.
2. Run the `./setup.sh` to understand dependencies and install them as needed.
3. After installing all dependencies, run the `./run_script.sh` to use these scripts.
4. Once all the data regarding performance of your code has been collected, you can view plots by running the `create_plots.sh`.
   Alternatively, they can be uploaded to the [Let's HPC platform](www.letshpc.org) to be analysed there.


<!-- ## Instructions to Run -->

<!-- * Step 1 : Installing perf tool : Install the perf tool using the following command  -->
<!-- ```bash -->
<!-- ./setup.sh -->
<!-- ``` -->

<!-- * Step 2 : Run the script :  -->
<!-- ```bash -->
<!-- ./run_script.sh -->
<!-- ``` -->

<!-- * After the script has run sucessfully, the _combined\_logs.txt_ file and a file in the _perf\_log_ directory would be created which contain the data regarding the execution times and perf-tool data respectively. -->
