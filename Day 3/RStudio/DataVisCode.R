# WELCOME TO R STUDIO ################################
# This is the interface you are going to get used to
# This is color coded in green because it is a comment
# You can change the visualisation by going on Tools>Global Options

# Flag the soft-wrap R source files option to have the code going authomatically to the next raw when it is too long

# To comment and un-comment strings you can use the shift+ctrl+c shortcut

#comments can be used to create paragraph and sub-paragraphs in your document

# THIS IS A LEVEL 1 HEADER #################################

## This Is a Level 2 Header ================================

### This is a level 3 header. ------------------------------

# BASIC OPERATIONS WITH R################################

## Create a sequence ================
1:250 #Print numbers between 1 and 250 across several lines
#To Clear the console press ctrl+l
100:1 #Print numbers from 100 to 1
seq(10)#Print numbers from 1 to 10
seq(30, 0, by = -3)#Print numbers from 30 to 0 every 3

## Print a String ================
print('Hello World!') #Prints "Hello World" in the console basically a string variable 

## Define Variables ================
x <- 1:5 #Put the numbers between 1-5 in the variable x
x #Displays the values we have set in x
#NB it starts counting from 1

#NB R is Case sensitive Y is not the same of y

y <- c(6,7,8,9,10) #puts numbers between 6-10 in y
y

#Short cut for <- is alt+-

### Assign the same value to multiple vectors---------------
a <- b <- c <- 3


#To remove variables from the environment
rm(x) #Remove an object from the work-space
rm (a, b) #Remove more than one
rm (list = ls()) #Remove everything

#INSTALLING PACKAGES ###################

#list of packages available by subject
browseURL("https://cran.r-project.org/web/views/")

#list of packages available by name
browseURL("https://cran.r-project.org/web/packages/available_packages_by_name.html")

## See current packages ==========================
library()#List the available ones
search()#List the ready to go ones 

## Install packages ==========================
#you can use: tools>Install packages
#or directly
install.packages("tidyverse")
?install.packages

## Activate packages ==========================
library(tidyverse)

## Check for updates ==========================
#tools>check for updates
update.packages()

## To unload packages ==========================
#unflag or reboot (every time you close the system the non default packages get unloaded)
detach ("package:tidyverse", unload = TRUE) # you will sometimes need to do this to avoid conflicts between packages. Contrary to Python you do not have to specify the library when using a function but this also means the system can get confused if there are more functions with the same name that do different things

## To Remove packages ==========================
#x in the packages windows 
remove.packages("nameofthepackage")

# DATA STRUCTURE ######################

#Vector ==============================================
#One dimentional collection of data
y <- c(6,7,8,9,10)
is.vector(y)

x <- c("b","d","a","f","h")
is.vector(x)

#Matrix==============================================
#bidimential collection of data
m1 <- matrix(c(T, T, F, F, T, F), nrow = 2)
m1

m2 <- matrix(c("a", "b", 
               "c", "d"), 
             nrow = 2,
             byrow = T)
m2

#A matrix has data all of the same type

m3 <- matrix(c(1, "b", 
               "c", "d"), 
             nrow = 2,
             byrow = T)
m3
## Array more than 2 dimentsions===================================
#multidimentional collection of data 
# Give data, then dimensions (rows, columns, tables)
a1 <- array(c( 1:24), c(4, 3, 2))
a1

## Data Frame ==============================================

# Can combine vectors of the same length
#different type variables (similar to a table in spreadsheet)
vNumeric   <- c(1, 2, 3)
vCharacter <- c("a", "b", "c")
vLogical   <- c(T, F, T)

df1 <- cbind(vNumeric, vCharacter, vLogical)
df1  # Coerces all values to most basic data type

df2 <- as.data.frame(cbind(vNumeric, vCharacter, vLogical))
df2  # Makes a data frame with three different data types


# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L

#When using the tidyverse you will normally use a specific type of Data frame called a tibble. We do not have time to cover this but you can find more info here https://tibble.tidyverse.org/


# IMPORTING DATA ##############################

#Using embedded data sets
#No need to import anything you just use it 
iris

# If you reboot the software since the beginning make sure to run library(tidyverse) first

# Import CSV files with readr::read_csv() from tidyverse
Books<- read_csv("data/BooksB.csv")
IrisNull <- read_csv("data/IrisNulls.csv")

# Import CSV files and modify the form and names of variables
df3 <- read_csv("data/IrisNulls.csv") %>%
  select(Sepal.Length,Sepal.Width,Species) %>% 
  mutate(Species = as.factor(Species)) %>%
  rename(SepalLength = Sepal.Length) 

