local V = {
	Name = "Synergy Elite Jeep Taucannon",
	Model = "models/vehicles/buggy_elite.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Armed Vehicles",
	Cost = 500,

	Members = {
		Mass = 1700,
		
		LightsTable = "elitejeep",
		
		FrontWheelRadius = 18,
		RearWheelRadius = 20,
		
		SeatOffset = Vector(0,0,-3),
		SeatPitch = 0,
		
		PassengerSeats = {
			{
			pos = Vector(16,-35,21),
			ang = Angle(0,0,9)
			}
		},
		
		Backfire = true,
		ExhaustPositions = {
			{
				pos = Vector(-15.69,-105.94,14.94),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(16.78,-105.46,14.35),
				ang = Angle(90,-90,0)
			}
		},
		
		StrengthenSuspension = true,
		
		FrontHeight = 13.5,
		FrontConstant = 27000,
		FrontDamping = 2200,
		FrontRelativeDamping = 1500, 
		
		RearHeight = 13.5,
		RearConstant = 32000,
		RearDamping = 2200,
		RearRelativeDamping = 1500,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 8,
		
		MaxGrip = 44,
		Efficiency = 1.4,
		GripOffset = 0,
		BrakePower = 40,
		BulletProofTires = true,
		
		IdleRPM = 750,
		LimitRPM = 7500,
		PeakTorque = 100,
		PowerbandStart = 2500,
		PowerbandEnd = 7300,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(20.92,6.95,26.83),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 65,
		
		PowerBias = 0.6,
		
		EngineSoundPreset = -1,
		
		snd_pitch = 1,
		snd_idle = "simulated_vehicles/v8elite/v8elite_idle.wav",
		
		snd_low = "simulated_vehicles/v8elite/v8elite_low.wav",
		snd_low_revdown = "simulated_vehicles/v8elite/v8elite_revdown.wav",
		snd_low_pitch = 0.8,
		
		snd_mid = "simulated_vehicles/v8elite/v8elite_mid.wav",
		snd_mid_gearup = "simulated_vehicles/v8elite/v8elite_second.wav",
		snd_mid_pitch = 1,
		
		snd_horn = "simulated_vehicles/horn_4.wav",
		
		DifferentialGear = 0.38,
		Gears = {-0.1,0,0.1,0.18,0.25,0.31,0.40}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_v8elite_armed", V )


local V = {
	Name = "Synergy Elite Jeep Airboatgun",
	Model = "models/vehicles/buggy_elite.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Armed Vehicles",
	Cost = 500,

	Members = {
		Mass = 1700,
		
		LightsTable = "elitejeep",
		
		FrontWheelRadius = 18,
		RearWheelRadius = 20,
		
		SeatOffset = Vector(0,0,-3),
		SeatPitch = 0,
		
		PassengerSeats = {
			{
			pos = Vector(16,-35,21),
			ang = Angle(0,0,9)
			}
		},
		
		Backfire = true,
		ExhaustPositions = {
			{
				pos = Vector(-15.69,-105.94,14.94),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(16.78,-105.46,14.35),
				ang = Angle(90,-90,0)
			}
		},
		
		StrengthenSuspension = true,
		
		FrontHeight = 13.5,
		FrontConstant = 27000,
		FrontDamping = 2200,
		FrontRelativeDamping = 1500, 
		
		RearHeight = 13.5,
		RearConstant = 32000,
		RearDamping = 2200,
		RearRelativeDamping = 1500,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 8,
		
		MaxGrip = 44,
		Efficiency = 1.4,
		GripOffset = 0,
		BrakePower = 40,
		BulletProofTires = true,
		
		IdleRPM = 750,
		LimitRPM = 7500,
		PeakTorque = 100,
		PowerbandStart = 2500,
		PowerbandEnd = 7300,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(20.92,6.95,26.83),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 65,
		
		PowerBias = 0.6,
		
		EngineSoundPreset = -1,
		
		snd_pitch = 1,
		snd_idle = "simulated_vehicles/v8elite/v8elite_idle.wav",
		
		snd_low = "simulated_vehicles/v8elite/v8elite_low.wav",
		snd_low_revdown = "simulated_vehicles/v8elite/v8elite_revdown.wav",
		snd_low_pitch = 0.8,
		
		snd_mid = "simulated_vehicles/v8elite/v8elite_mid.wav",
		snd_mid_gearup = "simulated_vehicles/v8elite/v8elite_second.wav",
		snd_mid_pitch = 1,
		
		snd_horn = "simulated_vehicles/horn_4.wav",
		
		DifferentialGear = 0.38,
		Gears = {-0.1,0,0.1,0.18,0.25,0.31,0.40}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_v8elite_armed2", V )


local V = {
	Name = "HL2 APC",
	Model = "models/blu/conscript_apc.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Armed Vehicles",
	SpawnOffset = Vector(0,0,50),
	Cost = 700,

	Members = {
		Mass = 4800,
		
		MaxHealth = 4500,
		
		IsArmored = true,
		
		EnginePos = Vector(-16.1,-81.68,47.25),
		
		LightsTable = "conapc",
		
		OnSpawn = function(ent) ent:SetNWBool( "simfphys_NoRacingHud", true ) end,
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/props_vehicles/apc_tire001.mdl",
		CustomWheelPosFL = Vector(-45,77,-22),
		CustomWheelPosFR = Vector(45,77,-22),
		CustomWheelPosRL = Vector(-45,-74,-22),
		CustomWheelPosRR = Vector(45,-74,-22),
		CustomWheelAngleOffset = Angle(0,180,0),
		
		CustomMassCenter = Vector(0,0,0),
		
		CustomSteerAngle = 35,
		
		SeatOffset = Vector(65,-13,35),
		SeatPitch = 0,
		SeatYaw = 0,
		
		PassengerSeats = {
			{
				pos = Vector(13,75,-3.5),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(0,0,-3.5),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(0,0,-3.5),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(0,0,-3.5),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(0,0,-3.5),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(0,0,-3.5),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(0,0,-3.5),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(0,0,-3.5),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(0,0,-3.5),
				ang = Angle(0,0,0)
			},
		},
		
		Attachments = {
			{
				model = "models/hunter/plates/plate075x105.mdl",
				material = "lights/white",
				color = Color(0,0,0,255),
				pos = Vector(0.04,57.5,16.74),
				ang = Angle(90,-90,0)
			},
			{
				model = "models/hunter/plates/plate025x05.mdl",
				material = "lights/white",
				color = Color(0,0,0,255),
				pos = Vector(-25.08,91.34,29.46),
				ang = Angle(4.2,-109.19,68.43)
			},
			{
				pos = Vector(-24.63,77.76,8.65),
				ang = Angle(24.05,-12.81,-1.87),
				model = "models/hunter/plates/plate05x1.mdl",
				material = "lights/white",
				color = Color(0,0,0,255)
			},
			{
				pos = Vector(24.63,77.76,8.65),
				ang = Angle(24.05,-167.19,1.87),
				model = "models/hunter/plates/plate05x1.mdl",
				material = "lights/white",
				color = Color(0,0,0,255)
			},
			{
				pos = Vector(-30.17,61.36,32.79),
				ang = Angle(-1.21,-92.38,-130.2),
				model = "models/hunter/plates/plate025x05.mdl",
				material = "lights/white",
				color = Color(0,0,0,255)
			},
			{
				pos = Vector(30.17,61.36,32.79),
				ang = Angle(-1.21,-87.62,130.2),
				model = "models/hunter/plates/plate025x05.mdl",
				material = "lights/white",
				color = Color(0,0,0,255)
			},
			{
				pos = Vector(0,72.92,40.54),
				ang = Angle(0,-180,0.79),
				model = "models/hunter/plates/plate1x1.mdl",
				material = "lights/white",
				color = Color(0,0,0,255)
			},
			{
				pos = Vector(25.08,91.34,29.46),
				ang = Angle(4.2,-70.81,-68.43),
				model = "models/hunter/plates/plate025x05.mdl",
				material = "lights/white",
				color = Color(0,0,0,255)
			},
			{
				pos = Vector(-29.63,79.02,19.28),
				ang = Angle(90,-18,0),
				model = "models/hunter/plates/plate05x1.mdl",
				material = "lights/white",
				color = Color(0,0,0,255)
			},
			{
				pos = Vector(29.63,79.02,19.28),
				ang = Angle(90,-162,0),
				model = "models/hunter/plates/plate05x1.mdl",
				material = "lights/white",
				color = Color(0,0,0,255)
			},
			{
				pos = Vector(0,75.33,5.91),
				ang = Angle(0,0,0),
				model = "models/hunter/plates/plate1x1.mdl",
				material = "lights/white",
				color = Color(0,0,0,255)
			},
			{
				pos = Vector(0,98.02,35.74),
				ang = Angle(63,90,0),
				model = "models/hunter/plates/plate025x025.mdl",
				material = "lights/white",
				color = Color(0,0,0,255)
			},
			{
				pos = Vector(0,100.55,7.41),
				ang = Angle(90,-90,0),
				model = "models/hunter/plates/plate1x1.mdl",
				material = "lights/white",
				color = Color(0,0,0,255)
			}
		},
		
		FrontHeight = 20,
		FrontConstant = 50000,
		FrontDamping = 4000,
		FrontRelativeDamping = 3000,
		
		RearHeight = 20,
		RearConstant = 50000,
		RearDamping = 4000,
		RearRelativeDamping = 3000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 8,
		
		MaxGrip = 140,
		Efficiency = 1.25,
		GripOffset = -14,
		BrakePower = 120,
		BulletProofTires = true,
		
		IdleRPM = 750,
		LimitRPM = 5500,
		PeakTorque = 180,
		PowerbandStart = 1000,
		PowerbandEnd = 4500,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(-61.34,49.71,15.98),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 120,
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/misc/Nanjing_loop.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/misc/m50.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,
		
		Sound_High = "simulated_vehicles/misc/v8high2.wav",
		Sound_HighPitch = 1,
		Sound_HighVolume = 0.75,
		Sound_HighFadeInRPMpercent = 58,
		Sound_HighFadeInRate = 0.19,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "simulated_vehicles/horn_2.wav",
		
		ForceTransmission = 1,
		
		DifferentialGear = 0.27,
		Gears = {-0.09,0,0.09,0.18,0.28,0.35}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_conscriptapc_armed", V )


local light_table = {	
	ems_sounds = {"ambient/alarms/apc_alarm_loop1.wav"},
}
list.Set( "simfphys_lights", "capc_siren", light_table)

local V = {
	Name = "HL2 Combine APC",
	Model = "models/combine_apc.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Armed Vehicles",
	Cost = 700,

	Members = {
		Mass = 3500,
		MaxHealth = 6000,
		
		LightsTable = "capc_siren",
		
		IsArmored = true,
		
		FrontWheelRadius = 28,
		RearWheelRadius = 28,
		
		SeatOffset = Vector(-25,0,104),
		SeatPitch = 0,
		
		PassengerSeats = {
		},
		
		FrontHeight = 10,
		FrontConstant = 50000,
		FrontDamping = 3000,
		FrontRelativeDamping = 3000,
		
		RearHeight = 10,
		RearConstant = 50000,
		RearDamping = 3000,
		RearRelativeDamping = 3000,
		
		FastSteeringAngle = 10,
		SteeringFadeFastSpeed = 535,
		
		TurnSpeed = 8,
		
		MaxGrip = 70,
		Efficiency = 1.8,
		GripOffset = 0,
		BrakePower = 70,
		BulletProofTires = true,
		
		
		IdleRPM = 750,
		LimitRPM = 6000,
		PeakTorque = 100,
		PowerbandStart = 1500,
		PowerbandEnd = 5800,
		Turbocharged = false,
		Supercharged = false,
		
		FuelFillPos = Vector(32.82,-78.31,81.89),
		
		PowerBias = 0,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/c_apc/apc_idle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/c_apc/apc_mid.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "",
		
		Sound_Throttle = "",
		
		snd_horn = "ambient/alarms/apc_alarm_pass1.wav",
		
		ForceTransmission = 1,
		DifferentialGear = 0.3,
		Gears = {-0.1,0,0.1,0.2,0.3}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_combineapc_armed", V )


local V = {
	Name = "DOD:S Sherman Tank",
	Model = "models/blu/tanks/sherman.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Armed Vehicles",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,
	Cost = 1000,

	Members = {
		Mass = 8000,
		AirFriction = 7,
		Inertia = Vector(10000,80000,100000),
		
		OnSpawn = function(ent) ent:SetNWBool( "simfphys_NoRacingHud", true ) end,
		
		OnDestroyed = 
			function(ent)
				if IsValid( ent.Gib ) then 
					local yaw = ent.sm_pp_yaw or 0
					local pitch = ent.sm_pp_pitch or 0
					ent.Gib:SetPoseParameter("turret_yaw", yaw )
					ent.Gib:SetPoseParameter("turret_pitch", pitch )
				end
			end,
		
		MaxHealth = 6000,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(0,-50,15),
		
		FrontWheelRadius = 40,
		RearWheelRadius = 40,
		
		EnginePos = Vector(-79.66,0,72.21),
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		
		CustomWheelPosFL = Vector(100,35,50),
		CustomWheelPosFR = Vector(100,-35,50),
		CustomWheelPosML = Vector(-5,35,50),
		CustomWheelPosMR = Vector(-5,-35,50),
		CustomWheelPosRL = Vector(-110,35,50),
		CustomWheelPosRR = Vector(-110,-35,50),
		CustomWheelAngleOffset = Angle(0,0,90),
		
		CustomMassCenter = Vector(0,0,3),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(60,-15,55),
		SeatPitch = 0,
		SeatYaw = 90,
		
		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},
		
		ExhaustPositions = {
			{
				pos = Vector(-90.47,17.01,52.77),
				ang = Angle(180,0,0)
			},
			{
				pos = Vector(-90.47,-17.01,52.77),
				ang = Angle(180,0,0)
			},
		},

		
		PassengerSeats = {
			{
				pos = Vector(50,-15,30),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(0,0,30),
				ang = Angle(0,-90,0)
			}
		},
		
		FrontHeight = 22,
		FrontConstant = 50000,
		FrontDamping = 5000,
		FrontRelativeDamping = 5000,
		
		RearHeight = 22,
		RearConstant = 50000,
		RearDamping = 5000,
		RearRelativeDamping = 5000,
		
		FastSteeringAngle = 14,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 6,
		
		MaxGrip = 800,
		Efficiency = 0.85,
		GripOffset = -300,
		BrakePower = 100,
		BulletProofTires = true,
		
		IdleRPM = 600,
		LimitRPM = 4500,
		PeakTorque = 250,
		PowerbandStart = 600,
		PowerbandEnd = 3500,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(-46.03,-34.64,75.23),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 160,
		
		PowerBias = -0.5,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/sherman/idle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/sherman/low.wav",
		Sound_MidPitch = 1.3,
		Sound_MidVolume = 0.75,
		Sound_MidFadeOutRPMpercent = 50,
		Sound_MidFadeOutRate = 0.85,
		
		Sound_High = "simulated_vehicles/sherman/high.wav",
		Sound_HighPitch = 1,
		Sound_HighVolume = 1,
		Sound_HighFadeInRPMpercent = 20,
		Sound_HighFadeInRate = 0.2,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		
		ForceTransmission = 1,
		
		DifferentialGear = 0.3,
		Gears = {-0.1,0,0.05,0.08,0.11,0.14}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_tank2", V )


local V = {
	Name = "DOD:S Tiger Tank",
	Model = "models/blu/tanks/tiger.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Armed Vehicles",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,
	Cost = 2000,

	Members = {
		Mass = 10000,
		AirFriction = 5,
		Inertia = Vector(10000,80000,100000),
		
		OnSpawn = function(ent) ent:SetNWBool( "simfphys_NoRacingHud", true ) end,
		
		OnDestroyed = 
			function(ent)
				if IsValid( ent.Gib ) then 
					local yaw = ent.sm_pp_yaw or 0
					local pitch = ent.sm_pp_pitch or 0
					ent.Gib:SetPoseParameter("turret_yaw", yaw )
					ent.Gib:SetPoseParameter("turret_pitch", pitch )
				end
			end,
		
		MaxHealth = 8000,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(0,-50,15),
		
		FrontWheelRadius = 45,
		RearWheelRadius = 45,
		
		EnginePos = Vector(-79.66,0,72.21),
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		
		CustomWheelPosFL = Vector(110,45,45),
		CustomWheelPosFR = Vector(110,-45,45),
		CustomWheelPosML = Vector(5,45,40),
		CustomWheelPosMR = Vector(5,-45,40),
		CustomWheelPosRL = Vector(-100,45,45),
		CustomWheelPosRR = Vector(-100,-45,45),
		CustomWheelAngleOffset = Angle(0,0,90),
		
		CustomMassCenter = Vector(0,0,5),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(70,0,55),
		SeatPitch = 0,
		SeatYaw = 90,
		
		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},
			
		ExhaustPositions = {
			{
				pos = Vector(-118,-16.62,72.6),
				ang = Angle(115,0,0)
			},
			{
				pos = Vector(-118,-16.62,72.6),
				ang = Angle(115,60,0)
			},
			{
				pos = Vector(-118,-16.62,72.6),
				ang = Angle(115,-60,0)
			},
			
			{
				pos = Vector(-118,16.62,72.6),
				ang = Angle(115,0,0)
			},
			{
				pos = Vector(-118,16.62,72.6),
				ang = Angle(115,60,0)
			},
			{
				pos = Vector(-118,16.62,72.6),
				ang = Angle(115,-60,0)
			},
		},

		
		PassengerSeats = {
			{
				pos = Vector(0,0,50),
				ang = Angle(0,-90,0)
			},
			{
				pos = Vector(0,0,50),
				ang = Angle(0,-90,0)
			}
		},
		
		FrontHeight = 23,
		FrontConstant = 50000,
		FrontDamping = 6000,
		FrontRelativeDamping = 6000,
		
		RearHeight = 23,
		RearConstant = 50000,
		RearDamping = 6000,
		RearRelativeDamping = 6000,
		
		FastSteeringAngle = 14,
		SteeringFadeFastSpeed = 400,
		
		TurnSpeed = 6,
		
		MaxGrip = 800,
		Efficiency = 0.7,
		GripOffset = -300,
		BrakePower = 150,
		BulletProofTires = true,
		
		IdleRPM = 600,
		LimitRPM = 4500,
		PeakTorque = 280,
		PowerbandStart = 600,
		PowerbandEnd = 3500,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(-111.88,-0.14,59.15),
		FuelType = FUELTYPE_PETROL,
		FuelTankSize = 160,
		
		PowerBias = -0.5,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/misc/nanjing_loop.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/misc/m50.wav",
		Sound_MidPitch = 1,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 58,
		Sound_MidFadeOutRate = 0.476,
		
		Sound_High = "simulated_vehicles/tiger/tiger_high.wav",
		Sound_HighPitch = 0.75,
		Sound_HighVolume = 0.75,
		Sound_HighFadeInRPMpercent = 40,
		Sound_HighFadeInRate = 0.19,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		
		ForceTransmission = 1,
		
		DifferentialGear = 0.21,
		Gears = {-0.1,0,0.05,0.07,0.09,0.11,0.13}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_tank", V )


local light_table = {
	L_HeadLampPos = Vector(-122.5,-33.02,25.81),
	L_HeadLampAng = Angle(15,180,0),
	R_HeadLampPos = Vector(-122.5,33.02,25.81),
	R_HeadLampAng = Angle(15,180,0),
	
	Headlight_sprites = { 
		Vector(-122.5,-33.02,25.81),
		Vector(-122.5,33.02,25.81)
	},
	Headlamp_sprites = { 
		Vector(-122.5,-33.02,25.81),
		Vector(-122.5,33.02,25.81)
	},

}
list.Set( "simfphys_lights", "t90ms", light_table)


local light_table = {
	L_HeadLampPos = Vector(-32.85,147.6,45.07),
	L_HeadLampAng = Angle(15,90,0),
	R_HeadLampPos = Vector(32.85,147.6,45.07),
	R_HeadLampAng = Angle(15,90,0),
	
	Headlight_sprites = { 
		Vector(-32.85,147.6,45.07),
		Vector(32.85,147.6,45.07)
	},
	Headlamp_sprites = { 
		Vector(-32.85,147.6,45.07),
		Vector(32.85,147.6,45.07)
	},
	Rearlight_sprites = {
		Vector(-62.95,-153.98,47.47),
		Vector(62.95,-153.98,47.47)
	},
	Brakelight_sprites = {
		Vector(-54.66,-154.5,47.43),
		Vector(54.66,-154.5,47.43)
	},
	
	Turnsignal_sprites = {
		Left = {
			Vector(-59.3,-153.26,47.1),
			Vector(-62.7,132.59,54.49)
		},
		Right = {
			Vector(59.3,-153.26,47.1),
			Vector(62.7,132.59,54.49)
		},
	},


}
list.Set( "simfphys_lights", "leopard", light_table)

local V = {
	Name = "Leopard 2A7",
	Model = "models/blu/tanks/leopard2a7.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Armed Vehicles",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,
	Cost = 2000,

	Members = {
		Mass = 20000,
		AirFriction = 120,
		--Inertia = Vector(14017.5,46543,47984.5),
		Inertia = Vector(80000,20000,100000),
		
		LightsTable = "leopard",
		
		OnSpawn = function(ent) ent:SetNWBool( "simfphys_NoRacingHud", true ) end,
		
		OnDestroyed = 
			function(ent)
				if IsValid( ent.Gib ) then 
					local yaw = ent.sm_pp_yaw or 0
					local pitch = ent.sm_pp_pitch or 0
					ent.Gib:SetPoseParameter("cannon_aim_yaw", yaw - 90 )
					ent.Gib:SetPoseParameter("cannon_aim_pitch", -pitch )
				end
			end,
		
		MaxHealth = 8200,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(0,-50,50),
		
		FrontWheelRadius = 40,
		RearWheelRadius = 45,
		
		EnginePos = Vector(0,-125.72,69.45),
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		--CustomWheelModel = "models/props_vehicles/apc_tire001.mdl",
		
		CustomWheelPosFL = Vector(-50,122,35),
		CustomWheelPosFR = Vector(50,122,35),
		CustomWheelPosML = Vector(-50,0,37),
		CustomWheelPosMR = Vector(50,0,37),
		CustomWheelPosRL = Vector(-50,-110,37),
		CustomWheelPosRR = Vector(50,-110,37),
		CustomWheelAngleOffset = Angle(0,0,90),
		
		CustomMassCenter = Vector(0,0,8),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(55,25,35),
		SeatPitch = -15,
		SeatYaw = 0,
		
		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},
			
		ExhaustPositions = {
			{
				pos = Vector(-34.53,-147.48,42.92),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(34.53,-147.48,42.92),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(-34.53,-147.48,42.92),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(34.53,-147.48,42.92),
				ang = Angle(90,-90,0)
			},
		},

		
		PassengerSeats = {
			{
				pos = Vector(0,0,40),
				ang = Angle(0,0,0)
			},
			{
				pos = Vector(25,-5,45),
				ang = Angle(0,0,0)
			}
		},
		
		FrontHeight = 27,
		FrontConstant = 50000,
		FrontDamping = 30000,
		FrontRelativeDamping = 300000,
		
		RearHeight = 27,
		RearConstant = 50000,
		RearDamping = 20000,
		RearRelativeDamping = 20000,
		
		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 300,
		
		TurnSpeed = 3,
		
		MaxGrip = 1000,
		Efficiency = 1,
		GripOffset = -500,
		BrakePower = 450,
		BulletProofTires = true,
		
		IdleRPM = 600,
		LimitRPM = 3500,
		PeakTorque = 780,
		PowerbandStart = 600,
		PowerbandEnd = 2600,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(-53.14,-143.23,71.42),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 220,
		
		PowerBias = -0.3,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/leopard/start.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/leopard/low.wav",
		Sound_MidPitch = 1.3,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 60,
		Sound_MidFadeOutRate = 0.4,
		
		Sound_High = "simulated_vehicles/leopard/high.wav",
		Sound_HighPitch = 1.2,
		Sound_HighVolume = 1,
		Sound_HighFadeInRPMpercent = 45,
		Sound_HighFadeInRate = 0.2,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		ForceTransmission = 1,
		
		DifferentialGear = 0.4,
		Gears = {-0.06,0,0.06,0.08,0.1,0.12,0.13}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_tank3", V )


local V = {
	Name = "T-90MS",
	Model = "models/blu/tanks/t90ms.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Armed Vehicles",
	SpawnOffset = Vector(0,0,60),
	SpawnAngleOffset = 90,
	Cost = 2500,

	Members = {
		Mass = 20000,
		AirFriction = 0,
		--Inertia = Vector(14017.5,46543,47984.5),
		Inertia = Vector(20000,80000,100000),
		
		LightsTable = "t90ms",
		
		OnSpawn = function(ent) ent:SetNWBool( "simfphys_NoRacingHud", true ) end,
		
		OnDestroyed = 
			function(ent)
				if IsValid( ent.Gib ) then 
					local yaw = ent.sm_pp_yaw or 0
					local pitch = ent.sm_pp_pitch or 0
					ent.Gib:SetPoseParameter("cannon_aim_yaw", yaw - 180 )
					ent.Gib:SetPoseParameter("cannon_aim_pitch", -pitch )
				end
			end,
		
		MaxHealth = 8200,
		
		IsArmored = true,
		
		NoWheelGibs = true,
		
		FirstPersonViewPos = Vector(-10,-30,20),
		
		FrontWheelRadius = 40,
		RearWheelRadius = 45,
		
		EnginePos = Vector(106.08,0.69,38.34),
		
		CustomWheels = true,
		CustomSuspensionTravel = 10,
		
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		--CustomWheelModel = "models/props_vehicles/apc_tire001.mdl",
		
		CustomWheelPosFL = Vector(-122,-50,16),
		CustomWheelPosFR = Vector(-122,50,16),
		CustomWheelPosML = Vector(0,-50,20),
		CustomWheelPosMR = Vector(0,50,20),
		CustomWheelPosRL = Vector(110,-50,20),
		CustomWheelPosRR = Vector(110,50,20),
		CustomWheelAngleOffset = Angle(0,0,90),
		
		CustomMassCenter = Vector(0,0,0),
		
		CustomSteerAngle = 60,
		
		SeatOffset = Vector(68,0,8),
		SeatPitch = -15,
		SeatYaw = -90,
		
		ModelInfo = {
			WheelColor = Color(0,0,0,0),
		},

		
		ExhaustPositions = {
			{
				pos = Vector(71,-75,30.4),
				ang = Angle(115,-90,0)
			},
			{
				pos = Vector(67,-75,30.4),
				ang = Angle(115,-90,0)
			},
			{
				pos = Vector(69,-75,30.4),
				ang = Angle(115,-90,0)
			},
		},
		
		
		PassengerSeats = {
			{
				pos = Vector(0,0,0),
				ang = Angle(0,90,0)
			},
			{
				pos = Vector(0,0,0),
				ang = Angle(0,90,0)
			}
		},
		
		FrontHeight = 27,
		FrontConstant = 50000,
		FrontDamping = 30000,
		FrontRelativeDamping = 300000,
		
		RearHeight = 27,
		RearConstant = 50000,
		RearDamping = 20000,
		RearRelativeDamping = 20000,
		
		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 300,
		
		TurnSpeed = 3,
		
		MaxGrip = 1000,
		Efficiency = 1,
		GripOffset = -500,
		BrakePower = 450,
		BulletProofTires = true,
		
		IdleRPM = 600,
		LimitRPM = 3500,
		PeakTorque = 780,
		PowerbandStart = 600,
		PowerbandEnd = 2600,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(139.42,-3.68,38.38),
		FuelType = FUELTYPE_DIESEL,
		FuelTankSize = 220,
		
		PowerBias = -0.3,
		
		EngineSoundPreset = 0,
		
		Sound_Idle = "simulated_vehicles/t90ms/idle.wav",
		Sound_IdlePitch = 1,
		
		Sound_Mid = "simulated_vehicles/t90ms/low.wav",
		Sound_MidPitch = 1.5,
		Sound_MidVolume = 1,
		Sound_MidFadeOutRPMpercent = 100,
		Sound_MidFadeOutRate = 1,
		
		Sound_High = "simulated_vehicles/t90ms/high.wav",
		Sound_HighPitch = 1.5,
		Sound_HighVolume = 0.7,
		Sound_HighFadeInRPMpercent = 50,
		Sound_HighFadeInRate = 0.2,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		ForceTransmission = 1,
		
		DifferentialGear = 0.4,
		Gears = {-0.06,0,0.06,0.08,0.1,0.12,0.13}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_tank4", V )