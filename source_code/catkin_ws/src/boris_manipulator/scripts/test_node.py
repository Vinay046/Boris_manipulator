#!/usr/bin/env python3
import rospy
import math
from std_msgs.msg import Float32 # Messages used in the node must be imported.
#from robot_control import *
rospy.init_node('test_node') # initialzing the node with name "publisher_py"


pub_directionx = rospy.Publisher('X_Target', Float32, queue_size=10)
pub_directiony = rospy.Publisher('Y_Target', Float32, queue_size=10)
pub_directionz = rospy.Publisher('Z_Target', Float32, queue_size=10)
#pub_position = rospy.Publisher('position', Float32MultiArray,queue_size=10)
# rospy.loginfo("publisher_py node started and publishing data on topic_py")

rate = rospy.Rate(100) # 10hz


while not rospy.is_shutdown(): # run the node until Ctrl-C is pressed
    a = float(input("enter x: "))
    b = float(input("enter y: "))
    c = float(input("enter z: "))
    pub_directionx.publish(a)
    pub_directiony.publish(b)
    pub_directionz.publish(c)
    rate.sleep() # This makes the loop to iterate at 10Hz i.e., 10 times a sec.
