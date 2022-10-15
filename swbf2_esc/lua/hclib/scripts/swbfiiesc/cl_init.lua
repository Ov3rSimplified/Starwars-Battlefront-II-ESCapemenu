--[[ < ---------- ( FONTS ) ---------- > ]]--


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

function HCLIB.Scripts.swbfiiesc.TitleFont()
   
    surface.CreateFont( "SWBFII.Title", {
        font = HCLIB.Config.Cfg[ "swbfiiesc" ][ "SetServerTitleFont" ] and HCLIB.Config.Cfg[ "swbfiiesc" ][ "SetServerTitleFont" ] or "Arial",
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

    HCLIB.Scripts.swbfiiesc.TitleFont();

end );
