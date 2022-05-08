#!/usr/bin/env python3
import rospy
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from std_msgs.msg import Bool, Float32, Int16
from boris_manipulator.srv import localization, localizationResponse

convert = CvBridge()

X_distance0 = Float32()
X_distance0.data = 0.0
Y_distance0 = Float32()
Y_distance0.data = 0.0 
Z_distance0 = Float32()
Z_distance0.data = 0.0

X_distance1 = Float32()
X_distance1.data = 100.0
Y_distance1 = Float32()
Y_distance1.data = 0.0 
Z_distance1 = Float32()
Z_distance1.data = 0.0

X_distance2 = Float32()
X_distance2.data = 0.0
Y_distance2 = Float32()
Y_distance2.data = 100.0 
Z_distance2 = Float32()
Z_distance2.data = 0.0

X_distance3 = Float32()
X_distance3.data = 0.0
Y_distance3 = Float32()
Y_distance3.data = 0.0 
Z_distance3 = Float32()
Z_distance3.data = -10

X_distance4 = Float32()
X_distance4.data = 0.0
Y_distance4 = Float32()
Y_distance4.data = 0.0
Z_distance4 = Float32()
Z_distance4.data = 0.0

calibration_complete = Bool()
calibration_complete.data = False

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
laser_position_3 = localizationResponse()



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

def position_offset():	
	try:	
		get_position_offset_data = rospy.ServiceProxy('control_signals',control)
		response = get_position_offset_data()
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
    pub_directionz.publish(Z_distance0)
    rospy.sleep(1)
    
    while (X_Busy.data == True):
        # print('moving') 
        rospy.sleep(0.5)   
    print('done moving')
    rospy.sleep(2)
    laser_position_origin = laser_localization()
    print(laser_position_origin)
    rospy.sleep(2)
    
    # move the robot to -10 mm along robot's Z
    
    pub_directionx.publish(X_distance3)
    pub_directiony.publish(Y_distance3)
    pub_directionz.publish(Z_distance3)
    rospy.sleep(1)

    while (Z_Busy.data == True):
        # print('moving') 
        rospy.sleep(0.5) 
    print('done moving')
    rospy.sleep(2)
    laser_position_3 = laser_localization()
    print(laser_position_3)
    rospy.sleep(2)

    # move the robot to 100 mm along robot's X
    
    pub_directionx.publish(X_distance1)
    pub_directiony.publish(Y_distance1)
    pub_directionz.publish(Z_distance1)
    rospy.sleep(1)

    while (X_Busy.data == True):
        # print('moving') 
        rospy.sleep(0.5) 
    print('done moving')
    rospy.sleep(2)
    laser_position_1 = laser_localization()
    print(laser_position_1)
    rospy.sleep(2)

    # move the robot to 100 mm along robot's Y
    
    pub_directionx.publish(X_distance2)
    pub_directiony.publish(Y_distance2)
    pub_directionz.publish(Z_distance2)
    rospy.sleep(1)
    
    while (Y_Busy.data == True):
        # print('moving') 
        rospy.sleep(0.5)   
    print('done moving')
    rospy.sleep(2)
    laser_position_2 = laser_localization()
    print(laser_position_2)
    rospy.sleep(2)

    # exiting by moving the actuator back to origin
    pub_directionx.publish(X_distance0)
    pub_directiony.publish(Y_distance0)
    pub_directionz.publish(Z_distance0)
    rospy.sleep(1)

    while (Y_Busy.data == True):
        # print('moving') 
        rospy.sleep(0.5)   
    print('done moving')
    rospy.sleep(2)

    origin_point = np.array([[laser_position_origin.position_x],[laser_position_origin.position_y],[laser_position_origin.position_z]])
    first_point = np.array([[laser_position_1.position_x],[laser_position_1.position_y],[laser_position_1.position_z]])
    second_point = np.array([[laser_position_2.position_x],[laser_position_2.position_y],[laser_position_2.position_z]])
    third_point = np.array([[laser_position_3.position_x],[laser_position_3.position_y],[laser_position_3.position_z]])
    T = np.append(np.append(np.append(np.append((first_point - origin_point)/100,(second_point - origin_point)/100,axis = 1),(third_point - origin_point)/10,axis = 1),origin_point,axis=1),np.array([[0,0,0,1]]),axis = 0)
    Rot = T[:3,:3]
    T_inv = np.identity(4) # np.append(np.append(Rot.T,-np.matmul(Rot.T,origin_point),axis=1),np.array([[0,0,0,1]]),axis = 0)
    transformation_matrix = convert.cv2_to_imgmsg(T_inv)
    pub_tranformation.publish(transformation_matrix)
    
    return True


rospy.Subscriber('/X_BusyFlag',Bool,X_Busy_callback,queue_size = 10)
rospy.Subscriber('/Y_BusyFlag',Bool,Y_Busy_callback,queue_size = 10)
rospy.Subscriber('/Z_BusyFlag',Bool,Z_Busy_callback,queue_size = 10)

rospy.Subscriber('/Setup_Complete',Bool,Setup_complete_callback,queue_size = 10)

pub_directionx = rospy.Publisher('/X_Target', Float32, queue_size=10)
pub_directiony = rospy.Publisher('/Y_Target', Float32, queue_size=10)
pub_directionz = rospy.Publisher('/Z_Target', Float32, queue_size=10)
pub_calibration_complete = rospy.Publisher('/calibration_complete',Bool, queue_size=1)
pub_tranformation = rospy.Publisher('/transformation', Image, queue_size = 1)


rospy.init_node('calibration',anonymous = True)

calibration_complete.data = calibrate()
pub_calibration_complete.publish(calibration_complete)  
rate = rospy.Rate(10)
while not rospy.is_shutdown():
    rate.sleep()



'''
target_point = np.array([[119.75],[1667.65],[-674.75],[1]])
transposed_data = np.matmul(T_inv,target_point)
X_distance4.data = transposed_data[0][0]
Y_distance4.data = transposed_data[1][0]
Z_distance4.data = transposed_data[2][0]

pub_directionx.publish(X_distance4)
pub_directiony.publish(Y_distance4)
pub_directionz.publish(Z_distance4)
print(transposed_data)
print(Rot.T)
rospy.sleep(2)
while ((X_Busy.data == True) or (Y_Busy.data == True)):
    # print('moving') 
    rospy.sleep(0.5)   
print('done moving')
rospy.sleep(2)

position_offset_1 = position_offset()
print(position_offset_1)
# if(np.absolute(position_offset_1.distance_x) > 0.06 or np.absolute(position_offset_1.distance_y > 0.06) or np.absolute(position_offset_1.distance_z) > 0.06 ):
position_offset_p1 = np.array([[position_offset_1.distance_x],[position_offset_1.distance_y],[-position_offset_1.distance_z]])
new_pose = transposed_data[:3] + np.matmul(Rot.T,position_offset_p1)

X_distance4.data = new_pose[0][0]
Y_distance4.data = new_pose[1][0]
Z_distance4.data = new_pose[2][0]

pub_directionx.publish(X_distance4)
pub_directiony.publish(Y_distance4)
pub_directionz.publish(Z_distance4)

while ((X_Busy.data == True) or (Y_Busy.data == True)):
    # print('moving') 
    rospy.sleep(0.5)   
print('done moving')
rospy.sleep(2)

print('done correcting')
'''