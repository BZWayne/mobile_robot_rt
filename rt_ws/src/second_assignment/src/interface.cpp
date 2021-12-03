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

char inputC(){
	char command;
	std::cout << "Speed UP (Yes, press a) or (No, press s)?\n";
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
	ros::Subscriber sub = nh.subscribe("/base_scan", 1, message);
	ros::spin();
	return 0;
}
