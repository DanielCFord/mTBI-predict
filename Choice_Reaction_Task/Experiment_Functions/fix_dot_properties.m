function cfgScreen = fix_dot_properties(cfgScreen)
% cfgScreen = fix_dot_properties(cfgScreen);
% input is screen and window info, outputs characteristics of fixation dot
% Screen('DrawDots'...) will read from this function's output

cfgScreen.fixDotCentre = cfgScreen.centre;  % -100 coordinates of fixation dot- normally above center
cfgScreen.fixDotSize = 0.2;  % size of fixation dot in visual degrees
cfgScreen.fixDotRect = [cfgScreen.fixDotCentre - angle2pix(cfgScreen, cfgScreen.fixDotSize./2)...
    , cfgScreen.fixDotCentre + angle2pix(cfgScreen, cfgScreen.fixDotSize./2)];  % rect for fixation dot 
cfgScreen.fixDotColor = [1 1 1];  % color of fixation dot in rgb (white)

end
