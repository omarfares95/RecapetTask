# Robot Framework Test Automation

This repository contains automated test cases written in **Robot Framework** for validating application flows.  

---

## 🔧 Installation & Setup

1. **Clone the repository**
   ```bash
   git clone <your_repo_url>
   cd <your_repo_name>
   ```

2. **Create and activate virtual environment**
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate   # On Linux / macOS
   .venv\Scripts\activate      # On Windows
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```


---

## ▶️ Running Tests

### Locally
Run all tests:
```bash
robot --outputdir Results TestCases/
```

Run tests by tag:
```bash
robot --include E2E TestCases/
```

Re-run failed tests:
```bash
robot --rerunfailed Results/output.xml --output Results/rerun.xml TestCases/
rebot --merge Results/output.xml Results/rerun.xml
```

## 📂 Project Structure

```
.
├── TestCases/                 # Test cases
│   ├── LoginCases/
│   │   └── Login.robot
│   │   └── login_data.csv     # Test Templete Data Driven
│   ├── CheckoutCases/
│   │   └── CheckoutFlow.robo
│   ├── TestBase.resource     #Test Base Values
├── Resources/             # Reusable keywords & page objects
│   ├── CartPage/
│   │   └── CartKeywords.resource
│   │   └── variablesAndLocators.py
│   ├── CheckoutInformationPage/
│   │   └── CheckoutInformationKeywords.resource
│   │   └── variablesAndLocators.py
│   ├── InventoryPage/
│   │   └── InventoryKeywords.resource
│   │   └── variablesAndLocators.py
│   ├── LoginPage/
│   │   └── LoginKeywords.resource
│   │   └── variablesAndLocators.py
│   ├── pageBase.resource        #Page Base Values
├── Results/               # Output reports (log.html, report.html, screenshots)
├── requirements.txt       # Python dependencies
└── README.md              # Project documentation
```

---

## 🛠 Tools & Libraries Used

- [Robot Framework](https://robotframework.org/) – Test automation framework  
- [SeleniumLibrary](https://github.com/robotframework/SeleniumLibrary) – UI testing with Selenium  
- [DataDriver](https://github.com/Snooz82/robotframework-datadriver) – Data-driven testing from CSV/Excel  
- [FakerLibrary](https://github.com/guykisel/robotframework-faker)  – Generate dummy test data  
- [Python-dotenv](https://pypi.org/project/python-dotenv/)  – Load `.env` files  

---

## ⚠️ Assumptions & Limitations

- Tests assume a stable internet connection and required test environment is accessible.  
- Browser drivers (e.g., ChromeDriver) must match the installed browser version. 
- `.env` file is required for sensitive configs (e.g., usernames/passwords) but not committed to source control.  
