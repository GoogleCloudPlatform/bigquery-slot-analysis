DECLARE
  _WHEN_FROM timestamp;
DECLARE
  _WHEN_TO timestamp;
DECLARE
  _PROJECT string;
SET
  _WHEN_FROM = '2022-08-07 13:45:00.00000';
SET
  _WHEN_TO = '2022-08-07 17:00:00.00000';
SET
  _PROJECT = 'A0NeWvUpv1N272n'; # (Optional) Filter out by project
WITH
  baseJobTimeline AS (
  SELECT
    period_start,
    job_id,
    user_email,
    (period_slot_ms / 1000) AS slots,
    total_bytes_processed*1e-12 AS terabytesProcessed
  FROM
    `jgo-test-273414.information_schema_eu.jobs_timeline_by_folder_cleaned`
  WHERE
    period_start BETWEEN _WHEN_FROM
    AND _WHEN_TO
    AND job_type = 'QUERY'
    AND statement_type <> 'SCRIPT'
    AND period_slot_ms > 0
    AND project_id = 'A0NeWvUpv1N272n')
SELECT
  period_start AS period,
  COUNT(job_id) AS totalPeriodJobs,
  SUM(slots) AS totalPeriodSlots,
  MAX(slots) AS peakPeriodSlots,
  SUM(terabytesProcessed) AS totalPeriodTbs,
  ARRAY_AGG(STRUCT(job_id,
      user_email)) AS jobsPerPeriod
FROM
  baseJobTimeline
GROUP BY
  period_start
ORDER BY
  period_start ASC;