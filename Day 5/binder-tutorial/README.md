# MyBinder Tutorial

## First part: From Zero To Binder in Python (Sarah)
Here's the [link](https://github.com/alan-turing-institute/the-turing-way/blob/master/workshops/boost-research-reproducibility-binder/workshop-presentations/zero-to-binder-python.md) from The Turing Way 

## Second part: Exercises with Historical Language Models (Fede and Kaspar)

The goal is to use MyBinder in order to run the Jupyter Notebooks available in [this repo](https://github.com/Living-with-machines/histLM).

### First Exercise: do the entire setup manually, to understand the process that would need to be automatised

Manual operations, step by step

1. Fork the [repo](https://github.com/Living-with-machines/histLM) (we have done this operation in the first day of the Summer School)

2. Select a notebook you want to integrate (the Flair model is the easiest one)

2. Create a branch (I named mine `mybinder`)

3. Lauch the notebook with MyBinder
![](https://i.imgur.com/4RubGlA.png)

Note: As stated in [the documentation of the repo](https://github.com/Living-with-machines/histLM#download), you need to download the language model to use the script

4. To do so, open a terminal inside MyBinder (how? good question!)

5. Make the needed directory 

6. Download the models inside the directory 

7. Unzip them

8. Run the code and see if it works fine

### Second Exercise: automate the download using the configuration file

You can either use postBuild or starts - investigate the differences and select the one you think would work best.

### Third Exercise: now do the same but with more than one model 

### Fourth Exercise: prepare a markdown snippet

add the markdown snippet launchbinder

### Optional: design a different solution for the Third Exercise to be able to have all models available on MyBinder
