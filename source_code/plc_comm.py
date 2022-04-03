from pymodbus.client.sync import ModbusTcpClient
import time
client = ModbusTcpClient('192.168.1.7')
# print(client.read_holding_registers(0).registers)
# while True:
client.write_registers(1,0)
client.write_registers(2,0)
client.write_registers(3,0)
# client.write_coil(8194,True)# turn on 192.168.1.241
# client.write_coil(8195,True)# turn on 192.168.1.242
# client.write_coil(8196,True)# turn on 192.168.1.240
# time.sleep(10)
# client.write_coil(8193,True)
# Registers 0 onwards are D0
# # we can also write to holding registers I think but we can work with just the registers for now.
# while()
# client.write_coil(8193,False)
# print(client.read_coils(8193).bits[0])
# while not (client.read_coils(8196).bits[0] or client.read_coils(8197).bits[0] or client.read_coils(8198).bits[0]):
#     client.write_coil(8193,False)
client.write_coil(8194,False)# turn on 192.168.1.241
client.write_coil(8195,False)# turn on 192.168.1.242
client.write_coil(8196,False)# turn on 192.168.1.240
client.close()