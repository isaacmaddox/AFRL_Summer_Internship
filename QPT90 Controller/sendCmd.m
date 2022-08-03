function ret = sendCmd(device, cmd)
    write(device, cmd, "uint8");

    for i = 1:1000
        if (device.NumBytesAvailable > 0)
            break;
        end
        if (i == 1000)
            ret = 0;
            return;
        end
    end

    data = [];
    for i = 1:1000
        n = device.NumBytesAvailable;
        if (n > 0)
            data = [data read(device, n, "uint8")];
            if (data(end) == 0x03)
                break;
            end
        end
        pause(0.05);
    end
    indices = find(data == 0x1B);
    if ~isempty(indices)
        replIndices = indices + 1;
        
        data(replIndices) = bitset(data(replIndices), 8, 0);
        
        data(indices) = [];
    end

    ret = data;
end