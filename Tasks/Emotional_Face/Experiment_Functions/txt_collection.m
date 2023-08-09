function cfgTxt = txt_collection
% cfgTxt = txt_collection
% collection of all texts used in the experiment

cfgTxt.quitTxt = 'Are you sure you want to abort the experiment? y/n';
cfgTxt.startTxt = 'Are you ready to start? \n Tell the experimenter to start the task when you are ready';
cfgTxt.question =  'Was the gender \n \n \n \n \n \n  female?                 male?';
cfgTxt.breakTxt = 'Take a break \n tell the experimenter to continue when you are ready';
cfgTxt.endTxt = 'Thank you :-) \n\n Please stay still while we save your data.';
instr1 = 'First a dot appears in the centre of the screen. \n\n Please look at that dot for the duration of the task.' ;
instr2 = 'Then a face appears on the screen. \n\n Please continue to look at the dot.';
instr3 = 'Sometimes a question will pop up \n asking about the gender of the previously shown face. \n\n Please press right index finger for male and left for female.';
cfgTxt.instrTxt = {instr1, instr2, instr3};

end