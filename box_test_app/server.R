box::use(
    shiny,
    ./pages/main_page
)

# Define server logic required to draw a histogram
shiny$shinyServer(function(input, output, session) {
    main_page$init_server("main")
})
