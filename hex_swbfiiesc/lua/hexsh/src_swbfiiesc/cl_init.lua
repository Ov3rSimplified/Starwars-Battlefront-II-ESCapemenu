HexSh.SWBFIIESC.UI = HexSh.SWBFIIESC.UI or {}

--[[ <v> Load Materials <v> ]]
    local Materials = {
        ["CyFsb4r"] = true, // Sideline
        ["zEuncuj"] = true, // BG
    }
    for k,v in pairs( Materials ) do 
        if (file.Exists("hexsh/cache/img/" .. k .. ".png", "DATA")) then 
            continue 
        end
        HexSh:getImgurImage( k )
    end

    HexSh.SWBFIIESC.UI.SideMat = "CyFsb4r"
    HexSh.SWBFIIESC.BG = "zEuncuj"

--[[ <^> Load Materials <^> ]]

--[[ < ---------- ( FONTS ) ---------- > ]]--

surface.CreateFont( "SWBFIIESC.Cfg40", { 
    font = "Arial", 
    size = ScrH() * 0.040, 
    weight = 100, 
    antialias = true, 
 } )
surface.CreateFont( "SWBFIIESC.Cfg30", { 
    font = "Arial", 
    size = ScrH() * 0.030, 
    weight = 100, 
    antialias = true, 
 } )
 surface.CreateFont( "SWBFIIESC.Cfg25", { 
    font = "Arial", 
    size = ScrH() * 0.025, 
    weight = 100, 
    antialias = true, 
 } )
surface.CreateFont( "RDSRP.ESC.Aurebesh", { 
    font = "Aurebesh", 
    size = ScrH() * 0.035, 
    weight = 100, 
    antialias = true, 
    bold = true 
 } )

 surface.CreateFont( "RDSRP.ESC.Button", {
    font = "Recharge Rg",
    extended = false,
    size = ScrH() * 0.055,
} )

function HexSh.SWBFIIESC.TitleFont()
   
    surface.CreateFont( "SWBFII.Title", {
        font = HexSh:getIConfig("src_swbfiiesc")[ "SetServerTitleFont" ] and HexSh:getIConfig("src_swbfiiesc")[ "SetServerTitleFont" ] or "Arial",
        extended = false,
        size = ScrH() * 0.065,
    } );

end; 

surface.CreateFont( "SWBFII.Button.50", {
    font = "Recharge Rg",
    size = ScrH() * 0.050,
} )

surface.CreateFont( "SWBFII.Button.40", {
    font = "Recharge Rg",
    size = 40,
} )

surface.CreateFont( "SWBFII.Button.30", {
    font = "Recharge Rg",
    size = 30,
} )

surface.CreateFont( "SWBFII.Button.20", {
    font = "Recharge Rg",
    size = 20,
} )

--[[ < ---------- ( MENU ) ---------- > ]]--

local function Menu()
    if IsValid( open ) then 
        if LocalPlayer().swbfiiescopen then return end;
        open:Remove();
    else
        open = vgui.Create( "SWBFII.Menu" );    
    end;
end;


hook.Add("PreRender", "SWBFII.PreRender", function()

	if input.IsKeyDown( KEY_ESCAPE ) and gui.IsGameUIVisible() then

        gui.HideGameUI();

        Menu();

	end;

end ); 

--[[ < ---------- ( INIT ) ---------- > ]]--

hook.Add( "InitPostEntity", "DSWBFIIESC.Init", function( )

    HexSh.SWBFIIESC.TitleFont();

end );
