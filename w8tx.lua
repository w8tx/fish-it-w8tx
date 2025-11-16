-- Mod Menu by W8TX
-- Fish It Auto Catch 10.000 ikan

-- Load Library UI
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- Buat Window
local window = library.CreateLib("Mod Menu by W8TX", "DarkTheme")

-- Tab dan Section
local tab = window:NewTab("Main")
local section = tab:NewSection("Auto Fish")

-- Toggle auto fish
_G.autoFish = false
_G.fishAmount = 10000 -- default 10.000 ikan

section:NewToggle("Auto Catch 10.000 ikan", "Mancing otomatis super cepat", function(bool)
    _G.autoFish = bool

    while _G.autoFish do
        pcall(function()
            -- Event Fish It, sesuaikan jika berbeda
            game:GetService("ReplicatedStorage").Events.CatchFish:FireServer(_G.fishAmount)
        end)
        task.wait(0.1) -- delay super cepat
    end
end)

-- Tombol stop
section:NewButton("Stop Auto Fish", "Hentikan semua", function()
    _G.autoFish = false
end)

-- Slider (opsional) untuk atur jumlah ikan
section:NewSlider("Jumlah Ikan", "Atur ikan per catch", 10000, 1, function(value)
    _G.fishAmount = value
end)