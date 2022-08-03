function [pan, tilt] = getStatus(device, overrideSoft, stop, reset)
    flags = 0x00;
    if stop
        flags = bitset(flags, 2, 1);
        overrideSoft = true;
        reset = true;
    end
    if overrideSoft
        flags = bitset(flags, 3, 1);
    end
    if reset
        flags = bitset(flags, 1, 1);
    end

    cmd = buildCommand([0x02 0x00 0x31 flags 0x00 0x00 0x00 0x00 0x00 0x03]);

    data = sendCmd(device, cmd);

    if (length(data) < 20) % No data, or not enough data, returned
        pan = 1000;
        tilt = 1000;
        return;
    end

    cmd = buildCommand([0x02 0x00 0x31 flags 0x00 0x00 0x00 0x00 0x00 0x03]);
    
    [pan, tilt] = getPanTilt(data);
end