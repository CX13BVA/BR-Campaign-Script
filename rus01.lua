-- this is a dummy line to create this file.
--
-- Unit ID notes
-- 2,3,4,5 Defensive posts (will be elimentated)
-- 11,12,13,14,15,16,17 Enemy front spawn when above is defeated. Delay == 8000 + (Italian)
-- 7,8,9 RP units (trigger for reinforcement)
-- 20,21,22,23,24,25,26,27 Player Reinforcements (Defense)
-- 40,41,42,43,(44,45) Italian forces + reinforcements (German)
-- 777 Player (Officer), 713 Armored Train
--
function Init()
    RunScript("DebugView", 1000); -- Testmode (Cheats)
    RunScript("ForceAdvanceBegin", 1000) -- landing enemy reinforcements after 38(t) has died.
    RunScript("EBase", 1000); -- enemy establishing a base at the village (south-west).
    RunScript("EAdvance", 1500); -- Enemy assault & reinforcements for the river side.
    RunScript("DefReinforce", 2000); -- Player reinforcements
    RunScript("StayAlive", 2000); -- Officer (player) needs to survive
    RunScript("EAdvanceIta", 2000); -- Italian advance
end;
function DebugView() -- Testmode (Cheats)
    Password("Panzerklein");
    DisplayTrace("Testmode", 1000);
    ShowActiveScripts();
    ChangeWarFog(1);
--    God(0,1)
    Suicide();
 end;
function Winner() -- Player wins
    Win(0);
    Suicide()
end;
function Lost() -- Player looses
    Loose()
    Suicide()
end;
function StayAlive() -- Player officer must survive
    if (GetNUnitsInScriptGroup(777) == 0) then
        RunScript("Lost", 8000);
        Suicide();
    end;
end;
function ForceAdvanceBegin() -- landing enemy assault after 38(t) has died.
    if (GetNUnitsInScriptGroup(10) == 0) then
        LandReinforcement(17);
        LandReinforcement(11);
        Suicide();
    end;
end;
function EBase() -- village taken by enemy => landing enemy reinforcements
    if (GetNUnitsInScriptGroup(2) == 0) or
        (GetNUnitsInArea(0, "Village") == 0) then
        RunScript("ReBase", 8000);
        Suicide();
    end;
end;
function ReBase() -- reinforcing village with enemy troops for base
    LandReinforcement(12);
    Suicide();
end;
function EAdvance() -- engaging enemy advance (assault below)
    RunScript("EAAdvance3", 1000);
    RunScript("EAAdvance4", 1000);
    RunScript("EAAdvance5", 1000);
    RunScript("EAAdvance6", 1000);
    Suicide();
end;
function EAAdvance3() -- assault on bridge successful => landing enemy reinforcements
    if (GetNUnitsInScriptGroup(3) == 0) or
        (GetNUnitsInArea(0, "CentralBridge") == 0) then
        RunScript("REA3", 8000);
        Suicide();
    end;
end;
function REA3()
    LandReinforcement(13);
    Suicide();
end;
function EAAdvance4() -- assault on RailForcty sucessful => landing enemy reinforcements
    if (GetNUnitsInScriptGroup(4) == 0) or
        (GetNUnitsInArea(0, "RailFactory") == 0) then
        RunScript("REA4", 8000);
        Suicide();
    end;
end;
function REA4()
    LandReinforcement(14);
    Suicide();
end;
function EAAdvance5() -- assault in FactoryCom sucessfull => landing enemy reinforcements
    if  (GetNUnitsInScriptGroup(5) == 0) or
        (GetNUnitsInArea(0, "FactoryCom") == 0) then
        RunScript("REA5", 8000);
        Suicide();
    end;
end;
function REA5()
    LandReinforcement(15);
    Suicide();
end;
function EAAdvance6() -- Enemy secured their river side => landing enemy reinforcements
    if (GetNUnitsInScriptGroup(2) == 0) or
        (GetNUnitsInArea(0, "Village") == 0) and
        (GetNUnitsInScriptGroup(3) == 0) or
        (GetNUnitsInArea(0, "CentralBridge") == 0) and
        (GetNUnitsInScriptGroup(4) == 0) or
        (GetNUnitsInArea(0, "RailFactory") == 0) and
        (GetNUnitsInScriptGroup(5) == 0) or
        (GetNUnitsInArea(0, "FactoryCom") == 0) then
        RunScript("REA6", 8000);
        Suicide();
    end;
