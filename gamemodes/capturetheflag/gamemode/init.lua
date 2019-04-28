AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "cl_scoreboard.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "config/custom_classes.lua" )

resource.AddFile( "models/CTF_Flag/ctf_flag.mdl" )
resource.AddFile( "models/CTF_FlagBase/ctf_flagbase.mdl" )
resource.AddFile( "models/CTF_SpawnArea/ctf_spawnarea.mdl" )
resource.AddFile( "models/CTF_Sphere/ctf_constructsphere.mdl" )

resource.AddFile( "materials/models/CTF_Flag/flagblue.vmt" )
resource.AddFile( "materials/models/CTF_Flag/flagred.vmt" )
resource.AddFile( "materials/models/CTF_FlagBase/baseblue.vmt" )
resource.AddFile( "materials/models/CTF_FlagBase/basered.vmt" )
resource.AddFile( "materials/models/CTF_SpawnArea/baseblue.vmt" )
resource.AddFile( "materials/models/CTF_SpawnArea/basered.vmt" )
resource.AddFile( "materials/models/CTF_Sphere/sphereblue.vmt" )
resource.AddFile( "materials/models/CTF_Sphere/spherered.vmt" )
resource.AddSingleFile( "materials/models/ctf_sphere/innersphereblue.vmt" )
resource.AddSingleFile( "materials/models/ctf_sphere/innerspherered.vmt" )

resource.AddFile( "materials/buttons/blue_button.png" )
resource.AddFile( "materials/buttons/blue_button_down.png" )
resource.AddFile( "materials/buttons/red_button.png" )
resource.AddFile( "materials/buttons/red_button_down.png" )
resource.AddFile( "materials/buttons/spectators_button.png" )
resource.AddFile( "materials/buttons/spectators_button_down.png" )
resource.AddFile( "materials/buttons/welcome.png" )

resource.AddFile( "materials/icons/blue_win_logo.png" )
resource.AddFile( "materials/icons/blue_win_text.png" )
resource.AddFile( "materials/icons/flag_icon.png" )
resource.AddFile( "materials/icons/flag_icon_carried.png" )
resource.AddFile( "materials/icons/flag_icon_dropped.png" )
resource.AddFile( "materials/icons/red_win_logo.png" )
resource.AddFile( "materials/icons/red_win_text.png" )

util.AddNetworkString("RestrictMenu")
util.AddNetworkString("UnrestrictMenu")
util.AddNetworkString("RestrictOrdnanceMenu")
util.AddNetworkString("UnrestrictOrdnanceMenu")
util.AddNetworkString("BaseSet")
util.AddNetworkString("MatchBegin")
util.AddNetworkString("ctf_TimeUpdate")
util.AddNetworkString("UpdatePP")
util.AddNetworkString("TeamScored")
util.AddNetworkString("UpdateAllValues")
util.AddNetworkString("FlagDropped")
util.AddNetworkString("FlagPickedUp")
util.AddNetworkString("FlagReturned")
util.AddNetworkString("GameEnded")
util.AddNetworkString("NotifyDeath")
util.AddNetworkString("UpdateRespawn")

include( 'shared.lua' )
include ( 'concommands.lua' )
include ( 'config/custom_classes.lua' )

CTF_Time = GetConVar( "ctf_buildtime" )
buildTime = CTF_Time:GetFloat()
showPP = GetConVar( "ctf_usepropprotect" ):GetBool()
CTF_RespawnTime = GetConVar( "ctf_respawntime" )
CTF_ForceRespawn = GetConVar( "ctf_forcerespawn" )
CTF_DSpectate = GetConVar( "ctf_deathspectate" )
CTF_DSpectateRestrict = GetConVar( "ctf_restrictdeathspectate" )
CTF_PassiveTimer = GetConVar( "ctf_passivetimer" )
CTF_PassiveIncome = GetConVar( "ctf_passiveincome" )
CTF_KillIncome = GetConVar( "ctf_killincome" )
CTF_StartingBalance = GetConVar( "ctf_startingbalance" )

Time = 0
TeamSetUp = {false, false}
MatchHasBegun = false
TeamLocations = {nil, nil}
respawnTime = 10

-------------------------------Prop Protection----------------------------
PropProtection.Props = {}

