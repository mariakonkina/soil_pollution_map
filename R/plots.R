#taking a map
plot_maker1 <- function() {
moscow_map <<- ggmap(get_googlemap(c(37.62, 55.76),
                                    zoom = 10,
                                    scale = 2,
                                    maptype = "terrain",
                                    color = "color"))
#creating plot version 1
soil_poll_plot1 <<- moscow_map +
  geom_point(data = soil_df,
             aes(x = lon,
                 y = lat,
                 color = soil_df$level),
             alpha = 0.7,
             size = 3) +
  ggtitle("Pollution level")
}

#creating plot version 2
plot_maker2 <- function() {
moscow_map <- ggmap(get_googlemap(c(37.62, 55.76),
                                  zoom = 10, scale = 2,
                                  maptype = "terrain",
                                  color = "color"))
soil_poll_plot2 <<- moscow_map +
  geom_point(data = soil_df_var,
             aes(x = lon,
                 y = lat,
                 color = level),
             alpha = 0.7,
             size = 3) +
geom_label_repel(data = soil_df_var,
                 aes(x = lon,
                     y = lat,
                     label = value),
                 box.padding = 0.35,
                 point.padding = 0.5,
                 segment.colour = "grey50",
                 alpha = 0.8) +
  ggtitle("Moderately dangerous pollution level with value")
}
