function movetohome(device)
    data = sendCmd(device, [0x02, 0x00, 0x36, 0x36, 0x03]);
end