--Number of inbound emails per student

NumInboundEmail AS (

SELECT
  CC.client_id,
  CC.crms_number,
  COUNT(CC.id) [NumInboundEmail]
FROM dbo.ZZ_crms_communication CC
WHERE CC.in_out = 'IN'
AND CC.class = 'EMAIL'

GROUP BY CC.client_id,
         CC.crms_number) 