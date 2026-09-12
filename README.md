# Customer Retention & Cohort Analytics Dashboard

An interactive portfolio project that turns customer purchase behavior into retention, repeat-purchase, channel-quality, and churn-risk decisions.

**Live demo:** Add your GitHub Pages URL after publishing.

## Business question

Which acquisition cohorts and marketing channels create durable customer relationships—not merely first purchases—and where should a growth team intervene to reduce churn?

## What the dashboard shows

- Month-by-month cohort retention heatmap
- M1 retention improvement across acquisition cohorts
- Revenue and repeat-purchase rate by channel
- At-risk customer value and recommended actions
- Plain-English executive summary

## Analytical workflow

1. Model customers and orders in SQL.
2. Assign each customer to the month of their first purchase.
3. Calculate the number of months between acquisition and subsequent activity.
4. Divide active customers by original cohort size to calculate retention.
5. Compare acquisition channels using revenue and repeat-purchase rate.
6. Translate results into lifecycle-marketing recommendations.

## Run locally

Open `index.html` in a modern browser or launch it with VS Code Live Server.

Verify the published metrics independently:

```bash
python3 verify_metrics.py
```

Expected ending:

```text
All verification cases passed.
```

## Repository structure

```text
customer-retention-cohort-dashboard/
├── data/
│   ├── channel_summary.csv
│   └── cohort_retention.csv
├── sql/
│   ├── 01_schema.sql
│   ├── 02_cohort_retention.sql
│   └── 03_channel_quality.sql
├── index.html
├── verify_metrics.py
├── requirements.txt
└── README.md
```

## Important interpretation note

Retention is descriptive, not automatically causal. Channel differences may reflect audience mix, campaign targeting, seasonality, or product experience. A budget decision should combine these metrics with acquisition cost, contribution margin, and controlled experiments.

