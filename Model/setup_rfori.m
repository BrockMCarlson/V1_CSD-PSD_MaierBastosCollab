function [RIGDIR, CODEDIR, OUTDIR_FD, OUTDIR_PLOT] = setup_rfori(user)
% RIGDIR        - where the base data is stored
% CODEDIR       - where your GitHub Repo is stored:
%                   this function also CDs into this directrory
% OUTDIR_FD     - FD = "Formatted Data"
%                   this is where your preProcessed / organized data goes
% OUTDIR_PLOT   - where your figures end up


global RIGDIR CODEDIR OUTDIR_FD OUTDIR_PLOT

    switch user
        case 1
            RIGDIR      = 'E:\rig021_LaminarLabelingCollaboration\EndOfDayFileOutputs\  ';
            CODEDIR     = 'C:\Users\Brock\Documents\MATLAB\GitHub\V1_CSD-PSD_MaierBastosCollab\Controller\';
            OUTDIR_FD   = 'C:\Users\Brock\Documents\MATLAB\formattedDataOutputs\rfori from laminar labeling collaboration\';
            OUTDIR_PLOT = 'C:\Users\Brock\Documents\MATLAB\plotOutputs\plot outputs for laminar labeling collaboration\';
        case 2
            RIGDIR      = 'D:\rig021_LaminarLabelingCollaboration\EndOfDayFileOutputs\  ';
            CODEDIR     = 'C:\Users\lichtemj\Documents\GitHub\V1_CSD-PSD_MaierBastosCollab\Controller\ ';
            OUTDIR_FD   = 'D:\Max_FormattedDataOutputs\ ';
            OUTDIR_PLOT = 'D:\plotData\Max_plots';
            
            

    end
      
cd(CODEDIR)
end


% cd(RIGDIR)
% cd(CODEDIR)
% ○
% cd(OUTDIR_PLOT)
