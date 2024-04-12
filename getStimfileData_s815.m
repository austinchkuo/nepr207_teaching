% loop to get nepr207 params

clear

stimfiles = viewGet(getMLRView,'stimfile');
for i = 1:length(stimfiles)

    temp = stimfiles{i}.task{1}{1}.randVars.trialType;
    temp = temp(~isnan(temp));

    e = getTaskParameters(stimfiles{i});
    sequenceLength{i} = e{1}.parameter.sequenceLength;
    cue{i} = e{1}.parameter.cue;
    
    nResponses{i} = stimfiles{i}.task{1}{1}.randVars.nResponses(1:length(temp));

    fullShapeSequence{i} = stimfiles{i}.task{1}{1}.fullSequence;
    distractorSequence{i} = stimfiles{i}.task{1}{1}.distractorSequence;
    correctSequence{i} = stimfiles{i}.task{1}{1}.correctSequence;

    sequenceResponse{i} = stimfiles{i}.task{1}{1}.sequenceResponse;
    if length(stimfiles{i}.task{1}{1}.sequenceResponse) ~= length(temp)
        sequenceResponse{i} = [sequenceResponse{i} {[]}];
        if i == 7
            sequenceResponse{i} = [sequenceResponse{i} {[]}];
        end
        fprintf('\n%d, i=%d\n',length(sequenceResponse{i}),i)
    end
    
end

total.sequenceLength = [];
total.cueSide = [];
total.nResponses = [];
total.fullShapeSequence = {};
total.distractorSequence = {};
total.correctSequence = {};
total.sequenceResponse = {};

for i = 1:length(stimfiles)
    total.sequenceLength = [total.sequenceLength sequenceLength{i}];
    total.cueSide = [total.cueSide cue{i}];
    total.nResponses = [total.nResponses nResponses{i}];
    total.fullShapeSequence = [total.fullShapeSequence fullShapeSequence{i}];
    total.distractorSequence = [total.distractorSequence distractorSequence{i}];
    total.correctSequence = [total.correctSequence correctSequence{i}];
    total.sequenceResponse = [total.sequenceResponse sequenceResponse{i}];

end

save('C:\Users\austi\OneDrive - Stanford\Documents\MATLAB\nepr207_teaching\s815_behavior.mat','total');

