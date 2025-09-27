-- BANK LOAN ANALYSIS QUERIES

SELECT * FROM bank_loan_data;

-- Total Number Loan Applications
SELECT
	COUNT(id) AS Total_Loan_Applications
FROM
	bank_loan_data;

-- Month-to-Date (MTD) Loan Applications - How many loans were applied on the latest or current month
SELECT
	COUNT(id) AS MTD_Total_Loan_Applications
FROM
	bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- Calculating the Previous-MTD which we will use to calculate the MoM change between the previous and the currecnt month.
SELECT
	COUNT(id) AS PMTD_Total_Loan_Applications
FROM
	bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;


-- Month-on-Month (MoM) Loan Applications - Loan application for the previous month and how does it compare to this current month as a percentage

WITH monthly_counts AS (
    SELECT 
        COUNT(CASE WHEN MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021 THEN id END) AS MTD,
        COUNT(CASE WHEN MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021 THEN id END) AS PMTD
    FROM bank_loan_data
)
SELECT 
    MTD,
    PMTD,
    -- Cast one of the values to a decimal/float to force floating-point division
    ROUND(ABS((PMTD - MTD) * 1.0 / PMTD) * 100, 2) AS MoM_Change_Rate_Percent
FROM monthly_counts;

-- Total Funded Amount
SELECT
    SUM(loan_amount) AS Total_Funded_Amount
FROM
    bank_loan_data;

-- Total Funded Amount MTD
SELECT
    SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM
    bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- Total Funded Amount PMTD
SELECT
    SUM(loan_amount) AS PMTD_Total_Funded_Amount
FROM
    bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

--The MoM rate of change - For the total funded amount
WITH monthly_counts AS (
    SELECT 
        SUM(CASE WHEN MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021 THEN loan_amount ELSE 0 END) AS MTD,
        SUM(CASE WHEN MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021 THEN loan_amount ELSE 0 END) AS PMTD
    FROM bank_loan_data
)
SELECT 
    MTD,
    PMTD,
    -- Cast one of the values to a decimal/float to force floating-point division
    ROUND(ABS((PMTD - MTD) * 1.0 / PMTD) * 100, 2) AS MoM_Change_Rate_Percent
FROM monthly_counts;

-- Total Amount Received
SELECT
    SUM(total_payment) AS Total_Amount_Received
FROM
    bank_loan_data;

-- Total Amount Received MTD
SELECT
    SUM(total_payment) AS MTD_Total_Amount_Received
FROM
    bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- Total Funded Amount PMTD

SELECT  SUM(total_payment) AS PMTD_Total_Amount_Received FROM bank_loan_data WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

--The MoM rate of change - For the total  amount received

WITH monthly_counts AS (
 SELECT   SUM(CASE WHEN MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021 THEN total_payment ELSE 0 END) AS MTD,
 SUM(CASE WHEN MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021 THEN total_payment ELSE 0 END) AS PMTD FROM bank_loan_data )
SELECT  MTD,  PMTD,  ROUND(ABS((PMTD - MTD) * 1.0 / PMTD) * 100, 2) AS MoM_Change_Rate_Percent FROM monthly_counts;

-- Average Interest Rate
SELECT
    ROUND(AVG(int_rate), 4) * 100 AS  Average_Interest_Rate
FROM
    bank_loan_data;

-- Month-to-Date (MTD) Average Interest Rate
SELECT
    ROUND(AVG(int_rate), 4) * 100 AS MTD_Average_Interest_Rate
FROM
    bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD Average Interest Rate
SELECT
    ROUND(AVG(int_rate), 4) * 100 AS PMTD_Average_Interest_Rate
FROM
    bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- Month-over-Month (MoM) Average Interest Rate
WITH monthly_counts AS (
    SELECT 
        ROUND(AVG(CASE WHEN MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021 THEN int_rate END), 4) * 100 AS MTD,
        ROUND(AVG(CASE WHEN MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021 THEN int_rate END), 4) * 100 AS PMTD
    FROM bank_loan_data
)
SELECT 
    MTD,
    PMTD,
    ROUND(ABS((MTD - PMTD) * 1.0 / PMTD) * 100, 2) AS MoM_Change_Rate_Percent
FROM monthly_counts;

-- Average Debt-to-Income ratio
SELECT
    ROUND(AVG(dti), 4) * 100 AS  Average_DTI
FROM
    bank_loan_data;

-- Month-to-Date (MTD) Average DTI
SELECT
    ROUND(AVG(dti), 4) * 100 AS MTD_Average_DTI
FROM
    bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD Average DTI
