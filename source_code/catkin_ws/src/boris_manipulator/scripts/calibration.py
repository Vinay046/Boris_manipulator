#!/usr/bin/env python3
import rospy
from std_msgs.msg import Bool, Float32, Int16
from boris_manipulator.srv import localization, localizationResponse, control, controlResponse
X_distance = Float32()
X_distance.data = 0.0
Y_distance = Float32()
Y_distance.data = 0.0 
Z_distance = Float32()
Z_distance.data = 0.0
X_Busy = Bool()
X_Busy.data = False
Y_Busy = Bool()
Y_Busy.data = False
Z_Busy = Bool()
Z_Busy.data = False
def X_Busy_callback(x_Busy):
    X_Busy.data = x_Busy.data

def Y_Busy_callback(y_Busy):
    Y_Busy.data = y_Busy.data

def Z_Busy_callback(z_Busy):
    Z_Busy.data = z_Busy.data

rospy.Subscriber('X_BusyFlag',Bool,X_Busy_callback,queue_size = 10)
rospy.Subscriber('Y_BusyFlag',Bool,Y_Busy_callback,queue_size = 10)
rospy.Subscriber('Z_BusyFlag',Bool,Z_Busy_callback,queue_size = 10)

pub_directionx = rospy.Publisher('X_Target', Float32, queue_size=10)
pub_directiony = rospy.Publisher('Y_Target', Float32, queue_size=10)
pub_directionz = rospy.Publisher('Z_Target', Float32, queue_size=10)

# rate = rospy.Rate(100)

rospy.init_node('calibration')
rospy.wait_for_service('localization')
rospy.wait_for_service('control_signals')
laser_position_old = localizationResponse()
laser_position_new = localizationResponse()
def laser_localization():	
	try:	
		get_locatlization_data = rospy.ServiceProxy('localization',localization)
		response = get_locatlization_data()
		return response
		# rate.sleep()
	except rospy.ServiceException as e:
		print("service call failed %s",e )


def control_signal_received():
	try:
		get_control_signal = rospy.ServiceProxy('control_signals',control)
		response = get_control_signal()
		return response
	except rospy.ServiceException as e:
		print("service call failed %s",e)

delay = rospy.Rate(1)
while not rospy.is_shutdown(): # run the node until Ctrl-C is pressed
    pub_directionx.publish(X_distance)
    pub_directiony.publish(Y_distance)
    pub_directionz.publish(Z_distance)
    delay.sleep()
    if not (X_Busy.data and Y_Busy.data and Z_Busy.data):
        laser_position_old = laser_localization()
        print(laser_position_old)
    else:
        pass
