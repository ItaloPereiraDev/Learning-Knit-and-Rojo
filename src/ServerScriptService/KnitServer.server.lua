local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)

--Knit.AddServices(ServerStorage.Source.Money.MoneyService)
--Code below: Procure por coisas que acabam em "Service"
for _, v in ipairs(ServerStorage.Source:GetDescendants()) do
    if v:IsA("ModuleScript") and v.Name:match("Service$") then
        require(v)
    end
end

Knit.Start():andThen(function()
    print("Knit Started, on server script")
end):catch(warn)