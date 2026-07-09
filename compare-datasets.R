compare_datasets <- function(paths, sheet_name, by) {
  
  names <- setNames(c("x", "y"), names(paths))
  
  d <-
    map(paths, \(x) read_excel(x, sheet = sheet_name))
  
  d %>%
    reduce(full_join, by = by, suffix = c("_x", "_y")) %>%
    pivot_longer(cols = !all_of(by)) %>%
    separate(name, into = c("name", "dataset"), sep = "_") %>%
    pivot_wider(names_from = dataset) %>%
    mutate(diff = y - x) %>%
    rename(all_of(names))
  
}
