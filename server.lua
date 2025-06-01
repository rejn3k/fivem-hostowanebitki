local queue = {}

RegisterNetEvent("bitka:doKolejki")
AddEventHandler("bitka:doKolejki", function()
    local _source = source
    table.insert(queue, _source)
    TriggerClientEvent("chat:addMessage", _source, {
        args = { "^2[Bitki]", "Zapisano do kolejki. Czekaj na przeciwnika..." }
    })

    if #queue >= 2 then
        local player1 = table.remove(queue, 1)
        local player2 = table.remove(queue, 1)

        TriggerClientEvent("bitka:rozpocznijBitke", player1, player1, player2)
        TriggerClientEvent("bitka:rozpocznijBitke", player2, player1, player2)
    end
end)

RegisterNetEvent("bitka:zakonczona")
AddEventHandler("bitka:zakonczona", function(przegrany)
    local winner = (source == przegrany) and nil or source
    if winner then
        TriggerClientEvent("chat:addMessage", winner, {
            args = { "^2[Bitki]", "Wygrałeś walkę!" }
        })
    end
end)
