--Number of offers by intake per student

WITH Offer
AS (SELECT
  S.client_id,
  S.crms_number,

  CASE
    WHEN ST.last_mo_source_tag LIKE '%sep%' AND
    ST.last_mo_source_tag LIKE '%12%' THEN 1
    ELSE 0
  END [Sep-12],
  CASE
    WHEN ST.last_mo_source_tag LIKE '%jan%' AND
    ST.last_mo_source_tag LIKE '%13%' THEN 1
    ELSE 0
  END [Jan-13],
  CASE
    WHEN ST.last_mo_source_tag LIKE '%sep%' AND
    ST.last_mo_source_tag LIKE '%13%' THEN 1
    ELSE 0
  END [Sep-13],
  CASE
    WHEN ST.last_mo_source_tag LIKE '%jan%' AND
    ST.last_mo_source_tag LIKE '%14%' THEN 1
    ELSE 0
  END [Jan-14],
  CASE
    WHEN ST.last_mo_source_tag LIKE '%sep%' AND
    ST.last_mo_source_tag LIKE '%14%' THEN 1
    ELSE 0
  END [Sep-14],
  CASE
    WHEN ST.last_mo_source_tag LIKE '%jan%' AND
    ST.last_mo_source_tag LIKE '%15%' THEN 1
    ELSE 0
  END [Jan-15],
  CASE
    WHEN ST.last_mo_source_tag LIKE '%sep%' AND
    ST.last_mo_source_tag LIKE '%15%' THEN 1
    ELSE 0
  END [Sep-15],
  CASE
    WHEN ST.last_mo_source_tag LIKE '%jan%' AND
    ST.last_mo_source_tag LIKE '%16%' THEN 1
    ELSE 0
  END [Jan-16],
  CASE
    WHEN ST.last_mo_source_tag LIKE '%sep%' AND
    ST.last_mo_source_tag LIKE '%16%' THEN 1
    ELSE 0
  END [Sep-16],
  CASE
    WHEN ST.last_mo_source_tag LIKE '%jan%' AND
    ST.last_mo_source_tag LIKE '%17%' THEN 1
    ELSE 0
  END [Jan-17],
  CASE
    WHEN ST.last_mo_source_tag LIKE '%sep%' AND
    ST.last_mo_source_tag LIKE '%17%' THEN 1
    ELSE 0
  END [Sep-17],
  CASE
    WHEN ST.last_mo_source_tag LIKE '%jan%' AND
    ST.last_mo_source_tag LIKE '%18%' THEN 1
    ELSE 0
  END [Jan-18],
  CASE
    WHEN ST.last_mo_source_tag LIKE '%sep%' AND
    ST.last_mo_source_tag LIKE '%18%' THEN 1
    ELSE 0
  END [Sep-18],
  CASE
    WHEN ST.last_mo_source_tag LIKE '%jan%' AND
    ST.last_mo_source_tag LIKE '%19%' THEN 1
    ELSE 0
  END [Jan-19]

FROM ZZ_crms_student S
LEFT JOIN ZZ_crms_student_tag ST
  ON S.client_id = ST.client_id
  AND S.crms_number = ST.crms_number)

SELECT
  S.client_id,
  S.crms_number,
  O.[Sep-12],
  O.[Jan-13],
  O.[Sep-13],
  O.[Jan-14],
  O.[Sep-14],
  O.[Jan-15],
  O.[Sep-15],
  O.[Jan-16],
  O.[Sep-16],
  O.[Jan-17],
  O.[Sep-17],
  O.[Jan-18],
  O.[Sep-12] + O.[Jan-13] + O.[Sep-13] + O.[Jan-14] + O.[Sep-14] + O.[Jan-15] + O.[Sep-15] + O.[Jan-16] + O.[Sep-16] + O.[Jan-17] + O.[Sep-17] + O.[Jan-18] AS [TotalOffers]

FROM ZZ_crms_student S

LEFT JOIN Offer O
  ON S.client_id = O.client_id
  AND S.crms_number = O.crms_number

WHERE S.client_id IN ('HUK_GLASGOWC', 'HUK_KINGSUNI', 'HUK_REGENTS', 'HUK_SWANSEA', 'HUK_USALFORD', 'HUK_WINCHEST', 'HUK05')
AND S.current_heat_status != 'dead'
AND O.[Sep-12] + O.[Jan-13] + O.[Sep-13] + O.[Jan-14] + O.[Sep-14] + O.[Jan-15] + O.[Sep-15] + O.[Jan-16] + O.[Sep-16] + O.[Jan-17] + O.[Sep-17] + O.[Jan-18] > 0

GROUP BY S.client_id,
         S.crms_number,
         O.[Sep-12],
         O.[Jan-13],
         O.[Sep-13],
         O.[Jan-14],
         O.[Sep-14],
         O.[Jan-15],
         O.[Sep-15],
         O.[Jan-16],
         O.[Sep-16],
         O.[Jan-17],
         O.[Sep-17],
         O.[Jan-18]