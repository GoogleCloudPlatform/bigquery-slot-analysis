# Many Dimensions
## [Query 1] BUCKETS=FOLDER, SPACE SCOPE=FOLDER

[Link to query](query_1.sql)

### Scenario
*Across all projects within a given organisation's folder*, I would like to know the total, peak, average slot usage and related metrics to determine the existence of usage spike (per second) within a given time interval.

### Output example
| totalSlotUsage | peakSlotUsage | avgPeriodSlotUsage | TotalQueries | totalProcessedTb | onDemandCost | minBreakEvenFlatSlotUnits100 | minBreakEvenFlatCost |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 816934033.39 | 36378.733 | 368.26964806672447 | 6515328 | 3307921.08 | 21501487.04 | 8270 | 21502000 |

### Visualization Options
Table

## [Query 2] BUCKETS=PROJECT, SPACE SCOPE=FOLDER

[Link to query](query_2.sql)

### Scenario
*For every project within a given organisation's folder*, I would like to know the total, peak, average slot usage and related metrics to determine the existence of usage spike (per second) within a given time interval.

### Output example
| project_id | totalSlotUsage | peakSlotUsage | avgPeriodSlotUsage | TotalQueries | totalProcessedTb | onDemandCost | minBreakEvenFlatSlotUnits100 | minBreakEvenFlatCost |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| RXWhmCdRYAPZkAaOx7El | 114639092.71 | 36291.85 | 887.65674038312557 | 150082 | 173298.6 | 1126440.92 | 433.0 | 1125800.0 |
| ZfR41Uc+jXI5xiNZUOcP | 1057962.36 | 19903.395 | 1467.3541747572815 | 721 | 2402.68 | 15617.41 | 6.0 | 15600.0 |
| 83lA6d4QeLulV7A1NkK8 | 104458065.77 | 16439.372 | 725.72073730173724 | 623701 | 625681.08 | 4066927.05 | 1564.0 | 4066400.0 |
| LcK4MZiqZsunNxtCItDF | 23948183.13 | 16054.257 | 250.31025278550098 | 107536 | 7447.93 | 48411.56 | 19.0 | 49400.0 |
| 96G9YBq0KcWKckzeXSAP | 9591741.19 | 14405.344 | 812.17114208298074 | 12581 | 45567.34 | 296187.74 | 114.0 | 296400.0 |
### Visualization Options
Table or Table with heat map can be generally good options