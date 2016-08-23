--Get the date of the last inbound call to each student

WITH LastInCall
AS (SELECT
  CC.client_id,
  CC.crms_number,
  CC.date_opened,
  CC.headline,
  ROW_NUMBER() OVER (PARTITION BY CC.client_id, CC.crms_number
  ORDER BY CC.client_id, CC.crms_number, CC.date_opened DESC) seq_rev
FROM dbo.ZZ_crms_communication CC
WHERE CC.in_out = 'IN')

SELECT
  *
FROM LastInCall
WHERE seq_rev = 1