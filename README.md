# Bank Loan Analysis & Performance Dashboard

## 📖 Project Overview
This project involves a comprehensive **Bank Loan Analysis** to monitor key lending metrics, assess loan performance ("Good" vs. "Bad" loans), and identify trends across various dimensions such as time, region, and borrower profiles. The analysis was conducted in two main parts: **MS SQL Server** (for data extraction, transformation, and querying) and **Power BI** (for visualization and interactive dashboard creation).

The goal was to build an end-to-end data solution that transforms raw loan data into actionable insights, enabling data-driven decision-making for portfolio management.

---

## 🎯 Problem Statement
The bank needed to track and analyze its lending portfolio to address key business problems, including:
- Monitoring overall loan application volume, funded amounts, and repayments.
- Assessing portfolio health by distinguishing between performing ("Good") and non-performing ("Bad") loans.
- Identifying trends over time (monthly, year-over-year).
- Understanding the regional distribution of loans.
- Analyzing how loan terms, borrower employment length, loan purpose, and home ownership influence lending metrics.

---

## 📊 Dashboard Summaries

### **Dashboard 1: SUMMARY**
A high-level overview of key performance indicators (KPIs) and loan health.
- **Key Performance Indicators (KPIs):**
  - Total Loan Applications (with MTD and MoM changes)
  - Total Funded Amount (with MTD and MoM changes)
  - Total Amount Received (repayments, with MTD and MoM changes)
  - Average Interest Rate (with MTD and MoM changes)
  - Average Debt-to-Income Ratio (DTI) (with MTD and MoM changes)
- **Good Loan vs. Bad Loan KPIs:**
  - Good Loan: Application %, Count, Funded Amount, Received Amount
  - Bad Loan: Application %, Count, Funded Amount, Received Amount
- **Loan Status Grid View:**
  - A detailed table showing metrics categorized by loan status.

### **Dashboard 2: OVERVIEW**
An analytical view of trends and distributions within the loan portfolio.
- **Charts and Visualizations:**
  - **Monthly Trends by Issue Date** (Line Chart): Seasonality and long-term trends in lending.
  - **Regional Analysis by State** (Filled Map): Geographic distribution of loans.
  - **Loan Term Analysis** (Donut Chart): Distribution of loans by term length.
  - **Employee Length Analysis** (Bar Chart): Loan metrics by borrower employment history.
  - **Loan Purpose Breakdown** (Bar Chart): Loans categorized by purpose (e.g., car, home, debt consolidation).
  - **Home Ownership Analysis** (Tree Map): Impact of home ownership on loans.
- **Metrics Displayed:** Total Loan Applications, Total Funded Amount, Total Amount Received.

### **Dashboard 3: DETAILS**
A granular, detailed view of the loan data for deep dive analysis.
- **Comprehensive Grid View:**
  - A detailed, consolidated table of all loan data.
  - Provides borrower profiles, loan terms, amounts, interest rates, status, and other key fields.
  - Serves as a one-stop solution for accessing individual loan details.

---

## 🛠️ Tools & Technologies Used
- **Database Management:** Microsoft SQL Server, SQL Server Management Studio (SSMS)
- **Data Analysis & Queries:** SQL (CTEs, Partitions, Aggregations, Date Functions)
- **Data Visualization:** Power BI
- **Data Modeling & DAX:** Power Query, Time Intelligence, Calculated Measures & Columns
- **Supplementary Tool:** Microsoft Excel

---

## ✨ Key Features & Skills Demonstrated
- **End-to-End ETL Process:** From raw data in SQL to a refined data model in Power BI.
- **Advanced SQL Queries:** Wrote complex queries for data extraction and transformation.
- **DAX & Time Intelligence:** Implemented sophisticated measures for MTD, MoM, and other KPIs.
- **Interactive Reporting:** Built a user-friendly, multi-page dashboard with cross-filtering and drill-down capabilities.
- **Data Storytelling:** Translated complex data into clear visual narratives to drive business insights.

---

## 📁 Repository Structure
