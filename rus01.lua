-- this is a dummy line to create this file.
--
--
-- Unit ID notes
-- 2,3,4,5 Defensive posts (will be elimentated)
-- 11,12,13,14,15,16,17 Enemy front spawn when above is defeated. >> delay 8000
-- 7,8,9 RP units (trigger for reinforcement)
-- 20,21,22,23,24,25,26,27 Player Reinforcements (Defense)
--
--
function Init()
    RunScript("DebugView", 1000);
    RunScript("ForceAdvanceBegin", 1000)
    RunScript("EBase", 1000);
    RunScript("EAdvance", 1500);
    RunScript("DefReinforce", 2000);
end;
function DebugView() -- Testmode (Cheats)
    Password("Panzerklein");
    DisplayTrace("Testmode", 1000);
    ShowActiveScripts();
    ChangeWarFog(1);
--    God(0,1)
    Suicide();
 end;
function ForceAdvanceBegin()
    if (GetNUnitsInScriptGroup(10) == 0) then
        LandReinforcement(17);
        LandReinforcement(11);
        Suicide();
    end;
end;
function EBase()
    if (GetNUnitsInScriptGroup(2) == 0) or
        (GetNUnitsInArea(0, "Village") == 0) then
        RunScript("ReBase", 8000);
        Suicide();
    end;
end;
function ReBase()
    LandReinforcement(12);
    Suicide();
end;
function EAdvance()
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
        RunScript("MainAssault", 15000);
        Suicide();
    end;
end;
function REA6()
    LandReinforcement(16);
    Suicide();
end;
function DefReinforce() -- Player reinforcements
    RunScript("T26Rein", 1000)
    Suicide();
end;
function T26Rein()
    if (GetNScriptUnitsInArea(9, "Car") > 0) then
        ChangePlayer(9, 0);
        LandReinforcement(20);
        LandReinforcement(21);
        Suicide();
    end;
end;
