function cfgOutput = display_cue(presentingStr, nstim, cfgCue, cfgScreen, cfgExp, cfgTrigger, cfgOutput)
% cfgOutput = display_cue(presentingStr, nstim, cfgCue, cfgScreen, cfgExp, cfgTrigger, cfgOutput)
% draw ans flip fixation cross with coordinates in cfgScreen
% for the duration specified in cfgExp

cfgOutput.cueOnTmPnt(nstim) = send_trigger(cfgTrigger, cfgExp, cfgTrigger.cueOn);
cfgOutput.respStartTime(nstim) = GetSecs;
for frm = 1:cfgExp.cueFrm
    Screen('DrawTexture', cfgScreen.window, presentingStr.cueStim{nstim}, [], cfgCue.destCue);
    Screen('FillOval', cfgScreen.window, cfgScreen.fixDotColor, cfgScreen.fixDotRect);
    Screen('Flip', cfgScreen.window, cfgScreen.vbl + (cfgScreen.waitFrm - 0.5) * cfgScreen.ifi);
end
cfgOutput.cueOffTmPnt(nstim) = send_trigger(cfgTrigger, cfgExp, cfgTrigger.cueOff);

end
