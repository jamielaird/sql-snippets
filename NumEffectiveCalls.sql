--Number of effective calls by student

SELECT
  CC.client_id,
  CC.crms_number,
  COUNT(CC.id) [NumEffectiveCalls]
FROM dbo.ZZ_crms_communication CC
WHERE CC.in_out = 'OUT'
AND CC.class = 'PHONE'
AND CC.call_effectiveness = 'Effective'

GROUP BY CC.client_id,
         CC.crms_number)