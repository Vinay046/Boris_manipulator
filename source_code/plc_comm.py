from pymodbus.client.sync import ModbusTcpClient
import time
client = ModbusTcpClient('192.168.1.7')


'''
All to enable certain control flags on the controller, we use coils on the PLC. The coils used in the application start from M1 and the address to 
M1 is 8193
'''

# print(client.read_holding_registers(0).registers)
# while True:
client.write_registers(0,15000-int(50*(150.199-0.23))) # D3
client.write_registers(2,(50*int(149.72000122070312+0.3444))) # D2
client.write_registers(4,int(50*(0.22-0.21))) # D3
# client.write_coil(8194,True)# turn on 192.168.1.241 M2
# client.write_coil(8195,True)# turn on 192.168.1.242 M3
# client.write_coil(8196,True)# turn on 192.168.1.240 M4
# time.sleep(5)
# client.write_coil(8203,True)# turn on 192.168.1.241 M2
# client.write_coil(8204,True)# turn on 192.168.1.242 M3
# client.write_coil(8205,True)# turn on 192.168.1.240 M4
# time.sleep(5)
# client.write_coil(8203,False)# turn on 192.168.1.241 M2
# client.write_coil(8204,False)# turn on 192.168.1.242 M3
# client.write_coil(8205,False)# turn on 192.168.1.240 M4
# time.sleep(1)
# time.sleep(10)
# client.write_coil(8193,True)


# while True:
#     X = 0 #float(input("enter X"))
#     Y = 0 #float(input("enter Y"))
#     Z = 0 #float(input("enter Z"))
#     ix = X/0.02
#     iy = Y/0.02
#     iz = Z/0.02
#     hix = int(ix/32767)
#     lix = int(ix % 32767)
#     hiy = int(iy/32767)
#     liy = int(iy % 32767)
#     hiz = int(iz/32767)
#     liz = int(iz % 32767)
#     # print((int(hiz*) + liz)*0.02)
#     client.write_registers(0,hix) 
#     client.write_registers(1,lix)
#     client.write_registers(2,hiy) 
#     client.write_registers(3,liy)
#     client.write_registers(4,hiz) 
#     client.write_registers(5,liz)
    
# # Registers 0 onwards are D0
# # # we can also write to holding registers I think but we can work with just the registers for now.
# # while()
# # client.write_coil(8193,False)
# # print(client.read_coils(8193).bits[0])
# # while not (client.read_coils(8196).bits[0] or client.read_coils(8197).bits[0] or client.read_coils(8198).bits[0]):
# #     client.write_coil(8193,False)
# # client.write_coil(8194,False)# turn on 192.168.1.241
# # client.write_coil(8195,False)# turn on 192.168.1.242
# # client.write_coil(8196,False)# turn on 192.168.1.240
# # client.close()