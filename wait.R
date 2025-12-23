secs_to_mins <- function(s) {
  
  m <- floor(s / 60)
  s <- s %% 60
  
  m_text <- if (m > 0) paste(m, "minute") else ""
  m_plural <- if (m > 1) "s" else ""
  s_text <- if (s > 0) paste(s, "second") else ""
  s_plural <- if (s > 1) "s" else ""
  and    <- if (m > 0 & s > 0) " and " else ""
  
  paste0(m_text, m_plural, and, s_text, s_plural)
  
}

wait <- function(seconds) {
  
  cli::cli_progress_bar(
    total = seconds,
    format = paste(
      "{cli::col_cyan(cli::symbol$info)}",
      "{secs_to_mins(seconds - t)} remaining..."
    ),
    format_done = "{cli::col_green(cli::symbol$tick)} Complete!",
    clear = FALSE
  )
  for (t in 1:seconds){
    Sys.sleep(1)
    cli::cli_progress_update()
  }
  
}

wait(10)
wait(80)
