# README

## 1. Running Environment

We recommend using MATLAB (R2024a) and CoppeliaSim Edu (4.1.0) versions for the experiment. Additionally, for MATLAB, it is necessary to add the appropriate robotics toolbox to ensure the smooth execution of experiments involving the UR5 robot.

## 2. Download of related software

### Download MATLAB

For downloading MATLAB, it is recommended to follow the steps below.：

1. **Visit the official MATLAB website at the following **:

  ```matlab
https://www.mathworks.com/
  ```

2. **On the download page, select the R2024a version that is suitable for your operating system, and then proceed with the installation.**

3. **Install the Robotics System Toolbox**.

   In the MATLAB command window, enter the following command：

   ```matlab
   matlab.addons.install('robotics-system-toolbox');
   ```

   This will open the MATLAB Add-Ons installation interface, where you can select and install the toolbox.


### Download CoppeliaSim

For downloading CoppeliaSim, it is recommended to follow the steps below.

1. **Visit the official CoppeliaSim website at the following URL:**：

   ```matlab
   https://www.coppeliarobotics.com/
   ```

2. **In the download section of the website, select the CoppeliaSim Edu version, then choose version 4.1.0, and proceed with the installation.**

## 3. Directory Structure

### Experiment 1

* **activation_functions**: Has SBP activation function for better model convergence.
* **left_func**: Stores 5 ZNN models for experimental comparison.
* **results**: Saves experimental result graphs.
* **solver**: Folder to reproduce the result graph
* **noiseFunc.m**: Contains 6 noise function formulas for noise simulation.
* **lamda.m**: RLST - ZNN parameter script affecting its performance.
* **solver.m**: Main script to reproduce the result graph.

### Experiment 2

- **matlab_CH_ur5**: This section stores all the data required for model execution and robot simulation. It includes the implementation of the model, the structures needed to run the model, as well as the robot's related parameters and the core that drives the robot's operation.
- **recorder**: This section stores the simulation of the model driving the robotic arm in an environment with complex time-varying noise, controlling the robot to trace a star-shaped trajectory.
- **results**: This stores the experimental result plots, including error convergence, desired and actual paths, joint angle variation curves, joint velocity variation curves, and motion trajectory plots.
- **vrep_CH_ur5**: It includes the simulation of the model driving the robotic arm in the simulation platform, showcasing the process of using this model to drive the UR5 robotic arm to trace a star-shaped path.

## Running Steps

### Experiment 1

To obtain the numerical experimental results in the paper, follow these steps:

1. Enter the `experiment 1` folder, open `solver`, and double - click `solver.m`. If it doesn't open with MATLAB R2022a, open it manually.

2. In MATLAB's `Current Folder`, click `left_func` to find 5 comparison models.

3. Open model scripts, set noise: remove `%` for the target noise and add `%` to others.

4. In `Diff_AF_norm.m`, select the model: remove `%"`for the target model and add `%` to others, then save.

5. Ensure device meets requirements, click `Run` in MATLAB or press `F5`. Fix errors if any, and wait for the graph.

   #### Notice：

   The experimental process of obtaining the "Model Comparison under Different Noises" result graph seems simple in theory, but there are differences in actual operation. When setting the noise, due to the sensitivity of some models to noise settings, carefully checking is required when manually adding or removing the `%` symbol. Especially for complex models, each operation takes some time, resulting in the time consumption exceeding expectations.

### Experiment 2

To obtain the UR5 robot control experimental results in the paper, follow these steps:

1. Open the `matlab_CH_ur5` directory, then run `main.m` to successfully execute the program

2. The results obtained from the execution are the joint angles of the UR5 robot at different time points, which represent the overall movement of the robotic arm, thereby altering the motion trajectory of the end-effector. This data will be stored in the variable group `x`.

3. Open this variable and copy the changes in the six joint angles of the UR5 robot. Then, in the `vrep_CH_ur5` folder, create a new `.txt` file, paste the copied data from the variable `x` into this file, and save it.

4. Open the `track.m` file in the `vrep_CH_ur5` directory and locate the following code:

   ```matlab
   jointValue=load('adata.txt'); 
   [m n]=size(jointValue);
   ```

​		Change the file name `adata.txt` in the code to the newly created `.txt` file name.

​	5.Open the CoppeliaSim software and load the `UR5_2.ttt` file. Then, click the run button at the top. Finally, run the `track.m` file in MATLAB to observe the process of the UR5 robot drawing a star-shaped path in the simulation platform (this process has been recorded as a video stored in the recorder folder).

#### Notice：

Experiment1 entire drawing process is set to only 6 seconds, but in the actual simulation experiment, the process takes nearly 20 seconds. This is because, during the simulation, each of the six joint angles pauses for 0.01 seconds after reading and setting the current joint angle to ensure the accuracy and smoothness of the robotic arm's motion, thereby ensuring the process aligns with the robot's own performance capabilities.

