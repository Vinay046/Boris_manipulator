# !/usr/bin/env python
import rospy
from boris_manipulator.srv import multiply, multiplyResponse#, multiplyRequest


def callback(request):
	return multiplyResponse(request.a+request.b)

def multiplier():
	rospy.init_node("multiplier_service")
	service = rospy.Service("multiply",multiply, callback)
	rospy.spin()

if __name__ == '__main__':
	multiplier()