SELECT
    ROUND(AVG(dti), 4) * 100 AS PMTD_Average_DTI
FROM
    bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- Month-over-Month (MoM) Average DTI
WITH monthly_counts AS (
    SELECT 
        ROUND(AVG(CASE WHEN MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021 THEN dti END), 4) * 100 AS MTD,
        ROUND(AVG(CASE WHEN MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021 THEN dti END), 4) * 100 AS PMTD
    FROM bank_loan_data
)
SELECT 
    MTD,
    PMTD,
    ROUND(ABS((MTD - PMTD) * 1.0 / PMTD) * 100, 2) AS MoM_Change_Rate_Percent
FROM monthly_counts;

-- GOOD LOAN ISSUE
-- Good Loan Percentage

SELECT 
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0)
    /
    COUNT(id) AS Good_loan_percentage
FROM bank_loan_data;

-- Good loan applications
SELECT 
    COUNT(id) as Good_loan_applications
FROM 
    bank_loan_data
WHERE
   loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Good Loan Funded Amount
SELECT 
    SUM(loan_amount) AS Good_loan_funded_amount
FROM 
    bank_loan_data
WHERE
   loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Good Loan Received Amount
SELECT 
    SUM(total_payment) AS Good_loan_total_received_amount
FROM 
    bank_loan_data
WHERE
   loan_status = 'Fully Paid' OR loan_status = 'Current';

-- BAD LOAN ISSUED
-- Bad Loan Application Percentage
SELECT 
    (COUNT (CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0)  
    / 
    COUNT (id) AS Bad_loan_application_percentage 
FROM 
    bank_loan_data;

-- Bad Loan Applications
SELECT  COUNT(id) as Bad_loan_applications FROM Bank_loan_data WHERE loan_status = 'Charged Off';

-- Bad Loan Funded Amount
SELECT  SUM (loan_amount) as Bad_loan_funded_amount FROM  Bank_loan_data WHERE loan_status = 'Charged Off';

-- Bad Loan Total Received Amount
SELECT  SUM (total_payment) as Bad_loan_total_received_amount FROM Bank_loan_data WHERE loan_status = 'Charged Off ';

-- Loan Status Grid View
SELECT
    loan_status,
    COUNT(id) AS Total_loan_application,
    SUM(loan_amount) AS Total_amount_funded,
    SUM(total_payment) AS Total_amount_received,
    ROUND(AVG(int_rate * 100), 2) AS Average_interest_rate,
    ROUND(AVG(dti * 100), 2) AS Average_DTI
FROM
    bank_loan_data
GROUP BY
    loan_status;

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount,
    ROUND(AVG(int_rate * 100), 2) AS Average_interest_rate,
    ROUND(AVG(dti * 100), 2) AS Average_DTI
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status

-- BANK LOAN REPORT | OVERVIEW
-- MONTH

SELECT
    MONTH(issue_date) AS Month_number,
    DATENAME(MONTH, issue_date) AS Month_name,
    COUNT(id) AS Total_loan_application,
    SUM(loan_amount) AS Total_amount_funded,
    SUM(total_payment) AS Total_amount_received
FROM
    bank_loan_data
GROUP BY  MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY  MONTH(issue_date)

-- Loan based on Address State
SELECT TOP 15
    address_state,
    COUNT(id) AS Total_loan_application,
    SUM(loan_amount) AS Total_amount_funded,
    SUM(total_payment) AS Total_amount_received
FROM
    bank_loan_data
GROUP BY address_state
ORDER BY  address_state

-- Loan based payment terms
SELECT 
    term AS Term,
    COUNT(id) AS Total_loan_application,
    SUM(loan_amount) AS Total_amount_funded,
    SUM(total_payment) AS Total_amount_received
FROM
    bank_loan_data
GROUP BY term
ORDER BY  term

-- Loan based on employee length 
SELECT 
    emp_length AS Employee_length,
    COUNT(id) AS Total_loan_application,
    SUM(loan_amount) AS Total_amount_funded,
    SUM(total_payment) AS Total_amount_received
FROM
    bank_loan_data
GROUP BY emp_length
ORDER BY emp_length

-- Loan based on loan purpose 
SELECT 
    purpose AS Loan_purpose,
    COUNT(id) AS Total_loan_application,
    SUM(loan_amount) AS Total_amount_funded,
    SUM(total_payment) AS Total_amount_received
FROM
    bank_loan_data
GROUP BY purpose
ORDER BY purpose

-- Loan based on home ownership

SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_loan_application,
	SUM(loan_amount) AS Total_amount_funded,
	SUM(total_payment) AS Total_amount_received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership