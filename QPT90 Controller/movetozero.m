function movetozero(device)
    data = sendCmd(device, [0x02, 0x00, 0x35, 0x35, 0x03]);
end