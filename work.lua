local miner = require('miner');
local dry = require('dry');

local modem = peripheral.find('modem');
modem.open(888);

function worker()
    while true do
        local event = {os.pullEvent()};

        if event[1] == "modem_message" then
            local command = event[5];
            local action = command[1];            

            if action == "miner" then
              local x = command[2];
              local y = command[3];
              miner.mine(x, y);
            end

            if action == "dry" then
                local x = command[2];
                local y = command[3];
                dry.dry(x, y);
            end
        end
    end
end

parallel.waitForAny(worker);