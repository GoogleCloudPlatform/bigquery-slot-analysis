# What to know before getting started

## Pricing options with BigQuery

As of the time of writing, BigQuery has two main pricing models:

- [On demand](https://cloud.google.com/bigquery/pricing#on_demand_pricing): where your querying project is charged based on the number of TB processed in the query. You will generally have access to 2000 slots as capacity per project. It may happen that BigQuery temporarily bursts beyond this limit to accelerate queries.

- [Flat-rate](https://cloud.google.com/bigquery/pricing#flat-rate_pricing): where you purchase slots (processing capacity), that you attach to projects via reservations.The included projects are not billed by scanned data anymore, which makes pricing more predictible. If your capacity demands exceed your committed capacity, BigQuery will queue up slots, which may slow down processing, but you will not be charged additional fees. More info on slots and reservations can be found in the [reservations documentation](https://cloud.google.com/bigquery/docs/reservations-intro).

**Note:** It is highly recommended to get familiar with BigQuery's pricing options by referring regularly to the [official documentation](https://cloud.google.com/bigquery/pricing).

## Understanding BigQuery's INFORMATION_SCHEMA views

The INFORMATION_SCHEMA consists of a set of views that gives you access to query the metrics and data related to metadata on the level of BigQuery jobs, tables, queries, views, users etc.

For the scope of this framework, we are mainly interested in analyzing jobs-related metadata which contains details on the type and execution details of BigQuery jobs carried out on projects.

### Required permissions

Before being able to start writing queries against those views (mainly related to job metadata views), make sure that the user or service account issuing the query jobs has the following permissions:

| View names               | Description                   | Permissions            |
|--------------------------|-------------------------------|------------------------|
| JOBS_BY_USER             | BQ Job metadata               | bigquery.jobs.listAll  |
| JOBS_BY_PROJECT          |                               |                        |
| JOBS_BY_FOLDER           |                               |                        |
| JOBS_TIMELINE_BY_USER    | BQ Job metadata by time slice | bigquery.jobs.listAll  |
| JOBS_TIMELINE_BY_PROJECT |                               |                        |
| JOBS_TIMELINE_BY_FOLDER  |                               |                        |

**Note:** In the case of analyzing multiple projects, make sure permissions are set on the parent folder for those projects. This will allow the user querying those views to access multiple project metadata in one query.

### INFORMATION_SCHEMA jobs overview

INFORMATION_SCHEMA contains two main views for analyzing BigQuery job related data, each with their own set of columns and use cases:

**INFORMATION_SCHEMA.JOBS_BY_**

This view contains all metadata related to each job executed or currently running in BigQuery and its related data such as project, creation_time, query, type, bytes processed, start time, end time etc. It is partitioned by the creation_time column. The main use case for this view is listing jobs and their related details without the need for very high accuracy on execution time.

In this view, slots consumption can be calculated on the level of each job by dividing the total_slot_ms column by the duration of that job’s execution in milliseconds, example: 

`SAFE_DIVIDE(total_slot_ms, (TIMESTAMP_DIFF(end_time, start_time, MILLISECOND))) AS avg_slots`

While this approach works, it will average slot consumption over the duration of the job, and will not show variations (e.g jobs that use a lot of slots at the beginning and fewer slots at the end). In addition, given that slot consumption ranges are organized on the level of jobs, it gets a bit hard to group the execution / slot consumption of multiple jobs at a specific period / range of time.
		
For this specific use case of slot consumption measurement, JOBS_TIMELINE_BY_ can be a better option.

**INFORMATION_SCHEMA.JOBS_TIMELINE_BY_**

This view contains data similar to that of JOBS_BY related to jobs but organized by “time slice”: each line is a period of 1 second. This allows us to understand the consumption of slots over specific periods of time for one or multiple jobs with the accuracy at the second granularity.

In this view, slot consumption is consumed over one or multiple periods (seconds) of time via the period_slot_ms column, which typically needs to be divided by 1000 to get the number of slots consumed for that period. Over multiple periods of time, we aggregate the sum of period_slot_ms and divide by 1000 to obtain the slots consumed over those periods.

This is the view we will use in our opinionated queries.
