local isInFight = false
local fightCoords = vector3(200.0, -900.0, 30.0) -- Zmień na swoją lokalizację
local fightRadius = 50.0

RegisterCommand("dolaczbitke", function()
    if not isInFight then
        SetEntityCoords(PlayerPedId(), fightCoords.x, fightCoords.y, fightCoords.z)
        TriggerEvent("chat:addMessage", { args = { "[Bitka]", "Dołączyłeś do areny!" } })
        isInFight = true
    else
        TriggerEvent("chat:addMessage", { args = { "[Bitka]", "Już jesteś na arenie!" } })
    end
end)

RegisterCommand("opuscbitke", function()
    if isInFight then
        local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
        if #(vector3(x, y, z) - fightCoords) < fightRadius then
            SetEntityCoords(PlayerPedId(), 150.0, -1000.0, 29.0) -- Lokacja wyjściowa
            TriggerEvent("chat:addMessage", { args = { "[Bitka]", "Opuściłeś arenę." } })
            isInFight = false
        else
            TriggerEvent("chat:addMessage", { args = { "[Bitka]", "Nie jesteś już w strefie bitki!" } })
        end
    end
end)
