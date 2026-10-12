local player = game:GetService("Players").LocalPlayer
local folder = workspace.Gameplay.CurrencyPickup.CurrencyHolder

UI.RemoveTab("Pickups")

UI.AddTab("Pickups", function(tab)
    local sec = tab:Section("Auto Collect", "Left")
    sec:Toggle("crowns", "Crowns")
end)

while true do
    if UI.GetValue("crowns") then
        for _, pickup in pairs(folder:GetChildren()) do
            if not UI.GetValue("crowns") then break end

            if pickup.Name == "Crown" and pickup:IsA("BasePart") then
                local character = player.Character
                local root = character and character:FindFirstChild("HumanoidRootPart")

                if root then
                    root.CFrame = pickup.CFrame
                    task.wait(0.2)
                end
            end
        end
    end

    task.wait(0.1)
end