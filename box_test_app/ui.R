box::use(
    shiny,
    ./pages/main_page
)

shiny$shinyUI(
    main_page$ui("main")
)