end;
function REA6()
    LandReinforcement(16);
    Suicide();
end;
function DefReinforce() -- Player reinforcements
    RunScript("T26Rein", 1000);
    RunScript("Victoria", 1000);
    RunScript("Trenchfiller", 1000);
    Suicide();
end;
function T26Rein() -- T26 reinforcement from repair factory
    if (GetNScriptUnitsInArea(9, "Car") > 0) then
        ChangePlayer(9, 0);
        LandReinforcement(20);
        LandReinforcement(21);
        Suicide();
    end;
end;
function Victoria() -- Armored Train reinforcement
    if  (GetNUnitsInArea(0, "ItaVillage") == 0) and
        (GetNUnitsInScriptGroup(5) == 0) or
        (GetNUnitsInArea(0, "FactoryCom") == 0) then
        LandReinforcement(713);
        Suicide();
    end;
end;
-- 40,41,42,43,(44,45,46) Italian forces + reinforcements (German)
function EAdvanceIta() -- Italian forces spawn
    if (GetNUnitsInScriptGroup(2) == 0) or
        (GetNUnitsInArea(0, "Village") == 0) and
        (GetNUnitsInScriptGroup(3) == 0) or
        (GetNUnitsInArea(0, "CentralBridge") == 0) and
        (GetNUnitsInScriptGroup(4) == 0) or
        (GetNUnitsInArea(0, "RailFactory") == 0) and
        (GetNUnitsInScriptGroup(5) == 0) or
        (GetNUnitsInArea(0, "FactoryCom") == 0) then
        RunScript("ItalianAdvance", 10000);
        Suicide();
    end;
end;
function ItalianAdvance() -- Italian forces secure their base
    RunScript("ItalianBase", 1000);
    LandReinforcement(40);
    Suicide();
end;
function ItalianBase() -- Italian base being reinforced, RG-41
        if (GetNUnitsInArea(0, "ItaVillage") == 0) and
            (GetNUnitsInScriptGroup(5) == 0) or
            (GetNUnitsInArea(0, "FactoryCom") == 0) then
        LandReinforcement(44);
        RunScript("ItalianBaseSec", 10000);
        RunScript("PrepItalianAssault", 14000);
        Suicide();
    end;
end;
function ItalianBaseSec() -- RG-44,46
    LandReinforcement(41);
    RunScript("SpawnDelayItaBase", 8000);
    Suicide();
end;
function SpawnDelayItaBase()
    LandReinforcement(46);
    Suicide();
end;
function PrepItalianAssault() -- RG-42
    LandReinforcement(42)
    RunScript("ItaWave1", 1000);
    Suicide();
end;
function ItaWave1() -- RG-42,43
    if (GetNUnitsInScriptGroup(42) == 0) then
        RunScript("ItaWave2", 8000);
        LandReinforcement(42);
        LandReinforcement(43);
        Suicide();
    end;
end;
function ItaWave2() -- RG-11,42,43
    if (GetNUnitsInScriptGroup(42) <= 1) or
        (GetNUnitsInScriptGroup(43) <= 1) then
        RunScript("CombinedAttack", 8000);
        LandReinforcement(11);
        LandReinforcement(42);
        LandReinforcement(43);
        Suicide();
    end;
end;
function CombinedAttack()
    if (GetNUnitsInScriptGroup(42) <= 1) or
        (GetNUnitsInScriptGroup(43) <= 1) then
        RunScript("FinalAssault1", 18000);
        RunScript("SpawnDelay1", 5000);
        LandReinforcement(42);
        LandReinforcement(43);
        Suicide();
    end;
end;
function SpawnDelay1()
    LandReinforcement(45);
    Suicide();
end;
function Trenchfiller()
    if (GetNUnitsInArea(0, "TrenchA") <= 1) or
    (GetNUnitsInArea(0, "TrenchB") <= 1) or
    (GetNUnitsInArea(0, "TrenchC") <= 1) then
    LandReinforcement(727);
    Suicide();
    end;
end;
