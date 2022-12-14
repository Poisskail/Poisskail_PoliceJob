fx_version "adamant"
game { "gta5" }; 



client_scripts {
    'RageUI/RMenu.lua',
    'RageUI/menu/RageUI.lua',
    'RageUI/menu/Menu.lua',
    'RageUI/menu/MenuController.lua',
    'RageUI/components/*.lua',
    'RageUI/menu/elements/*.lua',
    'RageUI/menu/items/*.lua',
    'RageUI/menu/panels/*.lua',
    'RageUI/menu/windows/*.lua',
    'cl_cctv.lua',
    "config.lua",
    "cl_menu.lua",
    "functions.lua",
    "sWanted.lua",
    
}

server_scripts {
    'config.lua',
    "@mysql-async/lib/MySQL.lua",
    "@sFramework/locale.lua",
    "sv_police.lua"
}