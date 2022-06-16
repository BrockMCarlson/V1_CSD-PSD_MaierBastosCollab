
% processNEV_rfori()
% plot PSD and CSD with NEV only - no stimulus information required

% The purpose of this code is to get an initial look at the data
% before enganging in more involved processing. One benefit of this is the
% ability to identify bad sessions early in the analysis pipeline.

% This script will plot the CSD-PSD figures for:
%   1. the pre-lesion EVP
%   2. All rfori files

%%
clear
close all
clc

user= input('User Number: ');
setup_rfori(user);

%% Automation setup 

%get all LLC session names
global RIGDIR
    fileList = dir(RIGDIR);
    fileList = {fileList.name};
    sessionListName = fileList(1,3:end)'; %this removes the first two enteries with dots (why does it do that?)


% Set up master table
    preLesionEVP.array = {4,3,5,7,3,5,3,8,3,4,3,4,2,2,4};
    preLesionEVP.string = cellfun(@num2str,preLesionEVP.array,'un',0); %turn any cell of arrays and strings into all strings

    for sessionNumber = 1:size(sessionListName,1)
        preLesionEvpFileName{sessionNumber,1}= strcat(...
            RIGDIR,...
            sessionListName{sessionNumber},filesep,...
            sessionListName{sessionNumber},...
            '_evp00',preLesionEVP.string{sessionNumber});
        rforiFileName{sessionNumber,1}= strcat(...
            RIGDIR,...
            sessionListName{sessionNumber},filesep,...
            sessionListName{sessionNumber},...
            '_rfori4lesions001');
    end
    useChans  = {1:21,1:21,1:22,1:24,1:29,1:24,1:32,1:26,1:23,1:22,1:32,1:23,1:23,1:20,1:32}';
    %qualityLaminarPenetration  = logical([0,0,0,0,1,0,1,1,1,1,1,1,1,1,1])';
    qualityLaminarPenetration  = logical([1,1,1,1,0,1,0,0,0,0,0,0,0,0,0])'; %BAD QALITY
    %trueIfRforiWasRunToday = logical([0,0,1,0,1,1,1,0,1,1,0,1,1,1,0])';
    trueIfRforiWasRunToday = logical([1,1,0,1,0,0,0,1,0,0,1,0,0,0,1])'; %ONLY EVP

    useDataInAnalysis = qualityLaminarPenetration & trueIfRforiWasRunToday;
    interpTheseChans = {[15 16], [15],[17],[],[7 21],[10],[],[5 19 20],[16],[16],[15 17],[19 20 22],[5 10 16],[16],[]}';
    FileInformationTable = table(sessionListName,useDataInAnalysis, preLesionEvpFileName, rforiFileName, useChans,  interpTheseChans, qualityLaminarPenetration,trueIfRforiWasRunToday);



global OUTDIR_PLOT
cd(OUTDIR_PLOT)

for sessionNumber = 1:size(sessionListName,1)
    

    if sessionNumber == 7
        %warning('problem with session double')
        continue

    elseif FileInformationTable.useDataInAnalysis(sessionNumber)
          global COUNTER
            COUNTER = sessionNumber;

        holderNameEVP = FileInformationTable.preLesionEvpFileName{sessionNumber};
        holderNameRfori = FileInformationTable.rforiFileName{sessionNumber};
        holderUseChans = FileInformationTable.useChans{sessionNumber};
        holderInterpChans = FileInformationTable.interpTheseChans{sessionNumber};
         
        plotCSDandPSDfromNEV(holderNameEVP,holderUseChans,holderInterpChans);
              FigName   = strcat(sessionListName{sessionNumber},'_EVP');
              %savefig(gcf, strcat(OUTDIR_PLOT, FigName, '.fig'));
              %saveas(gcf, strcat(OUTDIR_PLOT, FigName, '.svg'));
              saveas(gcf, strcat(OUTDIR_PLOT, FigName, '.png'));
              close all
              
%         plotCSDandPSDfromNEV(holderNameRfori,holderUseChans,holderInterpChans);
%               FigName   = strcat(sessionListName{sessionNumber},'_rfori');
%               %savefig(gcf, strcat(OUTDIR_PLOT, FigName, '.fig'));
%               %saveas(gcf, strcat(OUTDIR_PLOT, FigName, '.svg'));
%               saveas(gcf, strcat(OUTDIR_PLOT, FigName, '.png'));
%               close all
    end          
   
end
clc


% 7 has a problem with rfori
% 8 = 220216_B does not HAVE an rfori -- (did I get something wrong in
% mytruIfRforiWasRunToday?)
% 9 runs
% 10 runs
% 15 does not run - no rfori