function PropProtection.PlayerCanTouch(ply, ent)
	if ply:Team() == 3 then
		return false
	end

	if ent:GetClass() == "worldspawn" then
		return true
	end

	if (ent:GetNWInt("OwningTeam") == nil or ent:GetNWInt("OwningTeam") == 0) and not ent:IsPlayer() then
		PropProtection.TeamMakePropOwner(ply:Team(), ent)
		return true
	end

	if (MatchHasBegun and (ent.IsBase or ent.IsSpawnArea) or ent.IsFlag) then
		return false
	end

	if not (GetConVar("ctf_usepropprotect"):GetBool()) then
		return true
	end

	return ent:GetNWInt("OwningTeam") == ply:Team() or ent:GetNWInt("OwningTeam") == -1
end

function PropProtection.UnOwnProp(ent)
	if not IsValid(ent) then return false end

	PropProtection.Props[ent:EntIndex()] = nil
	ent:SetNWInt("OwningTeam", nil)

	return true
end

function PropProtection.TeamMakePropOwner(team, ent)
	if ent:IsPlayer() then
		return false
	end

	PropProtection.Props[ent:EntIndex()] = team
	ent:SetNWInt("OwningTeam", team)

	return true
end


local plymeta = FindMetaTable("Player")
if plymeta.AddCount then
	local Backup = plymeta.AddCount
	function plymeta:AddCount(Type, ent)
		PropProtection.TeamMakePropOwner(self:Team(), ent)
		Backup(self, Type, ent)
	end
end


function PropProtection.PhysGravGunPickup(ply, ent)
	if not IsValid(ent) then
		return
	end
	
	if not PropProtection.PlayerCanTouch(ply, ent) then return false end
end
//hook.Add("GravGunPunt", "PropProtection.GravGunPunt", PropProtection.PhysGravGunPickup)
//hook.Add("GravGunPickupAllowed", "PropProtection.GravGunPickupAllowed", PropProtection.PhysGravGunPickup)
hook.Add("PhysgunPickup", "PropProtection.PhysgunPickup", PropProtection.PhysGravGunPickup)

function PropProtection.FlagPunt(ply, ent)
	if not IsValid(ent) then
		return
	end

	if ent.IsFlag then
		return false
	end
end
hook.Add("GravGunPunt", "PropProtection.GravGunPunt", PropProtection.FlagPunt)

-- function PropProtection.CanTool(ply, tr, mode)
	-- if tr.HitWorld then
		-- return
	-- end
	-- local ent = tr.Entity
	-- if not IsValid(ent) or ent:IsPlayer() or ent.IsBase or ent.IsFlag or ent.IsSpawnArea then
		-- return false
	-- end

	-- if not PropProtection.PlayerCanTouch(ply, ent) then return false end
-- end
-- hook.Add("CanTool", "PropProtection.CanTool", PropProtection.CanTool)

function PropProtection.EntityTakeDamageFireCheck(ent)
	if not IsValid(ent) then
		return
	end
	if ent:IsOnFire() then
		ent:Extinguish()
	end
end

function PropProtection.EntityTakeDamage(ent, dmginfo)
	local attacker = dmginfo:GetAttacker()
	if not IsValid(ent) or ent:IsPlayer() or not attacker:IsPlayer() then
		return
	end
	if ent.IsBase or ent.IsSpawnArea then
		dmginfo:SetDamage(0)
		timer.Simple(0.1,
			function()
				if IsValid(ent) then PropProtection.EntityTakeDamageFireCheck(ent) end
			end)
	end
end
hook.Add("EntityTakeDamage", "PropProtection.EntityTakeDamage", PropProtection.EntityTakeDamage)

function PropProtection.OnPhysgunReload(weapon, ply)
	local tr = util.TraceLine(util.GetPlayerTrace(ply))
	if tr.HitWorld or not IsValid(tr.Entity) or tr.Entity:IsPlayer() then
		return
	end

	if not PropProtection.PlayerCanTouch(ply, tr.Entity) then return false end
end
hook.Add("OnPhysgunReload", "PropProtection.OnPhysgunReload", PropProtection.OnPhysgunReload)

function PropProtection.EntitySpawned(ent)
	if ent:GetOwner():IsValid() and ent:GetOwner():IsPlayer() then
		PropProtection.TeamMakePropOwner(ent:GetOwner():Team(), ent)
	end
