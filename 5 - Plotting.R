library("ggplot2")


#---------------line plots--------------------------

#dots
qplot(hours, Monday, data=weekData)
#colors
qplot(hours, Monday, data=weekData, color="Monday")
qplot(hours, Monday, data=weekData, color="Monday")

qplot(hours, Monday, data=weekData, color=daypart)

#size
qplot(hours, Monday, data=weekData, color=daypart, size=Monday)

#style
qplot(hours, Monday, data=weekData, geom = "line", color="Monday")
qplot(hours, Monday, data=weekData, geom = c("point", "line"), color="Monday")
qplot(hours, Monday, data=weekData, geom = c("point", "line"), color=daypart)

#description
qplot(hours, Monday, data=weekData, geom = "line", color="Monday", xlab = "Hour", ylab = "Number of pushes")
#scale
qplot(hours, Monday, data=weekData, geom = "line", color="Monday", xlab = "Hour", ylab = "Number of pushes") + scale_x_continuous(expand=c(0,0))


ggplot(weekData, aes(hours)) + 
  geom_line(aes(y = Monday, colour = "Monday")) + 
  geom_line(aes(y = Wednesday, colour = "Wednesday")) +
  geom_line(aes(y = Friday, colour = "Friday"))

#description
ggplot(weekData, aes(hours)) + 
  xlab("Hour") + ylab("Number of pushes") + ggtitle("Working week") +
  scale_colour_hue("Day") + 
  geom_line(aes(y = Monday, colour = "Monday")) + 
  geom_line(aes(y = Wednesday, colour = "Wednesday")) +
  geom_line(aes(y = Friday, colour = "Friday"))

#scale
ggplot(weekData, aes(hours)) + 
  scale_x_continuous(expand=c(0,0)) +
  xlab("Hour") + ylab("Number of pushes") + ggtitle("Working week") +
  scale_colour_hue("Day") + 
  geom_line(aes(y = Monday, , colour = "Monday")) + 
  geom_line(aes(y = Wednesday, colour = "Wednesday")) +
  geom_line(aes(y = Friday, colour = "Friday"))

ggplot(weekData, aes(hours)) + 
  scale_x_continuous(expand=c(0,0)) +
  scale_y_continuous(expand=c(0,0)) +
  xlab("Hour") + ylab("Number of pushes") + ggtitle("Working week") +
  scale_colour_hue("Day") + 
  geom_line(aes(y = Monday, , colour = "Monday")) + 
  geom_line(aes(y = Wednesday, colour = "Wednesday")) +
  geom_line(aes(y = Friday, colour = "Friday"))


ggplot(weekData, aes(hours)) + 
  ylim(0,17000) +
  scale_x_continuous(expand=c(0,0)) +
  xlab("Hour") + ylab("Number of pushes") + ggtitle("Working week") +
  scale_colour_hue("Day") + 
  geom_line(aes(y = Monday, , colour = "blue")) + 
  geom_line(aes(y = Wednesday, colour = "Wednesday")) +
  geom_line(aes(y = Friday, colour = "Friday"))

#---------------bar plots--------------------------
ggplot(weekData, aes(daypart)) + geom_bar()

# stat="Identity" because default is "bin" which give the number
ggplot(weekData, aes(x=h, y=Monday)) + geom_bar(stat="Identity")

#description
ggplot(weekData, aes(x=h, y=Monday, fill="Monday")) + geom_bar(stat="Identity") + scale_fill_hue("Day") +
  xlab("Hour") + ylab("Number of pushes") + ggtitle("Working week")

ggplot(weekData, aes(x=h)) + 
  scale_fill_hue("Day") + 
  xlab("Hour") + ylab("Number of pushes") + ggtitle("Working week") +
  geom_bar(aes(y=Monday, fill="Monday"), stat="Identity") +
  geom_bar(aes(y=Wednesday, fill="Wednesday"), stat="Identity") +
  geom_bar(aes(y=Friday, fill="Friday"), stat="Identity")

ggplot(weekData, aes(x=h)) + 
  xlab("Hour") + ylab("Number of pushes") + ggtitle("Working week") +
  geom_bar(aes(y=Monday, fill="Monday"), stat="Identity") +
  geom_bar(aes(y=Wednesday, fill="Wednesday"), stat="Identity") +
  geom_bar(aes(y=Friday, fill="Friday"), stat="Identity") +
  scale_fill_manual(values = c("red", "green", "blue"), name= "Day")


ggplot(weekData, aes(x=h)) + 
  scale_fill_hue("Day") + 
  xlab("Hour") + ylab("Number of pushes") + ggtitle("Working week") +
  geom_bar(aes(y=Monday, fill="Monday"), stat="Identity", position="dodge") +
  geom_bar(aes(y=Wednesday, fill="Wednesday"), stat="Identity", position="dodge") +
  geom_bar(aes(y=Friday, fill="Friday"), stat="Identity", position="dodge")


library(reshape2)
meltedWeek <- melt(weekData[,c('h','Monday','Wednesday', 'Friday')],id.vars = 1)

ggplot(meltedWeek, aes(x=h, y=value)) + geom_bar(aes(fill=variable), stat="Identity")
  
ggplot(meltedWeek, aes(x=h, y=value)) + geom_bar(aes(fill=variable), stat="Identity", position="dodge")

