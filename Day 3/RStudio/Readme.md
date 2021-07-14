# Visualisation with R Studio

Hello Everyone! This is the Readme File for the Data Visualisation with R tutorial.

## Authorship
L. Michielin 

## Installation and set up 

### Option A: Download and install R and R Studio

- Go to ​https://www.r-project.org/
- Go to the ​download​ link
- Choose your CRAN mirror nearer to your location (either ​Bristol​ or ​Imperial
College​ London)
- Download the correspondent version depending if you are using Windows Mac or
Linux
  - For​ **Windows** ​ click on ​ **install R for the first time.** ​Then ​ **download R for Windows** ​and follow the installation widget.​ ​If you get stuck follow this
video tutorial ​https://www.youtube.com/watch?v=GAGUDL-4aVw
  - For​ **Mac** ​ Download ​ **the most recent pkg file** ​and follow the installation widget. If you get stuck follow this video tutorial https://www.youtube.com/watch?v=EmZqlcKkJMM
  - For ​ **Linux** ​go on the correspondent subfolder and follow the normal path you do for installing new software. If you are using Ubuntu you can follow
this guide ​https://www.youtube.com/watch?v=kF0-FH-xBiE

- Once R is installed you can install R studio (R interface)
- Go to ​www.rstudio.com
- Go in ​download
- Download the correspondent version depending on your Operating system and
install it. If you get stuck check the videos linked above.
- Open the R studio interface and if it is looking like [this](http://wiki.awf.forst.uni-goettingen.de/wiki/images/f/f6/02-RStudio.jpg)

Congratulations you successfully installed the program we are going to use for the
whole tutorial!


### Option B: Use R Studio Cloud

If you do not want to install R and R Studio in your machine you can run the whole tutorial via R Studio Cloud
- Go to this link: https://rstudio.cloud/project/2697882
- If you do not have a R Studio Cloud Account yet you will need to sign up (can be done quickly via gmail or Github)
- When you access a project, RStudio Cloud automatically creates a temporary copy of the original project for you. You can play with and make edits to it, but none of your changes will be reflected in the original. 
If you’d like to keep the changes you’ve made, just save a copy of the project for yourself by pressing the Save a Permanent Copy button.

**NB if you are going to use R Studio Cloud you can skip the download material step because all the material will be already accessible via the R Studio Cloud Link**


### Option C: Run the Code via a Google Colab Notebook

If you are more familiar with Python-based notebooks you can run the code via Google Colab. 
In order to do so you will need to follow the following steps:

- Open Google Colab: https://colab.research.google.com/
- If you are not already logged you will be prompted to log-in via gmail
- Select **New Notebook**
- Run ```%load_ext rpy2.ipython``` 
- At the beginning of each cell you will have to add ```%%R``` before running the rest of the code
- You can find more detailed instructions and examples [here](https://www.youtube.com/watch?v=Py58PFPGP7o) and [here](https://sites.google.com/view/vinegarhill-datalabs/data-transformation-and-visualization/tidyverse-r)
- Importing the data folder 
    - a. click the "files" icon on the left column of your screen 
    - b. create an empty folder called "data" 
    - c. import the csv data file from the data folder downloaded from the current GitHub repo
    - d. make sure the data file is under the "data" folder on Google Colab
 


### Get the material ready 
In this folder you can find the following files and folders
- `DataVisCode.R` is the main R Script. 
- `data` folder contains the data used. 
- `Exercises.R` is the code used to do the exercises.
- `RVisualisation.pptx` is presentation used during the tutorial.

You can download each file separately or you can download and extract the zipped file named `RstudioTutorial` and unzip it on an easily accessible directory in your machine.
NB. if you have a windows managed machine it is a good idea to avoid C since you may luck full privileges on that folder.

### How to set a R project  
As long as you will have all your data in an easily accessible folder in your machine or you are going to use option B or C of the installation instructions you are ready to go.
However if you want to know in advance how to set a project in R (we are going to cover the topic during the tutorial) you can have a look [here](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects).
Or you can watch this [video](https://www.youtube.com/watch?v=pyJMWlDptYw).

For this class you would need 2 sub-folders : 
- data 
- graphs  

**Please make sure to have done all the required step prior to the start of the Summer School. If you had any issues in installing R and R Studio or set RStudio Cloud or Google Collab, or if you have any question we have a Drop in Session at 15:00 the 23rd of July that you can access from [here]( https://turing-uk.zoom.us/j/94458637842?pwd=UE5CL3lnQ3Y5d05xR3U1T29ldTNOUT09)**


All material here collected is free to use but it is covered by a [![License: CC BY-NC 4.0](https://licensebuttons.net/l/by-nc/4.0/80x15.png)](https://creativecommons.org/licenses/by-nc/4.0/) license
