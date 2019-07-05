get_html_title <- function(path) {
    read_lines(path) %>% str_subset("<title>") %>%
        xml2::as_xml_document() %>%
        xml2::xml_text()
}
safely_get_html_title <- purrr::possibly(get_html_title, "")