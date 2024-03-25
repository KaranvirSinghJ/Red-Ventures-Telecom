mydata<-RedVenturesDataset

colSums(is.na(mydata))
which(is.na(mydata$Sales))

colnames(mydata)<-c("sessionid","sessionstarttime","browsername","sessions","totalorders","cartorder",
                    "phoneorder","city","connectionspeed","country","devicetype","distinctpageviews","ispname",
                    "landingpageraw","manufacturer","metroname","osname","ordermonthlycharge","state","zipcode",
                    "trafficsource")


#Replacing missing total order with 0
totalorders<-colnames(mydata)[colSums(is.na(mydata))>0]
mydata$totalorders<-ifelse(is.na(mydata$totalorders),0,mydata$totalorders)

ggplot(mydata, aes(x = state, y = totalorders, fill = state)) +
  geom_col()+
  labs(title = "Total Orders for each state") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))


ggplot(mydata, aes(x = manufacturer, y = totalorders, fill = manufacturer)) +
  geom_col()+
  labs(title = "Total Orders by Manufacturer") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))


ggplot(mydata, aes(x = state, y = osname, fill = osname)) +
  geom_col()+
  labs(title = "Every os used by state") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))


hist(mydata$totalorders)
hist(mydata$cartorder)
hist(mydata$phoneorder)

ggplot(mydata, aes(x = browsername, y = totalorders)) +
  geom_col()+
  labs(title = "Total Orders for each state") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))