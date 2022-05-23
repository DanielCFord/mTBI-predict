function timepoint = send_trigger(cfgTrigger, cfgExp, code)
% timepoint = send_trigger(cfgTrigger, cfgExp, code)
% sends trigger during MEG, code should indicate trigger code you want to
% send

if cfgExp.MEGLab == 1
  io64(cfgTrigger.handle, cfgTrigger.address, code); % send trigger code, e.g., 16 (pin 5)
  Eyelink('Message', sprintf('Calibration_area: %s', num2str(calibration_area)))
end

timepoint = GetSecs;  % get the time point of interest

end 