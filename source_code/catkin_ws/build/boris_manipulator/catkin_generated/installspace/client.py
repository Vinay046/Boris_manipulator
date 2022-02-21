# !/usr/bin/env python
import rospy
# print('imported rospy')
from boris_manipulator.srv import multiply, multiplyResponse
# print('imported service files')

def multiplier_client(x,y):
	rospy.init_node('client_node')
	rospy.wait_for_service('multiply')
	rate = rospy.Rate(1)
	while not rospy.is_shutdown():
		try:
			multiply_two_integers = rospy.ServiceProxy('multiply',multiply)
			response = multiply_two_integers(x,y)
			print(response.result)
			rate.sleep()
		except rospy.ServiceException as e:
			print("service call failed %s",e )

if __name__ == '__main__':
	multiplier_client(72,3)

