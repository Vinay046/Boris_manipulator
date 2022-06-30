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

down = Bool()
down.data = False

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

def Z_down_callback(z_down):
    down.data = z_down.data


def position_offset():	
	try:	
		get_position_offset_data = rospy.ServiceProxy('control_signals',control)
		response = get_position_offset_data()
		return response
		# rate.sleep()
	except rospy.ServiceException as e:
		print("service call failed %s",e )

def listen_transformation():
    Transformation= np.asarray(convert.imgmsg_to_cv2(rospy.wait_for_message('/transformation',Image, timeout = 120)))
    print(Transformation,' received')
    return Transformation

def ready_for_positioning():
    while Ready.data != True:
        # print('waiting for the setup to complete')
        rospy.sleep(0.5)

    print("CALIBRATION COMPLETE")
    print("requesting for Transformation computed")

    T_F = listen_transformation()

    return T_F

def position(target,transformation):
    # transformation = ready_for_positioning()
    initial_correction = np.matmul(transformation,target)
    X_distance0.data = initial_correction[0][0]
    Y_distance0.data = initial_correction[1][0]
    Z_distance0.data = 0 #initial_correction[0][0]
    print(Z_distance0.data)
    pub_directionx.publish(X_distance0)
    pub_directiony.publish(Y_distance0)
    pub_directionz.publish(Z_distance0)
    rospy.sleep(2)
    
    while ((X_Busy.data == True) or (Y_Busy.data == True) or (Z_Busy.data == True)):
        # print('moving') 
        rospy.sleep(0.5)   
    print('done with initial correction')
    rospy.sleep(5)

    print('Now checking for any residual positioning error')
    position_offset_1 = position_offset()
    while(np.absolute(position_offset_1.distance_x)>0.1 or np.absolute(position_offset_1.distance_y)>0.06):# or np.absolute(position_offset_1.distance_z)>0.06):
        if np.absolute(position_offset_1.distance_x) < 0.1:
            position_offset_1.distance_x = 0
        if np.absolute(position_offset_1.distance_y) < 0.06:
            position_offset_1.distance_y =0
        position_offset_p1 = np.array([[position_offset_1.distance_x],[position_offset_1.distance_y],[position_offset_1.distance_z]])
        Rot = transformation[:3,:3]
        fine_correction = initial_correction[:3] + 0.95 * np.matmul(Rot,position_offset_p1)
        X_distance0.data = fine_correction[0][0]
        Y_distance0.data = fine_correction[1][0]
        Z_distance0.data = -36 #np.matmul(Rot,position_offset_p1)[2][0]
        print(np.matmul(Rot,position_offset_p1))
        if Z_distance0.data < -36:
            Z_distance0.data = -36
        # print(fine_correction[2][0])
        pub_directionx.publish(X_distance0)
        pub_directiony.publish(Y_distance0)
        pub_directionz.publish(Z_distance0) 
        print(X_distance0.data,Y_distance0.data,Z_distance0.data)
        rospy.sleep(0.5)
        while ((X_Busy.data == True) or (Y_Busy.data == True) or (Z_Busy.data == True)):
        # print('moving') 
            rospy.sleep(0.5)    
        # print('done with fine correction')
        rospy.sleep(6)
        position_offset_1 = position_offset()

    print('completed positioning')
    rospy.sleep(3)
    print('Fixing X and Y offset to mark the point')
    rospy.sleep(2)
    print('starting offset')
    X_distance0.data -= 36.767
    Y_distance0.data -= 1.8    
    pub_directionx.publish(X_distance0)
    pub_directiony.publish(Y_distance0)
    rospy.sleep(1)
    while ((X_Busy.data == True) or (Y_Busy.data == True)):
        # print('moving') 
        rospy.sleep(0.5)

    print('done with X and Y offset and going down')

    while(down.data == False):
        print('I am entering the down loop')
        Z_distance0.data -= 0.2
        pub_directionz.publish(Z_distance0)
        rospy.sleep(0.5)
        while ((Z_Busy.data == True)):
            # print('moving') 
            rospy.sleep(0.5)
    print(Z_distance0.data)
    a = input('press any button to continue')
    Z_distance0.data = 0.0
    pub_directionz.publish(Z_distance0)
    rospy.sleep(0.5)
    while ((Z_Busy.data == True)):
        # print('moving') 
        rospy.sleep(0.5)
    
def position_test():
    transformation = ready_for_positioning()
    Rot = transformation[:3,:3]
    point = np.array([[35.72],[9.53],[-46.70]])
    print(np.matmul(Rot,point))

def task():
    transformation = ready_for_positioning()
    targets = open('/home/vinay/master_thesis/Boris_manipulator/source_code/catkin_ws/src/boris_manipulator/scripts/targets.txt','r').readlines() 
    targets.reverse()
    print('There are ',len(targets),' targets in the task list')
    while(len(targets)>0):
        rospy.sleep(5)
        target = targets.pop()
        coordinates = target.split(',')
        target_point = np.array([[float(coordinates[1])],[float(coordinates[2])],[float(coordinates[3])],[1]])
        a = position(target_point,transformation)

    print('Done with all points in the task list')

