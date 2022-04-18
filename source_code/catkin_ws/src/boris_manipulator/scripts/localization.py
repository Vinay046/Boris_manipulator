# !/usr/bin/env python
import rospy
from boris_manipulator.srv import localization, localizationResponse, control, controlResponse
from std_msgs.msg import Float64
import socket

class UDP_connect:
    def __init__(self, ip, port, buffersize):
        self._ip = ip
        self._port = port
        self._buffersize = buffersize

        
    def get_message(self):
        UDPServerSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
        UDPServerSocket.bind((self._ip, self._port))
        UDPServerSocket.settimeout(5)

        try:
            bytesAddressPair = UDPServerSocket.recvfrom(self._buffersize)
        except socket.timeout:
            return False 
        message = bytesAddressPair[0]
        address = bytesAddressPair[1]

        return [message, address]

    # def get_message(self): # remove the function when you are going to connect to Alina's computer to receive the position data
    #     return True

def localization_callback(request):
    response = localizationResponse()
    response.connection_localization = True
    position_message = positionUDP.get_message()[0]
    # position_message = position_message[0]
    if not position_message:
        response.connection = False
    else:
        positionsSplit = position_message.split(b',')
        # response.distance_x = 1
        # response.distance_y = 2
        # response.distance_z = 3
        response.position_x = float(positionsSplit[1])
        response.position_y = float(positionsSplit[3])
        response.position_z = float(positionsSplit[5])

    return response

def control_callback(req):
    # in this service we connect to the other socket where we get the distance to target data
    # use the same stuff to do string parsing
    
    response = controlResponse()
    response.connection_control = True
    control_message = True #controlUDP.get_message()
    # control_message = control_message.split(b'\x00')[0]
    if not control_message:
        response.connection = False
    else:
        # controlsSplit = control_message.split(b',')
        # response.distance_x = 1
        # response.distance_y = 2
        # response.distance_z = 3
        response.control_x = 1#float(controlsSplit[1])
        response.control_y = 2#float(controlsSplit[3])
        response.control_z = 1#float(controlsSplit[5])

    return response


rospy.init_node("laser_service")
service_localization = rospy.Service('localization',localization,localization_callback)
service_control_signals = rospy.Service('control_signals',control,control_callback)
localIP     = '127.0.0.1'  #"192.168.78.57" add the right IP address later
localPortPostion = 65433
localPortControl = 65432
bufferSize = 1024
positionUDP = UDP_connect(localIP, localPortPostion, bufferSize)
controlUDP = UDP_connect(localIP, localPortControl, bufferSize)
rospy.spin()