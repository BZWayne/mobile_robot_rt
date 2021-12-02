#include "ros/ros.h"
#include "sensor_msgs/LaserScan.h"
#include "geometry_msgs/Twist.h"
#include "turtlesim/Spawn.h"
#include "second_assignment/Service.h"
#include "second_assignment/Speed.h"
#include "std_srvs/Empty.h"

ros::ServiceClient client;
ros::Publisher pub;

char InputC(){
	char c;
	std::cout << "Speed UP (Yes, press a) or (No, press s)?\n";
	std::cin >> c;
	return c;
}

void CharCallback(const sensor_msgs::LaserScan::ConstPtr& msg){
	second_assignment::Service a_srv;
	char in = InputC();
	a_srv.request.setVal = in;
	client.waitForExistence();
	client.call(a_srv);
	second_assignment::Speed n;
	n.acSpeed = a_srv.response.getVal;
	pub.publish(n);
}

int main (int argc, char **argv) 
{
	// Initialize the node, setup the NodeHandle for handling the communication with the ROS //system
	ros::init(argc, argv, "gui"); 
	ros::NodeHandle nh;
	// Define the subscriber to turtle's position
	pub = nh.advertise<second_assignment::Speed>("/acSpeed", 10);   
	client = nh.serviceClient<second_assignment::Service>("/accelarate");
	ros::Subscriber sub = nh.subscribe("/base_scan", 1, CharCallback);
	ros::spin();
	return 0;
}
