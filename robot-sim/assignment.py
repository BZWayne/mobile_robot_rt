from __future__ import print_function

import time
from sr.robot import *

"""
    Initial parameters to start the ride
"""
d_th = 0.4
a_th = 2
silver = True
dist_detect = 1.5                # a distance to detect silver or gold 
dist_rot = 100                   # a distance to detect the boxes in rotation

## Distances used to find obstacles, silver boxes
diff = 20
mid_point = 90
search_s = 70
search_g = 45
##################################################

diff_left = mid_point + diff     # difference of search from right
diff_right = mid_point - diff    # difference of search from left
angle_s = 30                     # search angle

# Starting point
R = Robot()

"""
    Function for setting a linear velocity
    Arguments: speed (int): the speed of the wheels seconds (int): the time interval
"""

def drive(speed, seconds):
    R.motors[0].m0.power = speed
    R.motors[0].m1.power = speed
    time.sleep(seconds)
    R.motors[0].m0.power = 0
    R.motors[0].m1.power = 0

"""
    Function for setting an angular velocity
    Arguments: speed (int): the speed of the wheels seconds (int): the time interval
"""

def turn(speed, seconds):
    R.motors[0].m0.power = speed
    R.motors[0].m1.power = -speed
    time.sleep(seconds)
    R.motors[0].m0.power = 0
    R.motors[0].m1.power = 0

"""
    Function to find the closest silver token
    Returns:
	dist (float): distance of the closest token (-1 if no token is detected)
	rot_y (float): angle between the robot and the token (-1 if no token is detected)
"""

def find_silver_token():
    dist = dist_detect
    for token in R.see():
        if -search_s<token.rot_y<search_s and token.dist < dist and token.info.marker_type is MARKER_TOKEN_SILVER:
            dist=token.dist
            rot_y=token.rot_y
    if dist == dist_detect:
        return -1, -1
    else:
        return dist, rot_y

"""
    Function to find the closest golden token
    Returns:
	dist (float): distance of the closest token (-1 if no token is detected)
	rot_y (float): angle between the robot and the token (-1 if no token is detected)
"""

def find_golden_token():
    dist = dist_detect
    for token in R.see():
        if -search_g<token.rot_y<search_g and token.dist < dist and token.info.marker_type is MARKER_TOKEN_GOLD:
            dist=token.dist
            rot_y=token.rot_y
    if dist == dist_detect:
        return -1, -1
    else:
        return dist, rot_y

"""
    Function to find the walls (golden boxes) and search for the silver boxes
    Arguments:
	distance (float): distance of the closest wall (if the distance is -1 and less or equal than 1.5)
	angle (float): angle between the robot and the token (-1 if no token is detected)
    Returns:
    True if the obstacles are closer to the robot than the silver boxes
    False if the silver box is closer to the robot than the obstacles or not found in a distance at least 1.0 or in a 60 degree of search
"""

def boxes(distance, angle):
    if distance == -1:
        return True
    else:
        dist = dist_detect
        for token in R.see():
            if angle-angle_s<token.rot_y<angle+angle_s and token.dist < dist and token.info.marker_type is MARKER_TOKEN_GOLD:
                dist=token.dist
                rot_y=token.rot_y
        if dist == dist_detect or (distance <= dist):
            return False
        elif (distance > dist):
            return True

"""
    Function to estimate the distance to the golden box. 
    Arguments:
	distance (float): distance of the closest wall (if the distance is -1 and less or equal than 1.5)
    Returns:
    True if the angle is negative, then the robot turns left
    False if the angle is positive, then the robot turns right
"""

def rotate():
    dist = dist_rot
    # Detecting any obstacles from the sides to avoid it by rotating 
    for token in R.see():
        if (-diff_left<token.rot_y<-diff_right or diff_right<token.rot_y<diff_left) and token.dist < dist and token.info.marker_type is MARKER_TOKEN_GOLD:
            dist = token.dist
            rot_y = token.rot_y
    # Turning right with a speed of 25 in 0.1 sec
    if rot_y < 0:
        turn(25, 0.1)
        return False
    # Turning left with a speed of 25 in 0.1 sec
    else:
        turn(-25, 0.1)
        return True

#### Where the main action happens
#### Will be run until the user terminates the program

while (True):

    # Updating the values of the distances to the silver and golds
    dist_silver , angle_silver = find_silver_token()
    dist_gold, angle_gold = find_golden_token()
    box = boxes(dist_silver, angle_silver)

    # If the obstacles or nothing is detected
    if box is True:
        # If there is any obstacles, and the distance is less than 1
        if (dist_gold!=-1 and dist_gold < 1.0):
            print("Avoid obstacles")
            rotate()    
        # If nothing from both sides        
        else:
            print("Drive straight")
            drive(60,0.2)
    
    # If the silver box is detected
    elif (box is False):

        # Turning to the direction of silver box
        if angle_silver < -a_th:
            print ("Rotate left")
            turn(-15, 0.1)
                            
        elif angle_silver > a_th:
            print ("Rotate right")
            turn(+15, 0.1)
            
        elif (-a_th < angle_silver <a_th):
            print ("Move straight to catch it")
            drive(50, 0.15)
        
        # If the distance is close to grab the silver box
        if dist_silver < d_th:
            print ("Grab a silver box")
            R.grab()
            turn(25,2.5)
            # drive(25,1)
            R.release()
            drive(-25,1)
            turn(-25,2.5)