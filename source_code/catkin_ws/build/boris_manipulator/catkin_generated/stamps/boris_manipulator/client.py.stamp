# !/usr/bin/env python
import rospy
import math
import numpy as np
# print('imported rospy')
from boris_manipulator.srv import localization, localizationResponse
# print('imported service files')
rospy.init_node('client_node')
rospy.wait_for_service('localization')
rate = rospy.Rate(10)	
laser_position_old = localizationResponse()
def laser_localization():	
	try:	
		get_locatlization_data = rospy.ServiceProxy('localization',localization)
		response = get_locatlization_data()
		return response
		# rate.sleep()
	except rospy.ServiceException as e:
		print("service call failed %s",e )

def calculate_orientation():
	pass

if __name__ == '__main__':
	while not rospy.is_shutdown():	
		laser_position_old = laser_localization()
		print(laser_position_old)
	# input('press enter to continue the execution')
	# laser_position_new = localizationResponse()
	# laser_position_new = laser_localization()
	# orientation = math.degrees(math.atan((laser_position_old.position_x - laser_position_new.position_x)/(laser_position_old.position_y-laser_position_new.position_y)))
	# print(orientation)
	# transformation_matrix = np.matrix('math.cos(orientation) -math.sin(orientation) 0 0; math.sin(orientation) math.cos(orientation) 0 0; 0 0 1 0; 0 0 0 1')
	# print(transformation_matrix)
		rate.sleep()