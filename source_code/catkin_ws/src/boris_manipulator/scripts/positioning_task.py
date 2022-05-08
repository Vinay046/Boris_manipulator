#!/usr/bin/env python3
import rospy
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from std_msgs.msg import Bool, Float32, Int16
from boris_manipulator.srv import control, controlResponse

convert = CvBridge()

X_distance0 = Float32()
X_distance0.data = 0.0
Y_distance0 = Float32()
Y_distance0.data = 0.0 
Z_distance0 = Float32()
Z_distance0.data = 0.0

X_Busy = Bool()
X_Busy.data = False
Y_Busy = Bool()
Y_Busy.data = False
Z_Busy = Bool()
Z_Busy.data = False

Ready = Bool()
Ready.data = False

rospy.wait_for_service('control_signals')
position_offset_1 = controlResponse()

def X_Busy_callback(x_Busy):
    X_Busy.data = x_Busy.data

def Y_Busy_callback(y_Busy):
    Y_Busy.data = y_Busy.data

def Z_Busy_callback(z_Busy):
    Z_Busy.data = z_Busy.data

def calibration_complete_callback(msg_callback):
    Ready.data = msg_callback.data

def position_offset():	
	try:	
		get_position_offset_data = rospy.ServiceProxy('control_signals',control)
		response = get_position_offset_data()
		return response
		# rate.sleep()
	except rospy.ServiceException as e:
		print("service call failed %s",e )

def listen_transformation():
    Transformation= np.asarray(convert.imgmsg_to_cv2(rospy.wait_for_message('/transformation',Image)))
    return Transformation

def ready_for_positioning():
    while Ready.data != True:
        # print('waiting for the setup to complete')
        rospy.sleep(0.5)

    print("CALIBRATION COMPLETE")
    print("requesting for Transformation computed")

    T_F = listen_transformation()

    return T_F

def position(target):
    transformation = ready_for_positioning()
    initial_correction = np.matmul(transformation,target)
    X_distance0.data = initial_correction[0][0]
    Y_distance0.data = initial_correction[1][0]
    Z_distance0.data = initial_correction[2][0]
    pub_directionx.publish(X_distance0)
    pub_directiony.publish(Y_distance0)
    pub_directionz.publish(Z_distance0)
    rospy.sleep(1)
    
    while ((X_Busy.data == True) or (Y_Busy.data == True)):
        # print('moving') 
        rospy.sleep(0.5)   
    print('done with initial correction')
    rospy.sleep(2)

    print('Now checking for any residual positioning error')
    position_offset_1 = position_offset()
    if(np.absolute(position_offset_1.distance_x)>0.06 or np.absolute(position_offset_1.distance_y)>0.06 or np.absolute(position_offset_1.distance_z)>0.06):
        position_offset_p1 = np.array([[position_offset_1.distance_x],[position_offset_1.distance_y],[-position_offset_1.distance_z]])
        fine_correction = initial_correction[:3] + np.matmul(Rot.T,position_offset_p1)
        X_distance0.data = fine_correction[0][0]
        Y_distance0.data = fine_correction[1][0]
        Z_distance0.data = fine_correction[2][0]
        pub_directionx.publish(X_distance0)
        pub_directiony.publish(Y_distance0)
        pub_directionz.publish(Z_distance0) 
        while ((X_Busy.data == True) or (Y_Busy.data == True)):
        # print('moving') 
            rospy.sleep(0.5)   
        print('done with fine correction')
        rospy.sleep(2)
        position_offset_1 = position_offset()
        # remove the following 3 lines when testing
        position_offset_1.distance_x = 0.0
        position_offset_1.distance_y = 0.0
        position_offset_1.distance_z = 0.0

    print('completed positioning')
    return True
           
def task():
    target_point = np.array([[150],[150],[0],[1]])
    a = position(target_point)

rospy.init_node('positioning_task',anonymous = True)

rospy.Subscriber('/X_BusyFlag',Bool,X_Busy_callback,queue_size = 10)
rospy.Subscriber('/Y_BusyFlag',Bool,Y_Busy_callback,queue_size = 10)
rospy.Subscriber('/Z_BusyFlag',Bool,Z_Busy_callback,queue_size = 10)

pub_directionx = rospy.Publisher('/X_Target', Float32, queue_size=10)
pub_directiony = rospy.Publisher('/Y_Target', Float32, queue_size=10)
pub_directionz = rospy.Publisher('/Z_Target', Float32, queue_size=10)

rospy.Subscriber('/calibration_complete',Bool,calibration_complete_callback,queue_size = 10)

rate = rospy.Rate(10)

task()
while not rospy.is_shutdown():
    rate.sleep()