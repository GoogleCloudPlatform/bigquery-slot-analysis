WITH
  all_seconds_in_march AS (
  SELECT
    period_start
  FROM (
    SELECT
      period_start
    FROM
      UNNEST (GENERATE_TIMESTAMP_ARRAY('2022-08-01 00:00:00', '2022-08-11 00:00:00', INTERVAL 1 SECOND)) period_start )),
  seconds_when_project_was_active AS (
  SELECT
    project_id,
    period_start,
    SUM(period_slot_ms)/1000 AS total_slots_this_second
  FROM
    `jgo-test-273414.information_schema_eu.jobs_timeline_by_folder_cleaned`
  WHERE
    job_type = "QUERY"
  GROUP BY
    project_id,
    period_start),
  full_project_timeline AS (
  SELECT
    project_id,
    s.period_start,
    IFNULL(a.total_slots_this_second, 0) AS total_slots_this_second
  FROM
    all_seconds_in_march s
  LEFT JOIN
    seconds_when_project_was_active a
  USING
    (period_start) )
SELECT
  project_id,
  percentile50,
  percentile70,
  percentile90,
  percentile93,
  percentile94,
  percentile95,
  percentile96,
  percentile98,
  percentile99
FROM (
  SELECT
    project_id,
    PERCENTILE_CONT(total_slots_this_second, 0.50) OVER(PARTITION BY project_id) AS percentile50,
    PERCENTILE_CONT(total_slots_this_second, 0.70) OVER(PARTITION BY project_id) AS percentile70,
    PERCENTILE_CONT(total_slots_this_second, 0.90) OVER(PARTITION BY project_id) AS percentile90,
    PERCENTILE_CONT(total_slots_this_second, 0.93) OVER(PARTITION BY project_id) AS percentile93,
    PERCENTILE_CONT(total_slots_this_second, 0.94) OVER(PARTITION BY project_id) AS percentile94,
    PERCENTILE_CONT(total_slots_this_second, 0.95) OVER(PARTITION BY project_id) AS percentile95,
    PERCENTILE_CONT(total_slots_this_second, 0.96) OVER(PARTITION BY project_id) AS percentile96,
    PERCENTILE_CONT(total_slots_this_second, 0.98) OVER(PARTITION BY project_id) AS percentile98,
    PERCENTILE_CONT(total_slots_this_second, 0.99) OVER(PARTITION BY project_id) AS percentile99
  FROM
    full_project_timeline)
GROUP BY
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10