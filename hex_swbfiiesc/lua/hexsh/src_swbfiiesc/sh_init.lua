HexSh.SWBFIIESC = HexSh.SWBFIIESC or {}

local function loadDir( dir )
	local files = file.Find( dir .. "/*", "LUA" );

	for k, v in pairs(files) do 
		if (v == "sh_init.lua" && dir == "hexsh/src_swbfiiesc") then continue end 
        if string.StartWith(v, "sh") then
			local load = include(dir.. "/".. v)
			if load then load() end
			AddCSLuaFile(dir.. "/".. v)
		end

        if string.StartWith(v, "cl") then
			if CLIENT then 
				local load = include(dir.. "/".. v)
				if load then load() end
			end
			AddCSLuaFile(dir.. "/".. v)
		end
	
		if string.StartWith(v, "sv") then
			if SERVER then 
				local load = include(dir.. "/".. v)
				if load then load() end
			end
		end
	end 
end 

--[[ load ]]
loadDir( "hexsh/src_swbfiiesc" )
loadDir( "hexsh/src_swbfiiesc/lang" )
loadDir( "hexsh/src_swbfiiesc/vgui" )
