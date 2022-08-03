function [pan, tilt] = getPanTilt(data)
    panVal = uint16(data(5));
    panVal = bitshift(panVal, 8);

    panVal2 = uint16(data(4));

    panAbs = typecast(bitor(panVal, panVal2), 'int16');

    tiltVal = uint16(data(8));
    tiltVal = bitshift(tiltVal, 8);

    tiltVal2 = uint16(data(7));

    tiltAbs = typecast(bitor(tiltVal, tiltVal2), 'int16');

    pan = double(panAbs) / 100;
    tilt = double(tiltAbs) / 100;
end