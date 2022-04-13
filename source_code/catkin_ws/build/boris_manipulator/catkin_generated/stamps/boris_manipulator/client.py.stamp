# !/usr/bin/env python
import rospy
from pymodbus.client.sync import ModbusTcpClient
client = ModbusTcpClient('192.168.1.7')
import math
import numpy as np
# print('imported rospy')
from boris_manipulator.srv import localization, localizationResponse, control, controlResponse
# print('imported service files')
rospy.init_node('client_node')
rospy.wait_for_service('localization')
rate = rospy.Rate(1)	
laser_position_old = localizationResponse()
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

def calculate_orientation():
	# Need to write a subroutine to calculate the initial transformation matrix of the robot
	# save the transformation in the inverse kinematics?? need to record this as a robot's configuration
	pass

def turn_robot_on():
	client.write_coil(8194,True)# turn on 192.168.1.241
	client.write_coil(8195,True)# turn on 192.168.1.242
	client.write_coil(8196,True)# turn on 192.168.1.240

def turn_robot_off():
	client.write_coil(8194,False)# turn on 192.168.1.241
	client.write_coil(8195,False)# turn on 192.168.1.242
	client.write_coil(8196,False)# turn on 192.168.1.240

if __name__ == '__main__':
	# while not rospy.is_shutdown():	
	# 	laser_position_old = laser_localization()
	# 	# print(laser_position_old)
	# 	control_signal = control_signal_received()
	# 	# print(control_signal)
	# 	X = int(input("enter X"))
	# 	Y = int(input("enter Y"))
	# 	Z = int(input("enter Z"))
	# 	client.write_registers(1,X)#int(control_signal.distance_x))
	# 	client.write_registers(2,Y)#int(control_signal.distance_y))
	# 	client.write_registers(3,Z)#int(control_signal.distance_z))
		
	# # input('press enter to continue the execution')
	# # laser_position_new = localizationResponse()
	# # laser_position_new = laser_localization()
	# # orientation = math.degrees(math.atan((laser_position_old.position_x - laser_position_new.position_x)/(laser_position_old.position_y-laser_position_new.position_y)))
	# # print(orientation)
	# # transformation_matrix = np.matrix('math.cos(orientation) -math.sin(orientation) 0 0; math.sin(orientation) math.cos(orientation) 0 0; 0 0 1 0; 0 0 0 1')
	# # print(transformation_matrix)
	# 	rate.sleep()
	client.close()