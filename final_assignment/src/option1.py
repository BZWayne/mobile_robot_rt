#! /usr/bin/env python

import rospy
import os
from move_base_msgs.msg import MoveBaseActionFeedback
from move_base_msgs.msg import MoveBaseActionGoal
from geometry_msgs.msg import Twist
from actionlib_msgs.msg import GoalID
from actionlib_msgs.msg import GoalStatusArray

# publishers
publisher_movebase = rospy.Publisher("move_base/goal", MoveBaseActionGoal, queue_size = 50)
publisher_cancel = rospy.Publisher("move_base/cancel", GoalID, queue_size = 50)

def option_one():
    # message topics using /move_base 
    move_base_msg = MoveBaseActionGoal()
    move_base_msg.goal.target_pose.header.frame_id = "map"
    move_base_msg.goal.target_pose.pose.orientation.w = 1

    # for exitting from the system
    exit_system = False

    while not exit_system:

        ## renew the system
        os.system('clear')
        print("Autonomous drive is chosen")
        x_goal = float(input("Insert x coordinate: "))
        y_goal = float(input("Insert y coordinate: "))
        print("The coordinates were given: x = %2.2f and y = %2.2f" % (x_goal, y_goal))

        ## provide and publish move_base with (x,y) values
        move_base_msg.goal.target_pose.pose.position.x = x_goal
        move_base_msg.goal.target_pose.pose.position.y = y_goal
        publisher_movebase.publish(move_base_msg) 

        ## provide basic needs and start moving
        time_start = rospy.Time.now().to_sec()
        dis_goal = 100
        rob_state = None

        ## wait for the status
        while rob_state is None:
            rob_state = rospy.wait_for_message("move_base/status", GoalStatusArray)
        
        ## otherwise continue
        id = rob_state.status_list[-1].goal_id.id # Retrieve the id of the goal
        state = rob_state.status_list[-1].status # Retrieve the current status

        ## if the robot is close to the goal
        while dis_goal > 1:
            rob_state = rospy.wait_for_message("move_base/status", GoalStatusArray) 
            rob_state = rob_state.status_list[-1].status

            ## if goal is not in charge exit from the system
            if (state != 1): 
                break

            ## get the position of robot and time
            feedback_robot = rospy.wait_for_message("move_base/feedback", MoveBaseActionFeedback)
            dist_goal_x = feedback_robot.feedback.base_position.pose.position.x 
            dist_goal_y = feedback_robot.feedback.base_position.pose.position.y 
            dis_goal = ((x_goal - dist_goal_x)**2 + (y_goal - dist_goal_y)**2)**0.5 
            time_finish = rospy.Time.now().to_sec()

            ## print position and time
            print("Now, robot is here at x = %2f and y = %2f" % (dist_goal_x, dist_goal_y)) # Some feedback for the user
            print("Time: %2f" %(time_finish - time_start)) # Some feedback for the user
        
        # if a user want to cancel the goal during movement that is not reachable
        if state != 1: 
            inp = input("The robot cannot reach to the goal, do you want to cancel the goal? if yes, press [y]\n")
            if inp == 'y':
                pass
            else:
                break
        
        # if robot achieved the goal
        if dis_goal < 1: # Successfully reached
            print("Robot is at the goal position")

        ## to cancel the robot
        move_base_msg_cancel = GoalID()
        move_base_msg_cancel.id = id
        publisher_cancel.publish(move_base_msg_cancel)

        # if a new goal is needed
        inp = input("Do you want to provide new goal? If yes, press [y]: \n")
        if inp == 'y':
            continue
        else:
            exit_system = True
        
    return 1

