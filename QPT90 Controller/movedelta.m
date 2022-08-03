function movedelta(device, coords)
    %% Jarrod's function to get the correct integer value
    moveToPan = coords(1);
    moveToTilt = coords(2);
    pan = dec2hex(int16(moveToPan*100),4);
    pan1 = hex2dec(pan(1:2));
    pan2 = hex2dec(pan(3:4));

    tilt = dec2hex(int16(moveToTilt*100),4);
    tilt1 = hex2dec(tilt(1:2));
    tilt2 = hex2dec(tilt(3:4));

    cmd = buildCommand([0x02; 0x00; 0x34; pan2; pan1; 0x00; tilt2; tilt1; 0x00; 0x00; 0x03]);

    if moveToPan < 0
        cmd(6) = 0xFF;
    end

    if moveToTilt < 0
        cmd(9) = 0xFF;
    end

    data = sendCmd(device, cmd);
end