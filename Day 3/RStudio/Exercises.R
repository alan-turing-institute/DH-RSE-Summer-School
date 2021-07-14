# EXERCISE 1 ############################

#Using the college Data set
#Create a chart that would show the relationship between the SAT average and the admission  rate 
#Can you see any relationship between the two values?
#Now see if this relationship is also influenced by the type of control of the University "control" and the region where the university is located.
#Plot this last info on separate subplot to better see the trends
#Make sure that the chart has a white background
#Give your Graph a title and a subtitle
#Rename the x and y axis and add a caption saying that it is based on the data from the University census.
#Add some transparency to better see the overlapping points search here on how to do it


# SOLUTION
ggplot(college, aes(x=sat_avg, y=admission_rate, color=control)) + 
  geom_point(size=3, alpha=0.2)+
  theme_bw()+
  facet_grid(region~control) + 
  labs(title = "USA University", subtitle = "The relation between university rate of admission and the sat results", caption = "(based on data from the 2005 survey of USA Universities)", x = "SAT average", y= "Admission Rate", color = "Type of University")


# EXERCISE 2 ############################

#Rodents
rodents <- read_csv('data/RodentJoined.csv')
rodents <- rodents %>%
  mutate(species_id=as.factor(species_id), sex=as.factor(sex),genus=as.factor(genus), species=as.factor(species), taxa=as.factor(taxa), plot_type=as.factor(plot_type))

#We want to check the relationship between weight and sex but the sample need some cleaning
ggplot(rodents, aes(x=weight, fill=sex))+ 
  geom_density(alpha=0.5) +
  theme_bw() 

#1)Remove the null values but only for sex and weight 
#SOLUTION
RodentsCleaned<- rodents[!(is.na(rodents$sex) | rodents$sex=="") & !(is.na(rodents$weight) | rodents$weight==""), ]

#2) Print a graph of the cleaned dataset that will show the difference in weight across male and female as boxplots
#SOLUTION
ggplot(RodentsCleaned, aes(x=sex,y=weight, fill=sex))+ 
  geom_boxplot(alpha=0.5) +theme_bw()

#3) Replot the boxplot that will print the male results first and then the female
#SOLUTION
RodentsCleaned$sex <- factor(RodentsCleaned$sex, levels(RodentsCleaned$sex)[c(2,1)])
ggplot(RodentsCleaned, aes(x=sex,y=weight, fill=sex))+ 
  geom_boxplot(alpha=0.5) +
  theme_bw()

#4) Use one of the Games of thrones palette to change the colour of the graph
#SOLUTION
ggplot(RodentsCleaned, aes(x=sex,y=weight, fill=sex))+ 
  geom_boxplot(alpha=0.5) +
  theme_bw()+
  scale_fill_got(discrete = TRUE, option = "Wildfire")
