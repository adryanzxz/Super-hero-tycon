return function(Settings)
    if not game:IsLoaded() then game.Loaded:Wait() end
    local plr = game.Players.LocalPlayer

    if Settings.Translator then
        warn("Tradução ativada: comandos traduzidos para PT-BR.")
    end

    local function autoClaimTycoon()
        local tycoons = workspace.Tycoons:GetChildren()
        for _, tycoon in pairs(tycoons) do
            if not tycoon:FindFirstChild("Owner") or tycoon.Owner.Value == nil then
                firetouchinterest(plr.Character.HumanoidRootPart, tycoon.ClaimPart, 0)
                firetouchinterest(plr.Character.HumanoidRootPart, tycoon.ClaimPart, 1)
                break
            end
        end
    end

    local function autoCollectCash()
        while Settings.AutoCollect do
            for _, tycoon in pairs(workspace.Tycoons:GetChildren()) do
                if tycoon:FindFirstChild("Owner") and tycoon.Owner.Value == plr then
                    local collect = tycoon:FindFirstChild("CollectCash")
                    if collect then
                        firetouchinterest(plr.Character.HumanoidRootPart, collect, 0)
                        firetouchinterest(plr.Character.HumanoidRootPart, collect, 1)
                    end
                end
            end
            wait(3)
        end
    end

    autoClaimTycoon()
    task.spawn(autoCollectCash)
end
