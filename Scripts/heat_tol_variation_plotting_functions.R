#Functions revisited for ploting phenotypic variation

#Add the MMM value below 

#Boxplot 
heattol_boxplot=function(df,Metric,Metric_lab,text_size,breaks_min,breaks_max,ymin,ymax,breaks_gap,xlab,xtitlelab,xticks){
  path="/data1/Denis/Hugo/"
  sites_data=read.csv(paste0(path,"Data/GBR_env_data/sites_data_ECT1.csv"),header=T,sep=";")
  colnames(sites_data)[1]="Reef.Name"
  # sites_data=read.csv(paste0(path,"Data/GBR_env_data/Aspath_sites_data.csv"))
  sites_data=sites_data %>% subset(Reef.Name %in% unique(df$Site.name))
  
  
  Site.stats <- df %>%
    group_by(Site.name) %>%
    dplyr::summarise(mean = mean(!!sym(Metric)), sd = sd(!!sym(Metric)), n = n(),lower=Rmisc::CI(!!sym(Metric), ci=0.95)[3],upper=Rmisc::CI(!!sym(Metric), ci=0.95)[1],q1=quantile(!!sym(Metric))[2],q3=quantile(!!sym(Metric))[4],median=median(!!sym(Metric)),IQ=q3-q1,min=q1-1.5*IQ,max=q3+1.5*IQ) %>%
    ungroup()
  
  
  
  # mycolors<-c("#1ba3c6" ,"#2cb5c0" ,"#21B087", "#33a65c" ,"#a2b627" ,"#f8b620", "#f89217", "#f06719","#e03426" ,"#f64971", "#fc719e" , "#ce69be", "#7873c0", "#4f7cba")
  # 
  get_palette=colorRampPalette(brewer.pal(n = 11, name = 'RdBu'))
  mycolors=rev(get_palette(14))
  
  
  #Order site names by MMM
  names(mycolors)<-sites_data$Reef.Name[order(sites_data$MMM)]
  #Order site names by Latitude instead
  # names(mycolors)<-sites_data$Reef.Name[order(sites_data$Lat)]
  #Barplot for every sites
  site_order=sites_data$Reef.Name[order(sites_data$Lat)]
  
  df=merge(df,sites_data %>% dplyr::select(Reef.Name,MMM),by.x="Site.name",by.y="Reef.Name")
  df$Site.name=factor(df$Site.name,levels=site_order)
  
  Site.stats=merge(Site.stats,sites_data %>% dplyr::select(Reef.Name,MMM),by.x="Site.name",by.y="Reef.Name")
  Site.stats$Site.name=factor(Site.stats$Site.name,levels=site_order)
  
  
  # p2ed50<-Site.stats %>% ggplot(aes(x=Site.name))+geom_boxplot(aes(ymin=q1-sd,ymax=q3+sd,lower=q1,middle=median,upper=q3,fill=Site.name),stat="identity",colour="black",position=position_dodge(0.85))+ geom_point(aes(x=Site.name,y=!!sym(Metric),fill=Site.name,colour=Site.name),position=position_jitterdodge(jitter.width = 2,dodge.width = 0.85),data=df,alpha=0.5)+ theme_classic()+labs(x="Site",y=Metric_lab)+ scale_fill_manual(values = mycolors,name="Site",labels=names(mycolors)) + theme(axis.text.x=xlab,axis.text.y=element_text(size=text_size,color="black"),axis.ticks.x = xticks,axis.title.x = xtitlelab,axis.title.y = element_text(size=text_size,color="black",margin = margin(t = 0, r = 15, b = 0, l = 0)),legend.title = element_text(size=text_size,color="black"),legend.text = element_text(size=text_size,color="black"),legend.position ="none",legend.background = element_rect(fill = "transparent"),
  #                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            panel.background = element_rect(colour = "black", size=1.5)) +
  #   scale_y_continuous(breaks = seq(breaks_min,breaks_max,by=breaks_gap),
  #                      limits = c(ymin,ymax))+ scale_colour_manual(values = mycolors,name="Site",labels=names(mycolors)) 

  new_palette=c("#1ba3c6" ,"#2cb5c0","#FFF880","#FFE135","#C60012") 
  p2ed50<-Site.stats %>% ggplot(aes(x=Site.name))+geom_boxplot(aes(ymin=q1-sd,ymax=q3+sd,lower=q1,middle=median,upper=q3,fill=MMM),stat="identity",colour="black",position=position_dodge(0.85))+ geom_point(aes(x=Site.name,y=!!sym(Metric),fill=MMM,colour=MMM),position=position_jitterdodge(jitter.width = 0.2,dodge.width = 0.85),data=df,alpha=0.5)+ theme_classic()+labs(x="Site",y=Metric_lab)+scale_fill_gradientn(colours = new_palette) + theme(axis.text.x=xlab,axis.text.y=element_text(size=text_size,color="black"),axis.ticks.x = xticks,axis.title.x = xtitlelab,axis.title.y = element_text(size=text_size,color="black",margin = margin(t = 0, r = 15, b = 0, l = 0)),legend.title = element_text(size=text_size,color="black"),legend.text = element_text(size=text_size,color="black"),legend.position ="none",legend.background = element_rect(fill = "transparent"),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        panel.background = element_rect(colour = "black", size=1.5)) +
    scale_y_continuous(breaks = seq(breaks_min,breaks_max,by=breaks_gap),
                       limits = c(ymin,ymax))+scale_colour_gradientn(colours = new_palette)
  
  
  
  return(p2ed50)
  }




