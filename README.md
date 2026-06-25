# OLA Booking Data Analysis (SQL, Python, Power BI)

> **Note:** This is a self-initiated case study using AI-generated synthetic 
> data modeled on OLA's ride-hailing business, created for portfolio and 
> learning purposes. It is not affiliated with, endorsed by, or built on 
> real data from OLA Cabs.

## 📌 Project Overview
This project analyzes ride-hailing booking data to understand booking success and cancellation patterns, revenue and payment behavior, vehicle-type performance, and customer/driver ratings. The workflow combines:

✅ **Data Analysis (SQL):** Run structured queries against the bookings dataset to answer key business questions on cancellations, revenue, ratings, and customer behavior.
✅ **Visualization & Insights (Power BI):** Build an interactive dashboard covering overall performance, vehicle types, revenue, cancellations, and ratings.
✅ **Report:** Document the queries, results, and findings in a structured project report.

## 🛠️ Tools Used
`SQL` `Power BI` `Excel/CSV`

## 📊 Dataset
- **Rows:** 103,024 bookings
- **Date Range:** 01-Jul-2024 to 31-Jul-2024
- **Columns:** 20
- **Key Features:**
  - **Identifiers & Time:** Date, Time, Booking_ID, Customer_ID
  - **Trip Details:** Booking_Status, Vehicle_Type, Pickup_Location, Drop_Location, Ride_Distance
  - **Service Times:** V_TAT (vehicle turnaround time), C_TAT (customer turnaround time)
  - **Cancellations:** Canceled_Rides_by_Customer, Canceled_Rides_by_Driver
  - **Incomplete Rides:** Incomplete_Rides, Incomplete_Rides_Reason
  - **Financials:** Booking_Value, Payment_Method
  - **Ratings:** Driver_Ratings, Customer_Rating
- **Vehicle Types:** Prime Sedan, Prime SUV, Prime Plus, Mini, Auto, Bike, eBike
- **Payment Methods:** Cash, UPI, Credit Card, Debit Card
- **Booking Statuses:** Success, Canceled by Customer, Canceled by Driver, Driver Not Found

## 🔍 Key Insights
- **Cancellations are a major leakage point:** 28.08% of all bookings are cancelled, with driver-initiated cancellations (17.9% of all bookings) outweighing customer-initiated ones (10.2%)
- **Driver-side cancellations split between two causes:** "Personal & car related issue" (35.5%) and "Customer related issue" (29.4%) are the leading reasons, suggesting both logistics and rider-driver friction play a role
- **Customer-side cancellations are pickup-driven:** "Driver is not moving towards pickup" (30.2%) is the top reason customers cancel
- **Auto stands apart from other vehicle types:** average ride distance is ~10 km vs. ~25 km for every other vehicle type, consistent with short, local-hop usage
- **Ride frequency and spend don't align:** the top 5 customers by number of rides are a completely different group from the top 5 by total booking value
- **Ratings are uniformly high and flat:** both driver and customer ratings cluster between 3.98–4.01 across every vehicle type, showing little variation by vehicle
- **Cash and UPI dominate payments,** together covering the large majority of revenue, while card payments remain a small share
- **Incomplete rides (3,926 total)** are driven almost equally by Customer Demand and Vehicle Breakdown
- **9.8% of all bookings fail outright** due to no driver being found

## 📂 Repository Structure
```
├── Bookings-100000-Rows.xlsx          # Raw dataset
├── ola_sql_queries.sql                # SQL queries answering business questions
├── OLA_Project_dashboard.pbix        # Power BI interactive dashboard
├── OLA_Data_Analyst_Project_Report(1).docx   # Full project report
└── README.md
```

## 📈 Dashboard Preview
<img width="1161" height="647" alt="Screenshot 2026-06-25 155223" src="https://github.com/user-attachments/assets/9e24eb03-9f8a-404b-83bb-4f410acf8d78" />
<img width="1145" height="655" alt="Screenshot 2026-06-25 155247" src="https://github.com/user-attachments/assets/a46519fb-bb16-4fd6-bf78-b6bcd11eec82" />



## 🛠️ How to Use This Project
1. **Clone the repository**
   ```bash
   git clone https://github.com/Siddhesh-Nalawade1/Ride-Hailing-Booking-Data-Analysis
   ```
2. **Load the data into your SQL database**
   - Create a database (see the `CREATE TABLE` statement at the top of `ola_sql_queries.sql`)
   - Import the dataset into the `bookings` table
   - Run the queries in `ola_sql_queries.sql` to reproduce the results in the report

3. **Open the Power BI dashboard**
   - Open the `.pbix` file in Power BI Desktop
   - Refresh the data connection if needed to point to your local copy of the dataset

4. **Review the report**
   - Open the project report for the full write-up: dataset summary, SQL questions and results, dashboard walkthrough, and key insights

## 💡 Thanks for checking out the project!
Feel free to star ⭐ this repo or share it with someone learning Data Analytics. 🚀
