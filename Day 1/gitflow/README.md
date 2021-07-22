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


## Overview of the exercise

We work in couple. For each issue the group wants to address, one manages the repo (and does the code review - the **ADMIN**), while the other addresses the issue (the **COLLABORATOR**). We will work on at least 2 issues, so you'll have the chance of being in both roles. Feel free to share the screen and discuss together about each step and if something is not clear get in touch with us.

### The Setup

First of all, decide who will be the **ADMIN** and who will be the **COLLABORATOR** for the first issue. We have highlighted in each step who should do it (either the **[ADMIN]** or the **[COLLABORATOR]**).

1. **[ADMIN]** Fork the [DeezyMatch Repository](https://github.com/Living-with-machines/DeezyMatch)
![](https://i.imgur.com/IMWtB0Y.png)

2. **[ADMIN]** Select your own GitHub account (for instance here Kasra is selecting his personal account)
![](https://i.imgur.com/x7tthLa.png)

3. **[ADMIN]** You will see the forked version available under your account now. The entire work needs to be done inside this forked version of the repo (we will repeat this a few times in the instructions to be sure!)
![](https://i.imgur.com/LcOjmfF.png)1

4. **[COLLABORATOR]** Select an issue to address (they are listed in the original repo). Start from [this simple one](https://github.com/Living-with-machines/DeezyMatch/issues/97). Note that this is just a toy issue that requires minimal changes, but this way you can see the entire workflow.
![](https://i.imgur.com/8ehZRAv.png) 

5. **[ADMIN]** Go to settings of the forked version of the repo that you have in your Github account and select Manage Access
![](https://i.imgur.com/nlLnnY6.png)

6. **[ADMIN]** Invite a collaborator and add the Github username of your **[COLLABORATOR]** (Kasra here is inviting Mariona as a collaborator)
![](https://i.imgur.com/35gyXVp.png)

7. **[COLLABORATOR]** accept the invitation email. 

8. **[COLLABORATOR]** Go to the forked version of the repo (**[ADMIN]** can give you the link) and switch to the branch named `develop`.
![](https://i.imgur.com/4mUttkv.png)

9. **[COLLABORATOR]** Create a dedicated branch in the forked repo, from `develop` and name it following the convention described above, so issue number and short description, for instance `97-fix-ranking-doc`
![](https://i.imgur.com/nUVOAI9.png)

(Optional) **[COLLABORATOR]** At this stage you should clone the forked version of the repo to your machine and checkout the branch on which you are planning to work on. We are not covering this in the tutorial, but feel free to do it if you have worked with GitHub before.

10. **[COLLABORATOR]** Start working on the branch and make the first commit. Be clear in the description of the contribution of your commit.
![](https://i.imgur.com/T2uRlW0.png)
![](https://i.imgur.com/qlKXEMs.png)



11. **[COLLABORATOR]** As soon as you have made the first commit, you will be able to open a pull request (PR).
![](https://i.imgur.com/xtLtOpI.png)

12. **[COLLABORATOR]** When opening the PR, make sure you are choosing the correct repository (the forked one, not the original one!!)
![](https://i.imgur.com/QqiGWEx.png)
This is what you should see when you select the correct repo and branch.
![](https://i.imgur.com/yzsL6ZD.png)



8. **[COLLABORATOR]** Remember to specify that this is a draft PR and select on the left the reviewer (the **[ADMIN]** of the repo in your case - in our example this person is Kasra), you as the assegnee and you can also provide a descriptive label (or define a new one). Please also point to the issue you are addressing with this PR.
![](https://i.imgur.com/ZOZS3Kh.png)
![](https://i.imgur.com/agk3sAF.png)
![](https://i.imgur.com/3y9GFx0.png)
![](https://i.imgur.com/9n0WsaL.png)



### The work

#### Addressing the issue

**[COLLABORATOR]** Now you can work on your issue. Remember a few important things while you are addressing an issue: 

1. Take your time to study the code and design an idea for addressing the problem, before start the implementation
2. Some issues may request several steps. You should address each step in a different commit in your branch (with a clear descriptive comment). This is useful so that you can later point to a specific commit when the **[ADMIN]** will go through your changes
5. (Optional) In case there is no test script already set-up for the line of work you are doing, design a small test script to double-check that input/output of the functions you are modifying remain consistent.

When you feel you are in a good stage and would like to receive feedbacks, you can make the PR ready to review. 

![](https://i.imgur.com/vYlYEIe.png)

**Remember:**

1) your work doesn't need to be completely finished (especially for complex PRs), but you might have an initial workflow for a solution and now it's the time the **[ADMIN]** could look at your code.
2) introduce your PR with a clear description, pointing the **[ADMIN]** to the issue this PR would close, the main component of your solution, the tests you have done etc
3) Try to put yourself in the **[ADMIN]**'s shoes (as you will soon be in the second part of the exercise): the solution you would like to review should be simple (not clever!), not too long and especially comprehensible! If you have added new code, spend time renaming variables so that they are consistent with the overall style.


#### The review process

**[ADMIN]** First of all, remember to be nice and polite with the **[COLLABORATOR]**, it is stressful for anyone to have their code reviewed. 

1) Read the issue the PR is planning to address
2) Go through the proposed solution, you will be able to see all modifications from the `Files changed` tab

![](https://i.imgur.com/zBayolE.png)

3) (Optional, if you both are working on the code) Clone the repo (if you have not done it already), checkout the branch of the PR and test the code

4) Ask questions if something is not clear. You can do this by adding the comment exactly at the line in the code you are referring to, from the Files changed tab. You could either add this as a single comment or "Start a review". Start a review will hold all your comments, until you have finished your review and then show these to the Collaborator together with the overall feedback.

![](https://i.imgur.com/vm4sIje.png)

5) When you have finished you can add an overall feedback and your decision. Unless there are clear bugs that need a "Request changes", most of the time a general Comment will give the Collaborator the chance to discuss and address the feedbacks in conversation with the Admin.

![](https://i.imgur.com/Xzxd65n.png)


6) **[COLLABORATOR]** Now you will see all the Admin's feedbacks and from the Files changed tab you will be able to follow up, for instance discussing with the Admin the requested changes.


7) **[COLLABORATOR]** If you have addressed the feedback you can point the Admin to the specific commit. You can find the commit id from the PR overview tab

8. **[ADMIN]** When you are satisfied with a change or a reply of a comment you can resolve it, so you will keep open only comments that still need to be resolved.

![](https://i.imgur.com/gGv3cda.png)


9. **[ADMIN]** When all things have been addressed, if you are satisfied with the PR you can proceed by merging it and closing the dedicated branch
![](https://i.imgur.com/1iGRQQU.png)

10. As you can see all it has been done in the **[ADMIN]** repo and now you are a few commits ahead of the main DeezyMatch repo.
![](https://i.imgur.com/NSIAVov.png)

## Exercise

Now that you have gone through the entire workflow you can try one of our exercises. Again, decide who will be the **[ADMIN]** and the **[COLLABORATOR]** (consider switching roles). Feel free to select the issue you want to address from the main DeezyMatch repository, project board `V1.3.0` (link [here](https://github.com/Living-with-machines/DeezyMatch/projects/3)). We have prepared some issues that are relatively easy to address: they are labelled with `help-wanted`. You can choose between issues that require improving the documentation (label `documentation`) or issues that require editing the code (label `enhancement`).

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
