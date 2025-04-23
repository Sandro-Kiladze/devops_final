# Simplified DevOps Pipeline Project

## Project Description

This project demonstrates a simplified DevOps pipeline using local resources. It includes a small Flask web application, version control with Git, Continuous Integration (CI) using GitHub Actions, Infrastructure as Code (IaC) using Terraform, a simulated Continuous Deployment (CD) strategy with Blue-Green deployment, and basic monitoring with a health check script.

## Tools and Technologies Used

* **Web Application:** Flask (Python)
* **Version Control:** Git
* **Remote Repository:** GitHub
* **Continuous Integration:** GitHub Actions
* **Infrastructure as Code:** Terraform
* **Monitoring/Health Check:** Bash script (`curl`)

## CI/CD and IaC Explanation

### Continuous Integration (CI)

I implemented CI using GitHub Actions. Upon pushing changes to the `main` or `dev` branches, or when a pull request is created targeting the `main` branch, the following steps are automatically executed:

1.  **Checkout Code:** The repository code is checked out onto the GitHub Actions runner.
2.  **Set up Python:** A Python environment is set up.
3.  **Create and Activate Virtual Environment:** A virtual environment is created and activated to manage dependencies.
4.  **Install Dependencies:** Dependencies listed in `requirements.txt` (if present), `pip`, `pytest`, and `flake8` are installed.
5.  **Lint with flake8:** The code is checked for style issues using `flake8`.
6.  **Test with pytest:** Unit tests (located in `test_flask_app.py`) are run using `pytest` to ensure the application functions correctly.

### Infrastructure as Code (IaC)

I used Terraform to manage our local "production" environment. The `terraform/main.tf` file defines the following resources:

* Creation of a `production` directory (simulated by creating a `.keep` file).
* Copying the Flask application (`app.py`), test file (`test_flask_app.py`), monitoring script (`monitor.sh`), and HTML templates (`index.html`, `result.htm`) into the `production` directory (and a `templates` subdirectory).
* Setting file permissions for the monitoring script to be executable.

Terraform automates the creation and updating of this "production" environment based on the configuration files.

### Continuous Deployment (CD)

I simulated a Continuous Deployment strategy using a Blue-Green deployment approach locally:

1.  **"Blue" Environment:** The `production` folder represents our current live environment.
2.  **"Green" Environment:** I created a `production_new` folder as a temporary environment for deploying a new version.
3.  **Deployment:** I used Terraform (by temporarily modifying the target paths in `terraform/main.tf`) to deploy a new version of the application to the `production_new` folder.
4.  **Switching:** The "switch" between environments was simulated by conceptually changing which folder our application would be run from to serve live traffic.
5.  **Rollback:** A rollback to the previous version was simulated by stopping the application in the "green" environment and starting the application in the "blue" environment.

[Local Machine] --> (Git Push) --> [GitHub Repository (dev/main branches)]
^                                        |
|                                        | (Pull Request)
|                                        v
+----------------------------------------+
|
| (GitHub Actions Trigger)
v
[GitHub Actions CI] --> (Tests Passed) --> [Artifacts (None in this case)]
|
| (Terraform Apply - Manual Trigger)
v
[Local "Production" Environment (production folder)]
|
| (Manual Run)
v
[Monitoring Script (monitor.sh)] --> (Logs to monitor.log)

Pictures will be in the PDF.