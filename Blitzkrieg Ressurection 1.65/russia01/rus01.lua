-- this is a dummy line to create this file.
--
-- Unit ID notes
-- 2,3,4,5 Defensive posts (will be elimentated)
-- 11,12,13,14,15,16,17 Enemy front spawn when above is defeated. Delay == 8000 + (Italian)
-- 7,8 RP units (trigger for reinforcement)
-- 9 will switch sides to player after arrival of officer (Car with ID 9) in T26 factory
-- 20,21,22,23,24,25,26,27 Player Reinforcements (Defense)
-- 40,41,42,43,(44,45) Italian forces + reinforcements (German)
-- 60 German artillery
-- 777 Player (Officer), 713 Armored Train
-- 99 BattleDead
function Init()
    RunScript("BattleDead", 1000); -- Adds Corpses
    RunScript("ForceAdvanceBegin", 1000) -- landing enemy reinforcements after 38(t) has died.
    RunScript("EBase", 1000); -- enemy establishing a base at the village (south-west).
    RunScript("EAdvance", 1500); -- Enemy assault & reinforcements for the river side.
    RunScript("DefReinforce", 2000); -- Player reinforcements
    RunScript("StayAlive", 2000); -- Officer (player) needs to survive
    RunScript("RevealObjective0", 2000);
    RunScript("RevealObjective1", 2000);
    RunScript("EAdvanceIta", 2000); -- Italian advance
end;
function BattleDead() -- Adds Corpses
    DamageObject(99,0)
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
function RevealObjective0()
    ObjectiveChanged(0, 0);
    RunScript("Objective0", 1000);
    Suicide();
end;
function RevealObjective1()
    ObjectiveChanged(1, 0);
    RunScript("Objective1", 1000);
    Suicide();
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
-- 60 German artillery
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
    RunScript("ItalianBaseAdvance", 8000);
    LandReinforcement(40);
    Suicide();
end;
function ItalianBaseAdvance()
        if (GetNUnitsInArea(0, "ItaVillage") == 0) and
            (GetNUnitsInScriptGroup(5) == 0) or
            (GetNUnitsInArea(0, "FactoryCom") == 0) then
        RunScript("ItalianBase", 8000);
        Suicide();
    end;
end;
function ItalianBase() -- RG-44
    LandReinforcement(44);
    RunScript("ItalianBaseSec", 10000);
    RunScript("PrepItalianAssault", 14000);
    Suicide();
end;
function ItalianBaseSec() -- RG-46
    LandReinforcement(46);
    RunScript("SpawnDelayItaBase", 8000);
    Suicide();
end;
function SpawnDelayItaBase() -- RG-41
    LandReinforcement(41);
    Suicide();
end;
function PrepItalianAssault() -- RG-42
    LandReinforcement(42);
    RunScript("ItaWave1", 1000);
    Suicide();
end;
function ItaWave1() -- RG-42,43,60
    if (GetNUnitsInScriptGroup(42) == 0) then
        RunScript("ItaWave2", 8000);
        LandReinforcement(42);
        LandReinforcement(43);
        LandReinforcement(60);
        Suicide();
    end;
end;
function ItaWave2() -- del-RG-60
    if (GetNUnitsInScriptGroup(42) <= 1) or
        (GetNUnitsInScriptGroup(43) <= 1) then
        RunScript("CombinedAttackPrepare", 8000);
        DeleteReinforcement(60);
        Suicide();
    end;
end;
function CombinedAttackPrepare() -- RG-11,42,43,60,66
    LandReinforcement(11);
    LandReinforcement(42);
    LandReinforcement(43);
    LandReinforcement(60);
    LandReinforcement(66);
    RunScript("CombinedAttack", 5000);
    Suicide();
end;
function CombinedAttack() -- RG-42,43
    if (GetNUnitsInScriptGroup(42) <= 1) or
        (GetNUnitsInScriptGroup(43) <= 1) then
        RunScript("FinalAssault", 18000);
        RunScript("SpawnDelay1", 5000);
        LandReinforcement(42);
        LandReinforcement(43);
        Suicide();
    end;
end;
function FinalAssault()
    if (GetNUnitsInScriptGroup(42) <= 1) or
        (GetNUnitsInScriptGroup(43) <= 1) then
    RunScript("AssaultIsOver", 1000);
    LandReinforcement(11);
    LandReinforcement(42);
    LandReinforcement(43);
    Suicide();
    end;
end;
function AssaultIsOver()
    if (GetNUnitsInScriptGroup(42) <= 1) or
    (GetNUnitsInScriptGroup(43) <= 1) then
    ObjectiveChanged(0, 1);
    ObjectiveChanged(1, 1);
    RunScript("Winner", 3000);
    Suicide();
    end;
end;
function SpawnDelay1()
    LandReinforcement(45);
    Suicide();
end;
function Trenchfiller()
    if (GetNUnitsInArea(0, "TrenchA") <= 3) or
    (GetNUnitsInArea(0, "TrenchB") <= 3) or
    (GetNUnitsInArea(0, "TrenchC") <= 3) then
    LandReinforcement(727);
    Suicide();
    end;
end;
function EnemyWin()
    if (GetNUnitsInArea(1, "Enemy1")) or
        (GetNUnitsInArea(1, "Enemy2")) or
        (GetNUnitsInArea(1, "Enemy3")) or
        (GetNUnitsInArea(1, "Enemy4")) then
    DisplayTrace("The enemy has taken Key points in the City", 1000);
    RunScript("Lost", 8000);
    Suicide();
    end;
end;
function PlayerBase()
    if (GetNUnitsInArea(0, "Main Base" == 0)) then
        DisplayTrace("Our base has been lost!", 1000);
        RunScript("Lost", 8000);
        Suicide();
    end;
end;
function BlockeGone()
    if (GetNUnitsInArea(0, "Blockade" == 0)) then
        DisplayTrace("The enemy has breached the City", 1000);
        Suicide();
    end;
end;
function FabriABC()
    if (GetNUnitsInArea(0, "FabriA")) or
        (GetNUnitsInArea(0, "FabriB")) or
        (GetNUnitsInArea(0, "FabriC")) then
    DisplayTrace("We are loosing the Factory, pull back and reorganize!", 1000);
    Suicide();
    end;
end;