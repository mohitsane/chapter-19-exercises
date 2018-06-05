# Exercise 5: Interactive plots

# Load the Shiny library
library("shiny")

# Define a UI using a `fluidPage()` layout
ui <- fluidPage(

  # Set the page titlePanel to be "Milage by Engine Power"
  titlePanel("Milage by Engine Power"),

  # Output a plot 'milage', and respond to clicks on the plot
  plotOutput("milage", click = "plot_click"),

  # Output the word "Highlighting:" followed by a 'selected' text output
  p("Highlighting:", strong(textOutput("selected", inline = TRUE)))
)

# Define a server function
server <- function(input, output) {

  # Create a `reactiveValues()` list to store reactive data values
  # Give it a `selected_class` key with a value of an empty string ""
  data <- reactiveValues(selected_class = "")

  # Use `observeEvent()` to respond to plot clicks
  observeEvent(input$plot_click, {

    # Use the `nearPoints()` function to get selected rows in the `mpg` data
    # set near to the click location
    selected <- nearPoints(mpg, input$plot_click)

    # Store `unique()` values from the `class` feature of the selected rows in
    # the `selected_class` reactive list
    data$selected_class <- unique(selected$class)
  })

  # Render the 'selected' text output, which should be the (text) value of your
  # the `selected_class` reactive value
  output$selected <- renderText({
    data$selected_class # return the data value
  })

  # Render the 'milage' plot output
  output$milage <- renderPlot({

    # Return a ggplot scatterplot for the `mpg` dataset, with `displ` on the x
    # and `hwy` on the y axis.
    # Color each point by whether the `class` is %in% the `selected_class`
    # reactive value.
    # Add `guides()` so that the `color` legend is not shown (FALSE)
    ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
      geom_point(mapping = aes(color = (class %in% data$selected_class)), size = 5) +
      guides(color = FALSE)
  })

  # Bonus: also use `observeEvent()` to respond to brushing and change the plot
  # in a different way!
}

# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = ui, server = server)
