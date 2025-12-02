# 📊 IPL 2025 Batsman SQL EDA Project

This project is a complete **Exploratory Data Analysis (EDA)** of IPL 2025 batsmen statistics using **MySQL**.  
The goal is to clean, explore, analyze, and derive meaningful insights from batting performance data of players participating in IPL 2025.

---

## 📥 Data Source

The dataset was manually collected from the **official IPL website** (https://www.iplt20.com).  
It includes player-level batting statistics such as:

* Player Name
* Team
* Runs
* Matches
* Innings
* Not-Outs
* Highest Score
* Average
* Balls Faced
* Strike Rate
* Hundreds / Fifties
* Fours / Sixes

These metrics were compiled into a CSV file for database insertion.

---

## 🗄️ Database Setup

A MySQL database named **`ipl\_2025`** was created.  
Inside it, a table **`ipl2025`** was designed with appropriate data types:

```sql
CREATE TABLE ipl2025 (
    PlayerID INT AUTO\_INCREMENT PRIMARY KEY,
    Player VARCHAR(100),
    Team VARCHAR(100),
    Runs INT,
    Matches INT,
    Innings INT,
    NotOut INT,
    Highest INT,
    Average DECIMAL(5,2),
    BallsFaced INT,
    StrikeRate DECIMAL(5,2),
    Hundreds INT,
    Fifties INT,
    Fours INT,
    Sixes INT
);
```

---

## 📤 Data Import

The CSV file was imported into MySQL using **MySQL Workbench’s Import Data Wizard**:

1. `Server` → `Data Import`
2. Selected the CSV file
3. Mapped CSV columns to SQL table columns
4. Loaded the data successfully into the `ipl2025` table

---

## 🔍 Data Exploration

The following preliminary checks were performed:

### ✔ Count total players

```sql
SELECT COUNT(\*) AS NumberOfPlayers FROM ipl2025;
```

### ✔ View sample data

```sql
SELECT \* FROM ipl2025 LIMIT 5;
```

### ✔ Check for NULL values

```sql
SELECT \* FROM ipl2025
WHERE Player IS NULL 
   OR Team IS NULL
   OR Matches IS NULL
   OR Innings IS NULL
   OR NotOut IS NULL
   OR Highest IS NULL
   OR Average IS NULL
   OR BallsFaced IS NULL
   OR StrikeRate IS NULL
   OR Hundreds IS NULL
   OR Fifties IS NULL
   OR Fours IS NULL
   OR Sixes IS NULL;
```

### ✔ Detect duplicate players

```sql
SELECT Player, COUNT(\*) AS total\_occurrences
FROM ipl2025
GROUP BY Player
HAVING COUNT(\*) > 1;
```

---

## 📈 Insights \& SQL Analysis

A variety of performance insights were generated using SQL:

### ⭐ Player Categorization (Anchor, Finisher, Opener, etc.)

### ⭐ Most Not-Outs

### ⭐ Team with Most Sixes

### ⭐ Highest Run Scorer

### ⭐ Highest Strike Rate (≥ 100 Balls Faced)

### ⭐ Lowest Strike Rate (≥ 50 Balls Faced)

### ⭐ Most Fifties

### ⭐ Team with Highest Total Runs

(All SQL queries are inside the project folder.)

---

## 🧠 What This Project Achieves

✔ Performs **full exploratory analysis** of IPL 2025 batting data  
✔ Creates multiple **performance-based insights** using SQL  
✔ Introduces **player categorization logic** (Anchor, Finisher, Six Hitter, etc.)  
✔ Summarizes **team strengths** based on runs and sixes  
✔ Identifies **top performers** across multiple metrics  
✔ Prepares data that can be **used for Power BI dashboards**  
✔ Demonstrates real-world SQL skills including:

* Data cleaning
* Aggregations
* Subqueries
* Window logic via CASE
* EDA \& insights generation

---

## 📊 Future Scope

* Build an **interactive Power BI dashboard** using this dataset
* Add bowling + fielding stats to expand analysis
* Create automated views or stored procedures for insights
* Perform ML-based performance prediction

---

## 📁 Project Folder Contains

* `ipl\_2025.sql` → Table schema + data loading
* `README.md` → Project documentation
* `IPL 2025 Batsman SQL EDA Project.docx` → Notes \& queries

---

## 🙌 Conclusion

This project demonstrates end-to-end data analysis using SQL, from data extraction and cleaning to advanced performance insights. It shows how structured data and well-designed queries can reveal valuable patterns in sports analytics.

