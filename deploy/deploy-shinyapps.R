# deploy/deploy-shinyapps.R
# usethis::use_build_ignore("deploy")
if (!interactive()) {
  rsconnect::setAccountInfo(
    Sys.getenv("SHINYAPPS_ACCOUNT"),
    Sys.getenv("SHINYAPPS_TOKEN"),
    Sys.getenv("SHINYAPPS_SECRET")
  )
}
# Add here any additional files/directories the app needs
app_files = c(
  "app.R",
  "DESCRIPTION",
  "NAMESPACE",
  "R/",
  "inst/",
  "renv.lock",
  ".rscignore"
)
# options(rsconnect.packrat = TRUE)
rsconnect::deployApp(
  account = "gmaggio", # not necessary
  appName = "FaithfulPlots", appFiles = app_files, forceUpdate = TRUE
)
