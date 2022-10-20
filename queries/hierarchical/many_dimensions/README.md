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

## [Query 3] BUCKETS=JOB, SPACE SCOPE=FOLDER

[Link to query](query_3.sql)

### Scenario
*For every job within a given organisation's folder*, I would like to know the total, peak, average slot usage and related metrics to determine the existence of usage spike (per second) within a given time interval.

### Output example
| project_id | job_id | totalSlotUsage | peakSlotUsage | avgPeriodSlotUsage | TotalQueries | totalProcessedTb | onDemandCost | minBreakEvenFlatSlotUnits100 | minBreakEvenFlatCost |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| ZfR41Uc+jXI5xiNZUOcP | kMtdamMbHBic+H9 | 641976.34 | 19903.395 | 1667.4710181818182 | 385 | 1688.73 | 10976.73 | 4.0 | 10400.0 |
| ZfR41Uc+jXI5xiNZUOcP | iLLpw3XdOi6ieAe | 230240.55 | 19269.934 | 2708.7123882352939 | 85  | 0.0 | 0.0 | 0.0 | 0.0 |
| RXWhmCdRYAPZkAaOx7El | 9xJtYCjjOTYRllu | 592307.13 | 18694.408 | 1935.6442189542486 | 306 | 2435.04 | 15827.75 | 6.0 | 15600.0 |
| RXWhmCdRYAPZkAaOx7El | UC68PYAOuGYrVYY | 88940.0 | 18643.804 | 4941.1111111111122 | 18  | 0.0 | 0.0 | 0.0 | 0.0 |
| 83lA6d4QeLulV7A1NkK8 | lFR3ZMmc3PcD/NQ | 141265.55 | 16439.372 | 960.99010884353731 | 147 | 101.93 | 662.56 | 0.0 | 0.0 |
| LcK4MZiqZsunNxtCItDF | n/pLUl/cv2w3n68 | 120229.04 | 16054.257 | 1252.3858333333335 | 96  | 99.79 | 648.66 | 0.0 | 0.0 |
| LcK4MZiqZsunNxtCItDF | UaKRF/AsbExTrPC | 108413.31 | 15133.16 | 967.97600000000011 | 112 | 114.64 | 745.14 | 0.0 | 0.0 |
| 96G9YBq0KcWKckzeXSAP | FeQ2hjp9paPEPpm | 415795.33 | 14405.344 | 1358.8082745098038 | 306 | 511.11 | 3322.22 | 1.0 | 2600.0 |
| LcK4MZiqZsunNxtCItDF | PbhfdHsvtDNnb5D | 109537.16 | 13986.443 | 928.28102542372881 | 118 | 123.95 | 805.67 | 0.0 | 0.0 |
| LcK4MZiqZsunNxtCItDF | 56OEB9vwmFllgUO | 95891.83 | 13717.434 | 949.42404950495063 | 101 | 113.14 | 735.38 | 0.0 | 0.0 |
| LcK4MZiqZsunNxtCItDF | JR4FiKNFncT5aet | 135296.41 | 13659.458 | 1108.9870081967213 | 122 | 116.43 | 756.78 | 0.0 | 0.0 |
| LcK4MZiqZsunNxtCItDF | cZLNeSVLSBNG6KJ | 80245.74 | 13395.024 | 922.36480459770121 | 87  | 59.52 | 386.88 | 0.0 | 0.0 |
| LcK4MZiqZsunNxtCItDF | 4ILoSde4KGKbEGd | 94395.89 | 13286.478 | 866.01730275229363 | 109 | 117.26 | 762.18 | 0.0 | 0.0 |
| LcK4MZiqZsunNxtCItDF | k7B3h3hE5yWv5S7 | 94941.59 | 13268.116 | 968.79171428571431 | 98  | 91.2 | 592.83 | 0.0 | 0.0 |
| AZvlA5zDWVJP8H6jZAtN | uLRxn7jQtfmgGR0 | 227838.88 | 13116.387 | 1700.2901343283581 | 134 | 161.91 | 1052.43 | 0.0 | 0.0 |
| LcK4MZiqZsunNxtCItDF | vyruccpba1b+Igo | 144167.98 | 13050.933 | 1153.34388 | 125 | 123.47 | 802.57 | 0.0 | 0.0 |
| AZvlA5zDWVJP8H6jZAtN | MRr9gHQvewBx5gU | 7095837.87 | 12969.921 | 1949.9417073371808 | 3639 |     |     |     |     |

### Visualization Options
Table or Table with heat map can be generally good options