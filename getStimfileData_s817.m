% getStimfileData_s817.m

clear

stimfiles = viewGet(getMLRView,'stimfile');

total.cuedStim = [];
total.offsetDir = [];
total.orientationOffset_stim1 = [];
total.orientationOffset_stim2 = [];
total.probeOrientation = [];
total.subjectResponse = [];

for i = 1:length(stimfiles)
    e = getTaskParameters(stimfiles{i}); e = e{1};
    total.cuedStim = [total.cuedStim e.parameter.sameStim];
    total.offsetDir = [total.offsetDir e.parameter.offsetDir];
    total.orientationOffset_stim1 = [total.orientationOffset_stim1 e.randVars.oriOffset1];
    total.orientationOffset_stim2 = [total.orientationOffset_stim2 e.randVars.oriOffset2];
    total.probeOrientation = [total.probeOrientation e.randVars.probeOri];
    response = e.response;
    response(response == 2) = -1;
    total.subjectResponse = [total.subjectResponse response];

end

save('~/Documents/MATLAB/nepr207_teaching/s817_behavior.mat','total')