end
hook.Add("EntityCreated", "PropProtection.EntityCreated", PropProtection.EntitySpawned)

function PropProtection.EntityRemoved(ent)
	PropProtection.Props[ent:EntIndex()] = nil
end
hook.Add("EntityRemoved", "PropProtection.EntityRemoved", PropProtection.EntityRemoved)

function PropProtection.PlayerSpawnedSENT(ply, ent)
	PropProtection.TeamMakePropOwner(ply:Team(), ent)
end
hook.Add("PlayerSpawnedSENT", "PropProtection.PlayerSpawnedSENT", PropProtection.PlayerSpawnedSENT)

function PropProtection.PlayerSpawnedVehicle(ply, ent)
	PropProtection.TeamMakePropOwner(ply:Team(), ent)
end
hook.Add("PlayerSpawnedVehicle", "PropProtection.PlayerSpawnedVehicle", PropProtection.PlayerSpawnedVehicle)

function PropProtection.NPCCreatedRagdoll(npc,doll)
	if PropProtection.Props[npc:EntIndex()] and not PropProtection.Props[doll:EntIndex()] then
		PropProtection.TeamMakePropOwner(npc:GetNWInt("OwningTeam"),doll)
	end
end
hook.Add("CreateEntityRagdoll","PropProtection.NPCCreatedRagdoll",PropProtection.NPCCreatedRagdoll)

function PropProtection.NPCDeath(npc,attacker,weapon)
	if not IsValid(npc:GetActiveWeapon()) then return end
	if PropProtection.Props[npc:EntIndex()] and not PropProtection.Props[npc:GetActiveWeapon():EntIndex()] then
		PropProtection.TeamMakePropOwner(npc:GetNWInt("OwningTeam"),npc:GetActiveWeapon())
	end
end
hook.Add("OnNPCKilled","PropProtection.NPCDeath",PropProtection.NPCDeath)

function PropProtection.WorldOwner()
	local WorldEnts = 0
	for k,v in pairs(ents.GetAll()) do
		if not v:IsPlayer() and v:GetNWInt("OwningTeam") == 0 then
			v:SetNWInt("OwningTeam", -1)
			WorldEnts = WorldEnts + 1
		end
	end
	print("World Props Added: " .. WorldEnts)
end
timer.Simple(2, PropProtection.WorldOwner)

function PropProtection.CanEditVariable( ent, ply, key, val, editor )
	return PropProtection.PlayerCanTouch(ply, ent) and !ent.IsBase and !ent.IsFlag and !ent.IsSpawnArea
end
hook.Add("CanEditVariable", "PropProtection.CanEditVariable", PropProtection.CanEditVariable)

function PropProtection.AllowPlayerPickup( ply, ent )
	if not PropProtection.PlayerCanTouch(ply, ent) then return false end
end
hook.Add("AllowPlayerPickup", "PropProtection.AllowPlayerPickup", PropProtection.AllowPlayerPickup)

function PropProtection.CanDrive( ply, ent )
	if ply:Team() == 3 then return false end
end
hook.Add("CanPlayerEnterVehicle", "PropProtection.CanDrive", PropProtection.CanDrive)

function PropProtection.CanProperty( ply, property, ent )
	if not PropProtection.PlayerCanTouch(ply, ent) then return false end
	if ent:GetNWString("Owner") == "World" or ent.IsBase or ent.IsFlag or ent.IsSpawnArea then return false end
end
hook.Add("CanProperty", "PropProtection.CanProperty", PropProtection.CanProperty)
-----------------------------Prop Protection End--------------------------

--------------------Force the use of buttons for key presses--------------
numpad.OldActivate = numpad.Activate
function numpad.Activate(ply, key, isButton)
	if (isButton or not GetConVar("ctf_restrictkeys"):GetBool()) then
		return numpad.OldActivate(ply, key, isButton)
	end
end

numpad.OldDeactivate = numpad.Deactivate
function numpad.Deactivate(ply, key, isButton)
	if (isButton or not GetConVar("ctf_restrictkeys"):GetBool()) then
		return numpad.OldDeactivate(ply, key, isButton)
	end
end
--------------------------------Button Force End--------------------------

