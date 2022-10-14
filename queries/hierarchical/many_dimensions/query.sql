DECLARE
_WHEN_FROM timestamp;
DECLARE
_WHEN_TO timestamp;
SET
_WHEN_FROM = '2022-07-08 00:00:00.00000';
SET
_WHEN_TO = '2022-08-08 00:00:00.00000';
WITH
baseQuery AS (
SELECT
  period_start AS period_ts_local,
  COUNT(DISTINCT job_id) AS query_count,
  SUM(period_slot_ms) / 1000 AS total_slot_sec,
  SUM(total_bytes_processed * 1e-12) total_processed_tb,
FROM
  `[your-project-id].region-eu.INFORMATION_SCHEMA.JOBS_TIMELINE_BY_FOLDER`
WHERE
  period_start BETWEEN _WHEN_FROM
  AND _WHEN_TO
  AND job_creation_time BETWEEN TIMESTAMP_SUB(_WHEN_FROM, INTERVAL 6 hour)
  AND job_type = 'QUERY'
  AND statement_type <> 'SCRIPT'
  AND period_slot_ms > 0
GROUP BY
  1 )
SELECT
ROUND(SUM(total_slot_sec), 2) AS totalSlotUsage,
MAX(total_slot_sec) AS peakSlotUsage,
AVG(total_slot_sec) AS avgPeriodSlotUsage,
SUM(query_count) AS TotalQueries,
ROUND(SUM(total_processed_tb), 2) AS totalProcessedTb,
ROUND(SUM(total_processed_tb) * 6.5, 2) AS onDemandCost,
ROUND((SUM(total_processed_tb) * 6.5) / 2600) AS minBreakEvenFlatSlotUnits100,
ROUND((SUM(total_processed_tb) * 6.5) / 2600) * 2600 AS minBreakEvenFlatCost
FROM
baseQuery
ORDER BY
peakSlotUsage DESC

