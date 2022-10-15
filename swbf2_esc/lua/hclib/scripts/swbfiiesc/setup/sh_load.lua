
return { 

    ScriptName = "SWBFII Escape",
    
    ScriptDescription = [[]], 
    
    ScriptExtraInformations = {},
    
    Scriptindex = "swbfiiesc", // NEVER CHANGE THIS SHHIT
     
    Config = { 
        
        Cfg = {

            ["Color"] = Color(251,255,0),

            ["ServerTitle"] = "HCS - Sandbox",

            ["SetServerTitleFont"] = "Recharge Rg", 

            ["EnableBackground"] = false, 

            ["EnableCustomBackground"] = false, 

            ["EnableCustomBackgroundPath"] = "VG1NBWN",

//            ["EnableInfopanel"] = true,

            ["EnableDrawPlayer"] = false,

        //    ["EnablePlayerInfo"] = true,

         //   ["EnableMusic"] = true,

       //     ["MusicPath"] = "",   

            ["PlayermodelSequence"] = false, 

            ["EnterPlayermodelSequence"] = "pose_standing_01",

            ["Buttons"] = { [1] = {  title = "Examplee", Order = 0, func = "URL", exec = "https://google.com"} }
        
        },   
         
        AccessGroups = {}
    },
     
    ScriptDevDocsentry = {},
    
    
    
    CreateIngameConfig = function( lib, parent )
        
        local BlueSecond = Color( 22, 23, 41, 255 );

        local Purplemain = Color( 63, 15, 164, 255);

        local white = Color( 255, 255, 255 );

        --[[ < ---------- ( ServerTitle ) ---------- > ]]


        local ServerTitle = lib.AddField( parent, HCLIB:L( "swbfiiesc", "Title" ), "" )
        
        local Title = lib.AddTextEntry( ServerTitle, HCLIB.Config.Cfg[ "swbfiiesc" ][ "ServerTitle" ], HCLIB:L( "swbfiiesc", "Title" ), false, nil, function( self )
            
            HCLIB.Config.Cfg[ "swbfiiesc" ][ "ServerTitle" ] = self:GetText();

            net.Start( "HCLIB.SetConfig" );
                
                HCLIB:WriteCompressedTable( HCLIB.Config );

                net.WriteString( "swbfiiesc" );

                net.WriteString( "Config" );

            net.SendToServer();

        end );

        --[[ < ---------- ( FONT ) ---------- > ]]
        
        local TitleFont = lib.AddField( parent, HCLIB:L( "swbfiiesc", "Font" ), "" )
        
        local Font = lib.AddTextEntry( TitleFont, HCLIB.Config.Cfg[ "swbfiiesc" ][ "SetServerTitleFont" ], HCLIB:L( "swbfiiesc", "Font" ), false, nil, function( self )
            
            HCLIB.Config.Cfg[ "swbfiiesc" ][ "SetServerTitleFont" ] = self:GetText();

            HCLIB.Scripts.swbfiiesc.TitleFont();

            net.Start( "HCLIB.SetConfig" );
                
                HCLIB:WriteCompressedTable( HCLIB.Config );

                net.WriteString( "swbfiiesc" );

                net.WriteString( "Config" );

            net.SendToServer();

        end );

        --[[ < ---------- ( background enable ) ---------- > ]]

        local enablebackground = lib.AddField( parent, HCLIB:L( "swbfiiesc", "Bg" ), "" );

        local inpuebg = lib.AddBoolSwitch( enablebackground, HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnableBackground" ], function( self )
            
            HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnableBackground" ] = self:GetChecked();

            net.Start( "HCLIB.SetConfig" );
                
                HCLIB:WriteCompressedTable( HCLIB.Config );

                net.WriteString( "swbfiiesc" );

                net.WriteString( "Config" );

            net.SendToServer();

        end );


        --[[ < ---------- ( custom background  ) ---------- > ]]
        
        local enablecustombackground = lib.AddField( parent, HCLIB:L( "swbfiiesc", "Cbg" ), "" );

        local inpuebcg = lib.AddBoolSwitch( enablecustombackground, HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnableCustomBackground" ], function( self )
            
            HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnableCustomBackground" ] = self:GetChecked();

            net.Start( "HCLIB.SetConfig" );
                
                HCLIB:WriteCompressedTable( HCLIB.Config );

                net.WriteString( "swbfiiesc" );

                net.WriteString( "Config" );

            net.SendToServer();

        end );

        --[[ < ---------- ( ImgurID ) ---------- > ]]

        local custombackgroundid = lib.AddField( parent, HCLIB:L( "swbfiiesc", "Iid" ), "" )
        
        local cbid = lib.AddTextEntry( custombackgroundid, HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnableCustomBackgroundPath" ], HCLIB:L( "swbfiiesc", "Iid" ), false, nil, function( self )
            
            HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnableCustomBackgroundPath" ] = self:GetText();

            net.Start( "HCLIB.SetConfig" );
                
                HCLIB:WriteCompressedTable( HCLIB.Config );

                net.WriteString( "swbfiiesc" );

                net.WriteString( "Config" );

            net.SendToServer();

        end );

        --[[ < ---------- ( drawplayer ) ---------- > ]]

        local EnableDrawPlayer = lib.AddField( parent, HCLIB:L( "swbfiiesc", "Dp" ), "" );

        local inpuebg = lib.AddBoolSwitch( EnableDrawPlayer, HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnableDrawPlayer" ], function( self )
            
            HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnableDrawPlayer" ] = self:GetChecked();

            net.Start( "HCLIB.SetConfig" );
                
                HCLIB:WriteCompressedTable( HCLIB.Config );

                net.WriteString( "swbfiiesc" );

                net.WriteString( "Config" );

            net.SendToServer();

        end );

        --[[ < ---------- ( playeranim ) ---------- > ]]

        local EnableDrawPlayerSequence = lib.AddField( parent, HCLIB:L( "swbfiiesc", "Dpa" ), "" );

        local inpuebg = lib.AddBoolSwitch( EnableDrawPlayerSequence, HCLIB.Config.Cfg[ "swbfiiesc" ][ "PlayermodelSequence" ], function( self )
            
            HCLIB.Config.Cfg[ "swbfiiesc" ][ "PlayermodelSequence" ] = self:GetChecked();

            net.Start( "HCLIB.SetConfig" );
                
                HCLIB:WriteCompressedTable( HCLIB.Config );

                net.WriteString( "swbfiiesc" );

                net.WriteString( "Config" );

            net.SendToServer();

        end );

        local EnterPlayermodelSequence = lib.AddField( parent, HCLIB:L( "swbfiiesc", "St" ), "" )
        
        local cbid = lib.AddTextEntry( EnterPlayermodelSequence, HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnterPlayermodelSequence" ], HCLIB:L( "swbfiiesc", "St" ), false, nil, function( self )
            
            HCLIB.Config.Cfg[ "swbfiiesc" ][ "EnterPlayermodelSequence" ] = self:GetText();

            net.Start( "HCLIB.SetConfig" );
                
                HCLIB:WriteCompressedTable( HCLIB.Config );

                net.WriteString( "swbfiiesc" );

                net.WriteString( "Config" );

            net.SendToServer();

        end );


        --[[ < ---------- ( Color ) ---------- > ]]

        local ccfg = lib.AddBlanKPanel( parent );

        ccfg:SetTall( 400 );


        local colorchange = vgui.Create( "DColorCombo", ccfg );
        
        colorchange:Dock( RIGHT );

        colorchange:DockMargin( 0, 10, 10, 10 );

        colorchange:SetWide( 450 );

        colorchange:SetColor( HCLIB.Config.Cfg[ "swbfiiesc" ][ "Color" ])


        local ccfgl = vgui.Create( "DLabel", ccfg );

        ccfgl:SetPos( 10 , 20 );

        ccfgl:SetText( HCLIB:L( "swbfiiesc", "Bhc" ) );

        ccfgl:SetFont( "HCLib.VGUI.50" );

        ccfgl:SetTextColor( Color(  255, 255, 255 ) );

        ccfgl:SizeToContents();

        local ccfls = vgui.Create( "DButton", ccfg );

        ccfls:SetPos( 20, 160 );

        ccfls:SetSize( 400, 50 );

        ccfls:SetText( HCLIB:L( "swbfiiesc", "Save" ) );

        ccfls:SetTextColor( white );

        ccfls:SetFont( "HCLib.VGUI.30" );

        ccfls.Paint = function( self, w, h)

            draw.RoundedBox( 19, 0, 1, w, h - 2, Purplemain );

            draw.RoundedBox( 15, 0, 0, w, h - 8, self:IsHovered() and Purplemain or BlueSecond );
 
        end;

        ccfls.DoClick = function( self )

            HCLIB.Config.Cfg[ "swbfiiesc" ][ "Color" ] = colorchange:GetColor();

            net.Start( "HCLIB.SetConfig" );
                
                HCLIB:WriteCompressedTable( HCLIB.Config );

                net.WriteString( "swbfiiesc" );

                net.WriteString( "Config" );

            net.SendToServer();

        end;



        --[[ < ---------- ( Buttons ) ---------- > ]]


        local bcfg = lib.AddBlanKPanel( parent );

        bcfg:SetTall( 600 );

        local bcfgsc = vgui.Create( "DScrollPanel", bcfg );
        
        bcfgsc:Dock( FILL );

        local add = bcfg:Add("DButton")
        add:Dock(BOTTOM)
        add:SetTall( 50 );
        add:DockMargin(10,0,10,20)
            add.Paint = function(self,w,h)
                self:SetFont("HCLib.VGUI.20")
                self:SetTextColor(Color(255,255,255))
                self:SetText("✚")
                surface.SetDrawColor(Color(21,80,21))
                surface.DrawOutlinedRect(0,0,w,h)
                if self:IsHovered() then 
                    draw.RoundedBox(1,0,0,w,h,Color(21,80,21),false,true,false,false)
                end                    
            end


        local function Buttons()
             local function addo( )
                add.DoClick = function()
                    local Window = vgui.Create( "HCLIB.Blank" )
                    Window:SetSize( ScrW()* 0.34, ScrH() * 0.5 )
                    Window:Center()
                    Window:MakePopup()
                    Window:DoModal()
                        Window.Paint = function(self,w,h)
                            draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
                            draw.RoundedBox(15,2,2,w-4,h-4,Color(23,22,22,255))
                        end
                    local top = vgui.Create("DPanel", Window)
                    top:Dock(TOP)
                    top:SetTall(ScrH()*0.05)
                        top.Paint = function(self,w,h)
                            draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,false,false)
                            draw.SimpleText("Create Button", "HCLib.VGUI.30", self:GetWide()/2, self:GetTall()/2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                        end


                    local Orderr = vgui.Create("DNumberWang", Window)
                    Orderr:Dock( TOP )
                    Orderr:DockMargin(10,5,10,0)
                    Orderr:SetTall(ScrH()*0.06)
                    -- Orderr:SetValue(v.Order)
                    Orderr:SetMin(0)
                    Orderr:SetMax(100)
                
                    local title = vgui.Create("DTextEntry", Window)
                    title:Dock( TOP )
                    title:DockMargin(10,5,10,0)
                    title:SetTall(ScrH()*0.06)
                    --title:SetValue(v.title)
                    title:SetFont("HCLib.VGUI.25")
                    title:SetPlaceholderText("Title")

                    local funcc = vgui.Create( "DComboBox", Window )
                    funcc:Dock( TOP )
                    funcc:DockMargin(10,5,10,0)
                    funcc:SetTall(ScrH()*0.06)
                    funcc:SetText("Function")
                    funcc:AddChoice( "Command", nil, nil )
                    funcc:AddChoice( "URL", nil, nil )
                    funcc:AddChoice( "Compilestring", nil, nil )

                    local execc = vgui.Create("DTextEntry", Window)
                    execc:Dock( TOP )
                    execc:DockMargin(10,5,10,0)
                    execc:SetTall(ScrH()*0.06)
                    -- execc:SetValue(v.exec)
                    execc:SetFont("HCLib.VGUI.25")
                    execc:SetPlaceholderText("Execute")
        
                    local close = vgui.Create("DButton", Window)
                    close:Dock(BOTTOM)
                    close:DockMargin(20,0,20,10)
                    close:SetText( HCLIB:L( "swbfiiesc", "Cancel") )
                    close:SetTextColor( Color(255,255,255))
                    close:SetTall(ScrH() * 0.03 )
                    close.Paint = function(self,w,h)
                        local clr
                        if self:IsHovered() then 
                            draw.RoundedBoxEx(6,0,0,w,h,Color(255,0,0),true,true,true,true)
                        end
                        draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
                    end
                    close.DoClick = function()
                        Window:Remove()
                    end
                    local enter = vgui.Create("DButton", Window)
                    enter:Dock(BOTTOM)
                    enter:DockMargin(20,0,20,10)
                    enter:SetText( HCLIB:L( "swbfiiesc", "Send") )
                    enter:SetTextColor( Color(255,255,255))
                    enter:SetTall(ScrH() * 0.03 )
                    enter.Paint = function(self,w,h)
                        local clr
                        if self:IsHovered() then 
                            draw.RoundedBoxEx(6,0,0,w,h,Color(0,255,13),true,true,true,true)
                        end
                        draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
                    end
                    enter.DoClick = function()
                    local count = table.Count( HCLIB.Config.Cfg[ "swbfiiesc" ]["Buttons"] )
                        local tabl = { [ count + 1 ] = { title = title:GetValue(), Order = Orderr:GetValue(), func = funcc:GetValue(), exec = execc:GetValue() } }
                        table.Merge( HCLIB.Config.Cfg[ "swbfiiesc" ]["Buttons"], tabl)

                        net.Start( "HCLIB.SetConfig" );
                            
                            HCLIB:WriteCompressedTable( HCLIB.Config );

                            net.WriteString( "swbfiiesc" );

                            net.WriteString( "Config" );

                        net.SendToServer();

                        Window:Remove()
                        bcfgsc:Clear()
                        timer.Simple(0.1,function()
                            Buttons()
                        end)
                    end
                end
            end;

            if table.IsEmpty(HCLIB.Config.Cfg[ "swbfiiesc" ]["Buttons"]) then 
                local button = vgui.Create("DButton", bcfgsc)
                button:Dock(TOP)
                button:SetTall(ScrH()*0.07)
                button:DockMargin(5,5,5,5)
                button:SetText("")
                button.Paint = function(self,w,h)
                    draw.RoundedBox(14,0,0,w,h,BlueSecond)
                    draw.SimpleText(HCLIB:L( "swbfiiesc", "NoButtons_B"), "HCLib.VGUI.35", self:GetWide()/2, self:GetTall()/2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end

                addo();

            else
                for k,v in pairs(HCLIB.Config.Cfg[ "swbfiiesc" ]["Buttons"]) do    
                    local button = vgui.Create("DButton", bcfgsc)
                    button:Dock(TOP)
                    button:SetTall(ScrH()*0.07)
                    button:DockMargin(5,5,5,5)
                    button:SetText("")
                    button.Paint = function(self,w,h)
                        draw.RoundedBox(14,0,0,w,h,Color(0,0,0,160))
                        draw.SimpleText(v.title, "HCLib.VGUI.35", self:GetWide()/2, self:GetTall()/2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                    local Delete = button:Add("DButton")
                    Delete:Dock(RIGHT)
                    Delete:DockMargin(0,0,0,0)
                    Delete:SetWide(ScrW()*0.02)
                    Delete:SetText("✘")
                    Delete:SetFont("HCLib.VGUI.30")
                    Delete:SetTextColor(Color(255,255,255))
                        Delete.DoClick = function()
                        end
                        Delete.Paint = function(self,w,h)
                            surface.SetDrawColor(Color(255,0,0))
                            surface.DrawOutlinedRect(0,0,w,h)
                            if self:IsHovered() then 
                                draw.RoundedBox(5,0,0,w,h,Color(255,0,0),false,true,false,false)
                            end       
                        end
                        Delete.DoClick = function()
                            HCLIB.Config.Cfg[ "swbfiiesc" ]["Buttons"][k] = nil
                            net.Start( "HCLIB.SetConfig" );
                                
                                HCLIB:WriteCompressedTable( HCLIB.Config );

                                net.WriteString( "swbfiiesc" );

                                net.WriteString( "Config" );

                            net.SendToServer();
                            bcfgsc:Clear()
                            timer.Simple(0.1,function()
                                Buttons()
                            end)
                        end
                    local Edit = button:Add("DButton")
                    Edit:Dock(RIGHT)
                    Edit:DockMargin(0,0,5,0)
                    Edit:SetWide(ScrW()*0.02)
                    Edit:SetText("E")
                    Edit:SetFont("HCLib.VGUI.30")
                    Edit:SetTextColor(Color(255,255,255))
                    Edit.Paint  = function(self,w,h)
                        surface.SetDrawColor(Color(255,123,0))
                        surface.DrawOutlinedRect(0,0,w,h)
                        if self:IsHovered() then 
                            draw.RoundedBox(5,0,0,w,h,Color(255,123,0),false,true,false,false)
                        end    
                    end
                    Edit.DoClick = function()
                        local Window = vgui.Create( "HCLIB.Blank" )
                        Window:SetSize( ScrW() * 0.34, ScrH() * 0.5 )
                        Window:Center()
                        Window:MakePopup()
                        Window:DoModal()
                            Window.Paint = function(self,w,h)
                                draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
                                draw.RoundedBox(15,2,2,w-4,h-4,Color(23,22,22,255))
                            end
                        local top = vgui.Create("DPanel", Window)
                        top:Dock(TOP)
                        top:SetTall(ScrH()*0.05)
                            top.Paint = function(self,w,h)
                                draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,false,false)
                                draw.SimpleText("Edit", "HCLib.VGUI.30", self:GetWide()/2, self:GetTall()/2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                            end


                        local Orderr = vgui.Create("DNumberWang", Window)
                        Orderr:Dock( TOP )
                        Orderr:DockMargin(10,5,10,0)
                        Orderr:SetTall(ScrH()*0.06)
                        Orderr:SetValue(v.Order)
                        Orderr:SetMin(0)
                        Orderr:SetMax(100)
                    
                        local title = vgui.Create("DTextEntry", Window)
                        title:Dock( TOP )
                        title:DockMargin(10,5,10,0)
                        title:SetTall(ScrH()*0.06)
                        title:SetValue(v.title)
                        title:SetFont("HCLib.VGUI.25")
                        title:SetPlaceholderText("Title")

                        local funcc = vgui.Create( "DComboBox", Window )
                        funcc:Dock( TOP )
                        funcc:DockMargin(10,5,10,0)
                        funcc:SetTall(ScrH()*0.06)
                        funcc:SetValue( v.func )
                        funcc:AddChoice( "Command", nil, nil )
                        funcc:AddChoice( "URL", nil, nil )
                        funcc:AddChoice( "Compilestring", nil, nil )

                        local execc = vgui.Create("DTextEntry", Window)
                        execc:Dock( TOP )
                        execc:DockMargin(10,5,10,0)
                        execc:SetTall(ScrH()*0.06)
                        execc:SetValue(v.exec)
                        execc:SetFont("HCLib.VGUI.25")
                        execc:SetPlaceholderText("Execute")
            
                        local close = vgui.Create("DButton", Window)
                        close:Dock(BOTTOM)
                        close:DockMargin(20,0,20,10)
                        close:SetText( HCLIB:L( "swbfiiesc", "Cancel") )
                        close:SetTextColor( Color(255,255,255))
                        close:SetTall(ScrH() * 0.03 )
                        close.Paint = function(self,w,h)
                            local clr
                            if self:IsHovered() then 
                                draw.RoundedBoxEx(6,0,0,w,h,Color(255,0,0),true,true,true,true)
                            end
                            draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
                        end
                        close.DoClick = function()
                            Window:Remove()
                        end
                        local enter = vgui.Create("DButton", Window)
                        enter:Dock(BOTTOM)
                        enter:DockMargin(20,0,20,10)
                        enter:SetText(HCLIB:L( "swbfiiesc", "Send") )
                        enter:SetTextColor( Color(255,255,255))
                        enter:SetTall(ScrH() * 0.03 )
                        enter.Paint = function(self,w,h)
                            local clr
                            if self:IsHovered() then 
                                draw.RoundedBoxEx(6,0,0,w,h,Color(0,255,13),true,true,true,true)
                            end
                            draw.RoundedBox(6,2,2,w-4,h-4,Color(46,46,46))
                        end
                        enter.DoClick = function()
                            HCLIB.Config.Cfg[ "swbfiiesc" ]["Buttons"][k].title = title:GetValue()
                            HCLIB.Config.Cfg[ "swbfiiesc" ]["Buttons"][k].Order = Orderr:GetValue()
                            HCLIB.Config.Cfg[ "swbfiiesc" ]["Buttons"][k].func = funcc:GetValue()
                            HCLIB.Config.Cfg[ "swbfiiesc" ]["Buttons"][k].exec = execc:GetValue()
                            net.Start( "HCLIB.SetConfig" );
                                
                                HCLIB:WriteCompressedTable( HCLIB.Config );

                                net.WriteString( "swbfiiesc" );

                                net.WriteString( "Config" );

                            net.SendToServer();
                            Window:Remove()
                            bcfgsc:Clear()
                            timer.Simple(0.1,function()
                                Buttons()
                            end)
                        end
                    end
                    
                    addo();

                end
            end
        end
        
        Buttons()


    end,
    
    LoadFiles = function() 
    
        if ( SERVER ) then 

            AddCSLuaFile( "hclib/scripts/swbfiiesc/cl_init.lua" );

            AddCSLuaFile( "hclib/scripts/swbfiiesc/vgui/cl_buttons.lua" );

            AddCSLuaFile( "hclib/scripts/swbfiiesc/vgui/cl_infopanel.lua" );
                        
            AddCSLuaFile( "hclib/scripts/swbfiiesc/vgui/cl_menu.lua" );
        end;

        if ( CLIENT ) then 

            include( "hclib/scripts/swbfiiesc/cl_init.lua" );

            include( "hclib/scripts/swbfiiesc/vgui/cl_buttons.lua" );

            include( "hclib/scripts/swbfiiesc/vgui/cl_infopanel.lua" );

            include( "hclib/scripts/swbfiiesc/vgui/cl_menu.lua" );

        end;
    
    end,
    
}
