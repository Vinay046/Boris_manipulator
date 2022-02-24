# !/usr/bin/env python
import rospy
# print('imported rospy')
from boris_manipulator.srv import localization, localizationResponse
# print('imported service files')
rospy.init_node('client_node')
rospy.wait_for_service('localization')
rate = rospy.Rate(10)	
def laser_localization():	
	try:	
		get_locatlization_data = rospy.ServiceProxy('localization',localization)
		response = get_locatlization_data()
		return response
		# rate.sleep()
	except rospy.ServiceException as e:
		print("service call failed %s",e )

if __name__ == '__main__':
	while not rospy.is_shutdown():	
		laser_position = localizationResponse()
		laser_position = laser_localization()
		print(laser_position)