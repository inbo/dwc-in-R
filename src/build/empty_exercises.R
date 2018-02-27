#
# S. Van Hoey
#

library(iterators)
library(readr)

#' Remove exercise solutions from chunks
#'
#' Extract the code of all chunks labeled as 'exercise = TRUE' and store the
#' result as a new file.
#'
#' @param solutions_file original file containing all solutions and with all
#' exercise chunks labeled as exercise = TRUE
#' @param output_file file name to write the cleaned version to
#' @param identifier code in the chunk header that labels the chunk as
#' exercise
#'
#' @return
#'
#' @examples
#'\dontrun{
#'empty_exercises("./src/dplyr-solutions.Rmd", "./src/dplyr.Rmd")
#'}
empty_exercises <- function(solutions_file,
                            output_file,
                            identifier = "exercise = TRUE") {

    file_con <- file(solutions_file, "r")
    outfile_con <- file(output_file, "w")

    content <- ireadLines(file_con)
    while (TRUE) {
        line <- try(nextElem(content))
        # check for end of file
        if (class(line) == "try-error") {
            break
        }

        # check for exercise content
        if (grepl(gsub("\\s", "", identifier), gsub("\\s", "", line))) {
            # write start of chunk to output file
            write_lines(line, outfile_con, append = TRUE)
            # exclude exercsise chunks content
            line <- nextElem(content)
            while (!grepl("```", line)) {
                line <- nextElem(content)
            }
        }
        # write line to output file
        write_lines(line, outfile_con, append = TRUE)
    }
    close(file_con)
    close(outfile_con)
}


