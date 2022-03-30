from pymodbus.client.sync import ModbusTcpClient
client = ModbusTcpClient('192.168.1.5')

# while True:
client.write_registers(0,120)

print(client.read_holding_registers(0).registers)