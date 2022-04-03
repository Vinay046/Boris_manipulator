# !/usr/bin/env python
import rospy
from random import seed
from random import randint
seed(1)
from boris_manipulator.srv import localization, localizationResponse, control, controlResponse#, multiplyRequest
from std_msgs.msg import Float64
import socket
# position_message = ''
class UDP_connect:
    def __init__(self, ip, port, buffersize):
        self._ip = ip
        self._port = port
        self._buffersize = buffersize

        
    # def get_message(self):
    #     UDPServerSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
    #     UDPServerSocket.bind((self._ip, self._port))
    #     UDPServerSocket.settimeout(5)

    #     try:
    #         bytesAddressPair = UDPServerSocket.recvfrom(self._buffersize)
    #     except socket.timeout:
    #         return False 
    #     message = bytesAddressPair[0]
    #     address = bytesAddressPair[1]

    #     return [message, address]

    def get_message(self):
        return True

def localization_callback(request):
    response = localizationResponse()
    response.connection_localization = True
    position_message = positionUDP.get_message()
    # position_message = position_message.split(b'\x00')[0]
    if not position_message:
        response.connection = False
    else:
    # positionsSplit = position_message.split(b',')
        # response.distance_x = 1
        # response.distance_y = 2
        # response.distance_z = 3
        response.position_x = 10#float(positionsSplit[1])
        response.position_y = 20#float(positionsSplit[3])
        response.position_z = 10#float(positionsSplit[5])

    return response

def control_callback(req):
    # in this service we connect to the other socket where we get the distance to target data
    # use the same stuff to do string parsing
    
    response = controlResponse()
    response.connection_control = True
    response.distance_x = 0#randint(0,10)
    response.distance_y = 0
    response.distance_z = 0
    return response
rospy.init_node("laser_service")
service_localization = rospy.Service('localization',localization,localization_callback)
service_control_signals = rospy.Service('control_signals',control,control_callback)
localIP     = "192.168.78.57"
localPortpositions = 65433
bufferSize = 1024
positionUDP = UDP_connect(localIP, localPortpositions, bufferSize)
rospy.spin()