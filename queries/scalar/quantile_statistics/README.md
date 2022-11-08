# Quantile statistics

With the following series of queries, we aim to understand the frequency of slot peak usage by distributing the usage data into percentiles. This would allow us to better differentiate between the exception and the norm when deciding on the number of slots to purchase.


## [Query 1] BUCKETS=FOLDER, SPACE SCOPE=FOLDER

[Link to query](query_1.sql)

### Scenario
*Across a whole folder* I would like to understand the percentage of queries that consume around or above a number of slots.

### Output example
| percentile50 | percentile70 | percentile90 | percentile93 | percentile94 | percentile95 | percentile96 | percentile98 | percentile99 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 137.347 | 934.6679999999998 | 2800.716 | 3524.629 | 3794.5629999999996 | 4060.862999999998 | 4351.296 | 5140.134 | 6064.670999999998 |

### Visualization Options
Table

## [Query 2] BUCKETS=PROJECT, SPACE SCOPE=FOLDER

[Link to query](query_1.sql)

### Scenario
*Across projects in a folder* I would like to understand the percentage of queries that consume around or above a number of slots and compare across the projects.

### Output example
| project_id | percentile50 | percentile70 | percentile90 | percentile93 | percentile94 | percentile95 | percentile96 | percentile98 | percentile99 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| HZ0TYOAttLoUuj9 | 0.025 | 0.033 | 0.0512 | 0.073 | 0.079839999999999883 | 0.089399999999999966 | 0.10355999999999992 | 0.17803999999999995 | 0.25245999999999968 |
| o9Q0YC+kg3gzRqv | 0.829 | 1.8129999999999991 | 21.1951 | 21.26557 | 23.806899999999985 | 26.638749999999987 | 29.47059999999999 | 31.06156 | 31.08128 |
| 6QQsGa7qfK6YccE | 0.939 | 2.0801999999999996 | 4.1864 | 4.7168400000000021 | 5.0240799999999988 | 5.3082 | 5.8786799999999957 | 53.210359999999952 | 573.56104 |
| 9PCJpWoD/HiqOop | 26.491 | 61.915 | 163.74300000000002 | 202.46 | 231.48759999999982 | 284.78099999999989 | 304.14759999999995 | 388.40419999999995 | 448.13309999999996 |
| tz1jQ3/4NUYdiPg | 42.7885 | 328.24799999999971 | 1890.6 | 2128.237050000002 | 2235.6033999999991 | 2364.5879999999993 | 2547.2691999999988 | 3078.3209999999995 | 3617.6634999999997 |
| MTYtLMtcWzmxBTb | 5.8525 | 11.387999999999996 | 27.471500000000006 | 37.055030000000016 | 42.377699999999962 | 58.696649999999991 | 84.724199999999485 | 144.77656 | 211.43993999999995 |
| 5cympJZ1AMA9n5K | 5.1975 | 20.0302 | 507.6609000000015 | 1789.0043300000007 | 1909.16016 | 1960.3641999999995 | 2049.6485199999997 | 2286.3489 | 3018.2639699999991 |

### Visualization Options

Table or Table with heat map can be generally good options


## [Query 3] BUCKETS=Job, SPACE SCOPE=FOLDER

[Link to query](query_3.sql)

### Scenario
*Across all jobs in a folder* I would like to understand the percentage of queries that consume around or above a number of slots and compare between jobs.

### Output example
TBD

### Visualization Options

Table or Table with heat map can be generally good options