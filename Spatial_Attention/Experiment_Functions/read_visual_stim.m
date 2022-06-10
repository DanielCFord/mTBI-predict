function [cfgStim, cfgExp, cfgTrigger] = read_visual_stim(cfgFile, cfgExp, cfgStim, cfgTrigger)
% cfgStim = read_visual_stim(cfgFile, cfgExp, cfgStim)
% randomly reads the visual stimuli
% inputs are the directory of stimuli images and number of trials/stim

fileDirStim = dir([cfgFile.stim, '*.bmp']);  % only use the files ending in .bmp (not unwanted files)
fileDirCue = dir([cfgFile.cue, '*.jpg']);

[~,idx] = sort(str2double(regexp({fileDirStim.name},'(?<=cube3D)\d+','match','once'))); % sort the file names increasingly  
cfgStim.fNameStimSortd = fileDirStim(idx);

cfgStim.visStim = cell(length(1:cfgStim.stimRotSpeed:length(cfgStim.fNameStimSortd)), 1);  % preallocation
cfgStim.cueStim = cell(cfgExp.numStim, 1);  % preallocation

% read stimulus images 
for spd = 1:cfgStim.stimRotSpeed:length(cfgStim.fNameStimSortd)
    cfgStim.visStim{spd} = imread(cfgStim.fNameStimSortd(spd).name);
end
cfgStim.visStim = cfgStim.visStim(~cellfun('isempty', cfgStim.visStim'));  % remove indices that are empty due to reading images based on speed

cfgStim.visStimMat = repmat([cfgStim.visStim; flip(cfgStim.visStim)], ceil(max(cfgExp.stimFrm)/100), 1);  % matrix of inward and outward moving gratings
% create enough visual stimuli for each trial
for stm = 1:length(cfgExp.stimFrm)
    tempStrt = randi(max(cfgExp.stimFrm));
    cfgStim.visStimR{stm} = cfgStim.visStimMat(tempStrt : tempStrt + max(cfgExp.stimFrm) + 10);  % every cfgExp.stimSpeedFrm = one complete rotation
    cfgStim.visStimL{stm} = cfgStim.visStimMat(tempStrt : tempStrt + max(cfgExp.stimFrm) + 10);  % 10 is added just to make sure there is enough stims
end

rng('shuffle')
cfgStim.cueRndIdx = randi(2, cfgExp.numStim, 1);  % random index for cue - 1:left, 2:right
for stim = 1:cfgExp.numStim
    cfgStim.cueStim{stim,1} = imread(fileDirCue(cfgStim.cueRndIdx(stim)).name);  % read cue randomly
end

% collect correct responses for questions in the corresponding row +
% triggers
cfgExp.cuesDir = cell(cfgExp.numStim, 2);
cfgTrigger.cuesRL = cell(cfgExp.numStim, 2);
cfgExp.cuesDir(find(cfgStim.cueRndIdx == 1), 1) = {'LeftArrow'};
cfgExp.cuesDir(find(cfgStim.cueRndIdx == 1), 2) = {'4$'};
cfgExp.cuesDir(find(cfgStim.cueRndIdx == 2), 1) = {'RightArrow'};
cfgExp.cuesDir(find(cfgStim.cueRndIdx == 2), 2) = {'7&'};
cfgExp.cuesDir(find(cfgExp.corrResp == 0), [1, 2]) = {'no resp'};
cfgTrigger = struct('cuesRL', num2str(cfgStim.cueRndIdx + 100));  % 101 -> cue right, 102 -> cue left
cfgTrigger.cuesRL(find(cfgStim.cueRndIdx == 1), 2) = 'Right';  % trigger message for Eyelink
cfgTrigger.cuesRL(find(cfgStim.cueRndIdx == 2), 2) = {'Left'};  


end