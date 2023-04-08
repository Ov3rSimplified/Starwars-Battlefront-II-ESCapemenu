if CLIENT then 
    HexSh:registerConfig( "SWBFIIESC", Color(240,0,0), function(sheet)
  
        local scrw, scrh = ScrW(), ScrH()
        local d2c = Color(16,16,16)
        local d1c = Color(16,16,16)
        local white = Color(255,255,255)
        
        local SMainPanel = vgui.Create("DScrollPanel", sheet)
        SMainPanel:Dock(FILL)
        local sbar = SMainPanel:GetVBar()
        sbar:SetSize(5,0)
        sbar:SetHideButtons( true )
        function sbar.btnGrip:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,d1c,false,false,false,false) end
        function sbar:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),false,false,false,false) end
        function sbar.btnUp:Paint(w, h) return end
        function sbar.btnDown:Paint(w, h) return end
        --[[
            -- Title
        ]]
        local function TitleCFGG()
            local TitleCFG = vgui.Create("DCollapsibleCategory", SMainPanel)
            TitleCFG:Dock( TOP )
            TitleCFG:DockMargin(0,5,0,0)
            TitleCFG:SetHeaderHeight( scrh * 0.07 )
            TitleCFG:SetLabel( " " )
            TitleCFG:SetExpanded( false )
            TitleCFG.Paint = function(self,w,h)
                    draw.SimpleText(HexSh:L("src_swbfiiesc", "Titlecategory"), "SWBFIIESC.Cfg40", self:GetWide()/2, 10, Color(255,255,255), TEXT_ALIGN_CENTER)
                    draw.RoundedBox(0,5 ,scrh*0.067,w,2.5,white)
                end

            local Titlepanel = vgui.Create( "DPanel",TitleCFG )
            Titlepanel:Dock(TOP)
            Titlepanel:SetTall( scrh*0.115 )
            Titlepanel.Paint = function(self,w,h)
            end

            local SetTitlee = vgui.Create( "DPanel", Titlepanel )
            SetTitlee:Dock(TOP)
            SetTitlee:DockMargin(5,5,5,0)
            SetTitlee:SetTall( scrh*0.05 )
            SetTitlee:SetTooltip( HexSh:L("src_swbfiiesc", "Title-Info") )
            SetTitlee.Paint = function(self,w,h)
                draw.RoundedBox(0,0,0,2.5,h,white)
                draw.RoundedBox(0,0,scrh*0.049,scrw*0.19,2.5,white)
            end

            local SetTitlee_Info = vgui.Create("DLabel", SetTitlee )
            SetTitlee_Info:Dock( LEFT )
            SetTitlee_Info:DockMargin(0,0,0,0)
            SetTitlee_Info:SetWide( scrw * 0.3)
            SetTitlee_Info:SetText( "" )
                function SetTitlee_Info.Paint(self,w,h)
                    --draw.SimpleText(HexSh:L("src_swbfiiesc", "DRP"), font, 0,0, HCS.Colors["white"], TEXT_ALIGN_LEFT )
                    draw.SimpleText(HexSh:L("src_swbfiiesc", "Title"), "SWBFIIESC.Cfg40", 20, self:GetTall() /2, Color(255,255,255), TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
                end

            local SetTitlee_Change = vgui.Create( "DTextEntry", SetTitlee )
            SetTitlee_Change:Dock(RIGHT)
            SetTitlee_Change:SetText("")
            SetTitlee_Change:SetWide(scrw * 0.18)
            SetTitlee_Change:DockMargin(0,6,15,6)
            SetTitlee_Change:SetFont("SWBFIIESC.Cfg30")
            SetTitlee_Change:SetText( HexSh:getIConfig("src_swbfiiesc")["ServerTitle"] )
            
            SetTitlee_Change.OnEnter = function(self)
                HexSh:getIConfig("src_swbfiiesc")["ServerTitle"] = self:GetText() 
                net.Start("HexSH::WriteConfig")
                HexSh:WriteCompressedTable(HexSh.Config.IConfig)
                net.SendToServer()
            end



            local SetFontt = vgui.Create( "DPanel", Titlepanel )
            SetFontt:Dock(TOP)
            SetFontt:DockMargin(5,5,5,0)
            SetFontt:SetTall( scrh*0.05 )
            SetFontt:SetTooltip( HexSh:L("src_swbfiiesc", "Font-Info") )
            SetFontt.Paint = function(self,w,h)
                draw.RoundedBox(0,0,0,2.5,h,white)
                draw.RoundedBox(0,0,scrh*0.049,scrw*0.19,2.5,white)
            end

            local SetFontt_Info = vgui.Create("DLabel", SetFontt )
            SetFontt_Info:Dock( LEFT )
            SetFontt_Info:DockMargin(0,0,0,0)
            SetFontt_Info:SetWide( scrw * 0.3)
            SetFontt_Info:SetText( "" )
                function SetFontt_Info.Paint(self,w,h)
                    --draw.SimpleText(HexSh:L("src_swbfiiesc", "DRP"), font, 0,0, HCS.Colors["white"], TEXT_ALIGN_LEFT )
                    draw.SimpleText(HexSh:L("src_swbfiiesc", "Font"), "SWBFIIESC.Cfg40", 20, self:GetTall() /2, Color(255,255,255), TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
                end

            local SetFontt_Change = vgui.Create( "DTextEntry", SetFontt )
            SetFontt_Change:Dock(RIGHT)
            SetFontt_Change:SetText("")
            SetFontt_Change:SetWide(scrw * 0.18)
            SetFontt_Change:DockMargin(0,6,15,6)
            SetFontt_Change:SetFont("SWBFIIESC.Cfg30")
            SetFontt_Change:SetText( HexSh:getIConfig("src_swbfiiesc")["SetServerTitleFont"] )
            
            SetFontt_Change.OnEnter = function(self)
                HexSh:getIConfig("src_swbfiiesc")["SetServerTitleFont"] = self:GetText() 
                net.Start("HexSH::WriteConfig")
                HexSh:WriteCompressedTable(HexSh.Config.IConfig)
                net.SendToServer()
                include("hexagon_cryptics/swbfii-esc/cl_fonts.lua")
            end 
        end
        TitleCFGG()

        --[[
            -- Visuell
        ]]
        local function VisuellCFGG()
            local VisuellCFG = vgui.Create("DCollapsibleCategory", SMainPanel)
            VisuellCFG:Dock( TOP )
            VisuellCFG:DockMargin(0,5,0,0)
            VisuellCFG:SetHeaderHeight( scrh * 0.07 )
            VisuellCFG:SetLabel( " " )
            VisuellCFG:SetExpanded( false )
            VisuellCFG.Paint = function(self,w,h)
                draw.SimpleText(HexSh:L("src_swbfiiesc", "Visuallycategory"), "SWBFIIESC.Cfg40", self:GetWide()/2, 10, Color(255,255,255), TEXT_ALIGN_CENTER)
                draw.RoundedBox(0,5 ,scrh*0.067,w,2.5,white)
            end

            local Visuellpanel = vgui.Create( "DPanel",VisuellCFG )
            Visuellpanel:Dock(TOP)
            Visuellpanel:SetTall( scrh*0.39 )
            Visuellpanel.Paint = function(self,w,h)
            end


            local Visuell_AB = vgui.Create( "DPanel", Visuellpanel )
            Visuell_AB:Dock(TOP)
            Visuell_AB:DockMargin(5,5,5,0)
            Visuell_AB:SetTall( scrh*0.05 )
            Visuell_AB:SetTooltip( HexSh:L("src_swbfiiesc", "bg-Info") )
            Visuell_AB.Paint = function(self,w,h)
                draw.RoundedBox(0,0,0,2.5,h,white)
                draw.RoundedBox(0,0,scrh*0.049,scrw*0.19,2.5,white)
            end

            local Visuell_AB_Info = vgui.Create("DLabel", Visuell_AB )
            Visuell_AB_Info:Dock( LEFT )
            Visuell_AB_Info:DockMargin(0,0,0,0)
            Visuell_AB_Info:SetWide( scrw * 0.3)
            Visuell_AB_Info:SetText( "" )
                function Visuell_AB_Info.Paint(self,w,h)
                    --draw.SimpleText(HexSh:L("src_swbfiiesc", "DRP"), font, 0,0, HCS.Colors["white"], TEXT_ALIGN_LEFT )
                    draw.SimpleText(HexSh:L("src_swbfiiesc", "Bg"), "SWBFIIESC.Cfg40", 20, self:GetTall() /2, Color(255,255,255), TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
                end

            local Visuell_AB_Change = vgui.Create( "DCheckBox", Visuell_AB )
            Visuell_AB_Change:Dock(RIGHT)
            Visuell_AB_Change:SetText("")
            Visuell_AB_Change:DockMargin(0,15,15,0)
            Visuell_AB_Change:SetChecked( HexSh:getIConfig("src_swbfiiesc")["EnableBackground"] )
                Visuell_AB_Change.OnChange = function(self)
                    if (self:GetChecked() == true) then 
                        HexSh:getIConfig("src_swbfiiesc")["EnableBackground"] = true
                    else
                        HexSh:getIConfig("src_swbfiiesc")["EnableBackground"] = false 
                    end

                    net.Start("HexSH::WriteConfig")
                    HexSh:WriteCompressedTable(HexSh.Config.IConfig)
                    net.SendToServer()
                end


            local Visuell_CBG = vgui.Create( "DPanel", Visuellpanel )
            Visuell_CBG:Dock(TOP)
            Visuell_CBG:DockMargin(5,5,5,0)
            Visuell_CBG:SetTall( scrh*0.05 )
            Visuell_CBG:SetTooltip( HexSh:L("src_swbfiiesc", "Cbg-Info") )
            Visuell_CBG.Paint = function(self,w,h)
                draw.RoundedBox(0,0,0,2.5,h,white)
                draw.RoundedBox(0,0,scrh*0.049,scrw*0.19,2.5,white)
            end

            local Visuell_CBG_Info = vgui.Create("DLabel", Visuell_CBG )
            Visuell_CBG_Info:Dock( LEFT )
            Visuell_CBG_Info:DockMargin(0,0,0,0)
            Visuell_CBG_Info:SetWide( scrw * 0.4)
            Visuell_CBG_Info:SetText( "" )
                function Visuell_CBG_Info.Paint(self,w,h)
                    --draw.SimpleText(HexSh:L("src_swbfiiesc", "DRP"), font, 0,0, HCS.Colors["white"], TEXT_ALIGN_LEFT )
                    draw.SimpleText(HexSh:L("src_swbfiiesc", "Cbg"), "SWBFIIESC.Cfg40", 20, self:GetTall() /2, Color(255,255,255), TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
                end

            local visibla_Visuell_AB_Change = Visuell_AB_Change:GetValue()
            local Visuell_CBG_Change = vgui.Create( "DCheckBox", Visuell_CBG )
            Visuell_CBG_Change:Dock(RIGHT)
            Visuell_CBG_Change:SetText("")
            Visuell_CBG_Change:DockMargin(0,15,15,0)
            Visuell_CBG_Change:SetChecked( HexSh:getIConfig("src_swbfiiesc")["EnableCustomBackground"] )
                Visuell_CBG_Change.OnChange = function(self)
                    if (self:GetChecked() == true) then 
                        HexSh:getIConfig("src_swbfiiesc")["EnableCustomBackground"] = true
                    else
                        HexSh:getIConfig("src_swbfiiesc")["EnableCustomBackground"] = false
                    end

                    net.Start("HexSH::WriteConfig")
                    HexSh:WriteCompressedTable(HexSh.Config.IConfig)
                    net.SendToServer()
                end



            local Visuell_CBGP = vgui.Create( "DPanel", Visuellpanel )
            Visuell_CBGP:Dock(TOP)
            Visuell_CBGP:DockMargin(5,5,5,0)
            Visuell_CBGP:SetTall( scrh*0.05 )
            Visuell_CBGP:SetTooltip( HexSh:L("src_swbfiiesc", "Iid-Info") )
            Visuell_CBGP.Paint = function(self,w,h)
                draw.RoundedBox(0,0,0,2.5,h,white)
                draw.RoundedBox(0,0,scrh*0.049,scrw*0.19,2.5,white)
            end

            local Visuell_CBGP_Info = vgui.Create("DLabel", Visuell_CBGP )
            Visuell_CBGP_Info:Dock( LEFT )
            Visuell_CBGP_Info:DockMargin(0,0,0,0)
            Visuell_CBGP_Info:SetWide( scrw * 0.3)
            Visuell_CBGP_Info:SetText( "" )
                function Visuell_CBGP_Info.Paint(self,w,h)
                    --draw.SimpleText(HexSh:L("src_swbfiiesc", "DRP"), font, 0,0, HCS.Colors["white"], TEXT_ALIGN_LEFT )
                    draw.SimpleText(HexSh:L("src_swbfiiesc", "Iid"), "SWBFIIESC.Cfg40", 20, self:GetTall() /2, Color(255,255,255), TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
                end

            local Visuell_CBGP_Change = vgui.Create( "DTextEntry", Visuell_CBGP )
            Visuell_CBGP_Change:Dock(RIGHT)
            Visuell_CBGP_Change:SetText("")
            Visuell_CBGP_Change:SetWide(scrw * 0.18)
            Visuell_CBGP_Change:DockMargin(0,6,15,6)
            Visuell_CBGP_Change:SetFont("SWBFIIESC.Cfg30")
            Visuell_CBGP_Change:SetText( HexSh:getIConfig("src_swbfiiesc")["EnableCustomBackgroundPath"] )
                Visuell_CBGP_Change.OnEnter = function(self)
                    HexSh:getIConfig("src_swbfiiesc")["EnableCustomBackgroundPath"] = self:GetText() 
                    net.Start("HexSH::WriteConfig")
                    HexSh:WriteCompressedTable(HexSh.Config.IConfig)
                    net.SendToServer()
                end



            local Visuell_EIP = vgui.Create( "DPanel", Visuellpanel )
            Visuell_EIP:Dock(TOP)
            Visuell_EIP:DockMargin(5,5,5,0)
            Visuell_EIP:SetTall( scrh*0.05 )
            Visuell_EIP:SetTooltip( HexSh:L("src_swbfiiesc", "Ip-Info") )
            Visuell_EIP.Paint = function(self,w,h)
                draw.RoundedBox(0,0,0,2.5,h,white)
                draw.RoundedBox(0,0,scrh*0.049,scrw*0.19,2.5,white)
            end

            local Visuell_EIP_Info = vgui.Create("DLabel", Visuell_EIP )
            Visuell_EIP_Info:Dock( LEFT )
            Visuell_EIP_Info:DockMargin(0,0,0,0)
            Visuell_EIP_Info:SetWide( scrw * 0.4)
            Visuell_EIP_Info:SetText( "" )
                function Visuell_EIP_Info.Paint(self,w,h)
                    --draw.SimpleText(HexSh:L("src_swbfiiesc", "DRP"), font, 0,0, HCS.Colors["white"], TEXT_ALIGN_LEFT )
                    draw.SimpleText(HexSh:L("src_swbfiiesc", "Ip"), "SWBFIIESC.Cfg40", 20, self:GetTall() /2, Color(255,255,255), TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
                end

            local Visuell_EIP_Change = vgui.Create( "DCheckBox", Visuell_EIP )
            Visuell_EIP_Change:Dock(RIGHT)
            Visuell_EIP_Change:SetText("")
            Visuell_EIP_Change:DockMargin(0,15,15,0)
            Visuell_EIP_Change:SetChecked( HexSh:getIConfig("src_swbfiiesc")["EnableInfopanel"] )
                Visuell_EIP_Change.OnChange = function(self)
                    if (self:GetChecked() == true) then 
                        HexSh:getIConfig("src_swbfiiesc")["EnableInfopanel"] = true
                    else
                        HexSh:getIConfig("src_swbfiiesc")["EnableInfopanel"] = false 
                    end

                    net.Start("HexSH::WriteConfig")
                    HexSh:WriteCompressedTable(HexSh.Config.IConfig)
                    net.SendToServer()
                end


            local Visuell_EDP = vgui.Create( "DPanel", Visuellpanel )
            Visuell_EDP:Dock(TOP)
            Visuell_EDP:DockMargin(5,5,5,0)
            Visuell_EDP:SetTall( scrh*0.05 )
            Visuell_EDP:SetTooltip( HexSh:L("src_swbfiiesc", "Dp-Info") )
            Visuell_EDP.Paint = function(self,w,h)
                draw.RoundedBox(0,0,0,2.5,h,white)
                draw.RoundedBox(0,0,scrh*0.049,scrw*0.19,2.5,white)
            end

            local Visuell_EDP_Info = vgui.Create("DLabel", Visuell_EDP )
            Visuell_EDP_Info:Dock( LEFT )
            Visuell_EDP_Info:DockMargin(0,0,0,0)
            Visuell_EDP_Info:SetWide( scrw * 0.4)
            Visuell_EDP_Info:SetText( "" )
                function Visuell_EDP_Info.Paint(self,w,h)
                    --draw.SimpleText(HexSh:L("src_swbfiiesc", "DRP"), font, 0,0, HCS.Colors["white"], TEXT_ALIGN_LEFT )
                    draw.SimpleText(HexSh:L("src_swbfiiesc", "Dp"), "SWBFIIESC.Cfg40", 20, self:GetTall() /2, Color(255,255,255), TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
                end

            local Visuell_EDP_Change = vgui.Create( "DCheckBox", Visuell_EDP )
            Visuell_EDP_Change:Dock(RIGHT)
            Visuell_EDP_Change:SetText("")
            Visuell_EDP_Change:DockMargin(0,15,15,0)
            Visuell_EDP_Change:SetChecked( HexSh:getIConfig("src_swbfiiesc")["EnableDrawPlayer"] )
                Visuell_EDP_Change.OnChange = function(self)
                    if (self:GetChecked() == true) then 
                        HexSh:getIConfig("src_swbfiiesc")["EnableDrawPlayer"] = true
                    else
                        HexSh:getIConfig("src_swbfiiesc")["EnableDrawPlayer"] = false 
                    end

                    net.Start("HexSH::WriteConfig")
                    HexSh:WriteCompressedTable(HexSh.Config.IConfig)
                    net.SendToServer()
                end
        
            local Visuell_EPS = vgui.Create( "DPanel", Visuellpanel )
            Visuell_EPS:Dock(TOP)
            Visuell_EPS:DockMargin(5,5,5,0)
            Visuell_EPS:SetTall( scrh*0.05 )
            Visuell_EPS:SetTooltip( HexSh:L("src_swbfiiesc", "Dpa-Info") )
            Visuell_EPS.Paint = function(self,w,h)
                draw.RoundedBox(0,0,0,2.5,h,white)
                draw.RoundedBox(0,0,scrh*0.049,scrw*0.19,2.5,white)
            end

            local Visuell_EPS_Info = vgui.Create("DLabel", Visuell_EPS )
            Visuell_EPS_Info:Dock( LEFT )
            Visuell_EPS_Info:DockMargin(0,0,0,0)
            Visuell_EPS_Info:SetWide( scrw * 0.4)
            Visuell_EPS_Info:SetText( "" )
                function Visuell_EPS_Info.Paint(self,w,h)
                    --draw.SimpleText(HexSh:L("src_swbfiiesc", "DRP"), font, 0,0, HCS.Colors["white"], TEXT_ALIGN_LEFT )
                    draw.SimpleText(HexSh:L("src_swbfiiesc", "Dpa"), "SWBFIIESC.Cfg40", 20, self:GetTall() /2, Color(255,255,255), TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
                end

            local Visuell_EPS_Change = vgui.Create( "DCheckBox", Visuell_EPS )
            Visuell_EPS_Change:Dock(RIGHT)
            Visuell_EPS_Change:SetText("")
            Visuell_EPS_Change:DockMargin(0,15,15,0)
            Visuell_EPS_Change:SetChecked( HexSh:getIConfig("src_swbfiiesc")["PlayermodelSequence"] )
                Visuell_EPS_Change.OnChange = function(self)
                    if (self:GetChecked() == true) then 
                        HexSh:getIConfig("src_swbfiiesc")["PlayermodelSequence"] = true
                    else
                        HexSh:getIConfig("src_swbfiiesc")["PlayermodelSequence"] = false 
                    end
                    net.Start("HexSH::WriteConfig")
                    HexSh:WriteCompressedTable(HexSh.Config.IConfig)
                    net.SendToServer()
                end


            local Visuell_EPMS = vgui.Create( "DPanel", Visuellpanel )
            Visuell_EPMS:Dock(TOP)
            Visuell_EPMS:DockMargin(5,5,5,0)
            Visuell_EPMS:SetTall( scrh*0.05 )
            Visuell_EPMS:SetTooltip( HexSh:L("src_swbfiiesc", "St-Info") )
            Visuell_EPMS.Paint = function(self,w,h)
                draw.RoundedBox(0,0,0,2.5,h,white)
                draw.RoundedBox(0,0,scrh*0.049,scrw*0.19,2.5,white)
            end

            local Visuell_EPMS_Info = vgui.Create("DLabel", Visuell_EPMS )
            Visuell_EPMS_Info:Dock( LEFT )
            Visuell_EPMS_Info:DockMargin(0,0,0,0)
            Visuell_EPMS_Info:SetWide( scrw * 0.3)
            Visuell_EPMS_Info:SetText( "" )
                function Visuell_EPMS_Info.Paint(self,w,h)
                    --draw.SimpleText(HexSh:L("src_swbfiiesc", "DRP"), font, 0,0, HCS.Colors["white"], TEXT_ALIGN_LEFT )
                    draw.SimpleText(HexSh:L("src_swbfiiesc", "St"), "SWBFIIESC.Cfg40", 20, self:GetTall() /2, Color(255,255,255), TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
                end

            local Visuell_EPMS_Change = vgui.Create( "DTextEntry", Visuell_EPMS )
            Visuell_EPMS_Change:Dock(RIGHT)
            Visuell_EPMS_Change:SetText("")
            Visuell_EPMS_Change:SetWide(scrw * 0.18)
            Visuell_EPMS_Change:DockMargin(0,6,15,6)
            Visuell_EPMS_Change:SetFont("SWBFIIESC.Cfg30")
            Visuell_EPMS_Change:SetText( HexSh:getIConfig("src_swbfiiesc")["EnterPlayermodelSequence"] )
                Visuell_EPMS_Change.OnEnter = function(self)
                    HexSh:getIConfig("src_swbfiiesc")["EnterPlayermodelSequence"] = self:GetText() 
                    net.Start("HexSH::WriteConfig")
                    HexSh:WriteCompressedTable(HexSh.Config.IConfig)
                    net.SendToServer()
                end
        end
        VisuellCFGG()


        --[[
            -- Button
        ]]
        local ButtonCFG = vgui.Create("DCollapsibleCategory", SMainPanel)
        ButtonCFG:Dock( TOP )
        ButtonCFG:DockMargin(0,5,0,0)
        ButtonCFG:SetHeaderHeight( scrh * 0.07 )
        ButtonCFG:SetLabel( " " )
        ButtonCFG:SetExpanded( false )
        ButtonCFG.Paint = function(self,w,h)
                draw.SimpleText(HexSh:L("src_swbfiiesc", "buttoncategory"), "SWBFIIESC.Cfg40", self:GetWide()/2, 10, Color(255,255,255), TEXT_ALIGN_CENTER)
                draw.RoundedBox(0,5 ,scrh*0.067,w,2.5,white)
            end

        local Buttonpanel = vgui.Create( "DPanel", ButtonCFG )
        Buttonpanel:Dock(TOP)
        Buttonpanel:SetTall( scrh*0.7 )
        Buttonpanel.Paint = function(self,w,h)
        end

        local ButtonCFG_EHP = vgui.Create( "DPanel", Buttonpanel )
        ButtonCFG_EHP:Dock(TOP)
        ButtonCFG_EHP:SetTall( scrh*0.25 )
        ButtonCFG_EHP:DockMargin(5,5,5,0)
        ButtonCFG_EHP:SetTooltip( HexSh:L("src_swbfiiesc", "Bhc-Info") )
            ButtonCFG_EHP.Paint = function(self,w,h)
                draw.RoundedBox(0,0,0,2.5,h,white)
                draw.RoundedBox(0,0,scrh*0.049,scrw*0.19,2.5,white)
            end
    
        ButtonCFG_EHP_Info = vgui.Create("DLabel", ButtonCFG_EHP )
        ButtonCFG_EHP_Info:SetPos(scrw*0.01,scrh*0.01)
        ButtonCFG_EHP_Info:SetSize( scrw*0.4,scrh*0.05)
        ButtonCFG_EHP_Info:SetText( "" )
            ButtonCFG_EHP_Info.Paint = function(self,w,h)
                draw.SimpleText(HexSh:L("src_swbfiiesc", "Bhc"), "SWBFIIESC.Cfg40", 0,0, Color(255,255,255), TEXT_ALIGN_LEFT )
            end 

        ButtonCFG_EHP_Change_Panel = vgui.Create( "DPanel", ButtonCFG_EHP )
        ButtonCFG_EHP_Change_Panel:Dock(RIGHT)
        ButtonCFG_EHP_Change_Panel:SetWide( scrh*0.3 )
        ButtonCFG_EHP_Change_Panel:DockMargin(5,5,5,5)
        ButtonCFG_EHP_Change_Panel.Paint = nil
    
       ButtonCFG_EHP_Change = vgui.Create( "DColorCombo", ButtonCFG_EHP_Change_Panel )
       ButtonCFG_EHP_Change:Dock( FILL )
       ButtonCFG_EHP_Change:SetColor( HexSh:getIConfig("src_swbfiiesc")["Color"] )


       ButtonCFG_EHP_Change_Enter = vgui.Create( "DButton", ButtonCFG_EHP_Change_Panel )
       ButtonCFG_EHP_Change_Enter:Dock( BOTTOM )
       ButtonCFG_EHP_Change_Enter:SetTall(scrh*0.04)
       ButtonCFG_EHP_Change_Enter:DockMargin(0,5,0,0)
       ButtonCFG_EHP_Change_Enter:SetText("")
        ButtonCFG_EHP_Change_Enter.Paint = function(self,w,h)
            if self:IsHovered() then 
                draw.RoundedBox(0,0,0,w,h,Color(38,255,0))
            end
            surface.SetDrawColor(Color(38,255,0))
            surface.DrawOutlinedRect(0,0,w,h,2)
            draw.SimpleText(HexSh:L("src_swbfiiesc", "Save"), "SWBFIIESC.Cfg30", self:GetWide()/2, self:GetTall()/2, Color(255,255,255), TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER )
        end
        ButtonCFG_EHP_Change_Enter.DoClick = function()
            HexSh:getIConfig("src_swbfiiesc")["Color"] = ButtonCFG_EHP_Change:GetColor()
            net.Start("HexSH::WriteConfig")
            HexSh:WriteCompressedTable(HexSh.Config.IConfig)
            net.SendToServer()
        end
        
        local colorbtn = ButtonCFG_EHP_Change:GetColor()

        ButtonCFG_EHP_ExampleButton = vgui.Create( "DButton", ButtonCFG_EHP )
        ButtonCFG_EHP_ExampleButton:Dock( RIGHT )
        ButtonCFG_EHP_ExampleButton:SetText( "" )
        ButtonCFG_EHP_ExampleButton:SetFont( "SWBFIIESC.Cfg40" )
        ButtonCFG_EHP_ExampleButton:SetColor( colorbtn )
        ButtonCFG_EHP_ExampleButton:DockMargin( scrw*0.06,scrh*0.09,scrw*0.05,scrh*0.08 )
        ButtonCFG_EHP_ExampleButton:SetWide(scrw*0.15) 
            ButtonCFG_EHP_ExampleButton.Paint = function(self,w,h)
                surface.SetDrawColor( ButtonCFG_EHP_Change:GetColor() )
                surface.DrawOutlinedRect(0,0,w,h,2)
                draw.SimpleText(HexSh:L("src_swbfiiesc", "Example"), "SWBFIIESC.Cfg40", self:GetWide()/2, self:GetTall()/2, ButtonCFG_EHP_Change:GetColor(), TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER  )
            end

        local ButtonCFG_BC = vgui.Create( "DPanel", Buttonpanel )
        ButtonCFG_BC:Dock(TOP)
        ButtonCFG_BC:SetTall( scrh*0.35 )
        ButtonCFG_BC:DockMargin(5,5,5,0)
        ButtonCFG_BC:SetTooltip( HexSh:L("src_swbfiiesc", "Bhc-Info") )
            ButtonCFG_BC.Paint = function(self,w,h)
                draw.RoundedBox(0,0,0,2.5,h,white)
            end
        
        local ButtonCFG_BC_l = vgui.Create( "DPanel", ButtonCFG_BC )
        ButtonCFG_BC_l:Dock( LEFT )
        ButtonCFG_BC_l:SetWide( scrw*0.25 )
        ButtonCFG_BC_l:DockMargin(10,5,5,5)
            ButtonCFG_BC_l.Paint = function(self,w,h)
                draw.RoundedBox(14,0,0,w,h,Color(0,0,0,130))

            end

            local ButtonCFG_BC_lTOP = vgui.Create( "DPanel", ButtonCFG_BC_l )
            ButtonCFG_BC_lTOP:Dock( TOP ) 
            ButtonCFG_BC_lTOP:SetTall(scrh*0.04)
            ButtonCFG_BC_lTOP:SetText( "" )
                ButtonCFG_BC_lTOP.Paint = function(self,w,h)
                    draw.SimpleText(HexSh:L("src_swbfiiesc", "Buttons"), "SWBFIIESC.Cfg30", self:GetWide()/2, self:GetTall()/2, Color(255,255,255), TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER  )
                end
                local add = ButtonCFG_BC_lTOP:Add("DButton")
                add:Dock(RIGHT)
                add:DockMargin(0,0,0,0)
                    add.Paint = function(self,w,h)
                        self:SetFont("SWBFIIESC.Cfg30")
                        self:SetTextColor(Color(255,255,255))
                        self:SetText("✚")
                        surface.SetDrawColor(Color(21,80,21))
                        surface.DrawOutlinedRect(0,0,w,h)
                        if self:IsHovered() then 
                            draw.RoundedBox(5,0,0,w,h,Color(21,80,21),false,true,false,false)
                        end                    
                    end

            local ButtonCFG_BC_lSCROLL = vgui.Create("DScrollPanel", ButtonCFG_BC_l) 
            ButtonCFG_BC_lSCROLL:Dock(FILL)
            local sbar = ButtonCFG_BC_lSCROLL:GetVBar()
            sbar:SetSize(5,0)
            sbar:SetHideButtons( true )

            function sbar.btnGrip:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,HCS.UI.BasePurple,false,false,false,false) end
            function sbar:Paint(w, h) draw.RoundedBoxEx(14,0,0,w,h,d1c,false,false,false,false) end
            function sbar.btnUp:Paint(w, h) return end
            function sbar.btnDown:Paint(w, h) return end

            local function Buttons()
                if table.IsEmpty(HexSh:getIConfig("src_swbfiiesc")["Buttons"]) then 
                    local button = vgui.Create("DButton", ButtonCFG_BC_lSCROLL)
                    button:Dock(TOP)
                    button:SetTall(scrh*0.07)
                    button:DockMargin(5,5,5,5)
                    button:SetText("")
                    button.Paint = function(self,w,h)
                        draw.RoundedBox(14,0,0,w,h,d2c)
                        draw.SimpleText(HexSh:L("src_swbfiiesc", "NoButtons_B"), "SWBFIIESC.Cfg30", self:GetWide()/2, self:GetTall()/2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end --NoButtons_B
                    add.DoClick = function()
                        local Window = vgui.Create( "EditablePanel" )
                        Window:SetSize( ScrW() * 0.34, ScrH() * 0.5 )
                        Window:Center()
                        Window:MakePopup()
                        ----------------- Window:DoModal()
                            Window.Paint = function(self,w,h)
                                draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
                                draw.RoundedBox(15,2,2,w-4,h-4,Color(23,22,22,255))
                            end
                        local top = vgui.Create("DPanel", Window)
                        top:Dock(TOP)
                        top:SetTall(ScrH()*0.05)
                            top.Paint = function(self,w,h)
                                draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,false,false)
                                draw.SimpleText("Erstellung", "SWBFIIESC.Cfg30", self:GetWide()/2, self:GetTall()/2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                            end
    
    
                        local Orderr = vgui.Create("DNumberWang", Window)
                        Orderr:Dock( TOP )
                        Orderr:DockMargin(10,5,10,0)
                        Orderr:SetTall(scrh*0.06)
                    -- Orderr:SetValue(v.Order)
                        Orderr:SetMin(0)
                        Orderr:SetMax(100)
                    
                        local title = vgui.Create("DTextEntry", Window)
                        title:Dock( TOP )
                        title:DockMargin(10,5,10,0)
                        title:SetTall(scrh*0.06)
                        --title:SetValue(v.title)
                        title:SetFont("SWBFIIESC.Cfg25")
                        title:SetPlaceholderText("Title")
    
                        local funcc = vgui.Create( "DComboBox", Window )
                        funcc:Dock( TOP )
                        funcc:DockMargin(10,5,10,0)
                        funcc:SetTall(scrh*0.06)
                        funcc:SetText("Function")
                        funcc:AddChoice( "Command", nil, nil )
                        funcc:AddChoice( "URL", nil, nil )
                        funcc:AddChoice( "Compilestring", nil, nil )
    
                        local execc = vgui.Create("DTextEntry", Window)
                        execc:Dock( TOP )
                        execc:DockMargin(10,5,10,0)
                        execc:SetTall(scrh*0.06)
                    -- execc:SetValue(v.exec)
                        execc:SetFont("SWBFIIESC.Cfg25")
                        execc:SetPlaceholderText("Execute")
            
                        local close = vgui.Create("DButton", Window)
                        close:Dock(BOTTOM)
                        close:DockMargin(20,0,20,10)
                        close:SetText( HexSh:L("src_swbfiiesc", "Cancel") )
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
                        enter:SetText( HexSh:L("src_swbfiiesc", "Send") )
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
                        local count = table.Count( HexSh:getIConfig("src_swbfiiesc")["Buttons"] )
                            local tabl = { [ count + 1 ] = { title = title:GetValue(), Order = Orderr:GetValue(), func = funcc:GetValue(), exec = execc:GetValue() } }
                            table.Merge( HexSh:getIConfig("src_swbfiiesc")["Buttons"], tabl)
                            net.Start("HexSH::WriteConfig")
                            HexSh:WriteCompressedTable(HexSh.Config.IConfig)
                            net.SendToServer()
                            Window:Remove()
                            ButtonCFG_BC_lSCROLL:Clear()
                            timer.Simple(0.1,function()
                                Buttons()
                            end)
                        end
                    end
                else
                    for k,v in pairs(HexSh:getIConfig("src_swbfiiesc")["Buttons"]) do    
                        local button = vgui.Create("DButton", ButtonCFG_BC_lSCROLL)
                        button:Dock(TOP)
                        button:SetTall(scrh*0.07)
                        button:DockMargin(5,5,5,5)
                        button:SetText("")
                        button.Paint = function(self,w,h)
                            draw.RoundedBox(14,0,0,w,h,Color(0,0,0,160))
                            draw.SimpleText(v.title, "SWBFIIESC.Cfg30", self:GetWide()/2, self:GetTall()/2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                        end
                        local Delete = button:Add("DButton")
                        Delete:Dock(RIGHT)
                        Delete:DockMargin(0,0,0,0)
                        Delete:SetWide(scrw*0.02)
                        Delete:SetText("✘")
                        Delete:SetFont("SWBFIIESC.Cfg30")
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
                                HexSh:getIConfig("src_swbfiiesc")["Buttons"][k] = nil
                                net.Start("HexSH::WriteConfig")
                                HexSh:WriteCompressedTable(HexSh.Config.IConfig)
                                net.SendToServer()
                                ButtonCFG_BC_lSCROLL:Clear()
                                timer.Simple(0.1,function()
                                    Buttons()
                                end)
                            end
                        local Edit = button:Add("DButton")
                        Edit:Dock(RIGHT)
                        Edit:DockMargin(0,0,5,0)
                        Edit:SetWide(scrw*0.02)
                        Edit:SetText("E")
                        Edit:SetFont("SWBFIIESC.Cfg30")
                        Edit:SetTextColor(Color(255,255,255))
                        Edit.Paint  = function(self,w,h)
                            surface.SetDrawColor(Color(255,123,0))
                            surface.DrawOutlinedRect(0,0,w,h)
                            if self:IsHovered() then 
                                draw.RoundedBox(5,0,0,w,h,Color(255,123,0),false,true,false,false)
                            end    
                        end
                        Edit.DoClick = function()
                            local Window = vgui.Create( "EditablePanel" )
                            Window:SetSize( ScrW() * 0.34, ScrH() * 0.5 )
                            Window:Center()
                            Window:MakePopup()
                            -- Window:DoModal()
                                Window.Paint = function(self,w,h)
                                    draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
                                    draw.RoundedBox(15,2,2,w-4,h-4,Color(23,22,22,255))
                                end
                            local top = vgui.Create("DPanel", Window)
                            top:Dock(TOP)
                            top:SetTall(ScrH()*0.05)
                                top.Paint = function(self,w,h)
                                    draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,false,false)
                                    draw.SimpleText("Erstellung", "SWBFIIESC.Cfg30", self:GetWide()/2, self:GetTall()/2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                                end
    

                            local Orderr = vgui.Create("DNumberWang", Window)
                            Orderr:Dock( TOP )
                            Orderr:DockMargin(10,5,10,0)
                            Orderr:SetTall(scrh*0.06)
                            Orderr:SetValue(v.Order)
                            Orderr:SetMin(0)
                            Orderr:SetMax(100)
                        
                            local title = vgui.Create("DTextEntry", Window)
                            title:Dock( TOP )
                            title:DockMargin(10,5,10,0)
                            title:SetTall(scrh*0.06)
                            title:SetValue(v.title)
                            title:SetFont("SWBFIIESC.Cfg25")
                            title:SetPlaceholderText("Title")

                            local funcc = vgui.Create( "DComboBox", Window )
                            funcc:Dock( TOP )
                            funcc:DockMargin(10,5,10,0)
                            funcc:SetTall(scrh*0.06)
                            funcc:SetValue( v.func )
                            funcc:AddChoice( "Command", nil, nil )
                            funcc:AddChoice( "URL", nil, nil )
                            funcc:AddChoice( "Compilestring", nil, nil )

                            local execc = vgui.Create("DTextEntry", Window)
                            execc:Dock( TOP )
                            execc:DockMargin(10,5,10,0)
                            execc:SetTall(scrh*0.06)
                            execc:SetValue(v.exec)
                            execc:SetFont("SWBFIIESC.Cfg25")
                            execc:SetPlaceholderText("Execute")
                
                            local close = vgui.Create("DButton", Window)
                            close:Dock(BOTTOM)
                            close:DockMargin(20,0,20,10)
                            close:SetText( HexSh:L("src_swbfiiesc", "Cancel") )
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
                            enter:SetText(HexSh:L("src_swbfiiesc", "Send") )
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
                                HexSh:getIConfig("src_swbfiiesc")["Buttons"][k].title = title:GetValue()
                                HexSh:getIConfig("src_swbfiiesc")["Buttons"][k].Order = Orderr:GetValue()
                                HexSh:getIConfig("src_swbfiiesc")["Buttons"][k].func = funcc:GetValue()
                                HexSh:getIConfig("src_swbfiiesc")["Buttons"][k].exec = execc:GetValue()
                                net.Start("HexSH::WriteConfig")
                                HexSh:WriteCompressedTable(HexSh.Config.IConfig)
                                net.SendToServer()
                                Window:Remove()
                                ButtonCFG_BC_lSCROLL:Clear()
                                timer.Simple(0.1,function()
                                    Buttons()
                                end)
                            end
                        end
                        add.DoClick = function()
                            local Window = vgui.Create( "EditablePanel" )
                            Window:SetSize( ScrW() * 0.34, ScrH() * 0.5 )
                            Window:Center()
                            Window:MakePopup()
                            ----------------- Window:DoModal()
                                Window.Paint = function(self,w,h)
                                    draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,true,true)
                                    draw.RoundedBox(15,2,2,w-4,h-4,Color(23,22,22,255))
                                end
                            local top = vgui.Create("DPanel", Window)
                            top:Dock(TOP)
                            top:SetTall(ScrH()*0.05)
                                top.Paint = function(self,w,h)
                                    draw.RoundedBoxEx(14,0,0,w,h,Color(46,46,46),true,true,false,false)
                                    draw.SimpleText("Erstellung", "SWBFIIESC.Cfg30", self:GetWide()/2, self:GetTall()/2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                                end
        
        
                            local Orderr = vgui.Create("DNumberWang", Window)
                            Orderr:Dock( TOP )
                            Orderr:DockMargin(10,5,10,0)
                            Orderr:SetTall(scrh*0.06)
                        -- Orderr:SetValue(v.Order)
                            Orderr:SetMin(0)
                            Orderr:SetMax(100)
                        
                            local title = vgui.Create("DTextEntry", Window)
                            title:Dock( TOP )
                            title:DockMargin(10,5,10,0)
                            title:SetTall(scrh*0.06)
                            --title:SetValue(v.title)
                            title:SetFont("SWBFIIESC.Cfg25")
                            title:SetPlaceholderText("Title")
        
                            local funcc = vgui.Create( "DComboBox", Window )
                            funcc:Dock( TOP )
                            funcc:DockMargin(10,5,10,0)
                            funcc:SetTall(scrh*0.06)
                            funcc:SetText("Function")
                            funcc:AddChoice( "Command", nil, nil )
                            funcc:AddChoice( "URL", nil, nil )
                            funcc:AddChoice( "Compilestring", nil, nil )
        
                            local execc = vgui.Create("DTextEntry", Window)
                            execc:Dock( TOP )
                            execc:DockMargin(10,5,10,0)
                            execc:SetTall(scrh*0.06)
                        -- execc:SetValue(v.exec)
                            execc:SetFont("SWBFIIESC.Cfg25")
                            execc:SetPlaceholderText("Execute")
                
                            local close = vgui.Create("DButton", Window)
                            close:Dock(BOTTOM)
                            close:DockMargin(20,0,20,10)
                            close:SetText( HexSh:L("src_swbfiiesc", "Cancel") )
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
                            enter:SetText( HexSh:L("src_swbfiiesc", "Send") )
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
                            local count = table.Count( HexSh:getIConfig("src_swbfiiesc")["Buttons"] )
                                local tabl = { [ count + 1 ] = { title = title:GetValue(), Order = Orderr:GetValue(), func = funcc:GetValue(), exec = execc:GetValue() } }
                                table.Merge( HexSh:getIConfig("src_swbfiiesc")["Buttons"], tabl)
                                net.Start("HexSH::WriteConfig")
                                HexSh:WriteCompressedTable(HexSh.Config.IConfig)
                                net.SendToServer()
                                Window:Remove()
                                ButtonCFG_BC_lSCROLL:Clear()
                                timer.Simple(0.1,function()
                                    Buttons()
                                end)
                            end  
                        end
                    end
                end
            end
            Buttons()       
    end )

end