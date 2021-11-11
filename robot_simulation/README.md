Python Robotics Simulator Assignment
================================

Results
----------------------
My solution of the task is represented in my YouTube channel: https://youtu.be/UXKGQzI_MYQ

Below, there is an explanation of how to run a code, problem and solution descriptions.

Installing and running
----------------------

The simulator requires a Python 2.7 installation, the [pygame](http://pygame.org/) library, [PyPyBox2D](https://pypi.python.org/pypi/pypybox2d/2.1-r331), and [PyYAML](https://pypi.python.org/pypi/PyYAML/).

Pygame, unfortunately, can be tricky (though [not impossible](http://askubuntu.com/q/312767)) to install in virtual environments. If you are using `pip`, you might try `pip install hg+https://bitbucket.org/pygame/pygame`, or you could use your operating system's package manager. Windows users could use [Portable Python](http://portablepython.com/). PyPyBox2D and PyYAML are more forgiving, and should install just fine using `pip` or `easy_install`.

## Troubleshooting

When running `python run.py <file>`, you may be presented with an error: `ImportError: No module named 'robot'`. This may be due to a conflict between sr.tools and sr.robot. To resolve, symlink simulator/sr/robot to the location of sr.tools.

On Ubuntu, this can be accomplished by:
* Find the location of srtools: `pip show sr.tools`
* Get the location. In my case this was `/usr/local/lib/python2.7/dist-packages`
* Create symlink: `ln -s path/to/simulator/sr/robot /usr/local/lib/python2.7/dist-packages/sr/`

## To run:
-----------------------------
Open a terminal, git clone the task and run the following commands:

```bash
$ python run.py assignment.py
```

## Problem description:
----------------------

The robot is the same one that you have used in the previous exercises (exercise1.py, exercise2.py, exercise3.py). 

The only difference is that now the sensors
can detect boxes around all directions (from -180.0 degrees to 180.0 degrees).
Write a python script for achieving this robot’s behaviour:
- constrantly drive the robot around the circuit in the counter-clockwise direction
- avoid touching the golden boxes
- when the robot is close to a silver box, it should grab it, and move it behind itself

## Solution:
----------------------

### Flowchart

![alt text](https://github.com/BZWayne/rt_exercises/blob/main/robot_simulation/flowchart.png)

### Initial parameters

This global variables are used to provide fixed values for the thresholds.

- `d_th` is the threshold of the distance to grab the silver box
- `a_th` is the threshold of the angle to move toward the silver box
- `dist_detect` is the threshold the distance to detect boxes
- `dist_rot` is the threshold of the rotate() function to avoid collisions
- `search_s` is the angle from -70 to 70 degrees to detect silver boxes. Also used to avoid previous grabbed silver boxes
- `search_g` is the angle from -45 to 45 degrees to detect golden boxes.
- `angle_s` is the threshold of the angle to estimate if the silver or golden boxes are close to the robot.
- `diff_left` and `diff_right` is the threshold used to avoid the collisions from the sides of the robot

### DRIVE function

The simulated robot has two motors configured for skid steering, connected to a two-output [Motor Board](https://studentrobotics.org/docs/kit/motor_board). The left motor is connected to output `0` and the right motor to output `1`.

The Motor Board API is identical to [that of the SR API](https://studentrobotics.org/docs/programming/sr/motors/), except that motor boards cannot be addressed by serial number. So, to turn on the spot at one quarter of full power, one might write the following:

Function for setting a linear velocity with provided speed and time.

Arguments: speed (int): the speed of the wheels seconds (int): the time interval

```
def drive(speed, seconds):
    R.motors[0].m0.power = speed
    R.motors[0].m1.power = speed
    time.sleep(seconds)
    R.motors[0].m0.power = 0
    R.motors[0].m1.power = 0
```

### TURN function

Function for setting an angular velocity

Arguments: speed (int): the speed of the wheels seconds (int): the time interval
```
def turn(speed, seconds):
    R.motors[0].m0.power = speed
    R.motors[0].m1.power = -speed
    time.sleep(seconds)
    R.motors[0].m0.power = 0
    R.motors[0].m1.power = 0
```

### FIND_SILVER_TOKEN function
This function to find the closest silver token

Returns:
`dist (float):` distance of the closest token (-1 if no token is detected)
`rot_y (float):` angle between the robot and the token (-1 if no token is detected)

```
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
```
### FIND_GOLDEN_TOKEN function
This function to find the closest golden token

Returns:
`dist (float):` distance of the closest token (-1 if no token is detected)
`rot_y (float):` angle between the robot and the token (-1 if no token is detected)
```
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
```

### BOXES function

This function is used to find the walls (golden boxes) and search for the silver boxes. 

Arguments:
- `distance (float):` distance of the closest wall (if the distance is -1 and less or equal than `dist_detect`)
- `angle (float):` angle between the robot and the token (-1 if no token is detected)

Returns:
- `True` if the obstacles are closer to the robot than the silver boxes
- `False` if the silver box is closer to the robot than the obstacles or not found in a distance at least 1.0 or from `-angle_s` to `angle_s`

```python
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
```

### ROTATE function

This function is used to rotate the wheel in case of finding the golden obstacles to avoid the collision. It is estimated by using the distance to the golden box with `dist_rot` global variable. The angles of avoidance with the wall is from `-diff_left` and `diff_left` from the left side and `-diff_right` and `diff_right` fro the right side.
 
Returns:
`True` if the angle is negative, then the robot turns left
`False` if the angle is positive, then the robot turns right

```
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
```
