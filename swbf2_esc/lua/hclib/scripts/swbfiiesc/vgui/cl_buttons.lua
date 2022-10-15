--

local PANEL = {};

local rollsound = "hclib/swbfii/roll.mp3";

local inputsound = "hclib/swbfii/inputclick.mp3";

local speed = 4;

local barStatus = 0;

local clr = Color( 255, 255, 255);

local white = Color( 255, 255, 255 );

local ablack = Color( 0, 0, 0, 130);


function PANEL:Init()

    self.ccol = HCLIB.Config.Cfg[ "swbfiiesc" ][ "Color" ];

    self.disablecheck = false;

    self.Text = "";

    self:SetText( "" );

    self:Dock( TOP );

    self:DockMargin( 0, 10, 0, 0 );

    self:SetTall( ScrH() * 0.075 );

    self.count = string.len( self.Text );
    
    self.font = "SWBFII.Button.50";

    self.switchcolor = HCLIB:LerpColor( self:IsHovered() and white or self.ccol, self:IsHovered() and self.ccol or white, 1);

    self.cachedfunction = nil;

    self.anim = HCLIB:ClickAnimation( 360, 20, 25, Color( HCLIB.Config.Cfg[ "swbfiiesc" ][ "Color" ][ "r" ], HCLIB.Config.Cfg[ "swbfiiesc" ][ "Color" ][ "g" ], HCLIB.Config.Cfg[ "swbfiiesc" ][ "Color" ][ "b" ], 70 ) )

end;

function PANEL:SetLabel( txt )
    
    self.Text = txt;

    self.count = string.len( self.Text );

end;

function PANEL:SetFunction( func )

    self.cachedfunction = func;

end;

function PANEL:DoClick()
    
    if ( self.disablecheck == true ) then 
        
        self.anim:Click( self );

        surface.PlaySound(inputsound);

        self.cachedfunction();

    else

        LocalPlayer().swbfiiescopen = true;
        
        self.anim:Click( self );

        surface.PlaySound(inputsound);
        
        timer.Simple(.1, function()
            
            self.cachedfunction();

            LocalPlayer().swbfiiescopen = nil;

        end );

    end;

end;

function PANEL:OnCursorEntered()
 
    surface.PlaySound( rollsound );
    
    self.switchcolor = HCLIB:LerpColor( white, self.ccol, 0.2 );

    
end;

function PANEL:Paint( w, h)

    if self.count >= 11 then 

        self.font = "SWBFII.Button.40";

    end;

    if self.count >= 15 then 

        self.font = "SWBFII.Button.30";

    end;

    if self.count >= 20 then 
    
        self.font = "SWBFII.Button.20";

    end;

    if ( self:IsHovered() ) then

        barStatus = math.Clamp(barStatus + speed * FrameTime(), 0, 1);

    else

        barStatus = math.Clamp(barStatus - speed * FrameTime(), 0, 1);

    end;

    draw.RoundedBox( 0, 0, 0, w, h, ablack );

    surface.SetDrawColor( white );

    surface.DrawOutlinedRect( 0, 0, w, h, 1 );

    if not self:IsHovered() then  self.switchcolor = HCLIB:LerpColor( white, self.ccol, 0.2 ); end;

    self.switchcolor:DoLerp();

    if self:IsHovered() then

        surface.SetDrawColor( self.switchcolor:GetColor() );

        surface.DrawOutlinedRect( 0, 0, w, h, 2 );
        

    end;

    self.anim:Animate();
    
    draw.SimpleText( tostring( self.Text ), self.font, 20, self:GetTall() / 2, self.switchcolor:GetColor(), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER );

end;

vgui.Register( "SWBFII.Button", PANEL, "DButton" ); 