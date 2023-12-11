local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)


--Knit.AddServices(ReplicatedStorage.Source.Money.MoneyController)
--Code below: Procure por coisas que acabam em "controller"
for _, v in ipairs(ReplicatedStorage.Source:GetDescendants()) do
    if v:IsA("ModuleScript") and v.Name:match("Controller$") then
        require(v)
    end
end


Knit.Start(
    {
        --ServicePromises = false,
        Middleware = { 
            Inbound =  {
                function (args)
                    print("MIDDLEWARE, args:", args)
                    return true
                end
            }
        }
    }
):andThen(function()
    print("Knit Started, on player scripts")
end):catch(warn)