# Git flow Tutorial

Git Flow is a set of guidelines that people can follow when using version control.

![](https://i.imgur.com/4mf2Mox.png)

## Important concepts

**Main branch (MAIN):** this is the branch for the official release of your code (and all future releases)

**Development branch (DEV):** this is the central development branch, which integrates new features when these have been fully tested

**Issue**: an issue is a "thing" that needs to be addressed on the project (it could be a new feature to add or a bug to solve). Each issue is identified by a number. Remember that it is very important that issues are clearly focused on a specific and contained task and clearly described.

**Feature branch:** this is a branch dedicated to address a specific issue, which will be merged to DEV through a pull request. Be consistent with naming the feature branches, a common and simple pratice is the following, which comprises the number of the addressed issue and a short description:

![](https://i.imgur.com/faPwmZt.png)

**Pull Request (PR)**: this is a request of a review of your changes before they are integrated in another branch (most of the time, from a feature branch to DEV)


## Essential steps during a PR

1) Select the issue that you want to address
2) (in case you are contributing to an external repository) Fork the repository
3) Create a new branch and give it a name (remember how to be consistent).
4) Start addressing the issue (in draft mode)
5) When you are ready, open the PR to review
6) Address the questions / feedbacks received, in order to complete your PR



## Before the Tutorial 

1. Create a github account, if you do not have it


## Overview of The exercise

We work in couple. For each issue the group wants to address, one manages the repo (and does the code review - the Admin), while the other addresses the issue (the Contributor). We will work on at least 2 issues, so you'll have the chance of being in both roles.

### The Setup

For each of the two issues that you plan to address.

