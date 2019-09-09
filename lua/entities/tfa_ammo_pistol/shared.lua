
-- Copyright (c) 2018-2019 TFA Base Devs

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

if SERVER then
	AddCSLuaFile()
end

ENT.Type = "anim"
ENT.Base = "tfa_ammo_base"
ENT.PrintName = "Pistol Rounds"
ENT.Category = "TFA Ammunition"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Class = ""
ENT.MyModel = "models/Items/BoxSRounds.mdl"
ENT.ImpactSound = "Default.ImpactSoft"
ENT.AmmoCount = 100
ENT.AmmoType = "pistol"
ENT.DrawText = true
ENT.TextColor = Color(255, 255, 255, 255)
ENT.TextPosition = Vector(2, 1.5, 11.6)
ENT.TextAngles = Vector(90, 90, 90)
ENT.ShouldDrawShadow = true
ENT.ImpactSound = "Default.ImpactSoft"
ENT.Damage = 40
ENT.Text = "Pistol Rounds"
ENT.Cost = 25