function UpdateAllValues(ply)

	local flagDropped = {false, false}
	local flagCarried = {false, false}
	local carrier = {NULL, NULL}

	for k,v in pairs(ents.GetAll()) do
		if v.IsFlag then
			flagDropped[v:GetNWInt("Team")] = !v.IsHeld && !v.IsOnBase
			flagCarried[v:GetNWInt("Team")] = v.IsHeld
			carrier[v:GetNWInt("Team")] = v.Carrier
		end
	end

	net.Start("UpdateAllValues")
	net.WriteBool(MatchHasBegun)
	net.WriteEntity(carrier[1])
	net.WriteEntity(carrier[2])
	net.WriteBool(TeamSetUp[1])
	net.WriteBool(TeamSetUp[2])
	net.WriteBool(flagDropped[1])
	net.WriteBool(flagDropped[2])
	net.WriteBool(flagCarried[1])
	net.WriteBool(flagCarried[2])
	net.WriteFloat(team.GetScore(1))
	net.WriteFloat(team.GetScore(2))
	net.WriteFloat(math.ceil(CTF_Time:GetFloat() * 60 - Time))
	net.WriteBool(GetConVar("ctf_usepropprotect"):GetBool())
	net.WriteFloat(CTF_RespawnTime:GetFloat())
	net.Send(ply)

end

function BroadcastFlagPickedUp(ply)
	net.Start("FlagPickedUp")
	net.WriteEntity(ply)
	net.Broadcast()
end

function BroadcastFlagDropped(team)
	net.Start("FlagDropped")
	net.WriteFloat(team)
	net.Broadcast()
end

function BroadcastFlagReturned(team)
	net.Start("FlagReturned")
	net.WriteFloat(team)
	net.Broadcast()
end

function GM:PlayerSpawn( ply )
 
	self.BaseClass:PlayerSpawn( ply )
	local plyClass = PLAYER_CLASSES[ply:GetNWInt("playerClass")]
	
	ply:SetMaxHealth(plyClass.health)
	ply:SetHealth(plyClass.health)
	ply:SetWalkSpeed(plyClass.walkspeed)
	ply:SetRunSpeed(plyClass.runspeed)

	hook.Call("PlayerLoadout", ply)

	if (ply:Team() == 4) then
		ply:StripWeapons()
		ply:Spectate( OBS_MODE_ROAMING )
	end

	if Time / 60 < CTF_Time:GetFloat() then
		ply.DoOnce = 1
	end

	if (MatchHasBegun) then
		net.Start("RestrictMenu")
		net.Send(ply)
	else
		net.Start("UnrestrictMenu")
		net.Send(ply)
	end

	ply.InvulnTime = CurTime()

	for k,v in pairs(ents.GetAll()) do
		if (v.IsSpawnArea and ply:Team() == v:GetNWInt("Team")) then
			ply:SetPos(v:GetSpawnPos())
			break
		end
 	end
end

function GM:PostPlayerDeath( ply )
	ply.DeathTime = CurTime()
	ply.ctf_clicked = false
	net.Start("NotifyDeath")
	net.Send(ply)
end

function GM:PlayerDeathThink( ply )
	if (!MatchHasBegun or respawnTime < 3 and !CTF_ForceRespawn:GetBool()) then
		return self.BaseClass:PlayerDeathThink(ply)
	end

	ply.ctf_clicked = (ply:KeyPressed( IN_ATTACK ) || ply:KeyPressed( IN_ATTACK2 ) || ply:KeyPressed( IN_JUMP )) || ply.ctf_clicked

	if (CurTime() - ply.DeathTime < 3) then return false end

	if (ply.InDeathSpectate) then
		if (!IsValid(ply:GetObserverTarget()) or ply.ctf_clicked) then
			ply.ctf_clicked = false
			GetNextSpectateTarget(ply)
		end

		if (CurTime() - ply.DeathTime >= respawnTime) then
			ply.InDeathSpectate = false
			ply:Spawn()
		end
	end

	if (CurTime() - ply.DeathTime < respawnTime) then
		if ((CTF_ForceRespawn:GetBool() or ply.ctf_clicked) and CTF_DSpectate:GetBool()) then
			ply.ctf_clicked = false
			ply.InDeathSpectate = true
			if (CTF_DSpectateRestrict:GetBool()) then
				ply:Spectate( OBS_MODE_CHASE )
				GetNextSpectateTarget(ply)
			else
				ply:Spectate( OBS_MODE_ROAMING )
			end
		end
		return false;
	elseif (CTF_ForceRespawn:GetBool()) then
		ply:Spawn()
	else
		ply.ctf_clicked = false
		self.BaseClass:PlayerDeathThink(ply)
	end