heattol_histo=function(df,text_size,breaks_min,breaks_max,breaks_gap,xlab,xtitlelab,xticks,binw,f,f2,hm,vm){
  # sites_data=read.csv("D:/Hugo/Data/GBR_env_data/sites_data_ECT1.csv",header=T,sep=";")
  
  path="/data1/Denis/Hugo/"
  sites_data=read.csv(paste0(path,"Data/GBR_env_data/sites_data_ECT1.csv"),header=T,sep=";")
  colnames(sites_data)[1]="Reef.Name"
  sites_data=sites_data %>% subset(Reef.Name %in% unique(df$Site.name))
  
  
  mean <- mean(df$Value)
  median <- median(df$Value)
  sd <- sd(df$Value)
  
  
  df=merge(df,sites_data %>% dplyr::select(Reef.Name,MMM),by.x="Site.name",by.y="Reef.Name")
  df$MMM=as.numeric(df$MMM)
  
  # mycolors<-c("#1ba3c6" ,"#2cb5c0" ,"#21B087", "#33a65c" ,"#a2b627" ,"#f8b620", "#f89217", "#f06719","#e03426" ,"#f64971", "#fc719e" , "#ce69be", "#7873c0", "#4f7cba")
  # #Order site names by MMM
  # names(mycolors)<-sites_data$Reef.Name[order(sites_data$MMM)]
  
  #Histogram for all sites 
  
  hist<- df %>%
    ggplot(aes(x = Value)) + 
    geom_histogram(aes(fill = MMM,group=MMM), binwidth = binw, alpha = 1, position = position_stack(reverse = TRUE)) +
    geom_density(aes(y = ..count.. * f),size=1) +
    theme_classic()  + theme(plot.background = element_blank(),rect = element_rect(fill = "transparent",colour="transparent"),axis.text.x=xlab,axis.text.y=element_blank(),axis.ticks.y=element_blank(),axis.ticks.x = xticks,axis.title.x = xtitlelab,axis.title.y = element_blank(),legend.title = element_text(size=text_size,color="black"),legend.text = element_text(size=text_size,color="black"),legend.position ="none",legend.background = element_rect(fill = "transparent"),
                              panel.background = element_rect(colour = "black", size=1.5)) +
    labs(x = "", y = "Number of colonies",fill="Site") +
    guides(fill = guide_legend(reverse = TRUE))+scale_fill_gradientn(colours = new_palette) +
    geom_vline(aes(xintercept = median),size=1) +scale_x_continuous(breaks = seq(breaks_min,breaks_max,by=breaks_gap),
                                                                 limits = c(breaks_min,breaks_max)) +scale_y_continuous(breaks = seq(0,80,by=20),
                                                                                                                        limits = c(0,90)) +
    # geom_segment(aes(x = mean, xend = mean - sd-0.05, 
    #                  y = dnorm(mean + sd, mean, sd) * f2,
    #                  yend = dnorm(mean + sd, mean, sd) * f2),
    #              arrow = arrow(length = unit(0.4,"cm"), ends = "both"), lwd = 1,size=1)+
    annotate("text", x = mean +vm, y = 82, adj = 1,
             label = paste0("median = ", round(median, 2),"??",round(sd, 2)), size = 5)  + coord_flip()
  
  # +
  #   annotate("text", x = mean -hm,
  #            y = dnorm(mean + sd, mean, sd) * f2,
  #            adj = 0, label = paste0("s.d. = ", round(sd, 2)), size = 5)
  
  return(hist)
}


