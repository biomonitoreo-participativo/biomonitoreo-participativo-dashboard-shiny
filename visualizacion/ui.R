dashboardPage(
    dashboardHeader(title = "Biomonitoreo participativo"),
    dashboardSidebar(
        sidebarMenu(
            menuItem(
                text = "Registros de presencia", 
                selectInput(
                    inputId = "select_scientific_name",
                    label = "Nombre científico",
                    choices = choices_scientific_name
                ),                
                startExpanded = TRUE,
                menuSubItem(text = "Mapa", tabName = "tab_lf_occurrences"),                
                menuSubItem(text = "Tabla", tabName = "tab_dt_occurrences"),
                menuSubItem(text = "Gráficos", tabName = "tab_plots_occurrences")
            )
        )
    ),
    dashboardBody(
        tabItems(
            tabItem(
                tabName = "tab_lf_occurrences",
                tags$style(type = 'text/css', '#lf_occurrences {height: calc(100vh - 80px) !important;}'),
                leafletOutput(outputId = "lf_occurrences")
            ),            
            tabItem(
                tabName = "tab_dt_occurrences",
                DTOutput(outputId = "dt_occurrences")
            ),
            tabItem(
                tabName = "tab_plots_occurrences",
                plotlyOutput(outputId = "plot_occurrences_by_year"),
                plotlyOutput(outputId = "plot_occurrences_by_month")
            )
        )
    )
)