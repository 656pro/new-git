local Lib = {
    bank = {
        MultiplierX = -11,
        MultiplierZ = 10,
        StartX = -364,
        CurrentX = -364,
        StartY = 21,
        StartZ = -335,
        CurrentZ = -335,
        MaxIterations = 13,
        MaxPerRow = 3,
        CurrentPerRow = 3
    }
}

return function(...)
    local data = ProccessArgs(...)
    local areas = {'bank'}
    local plr = game:service"Players".LocalPlayer

    local function ReSort(table_)
        local function CheckPlayer(userid)
            for i,v in pairs(game:service"Players":GetChildren()) do
                if v.UserId == userid then
                    return true
                end
            end
            return false
        end

        local k = {}
        for i,v in pairs(table_) do
            if CheckPlayer(v) == true then
                table.insert(k,v)
            end
        end
        return k
    end

    if table.find(areas,data[2]) then
        local area = data[2]:lower()
        for i=1,Lib[area]['MaxIterations']*Lib[area]['MaxPerRow'] do
            local x,y,z = Lib[area]['CurrentX'],Lib[area]['StartY'],Lib[area]['CurrentZ']
            if ReSort(Alts)[i] == plr.UserId then
                plr.Character.HumanoidRootPart.CFrame = CFrame.new(x,y,z)
                break
            end
            Lib[area]['CurrentX'] = Lib[area]['CurrentX'] + Lib[area]['MultiplierX']
            if i == Lib[area]['CurrentPerRow'] then
                Lib[area]['CurrentPerRow'] = Lib[area]['CurrentPerRow'] + Lib[area]['MaxPerRow']
                Lib[area]['CurrentZ'] = Lib[area]['CurrentZ'] + Lib[area]['MultiplierZ']
                Lib[area]['CurrentX'] = Lib[area]['StartX']
            end
        end
    end
end