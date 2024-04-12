% getStimfileData_s818.m

clear

stimfiles = viewGet(getMLRView,'stimfile');

total.trialVolume = [];
total.cue = [];
total.cuedTarget = [];
total.cueLR = [];
total.kWeb = [];
faster{1} = [];
faster{2} = [];
faster{3} = [];
faster{4} = [];
total.subjectResponse = [];

for i = 1:length(stimfiles)
    e = getTaskParameters(stimfiles{i}); e = e{1};
    total.trialVolume = [total.trialVolume e.trialVolume];
    total.cue = [total.cue e.parameter.cue];
    total.cuedTarget = [total.cuedTarget e.randVars.cuenum];
    total.cueLR = [total.cueLR e.randVars.cueLR];
    total.kWeb = [total.kWeb e.randVars.kWeb];
    faster{1} = [faster{1} e.randVars.faster1];
    faster{2} = [faster{2} e.randVars.faster2];
    faster{3} = [faster{3} e.randVars.faster3];
    faster{4} = [faster{4} e.randVars.faster4];
    total.subjectResponse = [total.subjectResponse e.response];

end

total.faster(1,:) = faster{1};
total.faster(2,:) = faster{2};
total.faster(3,:) = faster{3};
total.faster(4,:) = faster{4};

keyboard

save('~/Documents/MATLAB/nepr207_teaching/s818_behavior.mat','total')