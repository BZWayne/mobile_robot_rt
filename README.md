# Here are the exercises of RT course
## About this course

Course Instructor: [Carmine Tommaso Recchiuto](https://github.com/CarmineD8)

This course is oriented to learn Robotics Tools such as Python, C++, ROS/ROS2. As every course, it considers midterm assignments:

### Assignment I: Python Robotics Simulation
The first task is in `/robot_simulation` folder. This is a simple, portable robot simulator developed by Student Robotics. Some of the arenas and the exercises have been modified for the Research Track I course. The detailed explaination of this task is in that folder. 

#### Problem
The robot is the same one that you have used in the previous exercises (exercise1.py, exercise2.py, exercise3.py). 

The only difference is that now the sensors
can detect boxes around all directions (from -180.0 degrees to 180.0 degrees).
Write a python script for achieving this robot’s behaviour:
- constrantly drive the robot around the circuit in the counter-clockwise direction
- avoid touching the golden boxes
- when the robot is close to a silver box, it should grab it, and move it behind itself

#### Results
The video result of the first assignment is uploaded to my YouTube channel: https://youtu.be/UXKGQzI_MYQ

### Assignment II: ROS Robot Controller

The second task is in `/rt_ws` folder. This is a simple, portable robot simulator developed by Student Robotics. Some of the arenas and the exercises have been modified for the Research Track I course. The detailed explaination of this task is in that folder. 

#### Problem
Similarly to the first assignment, you have a robot here which should move autonomously inside a circuit.
Here however:
- It must be used ROS for controlling the robot
- The robot is endowed with laser scanners
- Modify a node for the control of the robot, and an additional node which interacts with the user to:
- Add increase / decrease the speed
- Add reset the robot’s position
- Everything should be done in cpp

Controlling the robot:
- Robot should publish a velocity on the cmd_vel topic
- Robot can use the /base_scan topic to get information about the surrounding environment.
- In particular, the information about the distance of the obstacles is in the ranges vector.
Hint: divide the ranges vector into subsections, and take the minimum value of each subsection. This will provide
information about the closest obstacles. 

#### Results
The video result of the first assignment is uploaded to my YouTube channel: 
