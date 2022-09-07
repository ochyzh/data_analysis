---
title: "POL 304 - Assignment #1: Indiscriminate Violence and Insurgent Attacks"
author: ""
date: "2022-09-30 "
output: html_document
---

In this assignment, you will analyse the following article:

Lyall, J. 2009. “[Does Indiscriminate Violence Incite Insurgent Attacks?: Evidence from Chechnya.](https://journals.sagepub.com/doi/pdf/10.1177/0022002708330881?casa_token=l_7ZYRzIi9cAAAAA:XLhtDu24m6RqVeGR4AWxPRpOsb-dSksMirge5Fkk9oYcHaKIPt3w1iyB1JgAvJcchYPj09aPjFek)” *Journal of Conflict Resolution* 53(3): 331–62.

You will identify the research question, the theory, and the hypothesis. Then, you will replicate the statistical test. For the statistical part of the assignment, you can use Excel, RStudio or any other software, as long as you note what software you used and describe how you obtained your answer (For example, "I used the Excel formula function to calculate the mean. The mean is X."). 

The goal of the assignment is to provide you a template (and some practice) for your final research project. After reading the article, answer the following questions. 



## Question 1
  
What is the research question? (Remember that a research question is general, it does not name specific places or policy areas.  Also note that a research question must be open-ended, it is not a yes/no question).

## Question 2
What is the theory used in the article? [Word limit: 150 words] Do not simply copy/paste from the article. Instead, think carefully what is the set of logically consistent assumptions that lead to the article's main prediction. Focus on the broad strokes rather than the details. Ask yourself what are the most basic relationships/conditions that must hold in order to derive the article's main prediction. List these assumptions and the relationship among them. For example, if the first assumption is that the Earth is flat and the second assumption is that the edge of the Earth is in the ocean, then a logically consistent prediction would be that we should observe water pouring off of the edge of the Earth into the void. Notice that neither the assumptions nor the prediction need to be true. The assumptions are simplifications of the world; the only requirement is that they are logically consistent with one another.

## Question 3
What is the central research hypothesis. [Answer in one sentence] Remember that, just like the research question and the theory, the hypothesis must be stated in general, rather than specific, terms.

## Question 4
The data to replicate the study are saved in the file named `chechen.csv.` The dataset was constructed around 159 events in which Russian artillery shelled a village.  For each such event we record the village where the shelling took place and whether it was in Groznyy, how many people were killed, and the number of insurgent attacks 90 days before and 90 days after the date of the event. We then augment this data by observing the same information for a set of demographically and geographically similar villages that were not shelled during the same time periods.

The names and descriptions of variables in the data file `chechen.csv` are

--------------------------------------------------------------------------------
 Name                 Description
 -------------------- ----------------------------------------------------------
 `village`            Name of village
 
 `groznyy`            Variable indicating whether a village is in
                      Groznyy (1) or not (0) 
                      
 `fire`               Whether Russians struck a village with artillery fire 
                      (1) or not (0)
                      
 `deaths`             Estimated number of individuals killed during Russian artillery fire 
                      or NA if not fired on
                      
 `preattack`          The number of insurgent attacks in the 90 days before being fired on
 
 `postattack`         The number of insurgent attacks in the 90 days after being fired on 
--------------------------------------------------------------------------------

Note that the same village may appear in the dataset several times as shelled and/or not shelled
because Russian attacks occurred at different times.


How many villages were shelled by Russia?  How many were not? 

## Question 5
    
Start with a cross-sectional design. What is the average number of insurgent attacks for shelled vs. non-shelled villages?  Would you conclude that indiscriminate violence reduces insurgent attacks?  Why or why not?

## Question 6

Considering only the pre-shelling periods, what is the difference between the average number of insurgent attacks for observations describing a shelled village and observations that do not?   What does this suggest to 
you about the validity of comparison used for the previous question?

## Question 7

Now implement the temporal research design.  Among observations describing villages that were shelled, did the number of insurgent attacks increase after being fired on?


## Question 8

Now implement a difference-in-difference design. Compute the mean difference in the difference between the pre- and post-shelling villages for villages that were shelled and for those that were not.  Does this analysis support the claim that indiscriminate violence reduces insurgency attacks?  

## Question 9

Which of the three designs--cross-sectional, temporal, or difference-in-difference--is the most appropriate, given whether or not the data meet the assumptions for each?

