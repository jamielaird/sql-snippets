--Get students with a Sep-16 offer

OfferSep16
AS (SELECT
  STH.client_id,
  STH.crms_number,
  STH.date_created,
  STH.tag_value,
  ROW_NUMBER() OVER (PARTITION BY STH.client_id, STH.crms_number
  ORDER BY STH.client_id, STH.crms_number, STH.date_created DESC) seq_rev_OfferSep16
FROM dbo.ZZ_crms_student_tag_history STH
WHERE STH.date_created <= DATEADD(YY, -0, GETDATE())
AND STH.tag_type = 'Made Offer Source'
AND STH.tag_value LIKE '%SEP%'
AND STH.tag_value LIKE '%16%')