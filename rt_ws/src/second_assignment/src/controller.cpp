#include "ros/ros.h"
#include "sensor_msgs/LaserScan.h"
#include "geometry_msgs/Twist.h"
#include "turtlesim/Spawn.h"
#include "second_assignment/Service.h"
#include "second_assignment/Speed.h"
#include "std_srvs/Empty.h"

ros::Publisher pub;
geometry_msgs::Twist vel;
float accelaration = 0;
float count = 0;

float measureDis(int min, int max, float ranges[]){

    float val_min = 100.0;
    for(int i = min; i <= max; i++){
        if (ranges[i]<=val_min) val_min = ranges[i];
    }
    return val_min;
}

void RobotCallback(const sensor_msgs::LaserScan::ConstPtr& msg){

    float val_min_right, val_min_front, val_min_left;
    float laser[721];

    for(int i = 0; i<721; i++){
        laser[i] = msg->ranges[i];
    }
    val_min_right = measureDis(0, 100, laser); 
    val_min_front = measureDis(310, 410, laser); 
    val_min_left = measureDis(620, 720, laser);

    if(val_min_front<1.5){
        if(val_min_left>val_min_right){
            vel.angular.z = 1;
            vel.linear.x = 0.1;
        }
        else if(val_min_right>val_min_left){
            vel.angular.z = -1;
            vel.linear.x = 0.1;
        }
    }
    else{
        vel.linear.x = 1 + count;
        vel.angular.z = 0;
    }
    float velocity = vel.linear.x;
    ROS_INFO("Right: @[%f]", accelaration);    
    pub.publish(vel);
}

void AccelarationCallback(const second_assignment::Speed::ConstPtr& aVal){
    count = aVal->acSpeed;
}

int main (int argc, char **argv)
{ 
    ros::init(argc, argv, "controller");  
    ros::NodeHandle nh;
    pub = nh.advertise<geometry_msgs::Twist>("/cmd_vel", 1);   
    ros::Subscriber sub2 = nh.subscribe("/acSpeed", 1, AccelarationCallback);
    ros::Subscriber sub = nh.subscribe("/base_scan", 1, RobotCallback);
    ros::spin();
    return 0;
}