end

function GetNextSpectateTarget(ply)
	local target = ply:GetObserverTarget()
	local targetIndex = -1
		
	for k,v in pairs(team.GetPlayers(ply:Team())) do
		if (!IsValid(target) and v != ply) then
			ply:SpectateEntity(v)
			break
		elseif (targetIndex == -1 and IsValid(target) and target == v) then
			targetIndex = k + 1
		elseif (targetIndex == k) then
			ply:SpectateEntity(v)
			targetIndex = -1
			break
		end
	end

	if (!IsValid(ply:GetObserverTarget()) or targetIndex >= 0) then
		ply:SpectateEntity(team.GetPlayers(ply:Team())[0])
	end
end

function GM:PlayerInitialSpawn( ply )

	ply:SetNWInt("playerClass", 1)
	ply:SetNWInt("playerMoney", ply:GetNWInt("playerMoney") + (GetConVar("ctf_startingbalance"):GetFloat()))

	UpdateAllValues(ply)
	joining( ply )
	ply:ConCommand( "ctf_start" )
	ply:ConCommand( "ctf_open_classmenu" ) 
	
end

function GM:PlayerCanPickupWeapon(ply, wep)
	if MatchHasBegun and (wep:GetClass() == "weapon_physgun" or wep:GetClass() == "gmod_tool") or ply:Team() == 3 then
		wep:Remove()
		return false
	end
	return true
end

function GM:PlayerDisconnected( ply )
	if (MatchHasBegun) then
		return
	end

	if (ply.IsCaptain && !TeamSetUp[ply:Team()]) then
		for k,v in pairs (team.GetPlayers( ply:Team() )) do
			if v != ply then
				v.IsCaptain = true
				v:Give( "weapon_ctf_setup" )
				ply:ChatPrint( "[CTF]: You have been made team captain. Please select a location for your base." )
			end
		end
	end
end

function GM:PlayerLoadout( ply )

	if (TeamSetUp[ply:Team()]) then
	
		ply:StripWeapons()
		RestoreTools(ply)
		
		-- Check player class
		local plyClass = PLAYER_CLASSES[ply:GetNWInt("playerClass")]
		-- Equip class weapons
		for k, v in pairs(plyClass.weapons) do
			ply:Give(v)
		end
		
		-- Give Ammo
		ply:GiveAmmo(150, "9x19MM", true)
		ply:GiveAmmo(80, "5.7x28MM", true)
		ply:GiveAmmo(200, "5.56x45MM", true)
		ply:GiveAmmo(100, ".45 ACP", true)
		ply:GiveAmmo(30, ".338 Lapua", true)
		ply:GiveAmmo(24, "12 Gauge", true)
		
	elseif ply.IsCaptain and !TeamSetUp[ply:Team()] then
	
		ply:StripWeapons()
		ply:Give( "weapon_ctf_setup" )
		
		-- Check player class
		local plyClass = PLAYER_CLASSES[ply:GetNWInt("playerClass")]
		-- Equip class weapons
		for k, v in pairs(plyClass.weapons) do
			ply:Give(v)
		end
		
		-- Give Ammo
		ply:GiveAmmo(150, "9x19MM", true)
		ply:GiveAmmo(80, "5.7x28MM", true)
		ply:GiveAmmo(200, "5.56x45MM", true)
		ply:GiveAmmo(100, ".45 ACP", true)
		ply:GiveAmmo(30, ".338 Lapua", true)
		ply:GiveAmmo(24, "12 Gauge", true)
		
	else
	
		ply:StripWeapons()
		-- Check player class
		local plyClass = PLAYER_CLASSES[ply:GetNWInt("playerClass")]
		-- Equip class weapons
		for k, v in pairs(plyClass.weapons) do
			ply:Give(v)
		end
		
		ply:GiveAmmo(150, "9x19MM", true)
		ply:GiveAmmo(80, "5.7x28MM", true)
		ply:GiveAmmo(200, "5.56x45MM", true)
		ply:GiveAmmo(100, ".45 ACP", true)
		ply:GiveAmmo(30, ".338 Lapua", true)
		ply:GiveAmmo(24, "12 Gauge", true)
		
	end
