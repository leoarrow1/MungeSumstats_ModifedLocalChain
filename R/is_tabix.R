#' Is tabix
#' 
#' Is a file bgz-zip compressed and tabix-indexed.
#' @param path Path to file.
#' @returns logical: whether the file is tabix-indexed or not.
is_tabix <- function(path) {
    ## Must meet all of these conditions 
    ## in order to use a pre-existing tabix files.
    check_func <- function(path){
        path <- tolower(path)
        file.exists(path) &&
            any(endsWith(path, c(".gz",".bgz"))) &&
            file.exists(paste0(path, ".tbi")) &&
            file.size(path) > 0
    }
    #### Iterate over multiple inputs ####
    res <- unlist(lapply(path, check_func))
    return(res)
}