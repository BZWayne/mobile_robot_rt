#include "ros/ros.h"
#include <ros/console.h>
#include "sensor_msgs/LaserScan.h"
#include "geometry_msgs/Twist.h"
#include "second_assignment/Service.h"
#include "std_msgs/Float32.h"

ros::Publisher pub;
geometry_msgs::Twist vel;

float range_right;
float range_front;
float range_left;
float ranger[721];

float speed = 0;
float changeAcc = 0;

float measureDis(int min, int max, float dis[]){

    float minDis = 120;
    for(int i = min; i <= max; i++){
        if (dis[i]<=minDis) minDis = dis[i];
    }
    return minDis;
}

void Robot(const sensor_msgs::LaserScan::ConstPtr& msg){

    for(int i = 0; i<721; i++){
        ranger[i] = msg->ranges[i];
    }
    range_right = measureDis(0, 120, ranger); 
    range_front = measureDis(300, 420, ranger); 
    range_left = measureDis(600, 720, ranger);

    if(range_front<2){
        if(range_left>range_right){
            vel.angular.z = 4;
            vel.linear.x = 0.7;
        }
        else if(range_right>range_left){
            vel.angular.z = -4;
            vel.linear.x = 0.7;
        }
    }
    else{
        vel.linear.x = 1 + changeAcc;
        vel.angular.z = 0;
    }
    float velocity = vel.linear.x;
    ROS_INFO("Speed: @[%f]\n", speed);    
    pub.publish(vel);
}


void changeSpeed(const std_msgs::Float32::ConstPtr& aVal){
    ROS_INFO("I am changing the speed: [%f]", aVal->data);
}

int main (int argc, char **argv)
{ 
    ros::init(argc, argv, "controller");  
    ros::NodeHandle nh;
    pub = nh.advertise<geometry_msgs::Twist>("/cmd_vel", 1);   
    ros::Subscriber sub_accSpeed = nh.subscribe("/acSpeed", 1, changeSpeed);
    ros::Subscriber sub_laser = nh.subscribe("/base_scan", 1, Robot);
    ros::spin();
    return 0;
}
