% getStimfileData_s816.m

stimfiles = viewGet(getMLRView,'stimfile');

total.cueDir = [];
total.angrySide = [];
total.angryImageIdx = [];
total.neutralImageIdx = [];
total.validCue = [];
total.probeDir = [];
total.oriOffsetAngry = [];
total.oriOffsetNeutral = [];
total.correctButton = [];
total.subjectResponse = [];

for i = 1:length(stimfiles)
    
    e = getTaskParameters(stimfiles{i}); e = e{1};
    total.cueDir = [total.cueDir e.parameter.cueDir];
    total.angrySide = [total.angrySide e.parameter.angrySide];
    total.angryImageIdx = [total.angryImageIdx e.randVars.angryImage];
    total.neutralImageIdx = [total.neutralImageIdx e.randVars.neutralImage];
    total.validCue = [total.validCue e.randVars.validCue];
    total.probeDir = [total.probeDir e.randVars.probeDir];
    total.oriOffsetAngry = [total.oriOffsetAngry e.randVars.oriOffsetAngry];
    total.oriOffsetNeutral = [total.oriOffsetNeutral e.randVars.oriOffsetNeutral];
    total.correctButton = [total.correctButton e.randVars.correctButton];
    total.subjectResponse = [total.subjectResponse e.response];

end

save('~/Documents/MATLAB/nepr207_teaching/s816_behavior.mat','total')