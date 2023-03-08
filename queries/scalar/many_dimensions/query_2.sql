# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
    project_id,
    period_start AS period_ts_local,
    COUNT(DISTINCT job_id) AS query_count,
    SUM(period_slot_ms) / 1000 AS total_slot_sec,
    SUM(total_bytes_processed * 1e-12) total_processed_tb,
  FROM
    `[YOUR_PROJECT_ID].region-[YOUR_DATASET_REGION].INFORMATION_SCHEMA.JOBS_TIMELINE_BY_FOLDER`
  WHERE
    period_start BETWEEN _WHEN_FROM
    AND _WHEN_TO
    AND job_creation_time BETWEEN TIMESTAMP_SUB(_WHEN_FROM, INTERVAL 6 hour)
    AND TIMESTAMP_SUB(_WHEN_TO, INTERVAL 6 hour)
    AND job_type = 'QUERY'
    AND statement_type <> 'SCRIPT'
    AND period_slot_ms > 0
  GROUP BY
    1,
    2 )
SELECT
  project_id,
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
GROUP BY
  1
ORDER BY
  peakSlotUsage DESC