# Import CSV files from online repo
college <- read_csv('http://672258.youcanlearnit.net/college.csv')
college <- college %>%
  mutate(state=as.factor(state), region=as.factor(region),
         highest_degree=as.factor(highest_degree),
         control=as.factor(control), gender=as.factor(gender),
         loan_default_rate=as.numeric(loan_default_rate))


##The Grammar of Graphics==========================
###Level 1 Data --------------------------
iris
###Level 2 and 3 aesthetics and Geometries --------------------------
ggplot(iris, aes(x=Petal.Length, y=Petal.Width)) + geom_point()

###Level 2 aesthetics: use a third variable to color code --------------------------
ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Species)) + geom_point()

###Level 2 aesthetics: use a forth variable to set the size of the dots --------------------------
ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Species, size=Sepal.Width, alpha=Sepal.Width)) + geom_point()

###Level 3 geometry: increase the size of all dots --------------------------
ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Species)) + 
  geom_point(size=4, alpha=0.5)

###Level 4 faceting: Subdivide the visualisation in subplots --------------------------
ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Species, size=Sepal.Width)) + 
  geom_point()+facet_wrap(~Species)

###Level 4 faceting: Subdivide the visualisation in subplots according to 2 variables --------------------------
ggplot(college, aes(x=faculty_salary_avg, y=undergrads, color=gender, size=tuition)) + 
  geom_point(alpha=0.5)+
  facet_grid(region~gender)

###Level 5 Statistics: plot summ stats instead of the data --------------------------
ggplot(iris, aes(x=Petal.Length, y=Petal.Width)) + 
  stat_summary_bin(fun="mean", geom = "bar")

###Level 6 Coordinates: attributes of the coordinate axis --------------------------
ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Species, size=Sepal.Width)) + 
  geom_point()+
  facet_wrap(~Species)+
  coord_polar()

###Level 7 Themes: change the global setting of the charts --------------------------
ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Species, size=Sepal.Width)) + 
  geom_point()+
  theme_bw()


ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Species, size=Sepal.Width)) + 
  geom_point()+theme_bw() + 
  labs(title = "New plot title", subtitle = "A subtitle", caption = "(based on data from ... N= 500)", x = "New x label", y= "New y label", color = "Colours")


# EXERCISE 1 


#EXPLORING DISTRIBUTION##############

#Histogram=========================
ggplot(iris, aes(x=Petal.Width, fill=Species))+ 
  geom_histogram(alpha=0.8,color="black", binwidth= sd(iris$Petal.Width)/10)+
  geom_vline(aes(xintercept = mean(Petal.Width)),col='red',size=2)+
  theme_bw()
#+facet_wrap(~species, ncol = 1) 

#Using the subplot mean values to plot the differences

ggplot(iris, aes(x=Petal.Width, fill=Species)) + 
  geom_histogram(alpha=0.8, color="black", binwidth=0.08)+
  geom_vline(data=filter(iris, Species=="setosa"),aes(xintercept = mean(Petal.Width)),col='red',size=2)+
  geom_vline(data=filter(iris, Species=="versicolor"),aes(xintercept = mean(Petal.Width)),col='green',size=2)+
  geom_vline(data=filter(iris, Species=="virginica"),aes(xintercept = mean(Petal.Width)),col='blue',size=2)+
  theme_bw()+
  facet_wrap(~Species, ncol = 1) 


#Density plot======================================
ggplot(iris, aes(x=Petal.Width, fill=Species))+ 
  geom_density(alpha = 0.5)+
  geom_vline(aes(xintercept = mean(Petal.Width)),col='red',size=2)+
  theme_bw()

#+facet_wrap(~Species, ncol = 1) 

#Boxplots======================================
#Boxplots are an other way to visualise summarising statistic of the dataset break out according to a categorical value 

ggplot(iris, aes(x=Petal.Width, fill=Species)) + 
  geom_histogram(alpha=0.8, color="black", binwidth=0.08)+
  geom_vline(data=filter(iris, Species=="setosa"),aes(xintercept = mean(Petal.Width)),col='red',size=2)+
  geom_vline(data=filter(iris, Species=="versicolor"),aes(xintercept = mean(Petal.Width)),col='green',size=2)+
  geom_vline(data=filter(iris, Species=="virginica"),aes(xintercept = mean(Petal.Width)),col='blue',size=2)+
  theme_bw()+
  facet_wrap(~Species, ncol = 1) 

#an other way to visualise it is using the Boxplot 
ggplot(iris, aes(x=Species, y=Petal.Width)) + 
  geom_boxplot()+
  theme_bw()

