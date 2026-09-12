import csv
from pathlib import Path

ROOT = Path(__file__).parent

with (ROOT / "data" / "cohort_retention.csv").open() as file:
    cohorts = list(csv.DictReader(file))

with (ROOT / "data" / "channel_summary.csv").open() as file:
    channels = list(csv.DictReader(file))

assert len(cohorts) == 6
assert sum(int(row["customers"]) for row in cohorts) == 4240
assert float(cohorts[0]["m1"]) == 42.5
assert float(cohorts[-1]["m1"]) == 53.4
assert round(float(cohorts[-1]["m1"]) - float(cohorts[0]["m1"]), 1) == 10.9

assert len(channels) == 5
assert sum(int(row["customers"]) for row in channels) == 4040
assert sum(float(row["revenue"]) for row in channels) == 685700
best_repeat = max(channels, key=lambda row: float(row["repeat_rate"]))
assert best_repeat["channel"] == "Email"
assert float(best_repeat["repeat_rate"]) == 57.8

print("Cohort totals verified: 4,240 customers across 6 cohorts.")
print("Channel totals verified: $685,700 revenue across 5 channels.")
print("Retention trend verified: M1 improved by 10.9 percentage points.")
print("Best repeat-purchase channel verified: Email (57.8%).")
print("All verification cases passed.")

