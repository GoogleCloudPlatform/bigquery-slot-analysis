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
  _PROJECT STRING;
SET
  _PROJECT = 'n0UdTRLpfpp2Qet';
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
    period_start,
    SUM(period_slot_ms)/1000 AS total_slots_this_second
  FROM
    `jgo-test-273414.information_schema_eu.jobs_timeline_by_folder_cleaned`
  GROUP BY
    period_start),
  full_project_timeline AS (
  SELECT
    s.period_start,
    IFNULL(a.total_slots_this_second, 0) AS total_slots_this_second
  FROM
    all_seconds_in_march s
  LEFT JOIN
    seconds_when_project_was_active a
  USING
    (period_start) )
SELECT
  PERCENTILE_CONT(total_slots_this_second, 0.50) OVER() AS percentile50,
  PERCENTILE_CONT(total_slots_this_second, 0.70) OVER() AS percentile70,
  PERCENTILE_CONT(total_slots_this_second, 0.90) OVER() AS percentile90,
  PERCENTILE_CONT(total_slots_this_second, 0.93) OVER() AS percentile93,
  PERCENTILE_CONT(total_slots_this_second, 0.94) OVER() AS percentile94,
  PERCENTILE_CONT(total_slots_this_second, 0.95) OVER() AS percentile95,
  PERCENTILE_CONT(total_slots_this_second, 0.96) OVER() AS percentile96,
  PERCENTILE_CONT(total_slots_this_second, 0.98) OVER() AS percentile98,
  PERCENTILE_CONT(total_slots_this_second, 0.99) OVER() AS percentile99
FROM
  full_project_timeline
LIMIT
  1;
