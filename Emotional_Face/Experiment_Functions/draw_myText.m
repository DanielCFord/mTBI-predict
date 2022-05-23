function cfgOutput = draw_myText(cfgScreen, cfgExp, text, cfgTxt, cfgOutput, cfgTrigger, cfgFile, cfgEyelink)
% cfgOutput = draw_myText(cfgScreen, cfgExp, text, cfgTxt, cfgOutput, cfgTrigger, cfgFile, cfgEyelink)
% draws white text on the centre of the Screen and waits for experimenter
% to press "y" to continue

Screen('Flip', cfgScreen.window);
DrawFormattedText(cfgScreen.window, text, 'center', 'center', [cfgScreen.black, cfgScreen.black, cfgScreen.black]);
Screen('Flip', cfgScreen.window);

notWaiting = false;  % only enable the experimenter to continue/ start
while ~notWaiting
    [~, contPresd] = KbStrokeWait(cfgExp.deviceNum);
    if contPresd(cfgExp.yesKey)
        notWaiting = true;
    elseif contPresd(cfgExp.noKey)
        Screen('Flip', cfgScreen.window);
        DrawFormattedText(cfgScreen.window, cfgTxt.quitTxt, 'center', 'center', [cfgScreen.black, cfgScreen.black, cfgScreen.black]);
        Screen('Flip', cfgScreen.window);
        [~, abrtPrsd] = KbStrokeWait;
        if abrtPrsd(cfgExp.yesKey)
            cfgOutput.abrtTmPoint(nstim) = send_trigger(cfgTrigger, cfgExp, cfgTrigger.off);  % send the quit trigger
            cleanup(cfgFile, cfgExp, cfgScreen, cfgEyelink);
            warning('Experiment aborted by user')
            break
        end
    end
    KbQueueFlush;
    WaitSecs(0.5)
end