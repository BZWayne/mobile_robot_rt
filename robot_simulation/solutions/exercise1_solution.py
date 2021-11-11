from __future__ import print_function
import time
from sr.robot import *

"""
Exercise 1 python script

Put the main code after the definition of the functions. The code should drive the robot around the environment
Steps to be performed:
1- give a linear velocity (speed 50, time 2)
2- give an angular velocity (speed 20, time 2)
3- move the robot in circle -> hint: you should create a new function setting the velocities so as to have a linear velocity + an angular velocity (speed 30, time 5)

When done, run with:
	$ python run.py solutions/exercise1_solution.py
"""

R = Robot()
""" instance of the class Robot"""

def drive_rot(speed, seconds):
    """
    Function for setting a linear velocity and an angular velocity
    """
    R.motors[0].m0.power = speed*2
    R.motors[0].m1.power = 0
    time.sleep(seconds)
    R.motors[0].m0.power = 0
    R.motors[0].m1.power = 0


def drive(speed, seconds):
    """
    Function for setting a linear velocity

    Args: speed (int): the speed of the wheels
	  seconds (int): the time interval
    """
    R.motors[0].m0.power = speed
    R.motors[0].m1.power = speed
    time.sleep(seconds)
    R.motors[0].m0.power = 0
    R.motors[0].m1.power = 0

def turn(speed, seconds):
    """
    Function for setting an angular velocity
    
    Args: speed (int): the speed of the wheels
	  seconds (int): the time interval
    """
    R.motors[0].m0.power = speed
    R.motors[0].m1.power = -speed
    time.sleep(seconds)
    R.motors[0].m0.power = 0
    R.motors[0].m1.power = 0


drive(50,2) #we move the robot forward
turn(20,2) #we make the robot turn
drive_rot(30,5) #we move the robot in circle


	
