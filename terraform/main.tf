resource "local_file" "production_dir_marker" {
  content    = ""
  directory_permission = "0755"
  file_permission      = "0644"
  filename   = "../production/.keep" # Create an empty file to ensure the directory exists
}

resource "local_file" "app_file" {
  depends_on = [local_file.production_dir_marker]
  content    = file("../app.py")
  file_permission = "0644"
  filename   = "../production/app.py"
}

resource "local_file" "test_file" {
  depends_on = [local_file.production_dir_marker]
  content    = file("../test_flask_app.py")
  file_permission = "0644"
  filename   = "../production/test_flask_app.py"
}

resource "local_file" "monitor_script" {
  depends_on = [local_file.production_dir_marker]
  content    = file("../monitor.sh")
  file_permission = "0755" # Make the script executable
  filename   = "../production/monitor.sh"
}

resource "local_file" "index_html" {
  depends_on = [local_file.production_dir_marker]
  content    = file("../templates/index.html")
  file_permission = "0644"
  filename   = "../production/templates/index.html"
}

resource "local_file" "result_html" {
  depends_on = [local_file.production_dir_marker]
  content    = file("../templates/result.html")
  file_permission = "0644"
  filename   = "../production/templates/result.html"
}

resource "local_file" "templates_dir_marker" {
  depends_on = [local_file.production_dir_marker]
  content    = ""
  directory_permission = "0755"
  file_permission      = "0644"
  filename   = "../production/templates/.keep" # Ensure templates dir exists
}