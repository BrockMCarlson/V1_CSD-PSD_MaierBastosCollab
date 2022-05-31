# V1_CSD-PSD_MaierBastosCollab
We will evaluate laminar profiles of PSD and stimulus-evoked CSD to assess 
the generalizability of PSD to laminar cortical position

> Note: the Blackrock NPMK toolbox is required for this code to run.
---


## Usage 
1. Inputs: {.nev, .ns2, .ns6, .bhv}. These files are stored under RIGDIR
2. Setup_IOT: you must establish your home directories for RIGDIR, CODEDIR, OUTDIR_FD, and OUTDIR_PLOT
4. Controller: A_processNEV B_preProcessNeuralData C_vis


## Full controller interface description

```matlab
1. Plot PSD and CSD with NEV
        Plots CSD and PSD for a given .nev file
        The CSD plots are aligned to every trial's event code from the .nev - no stimulus information available
        Therefore, every event-code-triggered-file-start is included in the plots
        The PSD plots use the full-session-length data
        SCRIPT: processNEV_rfori()
        OUTPUT: global OUTDIR_PLOT
        
 2. Pre-process Blackrock Files into photodiode triggered and behaviorially aligned data
        This script runs on a single session at a time. This is the most involved script in the controller file for
        this repository because each session requires curated inputs.
        This script takes in .nev, .ns2, .ns6, and .bhv2 files, triggers data to trial onset, and creates a 
        matrix of trial-by-trial stimulus information. Both LFP and aMUA arrays are created.
        SCRIPT: preProcessNeuralData_rfori()
        OUTPUT: global OUTDIR_FD

 3. (in dev) - create final figures
```

## Instructions
V1_CSD-PSD_MaierBastosCollab Is built on a Model-Viewer-Control (MVC) framework. This design choice allows for the development of deeper classes and defined layers of abstraction. I am a self-taught dev, so these principals are incorrectly implemented or could be improved please let me know! 

The intention is that each script in the “controller” folder acts as the interface for a class, i.e. users will only need to understand and interact with scripts in the controller folder in order to fully utilize this respository's functionality. 

### “Model” 

  — query the database for appropriate raw data,  
  
  — pre-processes the data with custom butterworth filters, 
  
  — trial aligns the data to event codes, 
  
  — re-defines the pertinent time points to the analog photo diode signal, 
  
  — obtains behavioral information from the MonkeyLogic digital outputs to .NEV files,
   
  — and applies necessary statistical or theoretical models.

**note** 
setupIOT is run at the start of each script so that individual directories on each local machine can be setup. These local directories are the *database* in an         MVC framework.

> Outputs from the model are sent to the base function or “formatted data” (OUTDIR_FD)
  
  
### “View” 
- take _FD and other outputs from model to visualize the data
- do necessary visual processing on the data.


## Contributing
For collaboration requests please contact brock.m.carlson@vanderbilt.edu

## License
[MIT](https://choosealicense.com/licenses/mit/)