rospy.init_node('positioning_task',anonymous = True)

rospy.Subscriber('/X_BusyFlag',Bool,X_Busy_callback,queue_size = 10)
rospy.Subscriber('/Y_BusyFlag',Bool,Y_Busy_callback,queue_size = 10)
rospy.Subscriber('/Z_BusyFlag',Bool,Z_Busy_callback,queue_size = 10)

rospy.Subscriber('/down',Bool,Z_down_callback,queue_size = 10)

pub_directionx = rospy.Publisher('/X_Target', Float32, queue_size=10)
pub_directiony = rospy.Publisher('/Y_Target', Float32, queue_size=10)
pub_directionz = rospy.Publisher('/Z_Target', Float32, queue_size=10)

rospy.Subscriber('/calibration_complete',Bool,calibration_complete_callback,queue_size = 10)

rate = rospy.Rate(1)
iterations = 5
while iterations > 0:
  task()
  iterations -= 1

# task()
# position_test()
while not rospy.is_shutdown():
    rate.sleep()


# # while loop in the fine correction
# position_offset_p1 = np.array([[position_offset_1.distance_x],[position_offset_1.distance_y],[position_offset_1.distance_z]])
# Rot = transformation[:3,:3]
# fine_correction = initial_correction[:3]# + np.matmul(Rot,position_offset_p1)
# X_distance0.data = fine_correction[0][0]
# Y_distance0.data = fine_correction[1][0]
# Z_distance0.data = -fine_correction[2][0]
# if Z_distance0.data < -34:
#     Z_distance0.data = -34
# # print(fine_correction[2][0])
# pub_directionx.publish(X_distance0)
# pub_directiony.publish(Y_distance0)
# pub_directionz.publish(Z_distance0) 
# rospy.sleep(1)
# while ((X_Busy.data == True) or (Y_Busy.data == True) or (Z_Busy.data == True)):
# # print('moving') 
#     rospy.sleep(0.5)    
# # print('done with fine correction')
# rospy.sleep(5)
# position_offset_1 = position_offset()
# print(position_offset_1.distance_x, position_offset_1.distance_y)


# # this is the non working loop
# # transformation = ready_for_positioning()
#     initial_correction = np.matmul(transformation,target)
#     X_distance0.data = initial_correction[0][0]
#     Y_distance0.data = initial_correction[1][0]
#     Z_distance0.data = 0
#     print(X_distance0.data)
#     pub_directionx.publish(X_distance0)
#     pub_directiony.publish(Y_distance0)
#     pub_directionz.publish(Z_distance0)
#     rospy.sleep(2)
    
#     while ((X_Busy.data == True) or (Y_Busy.data == True) or (Z_Busy.data == True)):
#         # print('moving') 
#         rospy.sleep(0.5)   
#     print('done with initial correction')
#     rospy.sleep(2)

#     # this is where the while loop starts. Move this to the while loop later if this doesnt work out 
#     print('Now checking for any residual positioning error')
    
#     # position_offset_1 = position_offset()
#     # position_offset_p1 = np.array([[position_offset_1.distance_x],[position_offset_1.distance_y],[position_offset_1.distance_z]])
#     # Rot = transformation[:3,:3]
#     # fine_correction = initial_correction[:3] + np.matmul(Rot,position_offset_p1)
#     # X_distance0.data = fine_correction[0][0]
#     # Y_distance0.data = fine_correction[1][0]
#     # Z_distance0.data = -fine_correction[2][0]
#     # if Z_distance0.data < -34:
#     #     Z_distance0.data = -34
#     # # print(fine_correction[2][0])
#     # pub_directionx.publish(X_distance0)
#     # pub_directiony.publish(Y_distance0)
#     # pub_directionz.publish(Z_distance0) 
#     # rospy.sleep(1)
#     # while ((X_Busy.data == True) or (Y_Busy.data == True) or (Z_Busy.data == True)):
#     # # print('moving') 
#     #     rospy.sleep(0.5)    
#     # # print('done with fine correction')
#     # rospy.sleep(2)
#     position_offset_1 = position_offset()
#     if(np.absolute(position_offset_1.distance_x)>0.06 or np.absolute(position_offset_1.distance_y)>0.06 or np.absolute(position_offset_1.distance_z)>0.06):
#         position_offset_p1 = np.array([[position_offset_1.distance_x],[position_offset_1.distance_y],[position_offset_1.distance_z]])
#         Rot = transformation[:3,:3]
#         fine_correction = initial_correction[:3] + np.matmul(Rot,position_offset_p1)
#         X_distance0.data = fine_correction[0][0]
#         Y_distance0.data = fine_correction[1][0]
#         Z_distance0.data = -fine_correction[2][0]
#         if Z_distance0.data < -34:
#             Z_distance0.data = -34
#         # print(fine_correction[2][0])
#         pub_directionx.publish(X_distance0)
#         pub_directiony.publish(Y_distance0)
#         pub_directionz.publish(Z_distance0) 
#         rospy.sleep(1)
#         while ((X_Busy.data == True) or (Y_Busy.data == True) or (Z_Busy.data == True)):
#         # print('moving') 
#             rospy.sleep(0.5)    
#         # print('done with fine correction')
#         rospy.sleep(5)
#         position_offset_1 = position_offset()
#         print(position_offset_1.distance_x, position_offset_1.distance_y, position_offset_1.distance_z)
#     #     position_offset_p1 = np.array([[position_offset_1.distance_x],[position_offset_1.distance_y],[position_offset_1.distance_z]])
#     #     Rot = transformation[:3,:3]
#     #     correction_step = np.matmul(Rot,position_offset_p1)
#     #     print(correction_step)
#     #     X_step = correction_step[0][0]
#     #     # Y_step = correction_step[1][0]
#     #     if X_step > 0:
#     #         while(X_step > 0):
#     #             X_distance0.data += 0.02
#     #             print(X_step)
#     #             X_step -= 0.02
#     #             pub_directionx.publish(X_distance0)
#     #             rospy.sleep(1)
#     #             while ((X_Busy.data == True)):
#     #                 # print('moving') 
#     #                 rospy.sleep(0.5)
#     #     else:
#     #         while(X_step < 0):
#     #             X_distance0.data -= 0.02
#     #             X_step += 0.02
#     #             pub_directionx.publish(X_distance0)
#     #             rospy.sleep(1)
#     #             while ((X_Busy.data == True)):
#     #                 # print('moving') 
#     #                 rospy.sleep(0.5)

