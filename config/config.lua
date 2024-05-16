Config = {}
Config.Locale = 'cs'

Config.Framework = "ESX" -- ESX or qbcore

Config.EnableDebug = false 
Config.Target = "ox_target" -- ox_target or qb-target


Config.Craftings = {
 ------------------------------------------ CLUB CRAFTING ------------------------------------------
    ["bahama"] = {
        jobs = {["bahama"] = 0},                        
        model = nil,                                       
        label = 'Míchaní drinků',                          
        icon = "fas fa-martini-glass-citrus",
        item = nil,                                         
        coords = {                                            
            [1] = vector4(-1379.3668, -591.4570, 30.2165, 127.7189),
            [2] = vector4(-1375.9387, -596.9040, 30.2165, 125.0756),
            [3] = vector4(-1386.0933, -627.9174, 35.8962, 126.7307),
        },
        items = {                                            
            {
                title = "Vodka",
                description = "1x Vodka, 1x Energy Drink",
                progressbar = "Mícháš vodku s energy",
                image = "https://media.discordapp.net/attachments/1240432673047187518/1240438267300544592/vodkaenergy2_2.png?ex=66468fa9&is=66453e29&hm=9da36cb868e583c3aeef1f3b13c76cecc478390a6238ff4cbd5fd1e51e2d1c43&=&format=webp&quality=lossless",
                duration = 1000,                           
                requireditems = {                            
                    {name = "vodka", amount = 1},
                    {name = "energy", amount = 1},
                },
                additems = {                                  
                    {name = "vodkaenergy", amount = 1},
                },
            },
        },
    },
}
