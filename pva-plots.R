library(dslabs) #load libraries
library(xlsx)
library(tidyverse)

dane<-read.xlsx("dane.xlsx",sheetIndex=1) #load data

# histogram
png("PVA-histogram.png", units="px", width = 800, height = 600) #Open png file
dane %>% 
  ggplot(aes(x=da, fill=pva))+
  geom_histogram(alpha=0.5)+
  scale_fill_discrete(name=quote(PVA))+
  facet_grid(pva~db)+
  xlab("Nominal droplet size (\u03BCm)")+
  ylab("Counts")+
  ggtitle("Droplet sizes after passing through a step") +
  theme(plot.title=element_text(family="Helvetica", face="bold", size=20,hjust=0.5))
dev.off() #close png file

#density plot
png("PVA-density.png", units="px", width = 800, height = 600) #Open png file
dane %>% 
  ggplot(aes(x=da, fill=pva))+
  geom_density(bw=3, alpha=0.5)+
  scale_fill_discrete(name=quote(PVA))+
  facet_grid(pva~db)+
  xlab("Nominal droplet size (\u03BCm)")+
  ylab("Smoothed density estimate")+
  ggtitle("Droplet sizes after passing through a step") +
  theme(plot.title=element_text(family="Helvetica", face="bold", size=20,hjust=0.5))
dev.off() #close png file
