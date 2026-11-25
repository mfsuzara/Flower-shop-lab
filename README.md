# Flower Shop Lab: Campus Sales Analytics

A two-person data project. We sell single carnations on our college campus and log every person we ask, whether they buy or not, to find out what drives a flower sale.

**Status:** collecting data (started November 2026, running through Valentine's Day 2027).

## Team

| Person | Role |
| --- | --- |
| Marie Suzara ([@mfsuzara](https://github.com/mfsuzara)) |  Came up with the project idea, designed and made the flower arrangements, co-led data collection, built the SQL database and queries, set up this repository |
| Ariohn Gunn ([@AriohnGunn](https://github.com/AriohnGunn)) | Came up with the research questions, approached customers and ran sales, handled payments, co-led data collection, contributed to the analysis |

## Research questions

1. What share of people we ask actually buy? (conversion rate)
2. Does the day, time or weather change the conversion rate?
3. How many flowers should we bring so we don't sell out too early or waste flowers?
4. How do customers prefer to pay?
5. Who are people buying flowers for?

## How the data is collected

- Each selling day we stand in the same spot on campus and ask people walking by if they'd like a flower.
- Every person asked is one row, whether they say yes or no.
- Product: 1 carnation + 2 fillers, sold for $5 (about $1.76 cost per flower).
- Buyers get a customer ID (C001, C002, ...) instead of a name, to keep the data private.
- Time, weather and temperature are recorded once per selling day.

## Repository contents

| File | What it holds |
| --- | --- |
| `data/flower_log.csv` | One row per person asked |
| `data/flower_costs.csv` | One row per flower purchase |
| `sql/flowers.db` | SQLite database with both tables |
| `sql/flower_queries.sql` | SQL queries used for the analysis |

## Data dictionary (`flower_log.csv`)

| Column | Meaning |
| --- | --- |
| date | Selling day |
| said_yes | Yes if the person bought, No if not |
| customer_id | ID for buyers only |
| item | Single flower or Bouquet |
| quantity | How many they bought |
| paid | Amount paid ($) |
| who_for | Who the flower was for (Partner, Friend, Family, Myself, Other) |
| weather | Sunny, Cloudy, Rainy or Windy |
| temp_f | Temperature (°F) |
| time | When we were selling |
| location | Where we sold |
| payment | Cash, Zelle, Venmo, Cash App or Card |
| notes | Anything unusual |

## Findings so far (2 campus selling days, 46 people asked)

| Metric | Result |
| --- | --- |
| Conversion rate | 34.8% (16 of 46 bought) |
| Mon Nov 16, 11:15 AM, cloudy | 25.0% (3 of 12) |
| Wed Nov 18, 3:15 PM, sunny | 38.2% (13 of 34) |
| Most common payment | Cash (50% of buyers) |
| Sales speed (Wed) | 13 sales in about 70 minutes |
| Total sales / costs / profit | $125 / $69.30 / $55.70 |

- We sold out on both campus days, so real demand may be higher than what we sold.
- A single flower earns $5 per stem; a 4-stem mini arrangement sold for $10 earned $2.50 per stem.

## Limitations

- Small sample so far.
- Day 1 (Nov 16) was a pilot with only 6 flowers, so it is not a fair comparison with later days.
- Day, time and weather all changed between the first two days, so we can't yet say which one made the difference.
- Selling out caps the number of possible sales.

## Decisions log

- Nov 16: log every person asked, including "no"s.
- Nov 17: record time, weather and temperature once per selling day and copy them to every row that day.
- Nov 21: keep carnations, $5 and 20 flowers per day so days can be compared fairly.
- Nov 23: built a SQLite database and starter SQL queries.

## Next steps

- More selling days in two fixed slots: Monday 11:15 AM and Wednesday 3:15 PM.
- Record sold-out time and people who wanted a flower after we sold out.
- Python analysis: conversion rate by slot, bootstrapping and inventory simulation.
- January: test one change at a time (price, then flower type).
- Dashboard in Tableau Public.
