box::use(shiny, graphics, datasets)

#' @export
ui <- function(id) {
  ns <- shiny$NS(id)
  shiny$fluidPage(
    shiny$titlePanel("Old Faithful Geyser Data"),
    shiny$sidebarLayout(
      shiny$sidebarPanel(
        shiny$sliderInput(ns("bins"),
                    "Number of bins:",
                    min = 1,
                    max = 50,
                    value = 30)
      ),
      shiny$mainPanel(
        shiny$plotOutput(ns("distPlot"))
      )
    )
  )
}

#' @export
init_server <- function(id) {
  shiny$callModule(server, id)
}

server <- function(input, output, session) {
  output$distPlot <- shiny$renderPlot({
    x <- datasets::faithful[, 2] # dataset import is available only using ::?
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    graphics$hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
}
