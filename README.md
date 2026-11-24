# Flower Shop Lab: Campus Sales Analytics

I sell single carnations on my college campus and log every person I ask, whether they buy or not. The goal is to find out what drives a flower sale: day, time, weather, price and who the flowers are for.

**Status:** collecting data (started November 2026, running through Valentine's Day 2027).

## Questions I want to answer

- What share of people I ask actually buy? (yes rate)
- Does the day, time or weather change the yes rate?
- How many flowers should I bring so I don't sell out too early or waste flowers?
- Who are people buying flowers for?

## How the data is collected

- Each selling day I stand in the same spot on campus and ask people walking by if they'd like a flower.
- Every person asked is one row, whether they say yes or no.
- Product: 1 carnation + 2 fillers, $5 each (about $1.76 cost per flower).
- Buyers get a customer ID (C001, C002, ...) instead of a name, to keep the data private.

## Files

| File | What it holds |
| --- | --- |
| `data/flower_log.csv` | One row per person asked |
| `data/flower_costs.csv` | One row per flower purchase |
| `sql/flower_queries.sql` | SQL queries on the data (SQLite) |

## Data dictionary

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
| time | When I was selling |
| location | Where I sold |
| payment | Cash, Zelle, Venmo, Cash App or Card |
| notes | Anything unusual |

## Findings so far (2 campus days, 46 people)

- About 1 in 3 people bought a flower (34.8% yes rate).
- Sunny Wednesday afternoon: 38% yes rate. Cloudy Monday morning: 25%. Too early to say why.
- Half of buyers paid cash.
- Sold out both days, so real demand may be higher than what I sold.

## Limitations

- Small sample so far.
- Day 1 (Nov 16) was a pilot with only 6 flowers, so it is not a fair comparison with later days.
- Day, time and weather all changed between the first two days.

## Decisions log

- Nov 16: started logging every person asked, including "no"s.
- Nov 17: record time, weather and temperature once per selling day and copy them to every row that day.
- Nov 21: keeping carnations, $5 and 10 flowers per day so days can be compared fairly.

## Next steps

- More selling days: Monday 11:15 AM and Wednesday 3:15 PM slots.
- Python analysis: yes rate by slot, bootstrapping and inventory simulation.
- Dashboard in Tableau Public.
