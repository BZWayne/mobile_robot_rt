#! /usr/bin/env python

import rospy
import os
from option1 import option_one
from option2 import option_two
from option3 import option_three

# User interface to give the user a set of options
def welcome():
    os.system('clear')
    print("Whats Up? This is RT1 Assignment III, and here is an UI for it.")
    print("Press [1] for autonomous drive of the robot")
    print("Press [2] for manual drive of the robot")
    print("Press [3] for manual drive of the robot with collision avoidance")
    print("Press [4] for exitting from the system")

# the main function that includes all options for execution
def main():
    exit_system = False
    rospy.init_node('final_assignment')
    while not rospy.is_shutdown() and not exit_system:
        welcome()
        while True:
            try:
                button = int(input("Choose drive options: "))
                break
            except:
                print("Your input is not possible to obtain")
        if button == 1:
            while not option_one():
                pass
        if button == 2:
            while not option_two():
                pass
        if button == 3:
            while not option_three():
                pass
        elif button == 4:
            exit_system = True
        else:
            print("Wrong button")

if __name__ == '__main__':
    main()