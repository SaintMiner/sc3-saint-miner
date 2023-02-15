local export = {}

local currentLevelStep = 1;
local totalSteps = 1;
local isEven = false;
local level = 1;

function dryWater()
  turtle.place();
  turtle.dig();
  turtle.placeDown();
  turtle.digDown();
end

function doStep()
    dryWater();
    turtle.forward();
    totalSteps = totalSteps + 1;
    currentLevelStep = currentLevelStep + 1;
end

function nextLevel()
    for i = 1, 2 do
        dryWater();
        turtle.down();
    end
    level = level + 1;
end

function getRotation(x, y)
    local isBackloop = level % 2 == 0;
    print(isBackloop);
    if (isEven and isBackloop) then
        return currentLevelStep % (x * 2) == 0 and 'turnLeft' or 'turnRight';
    end
    return currentLevelStep % (x * 2) == 0 and 'turnRight' or 'turnLeft';
end

function export.dry(x, y)
    print("start dry");
    turtle.refuel();
    turtle.select(2);
    if (y % 2 == 0) then
        isEven = true;
    end
    print(x, y);
    print('Even:', isEven)
    while turtle.getFuelLevel() > 0 do
        currentLevelStep = 1;
        for i = 1, y do
            for j = 1, (x - 1) do
                doStep();
            end
            -- local rotating = currentLevelStep % (x * 2) == 0 and 'turnRight' or 'turnLeft';
            local rotation = getRotation(x, y);

            if currentLevelStep == x * y then
                turtle[rotation]();
                turtle[rotation]();
                nextLevel();
            else
                turtle[rotation]();
                doStep();
                turtle[rotation]();
            end
        end
    end
end

return export;
