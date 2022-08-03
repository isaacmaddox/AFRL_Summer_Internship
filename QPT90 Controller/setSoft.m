function setSoft(device, axis)
    data = sendCmd(device, buildCommand([0x02 0x00 0x81 axis 0x00 0x03]));
end