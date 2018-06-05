# Exercise 5: interactive plots

# Load the Shiny library
library("shiny")

# Define a UI using a `fluidPage()` layout

  
  # Set the page titlePanel to be "Milage by Engine Power"

  
  # Output a plot 'milage', and respond to clicks on the plot

  
  # Output the word "Highlighting:" followed by a 'selected' text output



# Define a server function

  
  # Create a `reactiveValues()` list to store reactive data values
  # Give it a `selected_class` key with a value of an empty string ""


  # Use `observeEvent()` to respond to plot clicks

    
    # Use the `nearPoints()` function to get selected rows in the `mpg` data 
    # set near to the click location

    
    # Store `unique()` values from the `class` feature of the selected rows in 
    # the `selected_class` reactive list


  # Render the 'selected' text output, which should be the (text) value of your
  # the `selected_class` reactive value

  
  # Render the 'milage' plot output

    
    # Return a ggplot scatterplot for the `mpg` dataset, with `displ` on the x 
    # and `hwy` on the y axis. 
    # Color each point by whether the `class` is %in% the `selected_class` 
    # reactive value.
    # Add `guides()` so that the `color` legend is not shown (FALSE)

  
  # Bonus: also use `observeEvent()` to respond to brushing and change the plot
  # in a different way!


# Create a new `shinyApp()` using the above ui and server