#adding some color-coded info 
ggplot(iris, aes(x=Species, y=Petal.Width, fill=Species)) + 
  geom_boxplot()+
  theme_bw()

#you can also have a multilayered representation by plotting also the single observations
ggplot(iris, aes(x=Species, y=Petal.Width, color=Species)) + 
  geom_boxplot(outlier.color = "black")+
  geom_jitter(alpha =0.3)+
  theme_bw()

#removing the outliers from graph cause they can be confusing
ggplot(iris, aes(x=Species, y=Petal.Width, color=Species)) + 
  geom_boxplot(outlier.alpha = 0)+
  geom_jitter(size= 4, alpha =0.3)+
  theme_bw()


#what if I want to plot the mean too
means <- aggregate(Petal.Width ~ Species, iris, mean)

ggplot(iris, aes(x=Species, y=Petal.Width, color=Species)) + 
  geom_boxplot()+
  theme_bw()+
  stat_summary(fun=mean, colour="darkred", geom="point", 
               shape=18, size=3,show.legend = FALSE) + 
  geom_text(data = means, aes(label = Petal.Width, y = Petal.Width + 0.08))


#EXPLORING RATIO ################

# Pie Charts============================

# Three data sets
pie.a <- c(22, 14, 18, 20, 14, 12)
pie.b <- c(20, 18, 16, 18, 16, 12)
pie.c <- c(12, 14, 20, 18, 14, 22)

# Changing graphical parameters for a minute
oldpar <- par()   # Stores old graphical parameters
par(mfrow    = c(1, 3),  # Num. rows/cols
    cex.main = 3)   #  Main title 3x bigger
colors <- c("grey98", "grey90", "lightskyblue", "lightgreen", "grey98", "grey90")


# Three pie charts side by side
# Is the green slice or blue slice bigger?
pie(pie.a, main = "Pie A", col = colors)
pie(pie.b, main = "Pie B", col = colors)
pie(pie.c, main = "Pie C", col = colors)

# Three bar charts side by side
# Is the green bar or blue bar bigger?
barplot(pie.a, main = "Bar A", col = colors)
barplot(pie.b, main = "Bar B", col = colors)
barplot(pie.c, main = "Bar C", col = colors)

#Barcharts =====================
#Grouped, stacked and percent stacked barplot--------------

#Dataset
Books <- read_csv("data/BooksB.csv")
#Modify a little bit the dataset
BooksR <- subset(Books, Pages>30 & Pages<500)

#Check the Type ad Type of Binging in relation to the weight
ggplot(BooksR, aes(fill=Binding, y=Weight, x=Type)) + 
  geom_bar(position="dodge", stat="identity")+theme_bw()
#Make it stacked
ggplot(BooksR, aes(fill=Binding, y=Weight, x=Type)) + 
  geom_bar(position="Stack", stat="identity")+theme_bw()
#Using percentage
ggplot(BooksR, aes(fill=Binding, y=Weight, x=Type)) + 
  geom_bar(position="fill", stat="identity")+theme_bw()

#Using the counts
ggplot(BooksR, aes(x=Type, fill=Binding))+ 
  geom_bar()+theme_bw()

#Add labels count
ggplot(BooksR, aes(x=Type, fill=Type)) + 
  geom_bar()+
  geom_text(aes(label=stat(count)),stat='count',  nudge_y=-20, color="white")+theme_bw()

#Using the percentage for categorical variable
#Percentage for bar
ggplot(BooksR, aes(x=Type, fill=Binding)) + 
  geom_bar(aes(y = (..count..)/sum(..count..)), position="fill")+theme_bw()+ scale_y_continuous(labels = scales::percent)+ labs(y="Percentage by Novel types", x="Type")

#Total percentage
ggplot(BooksR, aes(x=Type, fill=Binding)) + 
  geom_bar(aes(y = (..count..)/sum(..count..)))+
  theme_bw()+ 
  scale_y_continuous(labels = scales::percent)+ labs(y="Percentage books", x="Type")


#Adding legend
ggplot(BooksR, aes(x=Type, fill=Type)) + 
  geom_bar(aes(y = (..count..)/sum(..count..)))+
  theme_bw()+ 
  scale_y_continuous(labels = scales::percent)+ labs(y="Percentage books", x="Type")+
  geom_text(aes(y = ((..count..)/sum(..count..)),label=scales::percent((..count..)/sum(..count..))), stat = "count", color="black", vjust = -0.25)



#Treemap =====================
install.packages("treemapify")
library(treemapify)

