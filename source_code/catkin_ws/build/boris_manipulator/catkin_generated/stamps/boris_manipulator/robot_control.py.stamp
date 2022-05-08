#! /usr/bin/env python3
import rospy
from std_msgs.msg import Bool, Float32, Int16
from pymodbus.client.sync import ModbusTcpClient
client = ModbusTcpClient('192.168.1.7')

X_Busy = Bool()
X_Busy.data = False
Y_Busy = Bool()
Y_Busy.data = False
Z_Busy = Bool()
Z_Busy.data = False
Ready = Bool()
Ready.data = False

class Motor:
    def __init__(self, axis):
        self.axis = axis # axis = 0 for X, 1 for Y and 2 for Z
        self.target = Float32()
        self.target.data = 0.0
        self.current_position = Float32()
        self.current_position.data = 0.0
        self.i_target = 0
    
    def move_actuator(self):
        self.i_target = int(self.target.data*50) # 0.02 resolution of the robot
        client.write_registers(self.axis*2 ,self.i_target) 

    def get_current_position(self):
        self.current_position.data = (client.read_holding_registers(self.axis*2+1).registers[0])*0.02

X_motor = Motor(0)
Y_motor = Motor(1)
Z_motor = Motor(2)

def X_Busy_callback(x_Busy):
    X_Busy.data = x_Busy.data

def Y_Busy_callback(y_Busy):
    Y_Busy.data = y_Busy.data

def Z_Busy_callback(z_Busy):
    Z_Busy.data = z_Busy.data

def Setup_complete_callback(msg_callback):
    Ready.data = msg_callback.data

def X_Target_callback(x_msg_callback):
    X_motor.target.data = 300.0 - x_msg_callback.data + 0.000001
    if (Ready.data == True) and (X_Busy.data == False):
        X_motor.move_actuator()

def Y_Target_callback(y_msg_callback):
    Y_motor.target.data = y_msg_callback.data + 0.000001
    if (Ready.data == True) and (X_Busy.data == False):
        Y_motor.move_actuator()

def Z_Target_callback(z_msg_callback):
    Z_motor.target.data = -(z_msg_callback.data) + 0.000001
    if Z_motor.target.data <= -1:
        Z_motor.target.data = 0
    if (Ready.data == True) and (X_Busy.data == False):
        Z_motor.move_actuator()


rospy.Subscriber('X_Target',Float32,X_Target_callback,queue_size = 10)
rospy.Subscriber('Y_Target',Float32,Y_Target_callback,queue_size = 10)
rospy.Subscriber('Z_Target',Float32,Z_Target_callback,queue_size = 10)

rospy.Subscriber('X_BusyFlag',Bool,X_Busy_callback,queue_size = 10)
rospy.Subscriber('Y_BusyFlag',Bool,Y_Busy_callback,queue_size = 10)
rospy.Subscriber('Z_BusyFlag',Bool,Z_Busy_callback,queue_size = 10)

rospy.Subscriber('Setup_Complete',Bool,Setup_complete_callback,queue_size = 10)

pub_current_position_x = rospy.Publisher('X_Pose',Float32,queue_size = 10)
pub_current_position_y = rospy.Publisher('Y_Pose',Float32,queue_size = 10)
pub_current_position_z = rospy.Publisher('Z_Pose',Float32,queue_size = 10)

rospy.init_node('Robot_control')

rate = rospy.Rate(100)

while not rospy.is_shutdown():
    X_motor.get_current_position()
    Y_motor.get_current_position()
    Z_motor.get_current_position()
    pub_current_position_x.publish(X_motor.current_position)
    pub_current_position_y.publish(Y_motor.current_position)
    pub_current_position_z.publish(Z_motor.current_position)
    rate.sleep()