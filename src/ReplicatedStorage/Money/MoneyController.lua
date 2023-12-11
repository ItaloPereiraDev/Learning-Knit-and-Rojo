local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)

local MoneyController = Knit.CreateController{
    Name = "MoneyController"
}

function MoneyController:KnitStart()

    local function ObserveMoney(money)
        print("Money:", money)
    end

    local MoneyService = Knit.GetService("MoneyService")
    -- SEM PROMISSE: local money = MoneyService:GetMoney()
    -- print("My money:", money)
    MoneyService:GetMoney():andThen(ObserveMoney):andThen(function()
        MoneyService.MoneyChanged:Connect(ObserveMoney)
    end)
    print("MoneyController Started on Knit")
end

function MoneyController:KnitInit()
    print("MoneyController Initialized on Knit")
end

return MoneyController