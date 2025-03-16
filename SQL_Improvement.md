# SQL Performance Improvement - Job Search Query

## 📌 Problem
Original SQL query took ~8 seconds due to multiple joins and `LIKE '%keyword%'` searches over large text columns.

---

## 🔧 Solution
- Replaced `LIKE` with **FULLTEXT SEARCH (MATCH ... AGAINST)** for efficient keyword matching.
- Applied **subquery with LIMIT** before joining to minimize rows.
- Removed unnecessary `GROUP BY`, added **indexes** on join keys.
- Result: Query execution time reduced to **<1 second**.

---

## 🚀 Setup
### 1. Create Fulltext Index (one-time)
```sql
ALTER TABLE Jobs ADD FULLTEXT(name, description, detail, business_skill, knowledge, location, activity, salary_statistic_group, salary_range_remarks, restriction, remarks);
2. Run Improved SQL Query
See optimized_query.sql