#Extract the information I want 
BreakoutRegion<-  college %>% 
  group_by(region) %>% 
  summarize(Number = n(), MeanSAT= round(mean(sat_avg),2))%>%
  arrange(desc(Number))

#Create a new column that will collect both book type and SAT Average
BreakoutRegion$Label = paste0(BreakoutRegion$region," ","(",BreakoutRegion$MeanSAT,")")

#Plot it with treemapify
ggplot(BreakoutRegion, aes(area = MeanSAT, fill = region, label=Label, subgroup=region)) + 
  geom_treemap(color="black")+ #it will not work without the treemapify
  geom_treemap_subgroup_border(color="black")+ #border the group in black
  geom_treemap_text(colour = "black", place = "centre", reflow = T)+
  theme(legend.position = "none" )+ #I do not need a legend 
  guides(alpha=FALSE)+
  labs(caption= "(N = 1269)")

#Let's see if the number of uni changes
#Create a new column that will collect both book type and Number of Unis
BreakoutRegion$Label2 = paste0(BreakoutRegion$region," ","(",BreakoutRegion$Number,")")

#Plot it
ggplot(BreakoutRegion, aes(area = Number, fill = region, label=Label2, subgroup=region)) + 
  geom_treemap(color="black")+ #it will not work without the treemapify
  geom_treemap_subgroup_border(color="black")+ #border the group in black
  geom_treemap_text(colour = "black", place = "centre", reflow = T)+
  theme(legend.position = "none" )+ #I do not need a legend 
  guides(alpha=FALSE)+
  labs(caption= "(N = 1269)")


#RELATIONSHIPS#############
#Scatterplots=========
#We already see it before but let's see a variation on it
#Hexbin
install.packages("hexbin")
library(hexbin)
ggplot(college, aes(x=sat_avg, y=admission_rate) ) +
  geom_hex(bins = 25) +
  scale_fill_continuous(type = "viridis") +
  theme_bw()+
  facet_wrap(~region)


###Heatmap=====================
ggplot(college, aes(x=control, y=region))+ geom_bin2d(colour="black") +theme_bw()

#plot
p <-ggplot(college, aes(x=control, y=region))+ geom_bin2d(colour="black") +theme_bw()

#Add the information 

# Get data from the plot created (save the results as a new dataframe)
newdata <- ggplot_build(p)$data[[1]]

# add in text labels
p + geom_text(data=newdata, aes((xmin + xmax)/2, (ymin + ymax)/2, 
                                label=count), col="white")


#More graph option at https://www.r-graph-gallery.com/

#COSTUMISE YOUR GRAPH #########################
#Order your results===========================
#Order result for specific graph-------------------
p <- ggplot(BooksR, aes(x=factor(Type), fill=Type)) + 
  geom_bar()+
  geom_text(aes(label=stat(count)),stat='count',  nudge_y=-25, color="white", size=5)
p
p + scale_x_discrete(limits=c("Romance", "Short Stories", "Noir"))

#Order result for all dataset=========================
#If I re-plot it 
p

#Make sure the variable is recognised as factor---------------
newBooks <- BooksR %>% 
  mutate(Type = as.factor(Type))

#Let's check
levels(newBooks$Type)
levels(BooksR$Type)

#Reorder---------------
newBooks$Type <- factor(newBooks$Type, levels(newBooks$Type)[c(2,3,1)])
#New plot version--------------
ggplot(newBooks, aes(x=factor(Type), fill=Type)) + 
  geom_bar()+
  geom_text(aes(label=stat(count)),stat='count',  nudge_y=-20, color="white")

#Let's Play with Colours =======================
#using palettes ------------------
means <- aggregate(Petal.Width ~ Species, iris, mean)
ggplot(iris, aes(x=Species, y=Petal.Width, color=Species)) + 
  geom_boxplot(outlier.alpha = 0)+
  geom_jitter(size= 3, alpha =0.3)+
  theme_bw()+
  stat_summary(fun=mean, colour="darkred", geom="point", 
               shape=18, size=3,show.legend = FALSE) + 
  geom_text(data = means, aes(label = Petal.Width, y = Petal.Width + 0.08))+
  scale_color_brewer(palette="Dark2")#you need to use a scale_fill_brewer if the colours you are using are in the fill command 
?scale_color_brewer
#in this case you shall use scale_fill_brewer because the color coded command is fill and not colour
ggplot(iris, aes(x=Petal.Width, fill=Species)) + 
  geom_histogram(alpha=0.8, color="black", binwidth=0.08)+
  facet_wrap(~Species, ncol = 1)+
  scale_fill_brewer(palette="Dark2") 

#More palettes: Games of Thrones Palette
install.packages("gameofthrones")
library(gameofthrones)

