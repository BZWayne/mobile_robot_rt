Assignment II: ROS Robot Simulation
================================

Results
----------------------
My solution of the task is visually represented in my YouTube channel: https://youtu.be/pkgA9I5c9DM

Below, there is an explanation of how to run a code, problem and solution descriptions.

Installing and building
----------------------

```
$ git clone https://github.com/BZWayne/rt_exercises.git
$ cd catkin_make
```

## To run:
-----------------------------
Open 5 terminals and run the following commands:

```bash
$ roscore

$ rosrun stage_ros stageros $(rospack find second_assignment)/world/my_world.world

$ rosrun second_assignment controller

$ rosrun second_assignment remote

$ rosrun second_assignment interface
```

## Problem description:
----------------------
Similarly to the first assignment, you have a robot here which should move autonomously inside a circuit. Here however:

It must be used ROS for controlling the robot
The robot is endowed with laser scanners
- Modify a node for the control of the robot, and an additional node which interacts with the user to:
- Add increase / decrease the speed
- Add reset the robot’s position
- Everything should be done in cpp

Controlling the robot:
- Robot should publish a velocity on the cmd_vel topic
- Robot can use the /base_scan topic to get information about the surrounding environment.
In particular, the information about the distance of the obstacles is in the ranges vector. Hint: divide the ranges vector into subsections, and take the minimum value of each subsection. This will provide information about the closest obstacles.

## Solution:
----------------------
### Flowchart

![alt text](https://github.com/BZWayne/rt_exercises/blob/main/images/flowchart_ass2.png)

### CONTROLLER script
#### Measure Distance Function
This function measures the neasrest distance to the obstacle in order to move around

```
    for(int i = min; i <= max; i++){
        if (dis[i]<=minDis) minDis = dis[i];
    }
    return minDis;
}
```

#### Robot() Function
This function controls the robot movement by turning left or ride to avoid the obstacle, or drive straight

```
    if(range_front<2){
        if(range_left>range_right){
            vel.angular.z = 2.5;
            vel.linear.x = 0.7;
        }
        else if(range_right>range_left){
            vel.angular.z = -2.5;
            vel.linear.x = 0.7;
        }
    }
    else{
        vel.linear.x = 1 + changeAcc;
        vel.angular.z = 0;
    }
```

#### Changing Speed Function
This function controls the accelaration of robot to increase or decrease the speed
##### changeSpeed() 
```
	changeAcc = aVal->data;
    ROS_INFO("I am changing the speed: [%f]", changeAcc);
```

### REMOTE script
This script is needed for users to connect with the server to control the speed or reset its position
#### remoteControl() 
```
	if(in.setVal == 'a'){
		finVal += 1.0;
		in.setVal = 'x';
	}
	else if(in.setVal == 'd'){
		finVal -= 1.0;
		in.setVal = 'x';
	}
	else if(in.setVal == 'r'){
		ros::service::call("/reset_positions", res_server);
	}
	else {
		std::cout << "Wrong button\n";
		return false;
	}
```

### INTERFACE script
This script is needed for users to press commands to control the speed or reset robot's position

#### InputC() is the function to import char
```
	char command;
	std::cin >> command;
	return command;
}
```

#### message() is the function to receive the command from the user and control the robot
```
	second_assignment::Service serv;
	char in = inputC();
	serv.request.setVal = in;
	client.waitForExistence();
	client.call(serv);
    
	// changing the speed
	std_msgs::Float32 n;
	n.data = serv.response.getVal;
	pub.publish(n);
}
```
