function [retCW, retCCW, retUp, retDown] = readLimits(device)
    %% Get clockwise limit
    cwData = sendCmd(device, buildCommand([0x02 0x00 0x81 0x80 0x00 0x03]));
    cwLimit = uint16(cwData(6));
    cwLimit = bitshift(cwLimit, 8);

    cwLimit2 = uint16(cwData(5));

    abs = typecast(bitor(cwLimit, cwLimit2), 'int16');

    retCW = double(abs) / 100;

    %% Get counter clockwise limit
    ccwData = sendCmd(device, buildCommand([0x02 0x00 0x81 0x81 0x00 0x03]));
    ccwLimit = uint16(ccwData(6));
    ccwLimit = bitshift(ccwLimit, 8);

    ccwLimit2 = uint16(ccwData(5));

    abs = typecast(bitor(ccwLimit, ccwLimit2), 'int16');

    retCCW = double(abs) / 100;

    %% Get upwards limit
    upData = sendCmd(device, buildCommand([0x02 0x00 0x81 0x82 0x00 0x03]));
    upLimit = uint16(upData(6));
    upLimit = bitshift(upLimit, 8);

    upLimit2 = uint16(upData(5));

    abs = typecast(bitor(upLimit, upLimit2), 'int16');

    retUp = double(abs) / 100;

    %% Get downwards limit
    downData = sendCmd(device, buildCommand([0x02 0x00 0x81 0x83 0x00 0x03]));
    downLimit = uint16(downData(6));
    downLimit = bitshift(downLimit, 8);

    downLimit2 = uint16(downData(5));

    abs = typecast(bitor(downLimit, downLimit2), 'int16');

    retDown = double(abs) / 100;
end