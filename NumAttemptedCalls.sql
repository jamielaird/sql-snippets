--Number of attempted calls by student

SELECT
  CC.client_id,
  CC.crms_number,
  COUNT(CC.id) [NumAttemptedCalls]
FROM dbo.ZZ_crms_communication CC
WHERE CC.in_out = 'OUT'
AND CC.class = 'PHONE'

GROUP BY CC.client_id,
         CC.crms_number

ORDER BY CC.client_id ASC, CC.crms_number ASC