#     #     # if Y_step > 0:
#     #     #     while(Y_step > 0):
#     #     #         Y_distance0.data += 0.02
#     #     #         print(Y_step)
#     #     #         Y_step -= 0.02
#     #     #         pub_directiony.publish(Y_distance0)
#     #     #         rospy.sleep(1)
#     #     #         while ((Y_Busy.data == True)):
#     #     #             # print('moving') 
#     #     #             rospy.sleep(0.5)
#     #     # else:
#     #     #     while(Y_step < 0):
#     #     #         Y_distance0.data -= 0.02
#     #     #         Y_step += 0.02
#     #     #         pub_directiony.publish(Y_distance0)
#     #     #         rospy.sleep(1)
#     #     #         while ((Y_Busy.data == True)):
#     #     #             # print('moving') 
#     #     #             rospy.sleep(0.5)

#     #     position_offset_1 = position_offset()

#     # while(np.absolute(position_offset_1.distance_y)>0.06 ):#or np.absolute(position_offset_1.distance_y)>0.06):# or np.absolute(position_offset_1.distance_z)>0.06):
#     #     position_offset_p1 = np.array([[position_offset_1.distance_x],[position_offset_1.distance_y],[position_offset_1.distance_z]])
#     #     Rot = transformation[:3,:3]
#     #     correction_step = np.matmul(Rot,position_offset_p1)
#     #     print(correction_step)
#     #     # X_step = correction_step[0][0]
#     #     Y_step = correction_step[1][0]

#     #     if Y_step > 0:
#     #         while(Y_step > 0):
#     #             Y_distance0.data += 0.02
#     #             print(Y_step)
#     #             Y_step -= 0.02
#     #             pub_directiony.publish(Y_distance0)
#     #             rospy.sleep(1)
#     #             while ((Y_Busy.data == True)):
#     #                 # print('moving') 
#     #                 rospy.sleep(0.5)
#     #     else:
#     #         while(Y_step < 0):
#     #             Y_distance0.data -= 0.02
#     #             Y_step += 0.02
#     #             pub_directiony.publish(Y_distance0)
#     #             rospy.sleep(1)
#     #             while ((Y_Busy.data == True)):
#     #                 # print('moving') 
#     #                 rospy.sleep(0.5)
#     print('completed positioning')

# print('starting offset')
# X_distance0.data -= 36.96
# Y_distance0.data -= 0.7#0.6830    
# pub_directionx.publish(X_distance0)
# pub_directiony.publish(Y_distance0)
# rospy.sleep(1)
# while ((X_Busy.data == True) or (Y_Busy.data == True)):
#     # print('moving') 
#     rospy.sleep(0.5)

# print('done with X and Y offset and going down')

# while(down.data == False):
#     Z_distance0.data -= 0.2
#     pub_directionz.publish(Z_distance0)
#     rospy.sleep(0.5)
#     while ((Z_Busy.data == True)):
#         # print('moving') 
#         rospy.sleep(0.5)
# print(Z_distance0.data)
# a = input('press any button to continue')
# Z_distance0.data = 0.0
# pub_directionz.publish(Z_distance0)
# rospy.sleep(0.5)
# while ((Z_Busy.data == True)):
#     # print('moving') 
#     rospy.sleep(0.5)
    
#     return True