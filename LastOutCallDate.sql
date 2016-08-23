--Get the date of the last outbound call per student

WITH LastOutCall
AS (SELECT
  CC.client_id,
  CC.crms_number,
  CC.date_opened,
  ROW_NUMBER() OVER (PARTITION BY CC.client_id, CC.crms_number
  ORDER BY CC.client_id, CC.crms_number, CC.date_opened DESC) seq_rev
FROM dbo.ZZ_crms_communication CC
WHERE CC.class = 'PHONE'
AND CC.in_out = 'OUT')

SELECT
  *
FROM LastOutCall
WHERE seq_rev = 1