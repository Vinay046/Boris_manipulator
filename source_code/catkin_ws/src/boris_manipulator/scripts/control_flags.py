#! /usr/bin/env python3
'''
This node is used to communicate with the PLC to acquire and bring all the control flags that control the robot in the PLC to the ROS network.
'''

import rospy
from pymodbus.client.sync import ModbusTcpClient
client = ModbusTcpClient('192.168.1.7')
from std_msgs.msg import Bool

class Motor:
    def __init__(self, axis):
        self.SVON = Bool()
        self.ResetFlag = Bool()
        self.SetupFlag = Bool()
        self.BusyFlag = Bool()
        self.SetOnFlag = Bool()
        self.axis = axis # axis = 0 for X, 1 for Y and 2 for Z
        self.SVON.data = True
        self.ResetFlag.data = False
        self.SetupFlag.data = False
        self.BusyFlag.data = False
        self.SetOnFlag.data = False
        client.write_coil(self.axis+8194,self.SVON.data)
    def set_SVON(self):
        client.write_coil(self.axis+8194,self.SVON.data) # write the correct function call to write to the flag

    def set_ResetFlag(self):
        client.write_coil(self.axis+8200,self.ResetFlag.data) # write the correct function call to write to the flag

    def set_SetupFlag(self):
        client.write_coil(self.axis+8203,self.SetupFlag.data) # write the correct function call to write to the flag

    def get_BusyFlag_status(self):
        self.BusyFlag.data = client.read_coils(self.axis+8197).bits[0] # write the correct function call to read the flag register and return it

    def get_SetOnFlag_status(self):
        self.SetOnFlag.data = client.read_coils(self.axis+8206).bits[0] # write the correct function call to read the flag register and return it

X_motor = Motor(0)
Y_motor = Motor(1)
Z_motor = Motor(2)

def X_SVON_callback(x_SVON):
    X_motor.SVON = x_SVON
    X_motor.set_SVON()

def Y_SVON_callback(y_SVON):
    Y_motor.SVON = y_SVON
    Y_motor.set_SVON()

def Z_SVON_callback(z_SVON):
    Z_motor.SVON = z_SVON
    Z_motor.set_SVON()

def X_reset_flag_callback(x_reset):
    X_motor.ResetFlag = x_reset
    X_motor.set_ResetFlag()

def Y_reset_flag_callback(y_reset):
    Y_motor.ResetFlag = y_reset
    Y_motor.set_ResetFlag()

def Z_reset_flag_callback(z_reset):
    Z_motor.ResetFlag = z_reset
    Z_motor.set_ResetFlag()

def X_setup_flag_callback(x_setup):
    X_motor.SetupFlag = x_setup
    X_motor.set_SetupFlag()

def Y_setup_flag_callback(y_setup):
    Y_motor.SetupFlag = y_setup
    Y_motor.set_SetupFlag()

def Z_setup_flag_callback(z_setup):
    Z_motor.SetupFlag = z_setup
    Z_motor.set_SetupFlag()


rospy.init_node('control_flags')

rospy.Subscriber('X_SVON',Bool,X_SVON_callback,queue_size = 10)
rospy.Subscriber('Y_SVON',Bool,Y_SVON_callback,queue_size = 10)
rospy.Subscriber('Z_SVON',Bool,Z_SVON_callback,queue_size = 10)

rospy.Subscriber('X_ResetFlag',Bool,X_reset_flag_callback,queue_size = 10)
rospy.Subscriber('Y_ResetFlag',Bool,Y_reset_flag_callback,queue_size = 10)
rospy.Subscriber('Z_ResetFlag',Bool,Z_reset_flag_callback,queue_size = 10)

rospy.Subscriber('X_SetupFlag',Bool,X_setup_flag_callback,queue_size = 10)
rospy.Subscriber('Y_SetupFlag',Bool,Y_setup_flag_callback,queue_size = 10)
rospy.Subscriber('Z_SetupFlag',Bool,Z_setup_flag_callback,queue_size = 10)

pub_busy_x = rospy.Publisher('X_BusyFlag', Bool, queue_size=10)
pub_busy_y = rospy.Publisher('Y_BusyFlag', Bool, queue_size=10)
pub_busy_z = rospy.Publisher('Z_BusyFlag', Bool, queue_size=10)

pub_seton_x = rospy.Publisher('X_SetOnFlag', Bool, queue_size=10)
pub_seton_y = rospy.Publisher('Y_SetOnFlag', Bool, queue_size=10)
pub_seton_z = rospy.Publisher('Z_SetOnFlag', Bool, queue_size=10)

rate = rospy.Rate(100) # hertz

while not rospy.is_shutdown():
    X_motor.get_BusyFlag_status()
    Y_motor.get_BusyFlag_status()
    Z_motor.get_BusyFlag_status()
    X_motor.get_SetOnFlag_status()
    Y_motor.get_SetOnFlag_status()
    Z_motor.get_SetOnFlag_status()
    pub_busy_x.publish(X_motor.BusyFlag)
    pub_busy_y.publish(Y_motor.BusyFlag)
    pub_busy_z.publish(Z_motor.BusyFlag)
    pub_seton_x.publish(X_motor.SetOnFlag)
    pub_seton_y.publish(Y_motor.SetOnFlag)
    pub_seton_z.publish(Z_motor.SetOnFlag)

    rate.sleep()