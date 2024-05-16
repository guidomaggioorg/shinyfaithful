#' Old Faithful histogram Shiny module
#'
#' @description UI and server function for an example Shiny module.
#'
#' @param id Internal parameter for {shiny}.
#'
#' @name mod_faithful_hist
#'
NULL

#' @rdname mod_faithful_hist
#'
#' @import shiny
mod_faithful_hist_ui <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      column(3,
             sliderInput(ns("bins"), "Number of bins:", min = 1, max = 50, value = 30),
             checkboxInput(ns("density"), label = "density")
      ),
      # Show a plot of the generated distribution
      column(9,
             plotOutput(ns("distPlot"))
      )
    )
  )
}

#' @rdname mod_faithful_hist
#'
#' @import shiny
mod_faithful_hist_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    # generate bins based on input$bins from ui.R
    variable <- "waiting"
    x    <- datasets::faithful[, variable, drop = FALSE]
    bins <- reactive(seq(min(x), max(x), length.out = input$bins + 1))

    output$distPlot <- renderPlot({
      # draw the histogram with the specified number of bins
      plot_hist(x = x, breaks = bins(), freq = !input$density)
    })
  })
}

## To be copied in the UI
# mod_faithful_hist_ui("faithful_hist_1")

## To be copied in the server
# mod_faithful_hist_server("faithful_hist_1")
