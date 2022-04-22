-- this is a dummy line to create this file.
--
-- ID Notes
-- 3: Player officer (Tutorial Officer) => Objective0
-- 11,13,14,15,16: Player Reinforcements
-- 20,21: Enemy scout group => Reinforcement 20
-- 30,31,32,33,34,35: Enemy Positionong (strategic) => EnemyAdvance0-5
-- 36: Main Assault
-- 
function Init()
    RunScript("DebugView", 1000);
    RunScript("RevealObjective0", 4000);
end;

function DebugView() -- Testmode (Cheats)
    Password("Panzerklein");
    DisplayTrace("Testmode", 1000);
    ShowActiveScripts();
    ChangeWarFog(1);
--    God(0,1)
    Suicide();
end;

function Wingame() -- Player wins
    Win();
    Suicide();
end;
function Lost() -- Player Loose
    Loose();
    Suicide();
end;

function RevealObjective0() -- Objective0, Reinforce20 >> EnemyAdvance0-5
    DisplayTrace("You (British officer) must survive in order to win.", 1000)
    RunScript("Objective0", 2000);
    RunScript("VillageLost", 3000);
    RunScript("Reinforce20", 4000);
    RunScript("EnemyAdvance0", 2500);
    RunScript("EnemyAdvance1", 2500);
    RunScript("EnemyAdvance2", 2500);
    RunScript("EnemyAdvance3", 2500);
    RunScript("EnemyAdvance4", 2500);
    RunScript("EnemyAdvance5", 2500);
    Suicide();
end;
function Reinforce20()
    LandReinforcement(20);
    Suicide();
end;

function VillageLost() -- no friendly troops in "village" => Reinforce13
    if (GetNUnitsInArea(0, "village") == 0) then
        RunScript("Reinforce13", 2000);
        Suicide();
    end;
end;
function Reinforce13()
    LandReinforcement(13);
    Suicide();
end;

function Objective0() -- Officer must survive => Loose
    if (GetNUnitsInScriptGroup(3) == 0) then -- 3 = Tutorial Officer (Player)
        DisplayTrace("You've been killed!", 1000);
        RunScript("Lost", 5000);
        Suicide();
    end;
end;

function EnemyAdvance0() -- enemy arrived at cross => Reinforce30
    if (GetNUnitsInArea(1, "cross") > 0) then
        RunScript("Reinforce30", 5000);
        Suicide();
    end;
end;
function Reinforce30()
    LandReinforcement(30);
    Suicide();
end;

function EnemyAdvance1() -- enemy arrived at "village" => Reinforce 31
    if (GetNUnitsInArea(1, "village") > 0) then
        RunScript("Reinforce31", 5000);
        Suicide();
    end;
end;
function Reinforce31()
    LandReinforcement(31);
    Suicide();
end;

function EnemyAdvance2() -- enemy arrived at "country-cross" => Reinforce32
    if (GetNUnitsInArea(1, "country-cross") > 0) then
        RunScript("Reinforce32", 5000);
        Suicide();
    end;
end;
function Reinforce32()
    LandReinforcement(32);
    Suicide();
end;

function EnemyAdvance3() -- enemy arrived at "town-line" => Reinforce33
    if (GetNUnitsInArea(1, "town-line") > 0) then
        RunScript("Reinforce33", 5000);
        Suicide();
    end;
end;
function Reinforce33()
    LandReinforcement(33);
    Suicide();
end;

function EnemyAdvance4() -- enemy arrived at "forest-line" => Reinforce34
    if (GetNUnitsInArea(1, "forest-line") > 0) then
        RunScript("Reinforce34", 5000);
        Suicide();
    end;
end;
function Reinforce34()
    LandReinforcement(34);
    Suicide();
end;

function EnemyAdvance5() -- enemy arrived at "town" => Reinforce35, Reinforce15, RevealObjective2
    if (GetNUnitsInArea(1, "town") > 0) or
        (GetNUnitsInArea(1, "town-entrance") > 0) then
        DisplayTrace("Enemy main force spotted!", 1000);
        RunScript("Reinforce15", 3500);
        RunScript("Reinforce35", 8000);
        RunScript("Reinforce36", 14000);
        Suicide();
    end;
end;
function Reinforce15()
    LandReinforcement(15);
    Suicide();
end;
function Reinforce35()
    LandReinforcement(35);
    Suicide();
end;
function Reinforce36()
    RunScript("RevealObjective2", 5000);
    LandReinforcement(36);
    Suicide();
end;

function RevealObjective2() -- Objective2, Objective3, Reinforce16
    ObjectiveChanged(2, 0);
    RunScript("Objective2", 1000);
    RunScript("Objective3", 1000);
    RunScript("Reinforce16", 2000);
    Suicide();
end;
function Reinforce16()
    LandReinforcement(16);
    Suicide();
end;

function Objective2() -- hold the assault => Wingame
    if (GetNUnitsInScriptGroup(36) <= 2) then
        DisplayTrace("It seems the enemy assault failed.", 3000)
        RunScript("Wingame", 5000);
        Suicide();
    end
end;

function Objective3() -- prevent enemy from reaching "town-exit" => Lost
    if (GetNUnitsInArea(1, "town-exit") > 1) then
        DisplayTrace("The Enemy broke through our lines!", 1000);
        DisplayTrace("Retreat!", 1500);
        RunScript("Lost", 5000);
    end;    
end;
