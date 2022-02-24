# !/usr/bin/env python
import rospy
from boris_manipulator.srv import localization, localizationResponse#, multiplyRequest
from std_msgs.msg import Float64
import socket
distance_message = ''

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

def callback(request):
	response = localizationResponse()
	response.connection = True
	distance_message = distancesUDP.get_message()
	distance_message = distance_message.split(b'\x00')[0]
	if not distance_message:
		response.connection = False
	else:
		distancesSplit = distance_message.split(b',')
		response.distance_x = float(distancesSplit[1])
		response.distance_y = float(distancesSplit[3])
		response.distance_z = float(distancesSplit[5])

	return response


rospy.init_node("laser_service")
service = rospy.Service('localization',localization,callback)
localIP     = "192.168.78.57"
localPortDistances = 65433
bufferSize = 1024
distancesUDP = UDP_connect(localIP, localPortDistances, bufferSize)
rospy.spin()