# Consumption timeline

With the following set of queries, we aim to look at slot usage at multiple levels of granularity across folder, project and jobs. With the columns presented, we aim to compare the slot consumption on average / peak (per second) against the number of terrabytes processed. Applying this comparison aids in the cost-benefit analysis of deciding on the minimum number of slot commitments to purchase as a function of average and peak slot usage with on-demand usage.

## [Query 1] BUCKETS=second, SPACE SCOPE=folder

[Link to query](query_1.sql)


### Scenario
*Across a whole folder* I would like to understand the timeline of slot consumption per second to identify peak usages at any given second within a time frame.

### Output example

| period                         | totalPeriodJobs | totalPeriodSlots | peakPeriodSlots | totalPeriodTbs |
| ------------------------------ | --------------- | ---------------- | --------------- | -------------- |
| 2022-08-07 13:45:03.000000 UTC | 1               | 0.088            | 0.088           | 1.32E-05       |
| 2022-08-07 13:45:04.000000 UTC | 2               | 0.114            | 0.067           | 2.65E-05       |
| 2022-08-07 13:45:05.000000 UTC | 2               | 0.064            | 0.049           | 2.65E-05       |
| 2022-08-07 13:45:10.000000 UTC | 1               | 0.067            | 0.067           | 1.32E-05       |

### Visualization Options
Table, Line Chart

## [Query 2] BUCKETS=PROJECT, SPACE SCOPE=FOLDER

### Scenario
*Across a whole folder* I would like to understand the timeline of slot consumption *per second, per project*, to identify peak usages at any given second within a time frame.

### Output example

| period                         | project\_id     | totalPeriodJobs | totalPeriodSlots | peakPeriodSlots | totalPeriodTbs |
| ------------------------------ | --------------- | --------------- | ---------------- | --------------- | -------------- |
| 2022-08-07 13:45:03.000000 UTC | A0NeWvUpv1N272n | 1               | 0.088            | 0.088           | 1.32E-05       |
| 2022-08-07 13:45:04.000000 UTC | A0NeWvUpv1N272n | 2               | 0.114            | 0.067           | 2.65E-05       |
| 2022-08-07 13:45:05.000000 UTC | A0NeWvUpv1N272n | 2               | 0.064            | 0.049           | 2.65E-05       |
| 2022-08-07 13:45:10.000000 UTC | A0NeWvUpv1N272n | 1               | 0.067            | 0.067           | 1.32E-05       |

### Visualization Options
Table, Line Chart

Due to having multiple projects per second, we can leverage this output to visualize multiple projects as multiple lines on one chart for comparison within the given time interval.
