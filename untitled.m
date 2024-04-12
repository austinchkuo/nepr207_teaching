% script to replace stimfiles with cue L/R

stimfiles = viewGet(getMLRView,'stimfile');

for i = 1:length(stimfiles)

    e = getTaskParameters(stimfiles{i}); e = e{1};
    cue = e.parameter.cue;
    cue((cue == 1) || (cue==3)) = 1;
    cue((cue == 2) || (cue==4)) = 2;
    
    stimfileRoot = 'Etc/240409_stim';
    stimfileExt = '.mat';
    stimfileNum = num2str(i+1);
    if (i+1) < 10
        stimfileNum = strcat('0',stimfileNum);
    end
    stimfilePath = strcat(stimfileRoot,stimfileNum,stimfileExt);
    addCalculatedVar('cueLR',cue,stimfilePath);

end