1. **[ADMIN]** Fork the DeezyMatch Repository
![](https://i.imgur.com/qbDXBrk.png)

2. **[ADMIN]** Create a DEV branch in the forked repo
![](https://i.imgur.com/5xueBVv.png)

3. **[CONTRIBUTOR]** Select an issue to address (they are listed in the original repo)
![](https://i.imgur.com/kcCaAzD.png)

4. **[CONTRIBUTOR]** Create a dedicated branch in the forked repo
![](https://i.imgur.com/5Aunlno.png)

5. **[CONTRIBUTOR]** Start working locally on the branch and push a tiny modification to github to your branch

6. **[CONTRIBUTOR]** As soon as you have pushed an initial change to your branch, you will be able to open a pull request.
![](https://i.imgur.com/si0xEHI.png)

7. **[CONTRIBUTOR]** When opening the PR, make sure you are choosing the correct repository (the forked one, not the original one)
![](https://i.imgur.com/eR0mo99.png)

8. **[CONTRIBUTOR]** Remember to specify that this is a draft PR and select on the left the reviewer (the Admin of the repo in your case), you as the assegnee and you can provide a descriptive label (or define a new one). These labels will be used to monitor the overall project workflow.
![](https://i.imgur.com/5cxxXJu.png)

### The work

#### Addressing the issue

**[CONTRIBUTOR]** Now you can work on your issue. Remember a few important things while you are addressing an issue: 

1. Take your time to study the code and design an idea for addressing the problem, before start the implementation
2. While you are coding your solution, every small step you have completed, commit the code to your branch (with a clear descriptive comment). This is useful so that you can later point to a specific commit when the ADMIN will go through your changes
3. In case there is no test script already set-up for the line of work you are doing, design a small test script to double-check that input/output of the functions you are modifying remain consistent.

When you feel you are in a good stage and would like to receive feedbacks, you can make the PR ready to review. 

![](https://i.imgur.com/hZ0pWMb.png)

**Remember:**

1) your work doesn't need to be completely finished (especially for complex PRs), but you might have an initial workflow for a solution and now it's the time the ADMIN could look at your code.
2) introduce your PR with a clear description, pointing the ADMIN to the issue this PR would close, the main component of your solution, the tests you have done etc
3) Try to put yourself in the ADMIN's shoes (as you will soon be in the second part of the exercise): the solution you would like to review should be simple (not clever!), not too long and especially comprehensible! Spend time renaming variables so that they are consistent with the overall style.



#### The review process

**[ADMIN]** First of all, remember to be nice and polite with the Contributor, it is stressful for anyone to have their code reviewed. 

1) Read the issue the PR is planning to address
2) Go through the proposed solution, you will be able to see all modifications from the Files changed tab

![](https://i.imgur.com/H51zPKz.png)

3) Clone the repo (if you have not done it already), switch to the branch of the PR and test the code

4) Ask questions if something is not clear. You can do this by adding the comment exactly at the line in the code you are referring to, from the Files changed tab. You could either add this as a single comment or "Start a review". Start a review will hold all your comments, until you have finished your review and then show these to the Contributor together with the overall feedback.


![](https://i.imgur.com/a7LJYj1.png)


5) When you have finished you can add an overall feedback and your decision. Unless there are clear bugs that need a "Request changes", most of the time a general Comment will give the Contributor the chance to discuss and address the feedbacks in conversation with the Admin.

![](https://i.imgur.com/9q7rZsm.png)

6) **[Contributor]** Now you will see all the Admin's feedbacks and from the Files changed tab you will be able to follow up, for instance discussing with the Admin the requested feedback.

![](https://i.imgur.com/GS4mNfL.png)

7) If you have addressed the feedback you can point the Admin to the specific commit, this way (you find the id of the commit)

![](https://i.imgur.com/mJuTSOr.png)

You can find the commit id from the PR overview tab

![](https://i.imgur.com/JPv3xk1.png)

8. **[ADMIN]** When you are satisfied with a change or a reply of a comment you can resolve it, so you will keep open only comments that still need to be resolved.

![](https://i.imgur.com/fDVSHL9.png)

9. **[ADMIN]** When all things have been addressed, if you are satisfied with the PR you can proceed by merging it and closing the dedicated branch

![](https://i.imgur.com/jskle6j.png)


## The Exercise

**Level 1:** edits in the documentation.

* `candidateRanker.py`: check lines 328-331. Comment and code are not aligned. Change the comment:
  ```python
  elif ranking_metric.lower() in ["cosine"]:
    # 0.99 is multiplied to avoid issues with float numbers and rounding errors
    if query_candidate_pd["cosine_dist"].max() > (selection_threshold*1.01):
       break 
  ```
  
* `utils.py`: Document actions in `normalizeString` function (lines 22-33):
  ```python
  def normalizeString(s, uni2ascii=False, lowercase=False, strip=False, only_latin_letters=False, prefix_suffix=["|", "|"]):
    if uni2ascii:
        s = unicodedata.normalize('NFKD', str(s))
    if lowercase:
        s = s.lower()
    if strip:
        s = s.strip()
    if only_latin_letters:
        s = re.sub(r"([.!?])", r" \1", s)
        s = re.sub(r"[^a-zA-Z.!?]+", r" ", s)
    
    return prefix_suffix[0] + s + prefix_suffix[1]
  ```

**Level 2:** edits in the code.

* Extend list of accepted values for positive matches (see issue https://github.com/Living-with-machines/DeezyMatch/issues/54).

  Change `data_processing.py` (see in particular lines 37-43, but you may have to do other changes in subsequent lines) so it also accepts, `positive`, `negative`, `correct`, and `wrong`:
  ```python
  for i in range(len(df_list)):
    tmp_split_row = df_list[i].split(csv_sep)
    if str(tmp_split_row[2]).strip().lower() not in ["true", "false", "1", "0"]:
      print(f"SKIP: {df_list[i]}")
      # change the label to remove_me,
      # we drop the rows with no true|false in the label column
      tmp_split_row = f"X{csv_sep}X{csv_sep}remove_me".split(csv_sep)
  ```

* Define word token separators in the input file (see issue https://github.com/Living-with-machines/DeezyMatch/issues/78).

  Relevant code in:
  1. `string_split` function in `utils.py`:
  
     ```python
      # ------------------- string_split --------------------
     def string_split(x, tokenize=["char"], min_gram=1, max_gram=3):
       """
       Split a string using various methods.
       min_gram and max_gram are used only if "ngram" is in tokenize
       """
       tokenized_str = []
       if "char" in tokenize:
         tokenized_str += [sub_x for sub_x in x]
    
       if "ngram" in tokenize:
         for ngram in range(min_gram, max_gram+1):
           tokenized_str += [x[i:i+ngram] for i in range(len(x)-ngram+1)] 
    
       if "word" in tokenize:
         tokenized_str += x.split()
    
       return tokenized_strc
     
  2. `data_processing.py`, lines 105-113

     ```python
     cprint('[INFO]', bc.dgreen, "-- create vocabulary")
     dataset_split["s1_unicode"] = dataset_split["s1_unicode"].apply(lambda x: string_split(x, tokenize=mode["tokenize"], min_gram=mode["min_gram"], max_gram=mode["max_gram"]))
     dataset_split["s2_unicode"] = dataset_split["s2_unicode"].apply(lambda x: string_split(x, tokenize=mode["tokenize"], min_gram=mode["min_gram"], max_gram=mode["max_gram"]))
     ```
   
  3. The `mode` section in the input file:
     ```bash
     mode:    # Tokenization mode
     # choices: "char", "ngram", "word"
     # for example: tokenize: ["char", "ngram", "word"] or ["char", "word"] 
     tokenize: ["char"]
     # ONLY if "ngram" is selected in tokenize, the following args will be used:
     min_gram: 2
     max_gram: 3
     ```
     

## Other important concepts

There are a few other important concepts that are not central to this tutorial but we might tangentially address.

### Agile working

In software development, agile practices involve discovering requirements and developing solutions through the collaborative effort of self-organizing and cross-functional teams and their end users. It advocates adaptive planning, evolutionary development, early delivery, and continual improvement, and it encourages flexible responses to change.


### The Kanban

![](https://i.imgur.com/BkoBu3D.png)



## Materials

https://the-turing-way.netlify.app/reproducible-research/vcs/vcs-github.html?highlight=pull%20request

https://www.atlassian.com/blog/git/written-unwritten-guide-pull-requests

https://www.igvita.com/2011/12/19/dont-push-your-pull-requests/

https://luminousmen.com/post/the-ultimate-python-style-guidelines

https://pep8.org/
