# Retrieve previous months trend file if archived
if(
  !paste0(format(start_month - month(1), "%Y-%m"), "_trend.rds") %in% 
  list.files(here("trend"))
){
  unzip(here("trend", "archive.zip"),
        files = paste0(format(start_month - month(1), "%Y-%m"), "_trend.rds"),
        exdir = here("trend"))
}