end

function GM:PlayerNoClip(ply, state)
	if ply:Team() == 3 and !state then
		return false
	elseif !MatchHasBegun and TeamSetUp[ply:Team()] or ply:Team() == 3 then
		return true
	end
	return false
end

function ctf_setteam( ply, cmd, args, argStr)
	local teamNum = tonumber(args[1])
	if (teamNum == nil) then
		ply:ConCommand("ctf_start")
		return
	end

	teamNum = math.Round(teamNum)
	if (teamNum < 1) then
		teamNum = 1
	elseif teamNum > 2 then
		teamNum = 2
	end
	local teamName = "Red"
	if (teamNum == 2) then
		teamName = "Blue"
	end

	ply:SetTeam(0)
	
	for k,v in pairs(ply:GetChildren()) do
		if v.IsFlag then
			v:ReturnFlag()
			BroadcastFlagReturned(v:GetNWInt("Team"))
		end
	end

	ply:PrintMessage( HUD_PRINTTALK, "[CTF]: Welcome to the " .. teamName .. " Team, " .. ply:Nick() .. ".")
	if team.NumPlayers(teamNum) < 1 and !TeamSetUp[teamNum] then
		ply:ChatPrint( "[CTF]: Please select a location for your base." )
		ply.IsCaptain = true
	elseif team.NumPlayers(teamNum) >= 1 and !TeamSetUp[teamNum] then
		ply:ChatPrint( "[CTF]: Please wait for your team captian to pick a base location." )
		ply.IsCaptain = false
	end
	ply:UnSpectate()
	ply:SetTeam( teamNum )
	ply:Spawn()
 
end
concommand.Add( "ctf_setteam", ctf_setteam )

function ctf_spectate( ply )

	ply:SetTeam( 3 )
	ply:Spawn()
	ply:StripWeapons()
	ply:Spectate( OBS_MODE_ROAMING )
	ply:ConCommand("noclip") // Fixes issues with spectators intersecting with ladders.
	ply:ChatPrint( "[CTF]: Welcome, spectator. Enjoy the show." )

end
concommand.Add( "ctf_spectate", ctf_spectate )

function joining( ply )
 
	ply:SetTeam( 4 )
 
end

-- function GM:PlayerShouldTakeDamage(victim,attacker) -- Disable friendly fire
	-- if Time / 60 < CTF_Time:GetFloat() or (attacker:IsPlayer() and attacker:Team() == victim:Team() or CurTime() - victim.InvulnTime < 6) then
		-- return false
	-- else
		-- return true
	-- end
-- end

