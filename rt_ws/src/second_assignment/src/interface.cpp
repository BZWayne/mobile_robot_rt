#include "ros/ros.h"
#include <ros/console.h>
#include "sensor_msgs/LaserScan.h"
#include "std_msgs/Float32.h"
#include "geometry_msgs/Twist.h"
#include "second_assignment/Service.h"
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
	std::cout << "Press [a] to accelerate\n";
	std::cout << "Press [d] to decelerate\n";
	std::cout << "Press [r] to reset\n";
}

char inputC(){
	char command;
	std::cin >> command;
	return command;
}

void message(const sensor_msgs::LaserScan::ConstPtr& msg){
	second_assignment::Service serv;
	char in = inputC();
	serv.request.setVal = in;
	client.waitForExistence();
	client.call(serv);
	std_msgs::Float32 n;
	n.data = serv.response.getVal;
	pub.publish(n);
}

int main (int argc, char **argv) 
{
	ros::init(argc, argv, "interface"); 
	ros::NodeHandle nh;
	pub = nh.advertise<std_msgs::Float32>("/acSpeed", 10);   
	client = nh.serviceClient<second_assignment::Service>("/change");
	welcomeWord();
	ros::Subscriber sub = nh.subscribe("/base_scan", 1, message);
	ros::spin();
	return 0;
}
