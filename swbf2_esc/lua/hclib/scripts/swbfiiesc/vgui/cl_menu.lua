    local PANEL = {};

    local sidemat = Material("materials/hclib/swbfii/sideline.png");

    local matz = Material("materials/hcs/bgs/bega.png");

    local bg = Material("materials/hcs/bgs/bega.png");

    local white = Color( 255, 255, 255 );

    local gray = Color(117,117,117);

    local localplayer = LocalPlayer();

    local function name( self )
        
        local avatar = vgui.Create( "HCLIB.CircleAvatar", self );

        avatar:SetPos( 70 , -13 );

        avatar:SetSize( 100, 100 );         

        avatar:SetPlayer( LocalPlayer(), 32 );

        avatar:SetMaskSize( 30 );

    end;

    local function PlayerPanel( self )

        local scrw, scrh = ScrW(), ScrH();

        if HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnableDrawPlayer" ] then 
    
            self.dpp = vgui.Create( "DModelPanel", self );

            self.dpp:SetPos( 580, 20 );

            self.dpp:SetSize( 800, 999 );

            self.dpp:SetFOV( 61 );

            self.dpp:SetModel( LocalPlayer():GetModel() ); 

            self.dpp.Entity:SetSkin( LocalPlayer():GetSkin() );
           
            local curgroups = LocalPlayer():GetBodyGroups() 
    
            self.dpp:SetAmbientLight( Color( 217, 115, 52, 200 ) );

            self.dpp:SetDirectionalLight( BOX_BOTTOM, Color( 255, 255, 255 ) );
    
            for k, v in pairs( curgroups ) do

                local ent = self.dpp.Entity;

                local cur_bgid = LocalPlayer():GetBodygroup( v.id );

                 ent:SetBodygroup( v.id, cur_bgid );

            end;
    
            self.selectedSequence = nil;
    
            function self.dpp:LayoutEntity( Entity )

                if ( self.bAnimated ) then self:RunAnimation() end;
    
                if  HCLIB.Config.Cfg[ "swbfiiesc" ][ "PlayermodelSequence" ] == false then

                    Entity:SetAngles( Angle( 0, 45, 0 ) );

                else

                    Entity:SetAngles( Angle( 0, 45, 0 ) );

                    if !self.selectedSequence then

                        self.selectedSequence =  HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnterPlayermodelSequence" ];

                    end;

                    Entity:SetSequence( Entity:LookupSequence( self.selectedSequence ) );

                end;

            end;

         end;
        
    end;

    function PANEL:Init()

        self.sname = steamworks.GetPlayerName( LocalPlayer():SteamID64() );

        self:SetSize( ScrW(), ScrH() );

        self:Center();

        self:MakePopup();

        name( self );

        PlayerPanel( self );

        local side = vgui.Create( "DLabel", self );

        side:Dock( LEFT );

        side:SetWide( 170);

        side:DockMargin( 0, 0, 0, 0 )

        side:SetText( "" );

        side.Paint = function( self, w, h )

            surface.SetDrawColor( white );

            surface.SetMaterial( sidemat );

            surface.DrawTexturedRect( - 25, 0, w, h );

        end;



        local Title = self:Add( "DPanel" );

        Title:SetPos( 140.2, 183.6 );

        Title:SetSize( 576, 108 );

        Title.Paint = nil;



        local top = Title:Add( "DLabel" );

        top:Dock( TOP );

        top:SetText( HCLIB:L( "swbfiiesc", "pausemenu" ) );

        top:SetFont( "RDSRP.ESC.Button" );

        top:SetTall( Title:GetTall() / 2 );

        top:SetTextColor( white );


        local bottom = Title:Add( "DLabel" );

        bottom:Dock( TOP );

        bottom:SetText( HCLIB:L( "swbfiiesc", "pausemenu" ) );

        bottom:SetFont( "RDSRP.ESC.Aurebesh" );

        bottom:SetTall( Title:GetTall() / 2 );

        bottom:SetTextColor( gray );


        local scrollmenu = self:Add("DScrollPanel")

        scrollmenu:SetPos( 140, 290 );

        scrollmenu:SetSize( 350, 650 );
            
        local sbar = scrollmenu:GetVBar()
    
        function sbar:Paint() return end;
        
        function sbar.btnUp:Paint() return end;

        function sbar.btnDown:Paint() return end;

        function sbar.btnGrip:Paint() return draw.RoundedBox( 0, 0, 0, w, h, Color(255,255,255,140) ) end;

        function scrollmenu:Paint() return end;


        local play = vgui.Create( "SWBFII.Button", scrollmenu );

        play:SetLabel( HCLIB:L( "swbfiiesc", "Play" ) ); 

        play:SetFunction( function()

            self:Remove()

        end );


        for k, v in pairs( HCLIB.Config.Cfg[ "swbfiiesc" ][ "Buttons" ] ) do 

            local button = vgui.Create( "SWBFII.Button", scrollmenu );

            button:SetLabel( v.title ); 
        
            button:SetFunction( function()
        
                if v.func == "URL" then 

                    gui.OpenURL( v.exec );

                elseif v.func == "Command" then 

                    LocalPlayer():ConCommand( v.exec );

                elseif v.func == "Compilestring" then

                    local funct = CompileString( v.exec, tostring( k ) );

                    funct();
                    
                end;

            end );

        end;

        local options = vgui.Create( "SWBFII.Button", scrollmenu );

        options:SetLabel( HCLIB:L( "swbfiiesc", "Options" ) ); 

        options:SetFunction( function()

            gui.ActivateGameUI();

            RunConsoleCommand( "gamemenucommand", "openoptionsdialog" );

        end );

        local console = vgui.Create( "SWBFII.Button", scrollmenu );

        console:SetLabel( HCLIB:L( "swbfiiesc", "Console" ) ); 

        console:SetFunction( function()

            RunConsoleCommand( "showconsole" );

            gui.ActivateGameUI();

        end );

        local leave = vgui.Create( "SWBFII.Button", scrollmenu );

        leave:SetLabel( HCLIB:L( "swbfiiesc", "Disconnect" ) ); 

        leave.disablecheck = true;

        leave:SetFunction( function()

            RunConsoleCommand("disconnect");

        end );

    end;

    function PANEL:Paint( w, h )
        
        if HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnableBackground" ] or HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnableBackground" ] == nil then 

            surface.SetDrawColor( white )

            surface.SetMaterial( matz )

            surface.DrawTexturedRect( 0, 0, w, h )

        elseif not HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnableBackground" ] then 

            HCLIB:DrawBlurRect( 0, 0, w, h, 3, 6 )

        else

            surface.SetDrawColor( white )

            surface.SetMaterial( matz )

            surface.DrawTexturedRect( 0, 0, w, h )

        end

        if HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnableCustomBackground" ] then

            if not HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnableBackground" ] then 

                return

            end

            if  HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnableCustomBackgroundPath" ] == "" or bg:IsError() or HCLIB:GetImgurImage( HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnableCustomBackgroundPath" ] ) == nil then 
            
                bg = Material( "materials/hcs/bgs/bega.png" )

            else

                bg = HCLIB:GetImgurImage( HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnableCustomBackgroundPath" ] )

            end

            surface.SetDrawColor( white )

            surface.SetMaterial( bg )

            surface.DrawTexturedRect( 0, 0, w, h )

        end

        draw.SimpleText( tostring( HCLIB.Config.Cfg[ "swbfiiesc" ][ "ServerTitle" ] ), "SWBFII.Title", w / 2, 5, white, TEXT_ALIGN_CENTER )

        draw.DrawText( "| " .. HCLIB:L("swbfiiesc", "Leftselect") .. "  |  " .. HCLIB:L("swbfiiesc", "Escback") .. " | ", "SWBFII.Button.20", 140, 1050, white, TEXT_ALIGN_LEFT ) 

        // Avatar
        
        draw.SimpleText( tostring( self.sname ), "SWBFII.Button.20", 160, 25, white, TEXT_ALIGN_LEFT )
        
       -- draw.SimpleText( HCLIB:L("swbfiiesc", "net"), "SWBFII.Button.20", 130, 39, white, TEXT_ALIGN_LEFT )


    end;


    vgui.Register( "SWBFII.Menu", PANEL, "DPanel" );