function doBuild(team, pos, ply)
	local otherTeam = 1
	if (team == 1) then
		otherTeam = 2
	end

	if (TeamLocations[otherTeam] != nil && (pos - TeamLocations[otherTeam]):Length() < GetConVar("ctf_buildzonescale"):GetFloat() * 2000) then
		ply:ChatPrint( "[CTF] This location is too close to the opposing base." )
		return
	end

	-- local tr = util.TraceHull( {
		-- start = pos + Vector(0,0,1),
		-- endpos = pos + Vector(0,0,2),
		-- filter = ply,
		-- mins = Vector(-200, -200, 0),
		-- maxs = Vector(200, 200, 50)
	-- } )

	-- if (tr.Hit) then
		-- ply:ChatPrint( "[CTF]: This location is invalid! Not enough space." )
		-- return
	-- end
	

	TeamLocations[team] = pos
	
	ply:StripWeapon("weapon_ctf_setup")
	local r,g,b,a = 70,70,70,255

	if team == 1 then
		r = 255
	elseif team == 2 then
		b = 255
	end

	ConSphere = ents.Create("CTF_ConstructSphere")
	ConSphere:SetPos(pos)
	ConSphere:SetNWInt("Team", team)
	ConSphere:SetGravity(0)
	ConSphere:Spawn()

	ConSphere:SetModelScale(GetConVar("ctf_buildzonescale"):GetFloat())
	if ConSphere:GetNWInt("Team") == 1 then
		ConSphere:SetSkin(0)
	elseif ConSphere:GetNWInt("Team") == 2 then
		ConSphere:SetSkin(1)
	end
	
	PropProtection.TeamMakePropOwner(team, ConSphere)
	
	-- Experimental base perimeter determination (Working, theoretically)--
	-- PerimeterSphere = ents.Create("CTF_PerimeterSphere")
	-- PerimeterSphere:SetPos(pos)
	-- PerimeterSphere:SetNWInt("Team", team)
	-- PerimeterSphere:SetGravity(0)
	-- PerimeterSphere:Spawn()
	-- PerimeterSphere:SetModelScale(GetConVar("ctf_buildzonescale"):GetFloat())
	
	FlagBase = ents.Create("CTF_FlagBase")
	FlagBase:SetPos(pos + Vector(-100,0,0))
	FlagBase:SetNWInt("Team", team)
	FlagBase:SetGravity(1)
	FlagBase:Spawn()
	PropProtection.TeamMakePropOwner(team, FlagBase)
	FlagBase:GetPhysicsObject():EnableMotion(false)
	Flag = ents.Create("CTF_Flag")
	Flag:SetPos(pos + Vector(-100,0,10))
	Flag:SetNWInt("Team", team)
	Flag:SetGravity(1)
	Flag:Spawn()
	PropProtection.TeamMakePropOwner(team, Flag)
	Flag:PhysWake()
	Flag:SetNWBool("HUDStart",true)
	FlagBase.Flag = Flag
	Flag.FlagBase = FlagBase
	Flag:SetParent(FlagBase)
	Flag.IsOnBase = true

	SpawnArea = ents.Create("CTF_SpawnArea")
	SpawnArea:SetPos(pos + Vector(100,0,0))
	SpawnArea:SetNWInt("Team", team)
	SpawnArea:SetGravity(1)
	SpawnArea:Spawn()
	PropProtection.TeamMakePropOwner(team, SpawnArea)
	SpawnArea:GetPhysicsObject():EnableMotion(false)

	TeamSetUp[team] = true
	RespawnTeam(team)

	local OtherTeam = 2
	if team == 2 then
		OtherTeam = 1
	end

	if TeamSetUp[OtherTeam] then
		for k,v in pairs(ents.GetAll()) do
			for j,f in pairs(ents.GetAll()) do
				if v:IsValid() and v.IsBase and f:IsValid() and f.IsFlag and v:GetNWInt("Team") != f:GetNWInt("Team") then
					v.OtherFlag = f
				end
			end
		end
	end

	for k,v in pairs(player.GetAll()) do
		if v:Team() == team then
			v:ChatPrint( "[CTF]: You may now build your base." )
		end
	end
	Timer = CurTime()
	net.Start("BaseSet")
	net.WriteFloat(ply:Team())
	net.Broadcast()
end

function RespawnTeam( team )
	for k,ply in pairs(player.GetAll()) do
		if (ply:Team() == team) then
			ply:Spawn()
		end
	end
end

function RestoreTools(ply)
	if ply:Alive() and ply:Team() != 3 and not MatchHasBegun and (ply:HasWeapon("gmod_tool") == false or ply:HasWeapon("weapon_physcannon") == false or ply:HasWeapon("weapon_physgun") == false) then
		ply:Give( "weapon_physcannon" )
		ply:Give( "weapon_physgun" )
		ply:Give( "gmod_tool" )
		player_manager.RunClass( ply, "Loadout" )
		ply:SelectWeapon("weapon_physgun")
	elseif ply:Alive() and ply:Team() != 3 and MatchHasBegun and not ply:HasWeapon("weapon_physcannon") then
		player_manager.RunClass( ply, "Loadout" )
		ply:StripWeapon("weapon_phsgun")
		ply:StripWeapon("gmod_tool")
	end
end

function TeamScored( scoredTeam )
	team.AddScore(scoredTeam,1)

	net.Start("TeamScored")
	net.WriteFloat(scoredTeam)
	net.WriteFloat(team.GetScore(scoredTeam))
	net.Broadcast();

	local target = GetConVar("ctf_capturetarget"):GetInt()
	if target == nil then
		target = 1
	end

	if (team.GetScore(scoredTeam) >= target && target > 0) then
		EndGame(scoredTeam)
	end
