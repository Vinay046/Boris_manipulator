#! /usr/bin/env python3


# Redo the file with correct sequence
import rospy
import time
from std_msgs.msg import Bool
from pymodbus.client.sync import ModbusTcpClient
client = ModbusTcpClient('192.168.1.7')

Setup_Complete = Bool()
Setup_Complete.data = False

X_SVON = Bool()
X_SVON.data = True
X_Reset = Bool()
X_Reset.data = False
X_Setup = Bool()
X_Setup.data = False
X_Busy = Bool()
X_Busy.data = False
X_SetOn = Bool()
X_SetOn.data = False

Y_SVON = Bool()
Y_SVON.data = True
Y_Reset = Bool()
Y_Reset.data = False
Y_Setup = Bool()
Y_Setup.data = False
Y_Busy = Bool()
Y_Busy.data = False
Y_SetOn = Bool()
Y_SetOn.data = False

Z_SVON = Bool()
Z_SVON.data = True
Z_Reset = Bool()
Z_Reset.data = False
Z_Setup = Bool()
Z_Setup.data = False
Z_Busy = Bool()
Z_Busy.data = False
Z_SetOn = Bool()
Z_SetOn.data = False

# 2 publishers per motor SVON and Setup
# 2 subscriber per motor Busy and SetOn

def X_Busy_callback(x_Busy):
    X_Busy.data = x_Busy.data

def Y_Busy_callback(y_Busy):
    Y_Busy.data = y_Busy.data

def Z_Busy_callback(z_Busy):
    Z_Busy.data = z_Busy.data

def X_SetOn_callback(x_SetOn):
    # print('before',X_SetOn)
    X_SetOn.data = x_SetOn.data    

def Y_SetOn_callback(y_SetOn):
    Y_SetOn.data = y_SetOn.data

def Z_SetOn_callback(z_SetOn):
    Z_SetOn.data = z_SetOn.data

def turn_motor_on_for_motion():
    client.write_coil(8193,True)
    client.close()

rospy.init_node('setup_node')

rospy.Subscriber('X_BusyFlag',Bool,X_Busy_callback,queue_size = 10)
rospy.Subscriber('Y_BusyFlag',Bool,Y_Busy_callback,queue_size = 10)
rospy.Subscriber('Z_BusyFlag',Bool,Z_Busy_callback,queue_size = 10)

rospy.Subscriber('X_SetOnFlag',Bool,X_SetOn_callback,queue_size = 10)
rospy.Subscriber('Y_SetOnFlag',Bool,Y_SetOn_callback,queue_size = 10)
rospy.Subscriber('Z_SetOnFlag',Bool,Z_SetOn_callback,queue_size = 10)

pub_setup_complete = rospy.Publisher('Setup_Complete', Bool, queue_size=10)

pub_setup_x = rospy.Publisher('X_SetupFlag', Bool, queue_size=10)
pub_setup_y = rospy.Publisher('Y_SetupFlag', Bool, queue_size=10)
pub_setup_z = rospy.Publisher('Z_SetupFlag', Bool, queue_size=10)

delay = rospy.Rate(0.25)
rate = rospy.Rate(100)
while not rospy.is_shutdown():
    delay.sleep()
    while not (X_SetOn.data and Y_SetOn.data and Z_SetOn.data) :
        delay.sleep()
        X_Setup.data = True
        Y_Setup.data = True
        Z_Setup.data = True
        pub_setup_x.publish(X_Setup)
        pub_setup_y.publish(Y_Setup)
        pub_setup_z.publish(Z_Setup)
    X_Setup.data = False
    pub_setup_x.publish(X_Setup)
    Y_Setup.data = False
    pub_setup_y.publish(Y_Setup)
    Z_Setup.data = False
    pub_setup_z.publish(Z_Setup)
    delay.sleep()
    rospy.on_shutdown(turn_motor_on_for_motion)
    if (X_SetOn.data and Y_SetOn.data and Z_SetOn.data):
        Setup_Complete.data = True
        pub_setup_complete.publish(Setup_Complete)
        print('Setup is now complete and the robot is ready to move')
        rospy.signal_shutdown("setup complete and the node is going to exit")
    rate.sleep()