ggplot(iris, aes(x=Species, y=Petal.Width, fill=Species)) + 
  geom_boxplot(outlier.alpha = 0)+
  theme_bw()+
  stat_summary(fun=mean, colour="darkred", geom="point", 
               shape=18, size=3,show.legend = FALSE) + 
  geom_text(data = means, aes(label = Petal.Width, y = Petal.Width + 0.08)) +
  scale_fill_got(discrete = TRUE, option = "Margaery")

#many other palettes available 
browseURL("https://www.datanovia.com/en/blog/top-r-color-palettes-to-know-for-great-data-visualization/")

#Print in Black and white [aes(shape=Species),]
ggplot(iris, aes(x=Species, y=Petal.Width, color=Species)) + 
  geom_boxplot(outlier.alpha = 0)+
  geom_jitter(aes(shape=Species),size= 3, alpha =0.3)+
  theme_bw()+
  stat_summary(fun=mean, colour="black", geom="point", 
               shape=18, size=3,show.legend = FALSE) + 
  geom_text(data = means,colour="black", aes(label = Petal.Width, y = Petal.Width + 0.08))+
  scale_color_grey(start = 0.5, end = 0.1) 

#Manually select colors 
ggplot(iris, aes(x=Species, y=Petal.Width, color=Species)) + 
  geom_boxplot(outlier.alpha = 0)+
  geom_jitter(size= 3, alpha =0.3)+
  theme_bw()+
  stat_summary(fun=mean, colour="black", geom="point", 
               shape=18, size=3,show.legend = FALSE) + 
  geom_text(data = means,colour= "black", aes(label = Petal.Width, y = Petal.Width + 0.08))+
  scale_color_manual(values=c("#80ec65", "#10ea31", "#700015"))

browseURL("https://www.hexcolortool.com/")

#Use gradients
ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Species)) + 
  geom_point(size=3)+
  theme_bw()

ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Sepal.Width, shape=Species)) + 
  geom_point(size=4, alpha=0.8)+
  scale_color_gradientn(colours = rainbow(7))+
  theme_dark()

#Remove Null Values===========================
IrisNull <- read_csv("data/IrisNulls.csv")
#compute the mean
mean(IrisNull$Petal.Length)
#clean the whole sample
IrisCleaned<- na.omit(IrisNull)
#re compute on the cleaned sample
mean(IrisCleaned$Petal.Length)
mean(IrisCleaned$Petal.Width)
#Clean single columns
IrisCleaned2<- IrisNull[!(is.na(IrisNull$Petal.Length) | IrisNull$Petal.Length==""), ]
#calculate mean again
mean(IrisCleaned$Petal.Length)
mean(IrisCleaned2$Petal.Length)

#Change scale of Graphs axis=================================

#Initial graph
Mygraph <- ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Species)) + geom_point(size=6, alpha=0.5)+
  theme_bw()+ 
  labs(title = "Iris", subtitle = "Relationship between Petal Lengh and Petal Width", x = "Petal Length", y= "Petal Width")
Mygraph
#Define limits axis
Mygraph +xlim(0, 10)+ylim(0, 3)
#Define limits and set intercept of X and Y
Mygraph +expand_limits(x=c(0,10), y=c(0, 3))
#Plot in the log scale
Mygraph + coord_trans(x="log10", y="log10")

#Change unit of measurments
ggplot(iris, aes(x=Petal.Length/2.54, y=Petal.Width/2.54, color=Species)) + geom_point(size=6, alpha=0.5)+
  theme_bw()+ 
  labs(title = "Iris", subtitle = "Relationship between Petal Lengh and Petal Width", x = "Petal Length (Inches)", y= "Petal Width(Inches)")+
  expand_limits(x=c(0,3), y=c(0,1.5))

#Set the ticks in the grid
ggplot(iris, aes(x=Petal.Length/2.54, y=Petal.Width/2.54, color=Species)) + geom_point(size=6, alpha=0.5)+
  theme_bw()+ 
  labs(title = "Iris", subtitle = "Relationship between Petal Lengh and Petal Width", x = "Petal Length (Inches)", y= "Petal Width(Inches)")+expand_limits(x=c(0,3), y=c(0,1.5))+
  scale_x_continuous(minor_breaks = seq(0,4, 1), breaks = seq(0,4,2))+
  scale_y_continuous(minor_breaks = seq(0,2, 0.25), breaks = seq(0,2,0.5))

#EXERCISE 2

#EXPORT GRAPHS########
ggsave(filename='Figure1.tiff', dpi=600, path='graphs')

#THE END 