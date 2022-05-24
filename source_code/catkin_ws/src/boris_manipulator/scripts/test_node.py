#!/usr/bin/env python3
import rospy
import math
from std_msgs.msg import Float32, Bool # Messages used in the node must be imported.
#from robot_control import *
rospy.init_node('test_node') # initialzing the node with name "publisher_py"
X = Float32()
X.data = 0.0
Y = Float32()
Y.data = 0.0
Z = Float32()
Z.data = 0.0
down = Bool()
down.data = False
X_Busy = Bool()
X_Busy.data = False
Y_Busy = Bool()
Y_Busy.data = False
Z_Busy = Bool()
Z_Busy.data = False

X_pose = Float32()
X_pose.data = 0.0
Y_pose = Float32()
Y_pose.data = 0.0
Z_pose = Float32()
Z_pose.data = 0.0

Ready = Bool()
Ready.data = False

def X_Busy_callback(x_Busy):
    X_Busy.data = x_Busy.data

def Y_Busy_callback(y_Busy):
    Y_Busy.data = y_Busy.data

def Z_Busy_callback(z_Busy):
    Z_Busy.data = z_Busy.data

def X_pose_callback(X_msg):
    X_pose.data = X_msg.data
def Y_pose_callback(Y_msg):
    Y_pose.data = Y_msg.data
def Z_pose_callback(Z_msg):
    Z_pose.data = Z_msg.data


def Setup_complete_callback(msg_callback):
    Ready.data = msg_callback.data

def Z_down_callback(z_down):
    down.data = z_down.data

pub_directionx = rospy.Publisher('X_Target', Float32, queue_size=10)
pub_directiony = rospy.Publisher('Y_Target', Float32, queue_size=10)
pub_directionz = rospy.Publisher('Z_Target', Float32, queue_size=10)

rospy.Subscriber('/X_BusyFlag',Bool,X_Busy_callback,queue_size = 10)
rospy.Subscriber('/Y_BusyFlag',Bool,Y_Busy_callback,queue_size = 10)
rospy.Subscriber('/Z_BusyFlag',Bool,Z_Busy_callback,queue_size = 10)

rospy.Subscriber('/X_Pose',Float32,X_pose_callback,queue_size = 10)
rospy.Subscriber('/Y_Pose',Float32,Y_pose_callback,queue_size = 10)
rospy.Subscriber('/Z_Pose',Float32,Z_pose_callback,queue_size = 10)

rospy.Subscriber('/Setup_Complete',Bool,Setup_complete_callback,queue_size = 10)

rospy.Subscriber('/down',Bool,Z_down_callback,queue_size = 10)

#pub_position = rospy.Publisher('position', Float32MultiArray,queue_size=10)
# rospy.loginfo("publisher_py node started and publishing data on topic_py")

rate = rospy.Rate(100) # 10hz

def task():
    while Ready.data != True:
        # print('waiting for the setup to complete')
        rospy.sleep(0.5)
    print('done with setup')
    X.data = 5.0
    Y.data = 0.0
    Z.data = -30.0
    pub_directionx.publish(X)
    pub_directiony.publish(Y)
    pub_directionz.publish(Z)
    rospy.sleep(2)
    while ((X_Busy.data == True) or (Y_Busy.data == True) or (Z_Busy.data == True)):
        # print('moving') 
        rospy.sleep(0.5)
    while(X.data <= 295):
        Y.data = 0.0
        while(Y.data <= 300):
            pub_directionx.publish(X)
            pub_directiony.publish(Y)
            pub_directionz.publish(Z)
            rospy.sleep(1)
            while ((X_Busy.data == True) or (Y_Busy.data == True) or (Z_Busy.data == True)):
                # print('moving') 
                rospy.sleep(0.5)
            rospy.sleep(1)
            while(down.data == False):
                Z.data -= 0.2
                pub_directionz.publish(Z)
                rospy.sleep(0.5)
                while ((Z_Busy.data == True)):
                    # print('moving') 
                    rospy.sleep(0.5)
            print(Z.data)
            a = input('press any button to continue')
            Y.data += 30.0
            Z.data = -30.0
        X.data += 30.0

task()
while not rospy.is_shutdown(): # run the node until Ctrl-C is pressed
    
    rate.sleep() # This makes the loop to iterate at 10Hz i.e., 10 times a sec.
