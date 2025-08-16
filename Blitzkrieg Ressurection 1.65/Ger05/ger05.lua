-- this is a dummy line to create this file.
--
-- Unit ID Notes;
-- 99 BattleDead, 98 Take Command
-- 15 Initial Reinf, 16 Riverside Reinf,
--
-- List of Objectives.
-- Obj 0: Secure the City, Obj 1: Secure position, Obj 2: Take out AA, Obj 3: Secure Westside of River
--
--
-- Note to self: Remove all DisplayTrace("Script Debug") messages once the script is done and tested.
-- DisplayTrace("Scrpit Debug: ");
--
-- Script not yet tested!
--
function Init()
	DisplayTrace("Scrpit Debug: Init");
	RunScript("Debug", 2000); -- Enables certain cheats for debug reasons.
	RunScript("InitialNoAir", 500); -- Disables Airspawn for Player and AI.
	RunScript("BattleDead", 1000); -- Adds Corpses and destroyed vehicles/beuildings.
	RunScript("InitialReinforcements", 3500); -- Initial Reinforcements (ID15).
	RunScript("InitialOrders", 3500); -- Starts the first Task.
	RunScript("MainTask", 2000); -- Enables the main task
end;

function Debug() -- Enables certain cheats for debug reasons.
	DisplayTrace("Scrpit Debug: Debug");
	Password("Panzerklein"); -- Enables cheats.
	ChangeWarFog(1); -- Disables Fog of War, so one can see the enemy units.
	ShowActiveScripts(); -- Shows what scripts (function) are currently active.
	Suicide(); -- Stops the script from running, if not added the script (function) will loop.
end;

function BattleDead() -- Adds Corpses and destroyed vehicles/buildings.
	DisplayTrace("Scrpit Debug: BattleDead");
	DamageObject(99, 0); -- Units with ScripID 99 get their Health set to 0.
	Suicide();
end;

function InitialNoAir() -- Disables Airspawn for Player and AI.
	DisplayTrace("Scrpit Debug: InitialNoAir");
	DisableAviation(-1, -1); -- (iParty, iAviationType)
	Suicide();
end;

function Winner() --
	DisplayTrace("Scrpit Debug: Winner");
	Win(0); -- Party 0 (Player) wins
	Suicide();
end;

function Looser()
	DisplayTrace("Scrpit Debug: Looser");
	Loose();
	Suicide;
end;

function MainTask()
	ObjectiveChanged(0, 0); -- Obj 0: Secure the City.
	ObjectiveChanged(3, 0); -- Obj 3: Secure Westside of River (Starting position)
	RunScript("TakeTheCity0", 500);
	RunScript("Westside", 500);
	Suicide();
end;

function InitialReinforcements()
	DisplayTrace("Scrpit Debug: InitialReinforcements");
	LandReinforcement(15); -- Spawns Reinforcement group 15
	Suicide(); -- Very important on Reinforcement scripts, else they're gonna loop forever
end;

function InitialOrders()
	DisplayTrace("Scrpit Debug: InitialOrders");
	RunScript("SecurePosition", 2000);
	ObjectiveChanged(0, 0); -- Obj 1: Secure Position
	RunScript("DestroyAA", 1500);
	ObjectiveChanged(1, 0); -- Obj 2: Destroy AA
	RunScript("RiversideReinf", 8000
end;

-- Areas for the next 3 functions: 
-- WorkerBarracks (Obj 1), Garrison (obj 1), aaPosition (obj 2)

function SecurePosition()
	if ((GetNUnitsInArea(1, "WorkerBarracks" <=3) and
		(GetNUnitsInArea(1, "Garrison" ==0) then
	ObjectiveChanged(1, 1);
	Suicide();
end;

function aaPosition()
	if (GetNUnitsInArea(1, "aaPosition" <=3) then
	ObjectiveChanged(2, 1)
	Suicide():
end;

function Westside()
	-- This function checks if Obj 1 and Obj 2 have been completed.
	if ((GetNUnitsInArea(1, "WorkerBarracks" <=3) and
		(GetNUnitsInArea(1, "Garrison" ==0) and
		(GetNUnitsInArea(1, "aaPosition" <=3) then
	ObjectiveChanged(3, 1);
	RunScript("EastPrep", 3000);
	Suicide();
end;

-- Script not yet tested!


