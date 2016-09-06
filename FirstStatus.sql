--Find the first status assigned to each student

WITH FirstStatus
AS (SELECT
  SSH.client_id,
  SSH.crms_number,
  SSH.date_modified,
  ROW_NUMBER() OVER (PARTITION BY SSH.client_id, SSH.crms_number
  ORDER BY SSH.client_id, SSH.crms_number, SSH.date_modified ASC) seq,
  SSH.student_status
FROM dbo.ZZ_crms_student_status_history SSH)

SELECT
  *
FROM FirstStatus

WHERE seq = 1
--test comment