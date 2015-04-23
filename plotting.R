library("ggplot2")


#lines
qplot(hours, Monday, data=weekData)
#colors
qplot(hours, Monday, data=weekData, color="red")
qplot(hours, Monday, data=weekData, color="red")

qplot(hours, Monday, data=weekData, color=daypart)

#size
qplot(hours, Monday, data=weekData, color=daypart, size=Monday)

#style
qplot(hours, Monday, data=weekData, geom = "line", color="red")
qplot(hours, Monday, data=weekData, geom = c("point", "line"), color="red")
qplot(hours, Monday, data=weekData, geom = c("point", "line"), color=daypart)

#description
qplot(hours, Monday, data=weekData, geom = "line", color="red", xlab = "Hour", ylab = "Number of pushes")
#scale
qplot(hours, Monday, data=weekData, geom = "line", color="red", xlab = "Hour", ylab = "Number of pushes") + scale_x_continuous(expand=c(0,0))


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
  geom_line(aes(y = Monday, , colour = "Monday")) + 
  geom_line(aes(y = Wednesday, colour = "Wednesday")) +
  geom_line(aes(y = Friday, colour = "Friday"))


