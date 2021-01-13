

#' Title
#'
#' @param dirname
#' @param camp_template
#'
#' @return
#' @export
#'
#' @examples
pSIMS_Site_Make <- function(dirname=".",
                            camp_list=list(planting=list(depth=35))# this is for the json,
                            param_list=list(ref_year=2010) # this is for the yaml
                            Project_name="NewProject") {

  # File names
  json_fname <- "exp_template.json"
  yaml_fname <- "params.apsim.sample"

  # Find the file templates
  tmp_json_path <- system.file("templates", json_fname, package = "pSIMSSiteMaker")
  tmp_yml_path <- system.file("templates", yaml_fname, package = "pSIMSSiteMaker")

  # read json and yaml----------------------------------------------------------------
  tmp_json <- jsonlite::fromJSON(tmp_json_path)
  tmp_yml <- yaml::read_yaml(tmp_yml_path)

  # Making the dir -------------------------------------------------------------------
  if(!dir.exists(file.path(dirname, Project_name))) dir.create(file.path(dirname, Project_name))

  #Copy the campaign ncfile and template file

  # Writing json and yaml files -------------------------------------------------------
  jsonlite::write_json(tmp_json, file.path(file.path(dirname, Project_name, json_fname)))
  yaml::write_yaml(tmp_yml, file.path(file.path(dirname, Project_name, yaml_fname)))
}
