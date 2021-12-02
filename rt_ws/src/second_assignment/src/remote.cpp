#include "second_assignment/Service.h"
#include "ros/ros.h"
#include "std_srvs/Empty.h"


std_srvs::Empty res_server;
float stuff = 0;

bool ServerCallback(second_assignment::Service::Request &req, second_assignment::Service::Response &res){
	if(req.setVal == 'a'){
		stuff += 0.5;
		req.setVal = 'x';
	}
	if(req.setVal == 's'){
		stuff -= 0.5;
		req.setVal = 'x';
	}
	if(req.setVal == 'r'){
		ros::service::call("/reset_positions", res_server);
	}
	if(req.setVal == 'x'){
		return false;
	}
	if(req.setVal != 'x' && req.setVal != 's' && req.setVal != 'a' && req.setVal != 'r'){
		std::cout << "It's not the right key!\n";
	}
	res.getVal = stuff;
	ROS_INFO("Right: @[%f]", res.getVal);    
	return true;
}

int main(int argc, char **argv){
	ros::init(argc, argv, "server");
	ros::NodeHandle nh;
	ros::ServiceServer service =  nh.advertiseService("/accelarate", ServerCallback);
	ros::spin();
	return 0;
}
