function cfgExp = initialise_exp_variables(cfgExp)
% cfgExp = initialise_exp_variables(cfgExp)
% Introduces variables of interest for SpAtt task
% to change any repetition you should edit this function

rng('shuffle')
cfgExp.numBlock = 3;  % total number of blocks 
cfgExp.numTrial = 76;  % number of trials in each block
cfgExp.numStim = cfgExp.numTrial * cfgExp.numBlock;  % number of stimuli in total
cfgExp.cueDur = 1400;  % duration of cue presentation in ms
cfgExp.ISIDur = 1750;  % interval between cue and grating (stimulus)
cfgExp.catchTrial = zeros(cfgExp.numStim, 1);  % 1=>target present 0=>catch trials
cfgExp.catchTrial(2:10:end, :) = 1; 
cfgExp.catchTrial = cfgExp.catchTrial(randperm(length(cfgExp.catchTrial)));  % randomize order of catch trials
cfgExp.respTimOut = 1500;  % time during which subject can respond in ms

if strcmp(cfgExp.answer.site,'Birmingham'), cfgExp.site = 2; elseif strcmp(cfgExp.answer.site,'Nottingham'), cfgExp.site = 3;
    strcmp(cfgExp.answer.site,'Aston'), cfgExp.site = 1; end  % Aston -> 1, UoB -> 2, UoN ->3
if strcmp(cfgExp.answer.pc,'MEG'), cfgExp.MEGLab = 1; else, cfgExp.MEGLab = 0; end  % MEG lab computer-> 1 PC-> 0
if strcmp(cfgExp.answer.test,'task'), cfgExp.task = 1; else, cfgExp.task = 0; end  % are we collecting data and running the task?
if strcmp(cfgExp.answer.test,'train'), cfgExp.train = 1; else, cfgExp.train = 0; end  % are we training the participant?

end

% generate N random numbers in the interval (a,b): r = a + (b-a).*rand(N,1).