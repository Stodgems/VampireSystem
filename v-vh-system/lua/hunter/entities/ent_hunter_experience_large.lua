-- Large Hunter Experience Book Entity

AddCSLuaFile()

ENT = {}
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Large Hunter Experience Book"
ENT.Author = "Your Name"
ENT.Category = "Hunter System"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:Initialize()
    self:SetModel("models/props_lab/bindergreen.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:Wake()
    end
end

function ENT:Use(activator, caller)
    if activator:IsPlayer() then
        AddExperience(activator, 10000) -- Give 10000 experience
        self:Remove()
    end
end

scripted_ents.Register(ENT, "ent_hunter_experience_large")
