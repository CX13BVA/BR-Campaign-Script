-- first time making a script, so don't be surprised if it looks terrible or doesn't work at all.
--
--
function Init()
    RunScript("DebugView", 1000);
    DisplayTrace("Somewhere in Poland, 1939", 3000);
    RunScript("RevealObjective0", 5000);
end;

function DebugView()
    Password("Panzerklein");
    DisplayTrace("Testmode");
    ShowActiveScripts();
    ChangeWarFog(1);
    Suicide();
end;

function Lost()
    DisplayTrace("Our attack has failed!");
    Loose();
    Suicide();
end;

function RevealObjective0()
    ObjectiveChanged(0, 0);
    RunScript("Objective0", 1000);
    LandReinforcement(12); -- spawns snipers
    Suicide();
end;

function Objective0()
    if (GetNUnitsInScriptGroup(17) == 0) then -- Enemy Arty officers both dead
        DisplayTrace("The Artillery spotters are Down.", 2000);
        ObjectiveChanged(0, 1);
        RunScript("RevealObjective1", 5000); -- starts 2nd objective
        Suicide();
    end;
end;

function RevealObjective1()
    ObjectiveChanged(1, 0);
    RunScript("Objective1", 1000);
    RunScript("Reinforce1", 1000);
    DisplayTrace("Now we need to secure out flank.", 3000);
    Suicide();
end;

function Reinforce1()
    LandReinforcement(33);
    Suicide();
end;

function Objective1()
    if (GetNUnitsInScriptGroup(15, 1) == 0) then
        ObjectiveChanged(1, 1);
        DisplayTrace("Our flank has been secured.", 2000);
        DisplayTrace("It's time to prepare out main Assault.", 2500);
        RunScript("RevealObjective2", 3000);
        RunScript("RevealObjective3", 4000);
        Suicide();
    end;
end;

function RevealObjective2()
    ObjectiveChanged(2, 0);
    RunScript("Objective2", 1000);
    Suicide();
end;

function RevealObjective3()
    ObjectiveChanged(3, 0);
    RunScript("Objective3", 2000);
    RunScript("Reinforce2");
    Suicide();
end;

function Reinforce2()
    LandReinforcement(55);
    DisplayTrace("Time to break the Enemy defense!", 2000);
    Suicide();
end;

function Objective2()
    if (GetNUnitsInScriptGroup(14, 1) == 0) then
        ObjectiveChanged(2, 1);
        DisplayTrace("The first line has fallen!", 2000);
        DisplayTrace("Our scouts spotted enemy reinforcements, keep an eye out!", 9000);
        RunScript("Reinforce20", 12000);
        Suicide();
    end;
end;

function Objective3()
    if (GetNUnitsInScriptGroup(16, 1) == 0) then
        ObjectiveChanged(3, 1);
        DisplayTrace("The Village is ours!", 2000);
        RunScript("RevealObjective5");
        Suicide();
    end;
end;

function Reinforce20()
    LandReinforcement(20);
    RunScript("RevealObjective4", 6000);
    Suicide();
end;

function RevealObjective4()
    ObjectiveChanged(4, 0);
    DisplayTrace("Enemy reinforcements spotted, push them back!", 6000);
    RunScript("Objective4", 8000);
    RunScript("Reinforce3", 8000);
    Suicide();
end;

function Reinforce3()
    DisplayTrace("High Command has send you Reinforcements.", 1000);
    DisplayTrace("Make sure you don't loose the Tank!", 1500);
    LandReinforcement(50);
    RunScript("Vital", 2000);
    Suicide();
end;

function Vital()
    if  (GetNUnitsInScriptGroup(51) == 0) then
        DisplayTrace("You have lost the Panzer III, High Command is furious!");
        RunScript("Lost", 3000);
    end;
end;

function Objective4()
    if (GetNUnintsInScriptGroup(20) == 0) then
        DisplayTrace("The enemy counter attack failed.");
        ObjectiveChanged(4, 1);
        Suicide();
    end;
end;

function RevealObjective5()
    ObjectiveChanged(5,0);
    DisplayTrace("Take out the Enemy Commander.", 2000);
    RunScript("Objective5", 2500);
    LandReinforcement(24);
    Suicide();
end;

function Objective5()
    if (GetNUnitsInScriptGroup(25) == 0) then
        DisplayTrace("The Enemy command has fallen, Victory is ours!", 2000);
        ObjectiveChanged(5, 1);
        RunScript("Win", 6000);
        Suicide();
    end;
end;

function Win()
    Win(0);
    Suicide();
end;
