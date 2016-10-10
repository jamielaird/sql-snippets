--Last status by student

WITH LastStatus
AS (SELECT
  SSH.client_id,
  SSH.crms_number,
  SSH.date_modified,
  ROW_NUMBER() OVER (PARTITION BY SSH.client_id, SSH.crms_number
  ORDER BY SSH.client_id, SSH.crms_number, SSH.date_modified DESC) seq_rev,
  SSH.student_status
FROM dbo.ZZ_crms_student_status_history SSH)

SELECT
  *
FROM LastStatus

WHERE seq_rev = 1