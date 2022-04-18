#!/usr/bin/env python3
import rospy
from std_msgs.msg import Bool, Float32, Int16
from boris_manipulator.srv import localization, localizationResponse

X_distance0 = Float32()
X_distance0.data = 300.0
Y_distance0 = Float32()
Y_distance0.data = 0.0 

X_distance1 = Float32()
X_distance1.data = 200.0
Y_distance1 = Float32()
Y_distance1.data = 0.0 

X_distance2 = Float32()
X_distance2.data = 300.0
Y_distance2 = Float32()
Y_distance2.data = 100.0 

X_Busy = Bool()
X_Busy.data = False
Y_Busy = Bool()
Y_Busy.data = False
Z_Busy = Bool()
Z_Busy.data = False

Ready = Bool()
Ready.data = False

rospy.wait_for_service('localization')
laser_position_origin = localizationResponse()
laser_position_1 = localizationResponse()
laser_position_2 = localizationResponse()

def X_Busy_callback(x_Busy):
    X_Busy.data = x_Busy.data

def Y_Busy_callback(y_Busy):
    Y_Busy.data = y_Busy.data

def Z_Busy_callback(z_Busy):
    Z_Busy.data = z_Busy.data

def Setup_complete_callback(msg_callback):
    Ready.data = msg_callback.data

def laser_localization():	
	try:	
		get_locatlization_data = rospy.ServiceProxy('localization',localization)
		response = get_locatlization_data()
		return response
		# rate.sleep()
	except rospy.ServiceException as e:
		print("service call failed %s",e )

def calibrate():
    while Ready.data != True:
        # print('waiting for the setup to complete')
        rospy.sleep(0.5)
        # rospy.spin()

    print("Calibration start")
    print("SEEKING COORDINATE TRANSFORM")

    # first move it to the robot_origin
    
    pub_directionx.publish(X_distance0)
    pub_directiony.publish(Y_distance0)
    rospy.sleep(1)
    
    while (X_Busy.data == True):
        # print('moving') 
        rospy.sleep(0.5)   
    print('done moving')
    rospy.sleep(1)
    laser_position_origin = laser_localization()
    print(laser_position_origin)

    # move the robot to 100 mm along robot's X
    
    rospy.sleep(2)
    pub_directionx.publish(X_distance1)
    pub_directiony.publish(Y_distance1)
    rospy.sleep(1)

    while (X_Busy.data == True):
        # print('moving') 
        rospy.sleep(0.5) 
    print('done moving')
    laser_position_1 = laser_localization()
    print(laser_position_1)
    rospy.sleep(2)

    # first move it to the robot_origin
    
    pub_directionx.publish(X_distance2)
    pub_directiony.publish(Y_distance2)
    rospy.sleep(1)
    
    while (Y_Busy.data == True):
        # print('moving') 
        rospy.sleep(0.5)   
    print('done moving')
    rospy.sleep(1)
    laser_position_2 = laser_localization()
    print(laser_position_2)
    rospy.sleep(1)

    # exiting by moving the actuator back to origin
    pub_directionx.publish(X_distance0)
    pub_directiony.publish(Y_distance0)
    rospy.sleep(1)
    return True


rospy.Subscriber('X_BusyFlag',Bool,X_Busy_callback,queue_size = 10)
rospy.Subscriber('Y_BusyFlag',Bool,Y_Busy_callback,queue_size = 10)
rospy.Subscriber('Z_BusyFlag',Bool,Z_Busy_callback,queue_size = 10)

rospy.Subscriber('Setup_Complete',Bool,Setup_complete_callback,queue_size = 10)

pub_directionx = rospy.Publisher('X_Target', Float32, queue_size=10)
pub_directiony = rospy.Publisher('Y_Target', Float32, queue_size=10)
pub_directionz = rospy.Publisher('Z_Target', Float32, queue_size=10)


rospy.init_node('calibration',anonymous = True)

calibration_complete = calibrate()
rate = rospy.Rate(10)
while not rospy.is_shutdown():
    rate.sleep()