end

function ResetWorld()
	MatchHasBegun = false
	Timer = CurTime()
	Time = 0
	TeamSetUp = {false, false}
	MatchHasBegun = false
	TeamLocations = {nil, nil}
	team.SetScore(1, 0)
	team.SetScore(2, 0)

	game.CleanUpMap()

	for k,ply in pairs(player.GetAll()) do
		UpdateAllValues(ply)
		joining( ply )
		ply:UnLock()
		ply:ConCommand( "ctf_start" )
		ply:Spawn()
	end
end

function EndGame(team)
	timer.Simple(7, ResetWorld)

	for k,ply in pairs(player.GetAll()) do
		ply:Lock()
	end

	net.Start("GameEnded")
	net.WriteFloat(team)
	net.Broadcast()
end

LastTimeLeft = math.ceil(CTF_Time:GetFloat() * 60 - Time)
function GM:Think()

	if buildTime != CTF_Time:GetFloat() then
		buildTime = CTF_Time:GetFloat()
		net.Start("ctf_TimeUpdate")
		net.WriteFloat(math.ceil(buildTime * 60 - Time))
		net.Broadcast()
	end

	if showPP != GetConVar("ctf_usepropprotect"):GetBool() then
		showPP = GetConVar("ctf_usepropprotect"):GetBool()
		net.Start("UpdatePP")
		net.WriteBool(tobool(showPP))
		net.Broadcast()
	end

	if respawnTime != CTF_RespawnTime:GetFloat() then
		respawnTime = CTF_RespawnTime:GetFloat()
		net.Start("UpdateRespawn")
		net.WriteFloat(respawnTime)
		net.Broadcast()
	end

	if Time / 60 > CTF_Time:GetFloat() and not MatchHasBegun then
		MatchHasBegun = true
		net.Start("MatchBegin")
		net.Broadcast()
		for k,v in pairs(ents.GetAll()) do
			if v.IsSphere then
				v:Remove()
			elseif v.IsBase or v.IsSpawnArea then
				v:GetPhysicsObject():EnableMotion(false)
			end
		end
		for k,v in pairs(player.GetAll()) do
			v:StripWeapons()
			RestoreTools(v)
			v.canbuild = 1
			RespawnTeam(1)
			RespawnTeam(2)
			v:ChatPrint( "[CTF]: The build phase is over. Begin.")
			timer.Create( "moneyTimer", (GetConVar("ctf_passivetimer"):GetFloat()), 0, function() v:SetNWInt("playerMoney", v:GetNWInt("playerMoney") + (GetConVar("ctf_passiveincome"):GetFloat())) end)
		end
		table.Empty(undo:GetTable())
	end

	if TeamSetUp[1] and TeamSetUp[2] and !MatchHasBegun then
		Time = CurTime() - Timer
		local NewTimeLeft = math.ceil(CTF_Time:GetFloat() * 60 - Time)
		if (NewTimeLeft != LastTimeLeft) then
			LastTimeLeft = NewTimeLeft
			net.Start("ctf_TimeUpdate")
			net.WriteFloat(NewTimeLeft)
			net.Broadcast()
		end
	end
end

--------------------------------Economy--------------------------

function GM:PlayerDeath(victim, inflictor, attacker)
	if(attacker:IsPlayer() and (attacker:Team() ~= victim:Team()) and victim:IsPlayer()) then
		attacker:SetNWInt("playerMoney", attacker:GetNWInt("playerMoney") + (GetConVar("ctf_killincome"):GetFloat())) -- Award amount based on killincome cvar
	end
end

-- function GM:PlayerHurt( victim, attacker, healthRemaining, damageTaken )
	-- if ( attacker:IsPlayer() and (attacker:Team() ~= victim:Team()) ) then
		-- attacker:SetNWInt("playerMoney", attacker:GetNWInt("playerMoney") + damageTaken) -- Award player $1 per point of damage
	-- end
-- end

--------------------------------Menu Calls--------------------------

function GM:ShowSpare1(ply)
	
	ply:ConCommand("ctf_open_classmenu")
	
end

util.AddNetworkString("OrdnanceMenu")
function GM:ShowSpare2(ply)

	ply:ConCommand("ctf_open_ordnancemenu")
	
end
