local _, Rubim = ...

local exeOnLoad = function()
--	NePCR.Splash()
	Rubim.meeleSpell = 49998
	print("|cffFFFF00 ----------------------------------------------------------------------|r")
	print("|cffFFFF00 --- |rCLASS NAME|cffC41F3BSPEC |r")
	print("|cffFFFF00 --- |rRecommended Talents: 1/2 - 2/1 - 3/1 - 4/2 - 5/1 - 6/3 - 7/1")
	print("|cffFFFF00 --- |rDnD usage is not optimal.")
	print("|cffFFFF00 --- |rRead the Readme avaiable at github.")
	print("|cffFFFF00 ----------------------------------------------------------------------|r")

	NeP.Interface:AddToggle({
		key = 'saveDS',
		icon = 'Interface\\Icons\\spell_deathknight_butcher2.png',
		name = 'Save Death Strike',
		text = 'BOT will Only Death Strike when RP is Capped, useful on fights were you need to cast an active mitigation.'
	})
		
	NeP.Interface:AddToggle({
		key = 'bonestorm',
		icon = 'Interface\\Icons\\Ability_deathknight_boneshield.png',
		name = 'Use 194844',
		text = 'This will pool RP to use 194844.'
	})
	
	NeP.Interface:AddToggle({
		key = 'aoetaunt',
		icon = 'Interface\\Icons\\spell_nature_shamanrage.png',
		name = 'Aoe Taunt',
		text = 'Experimental AoE Taunt.'
	 })	
	
end


local inCombat = {
	{ "43265" ,{'keybind(lalt)' , 'keybind(lshift)'}},
	{ Util },
	{ Interrupts, "target.interruptAt(10)" }, -- Interrupt when 40% into the cast time
	{ Cooldowns , "player.rubimarea(8).enemies >= 1" },
	{"Blood Boil", { "target.debuff(Blood Plague).duration < 1.5" , "player.area(8).enemies >= 1" }},
	{"Blood Boil" , { "player.buff(Dancing Rune Weapon).duration > 0" ,  "player.buff(Dancing Rune Weapon).duration < 3"}},
	{"Blood Boil" , { "player.spell(Blood Boil).charges >= 1.8" , "player.area(8).enemies >= 1" }},
	{ Survival },
	{ "194844" , { "player.runicpower >= 90" , "toggle(bonestorm)" , "player.areattd >= 10" }}, --194844 with enough RP
	{ Burst , "player.blood.rotation(burst)" },
	{ DRW , "player.blood.rotation(drw)" },
	{ DPS , "player.blood.rotation(dps)" },
	{ General },
}

local outCombat = {
	{Shared}
}

NeP.CR:Add(261, 'Rubim (WIP) Deathknight - Blood', {
		{'%pause', 'player.channeling'},
		{Shared},
		{inCombat}
	}, outCombat, exeOnLoad)
