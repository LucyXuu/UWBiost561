rm(list = ls())
library(UWBiost561)
library(ggplot2)
library(patchwork)


load("HW4_simulation.RData")

all_records <- list()

for (density_name in names(density_trial_list)) {
  trials <- density_trial_list[[density_name]]

  for (trial_name in names(trials)) {
    implementations <- trials[[trial_name]]

    for (impl_name in names(implementations)) {
      result <- implementations[[impl_name]]

      clique_idx <- result$clique_idx
      clique_label <- if (is.null(clique_idx)) {
        "NULL"
      } else {
        paste(sort(clique_idx), collapse = "-")
      }

      all_records[[length(all_records) + 1]] <- data.frame(
        density = density_name,
        trial = trial_name,
        implementation = impl_name,
        clique_label = clique_label,
        stringsAsFactors = FALSE
      )
    }
  }
}

df <- do.call(rbind, all_records)


unique_settings <- unique(df[, c("density", "trial")])

# Create list to store ggplot objects
plot_list <- list()

# Loop through unique settings and generate ggplot objects only (不保存每张图)
for (i in seq_len(nrow(unique_settings))) {
  sub_df <- subset(df,
                   density == unique_settings$density[i] &
                     trial == unique_settings$trial[i])

  counts <- as.data.frame(table(sub_df$clique_label))
  colnames(counts) <- c("clique", "count")

  p <- ggplot(counts, aes(x = "", y = count, fill = clique)) +
    geom_bar(stat = "identity", width = 1) +
    coord_polar(theta = "y") +
    labs(title = paste("Density:", unique_settings$density[i],
                       "|", unique_settings$trial[i]),
         x = NULL, y = NULL) +
    theme_void() +
    theme(legend.position = "none")  # Optional: hide individual legends

  plot_list[[i]] <- p
}

# Combine all plots using patchwork
combined_plot <- wrap_plots(plot_list, ncol = 5)  # 5 columns, 2 rows

# Save the combined plot
ggsave("vignettes/HW4_simulation_combined.png",
       plot = combined_plot, width = 20, height = 8)
