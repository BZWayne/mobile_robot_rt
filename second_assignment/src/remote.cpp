#include "ros/ros.h"
#include <ros/console.h>
#include "sensor_msgs/LaserScan.h"
#include "std_msgs/Float32.h"
#include "geometry_msgs/Twist.h"
#include "second_assignment/Service.h"
#include "geometry_msgs/Twist.h"
#include "std_srvs/Empty.h"
#include "turtlesim/Spawn.h"


std_srvs::Empty res_server;
float finVal = 0;

// Control buttons
// Increases by +1 if pressed [a]
// Decreases by -1 if pressed [d]
// Resets it position if pressed [r]
// Sends error if wrong command

bool remoteControl(second_assignment::Service::Request &in, 
				   second_assignment::Service::Response &out)
{
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
	out.getVal = finVal;
	ROS_INFO("The value is: "); 
	ROS_INFO("Speed: @[%f]\n", out.getVal);    
	return true;
}

// Main functions
int main(int argc, char **argv){
	ros::init(argc, argv, "remote");
	ros::NodeHandle nh;
	ros::ServiceServer service =  nh.advertiseService("/change", remoteControl);
	ros::spin();
	return 0;
}
