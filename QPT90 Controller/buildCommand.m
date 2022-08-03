function ret = buildCommand(cmd)
    if length(cmd) > 5
        lrc = 0;
        for i = 3:length(cmd) - 1
            lrc = bitxor(lrc, cmd(i));
        end
        cmd(end - 1) = lrc;
    end

    indices_of_cmds = find(cmd == 0x02 | cmd == 0x03 | cmd == 0x06 | cmd == 0x15 | cmd == 0x1B);
    indices_of_cmds = indices_of_cmds(2:end - 1);
    cmd(indices_of_cmds) = bitset(cmd(indices_of_cmds),8,1);
    new_indices = sort([indices_of_cmds' 1:length(cmd)]);
    cmd = cmd(new_indices);
    cmd(~diff(new_indices)) = 0x1B;
    
    ret = cmd;
end