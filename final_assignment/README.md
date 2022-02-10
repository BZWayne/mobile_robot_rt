Assignment III: Autonomous and Manual control
================================

Results
----------------------
My solution of the task is visually represented in my YouTube channel: https://youtu.be/ZkutjJkQl1Q

Below, there is an explanation of how to run a code, problem and solution descriptions.

Installing and building
----------------------

Install in your workspace and build:

```
$ git clone https://github.com/BZWayne/rt_exercises.git
$ cd catkin_make
```

## To run:
-----------------------------
Open 2 terminals and run each by following commands:

```bash
$ roslaunch final_assignment master.launch

$ roslaunch final_assignment robot.launch
```

## Problem description:
----------------------
Develop a software architecture for the control of the robot in the environment. The software will rely on the move_base
and gmapping packages for localizing the robot and plan the motion.
The architecture should be able to get the user request, and let the robot execute one of the following behaviors
(depending on the user’s input):
- 1) autonomously reach a x,y coordinate inserted by the user
- 2) let the user drive the robot with the keyboard
- 3) let the user drive the robot assisting them to avoid collisions

Regarding 1) the move_base pakage requires goal to be sent to the topic move_base/goal, by sending a message of type
move_base_msgs/MoveBaseActionGoal. Please remember to: 
- set the field goal.target_pose.frame_id to map 
- set the field goal.target_pose.pose.orientation.w to 1
the target x and y position coordinates should be set in: 
- goal.target_pose.pose.position.x
- goal.target_pose.pose.position.y
Optional: of course you can also directly use actions, as seen in
class.

Regarding 2 and 3), you can rely on the teleop_twist_keyboard seen in class. However, in case 3), the cmd_vel may need to be corrected
when the user is going to crash into obstacles. Carefully consider the architecture of the system.
Concerning 3), the robot:
- should not go forward if there is an obstacle in the front
- should not turn left/right if there are obstacles on the
left/right

## Solution:
----------------------
### Flowchart

![alt text](https://github.com/BZWayne/rt_exercises/blob/main/images/flowchart_ass3.png)

### Option One script
This is autonomous driving mode and here we are providing (x,y) coordinates

```
    ## provide and publish move_base with (x,y) values
    move_base_msg.goal.target_pose.pose.position.x = x_goal
    move_base_msg.goal.target_pose.pose.position.y = y_goal
    publisher_movebase.publish(move_base_msg) 
```

This is a feedback to the robot if he reached a point

```
    feedback_robot = rospy.wait_for_message("move_base/feedback", MoveBaseActionFeedback)
    dist_goal_x = feedback_robot.feedback.base_position.pose.position.x 
    dist_goal_y = feedback_robot.feedback.base_position.pose.position.y 
    dis_goal = ((x_goal - dist_goal_x)**2 + (y_goal - dist_goal_y)**2)**0.5 
    time_finish = rospy.Time.now().to_sec()
```

To cancel the robot's goal is here

```
	# if a new goal is needed
    inp = input("Do you want to provide new goal? If yes, press [y]: \n")
    if inp == 'y':
        continue
    else:
        exit_system = True
```

### Option Two script
Using controlButtons() function, a user is controlling the robot like a joystick
```
    if button == 'w' or button == 'W':
        return 1.0, 0, False
    elif button == 'a' or button == 'A':
        return 0, 2, False
    elif button == 'd' or button == 'D':
        return 0, -2, False
    elif button == 's' or button == 'S':
        return -1.0, 0, False
    elif button == 'q' or button == 'Q':
        return 0, 0, True
    else:
        print("Wrong button \n")
```

To publish values from control_buttons(), this line of code in option_two() is used

```
	 [msg_twist.linear.x, msg_twist.angular.z, exit_system] = control_buttons() 
   publisher_velocity.publish(msg_twist) 
```

### Option Three script

This line of code is used to detect from laser's data 

To get the data from laser

 ```
    laser = rospy.wait_for_message("/scan", LaserScan)
    laser_data = laser.ranges
    [min_left, min_front, min_right] = min_distance(laser_data)
```

from left (45 and 135)
from front (-45 and 45) 
from right (-135 and 45)

```
    for i in range(-angle_provided, angle_provided):
        if distance_wall[i] < min_distance:
            min_distance = distance_wall[i]

    # right angle
    for i in range(-3*angle_provided, -angle_provided+1):
        if distance_wall[i] < min_distance:
            min_distance = distance_wall[i]

    # left angle
    for i in range(angle_provided+1, 3*angle_provided):
        if distance_wall[i] < min_distance:
            min_distance = min_distance[i]
```

if robot crosses minimal distance, then everything stops

```
    if min_left < distance_obst:
            if msg_twist.angular.z < 0:
                print("Obstacle from the left \n")
                msg_twist.angular.z = 0

    ## distance to wall from front
    elif min_front < distance_obst:
        if msg_twist.linear.x > 0:
            print("Obstacle from the front \n")
            msg_twist.linear.x = 0

    ## distance to wall from right
    elif min_right < distance_obst:
        if msg_twist.angular.z > 0:
            print("Obstacle from the right \n")
            msg_twist.angular.z = 0
```
