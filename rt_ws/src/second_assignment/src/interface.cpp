#include "ros/ros.h"
#include <ros/console.h>
#include "sensor_msgs/LaserScan.h"
#include "geometry_msgs/Twist.h"
#include "second_assignment/Service.h"
#include "second_assignment/Speed.h"
#include "geometry_msgs/Twist.h"
#include "std_srvs/Empty.h"
#include "turtlesim/Spawn.h"

ros::ServiceClient client;
ros::Publisher pub;

void welcomeWord(){
	std::cout << "Here is the interface of remotely controlling the robot\n";
	std::cout << "You may increase or decrease the speed of the robot\n";
	std::cout << "or reset to its initial position\n";
	std::cout << "Here is the interface of remotely controlling the robot\n";
}

char inputC(){
	char command;
	std::cout << "Accelerate (Yes, press a) or Decelerate (No, press d)?\n";
	std::cin >> command;
	return command;
}

void message(const sensor_msgs::LaserScan::ConstPtr& msg){
	second_assignment::Service serv;
	char in = inputC();
	serv.request.setVal = in;
	client.waitForExistence();
	client.call(serv);
	second_assignment::Speed n;
	n.acSpeed = serv.response.getVal;
	pub.publish(n);
}

int main (int argc, char **argv) 
{
	ros::init(argc, argv, "interface"); 
	ros::NodeHandle nh;
	pub = nh.advertise<second_assignment::Speed>("/acSpeed", 10);   
	client = nh.serviceClient<second_assignment::Service>("/change");
	welcomeWord();
	ros::Subscriber sub = nh.subscribe("/base_scan", 1, message);
	ros::spin();
	return 0;
}
