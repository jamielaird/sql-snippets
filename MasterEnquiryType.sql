--Create the field [master_enquiry_type] and classify all records as Natural or Non-Natural

  CASE
    WHEN ST.first_source_tag = '11ten PPC' AND
    S.client_id = 'HUK_GLASGOWC' THEN '11TENPPC'
    WHEN CONVERT(date, ST.first_source_tag_date_created) = CONVERT(date, S.date_created) AND
    ST.first_source_tag LIKE '%gecko%' THEN 'Non-Natural'
    WHEN CONVERT(date, ST.first_source_tag_date_created) = CONVERT(date, S.date_created) AND
    ST.first_source_tag LIKE '%gekko%' THEN 'Non-Natural'
    WHEN CONVERT(date, ST.first_source_tag_date_created) = CONVERT(date, S.date_created) AND
    ST.first_source_tag LIKE '%_ff_%' THEN 'Non-Natural'
    WHEN CONVERT(date, ST.first_ssw_tag_date_created) = CONVERT(date, S.date_created) THEN 'Non-Natural'
    WHEN CONVERT(date,
    ST.first_source_tag_date_created) = CONVERT(date, S.date_created) AND
    ST.first_source_tag LIKE '%_bc_%' THEN 'Non-Natural'
    WHEN CONVERT(date, ST.first_source_tag_date_created)
    = CONVERT(date, S.date_created) AND
    ST.first_source_tag LIKE '%emt%' THEN 'Natural'
    WHEN CONVERT(date, ST.first_source_tag_date_created) = CONVERT(date, S.date_created) AND
    ST.first_source_tag LIKE '%enq%' THEN 'Non-Natural'
    WHEN CONVERT(date, ST.first_source_tag_date_created) = CONVERT(date, S.date_created) AND
    ST.first_source_tag LIKE '%OF REG%' THEN 'Natural'
    WHEN CONVERT(date, ST.first_general_tag_date_created) = CONVERT(date, S.date_created) AND
    ST.first_general_tag LIKE '%AY enquir%' THEN 'Non-Natural'
    WHEN CONVERT(date, ST.first_general_tag_date_created) = CONVERT(date, S.date_created) AND
    ST.first_general_tag LIKE '%AY appli%' THEN 'Non-Natural'
    WHEN ST.first_channel_mod = 'Made Offer' AND
    ABS(DATEDIFF(DAY, S.date_created, ST.first_mo_tag_date_created)) < 7 THEN NULL
    WHEN ST.first_channel_mod = 'Prospect List' AND
    ST.first_source_tag LIKE '%_emt%' THEN 'Natural'
    WHEN CONVERT(date, ST.first_mo_tag_date_created) = CONVERT(date, S.date_created) THEN NULL
    WHEN ST.first_general_tag LIKE '%AY appli%' THEN 'Non-Natural'
    WHEN ST.first_channel_mod = 'Prospect List' AND
    ST.first_source_tag LIKE '%_ff_%' THEN 'Non-Natural'
    WHEN ST.first_channel_mod = 'Prospect List' AND
    ST.first_source_tag LIKE '%_bc_%' THEN 'Non-Natural'
    WHEN ST.first_channel_mod = 'Prospect List' AND
    FS.student_status = 'Applied' THEN 'AppliedList'
    WHEN ST.first_channel_mod = 'Prospect List' THEN 'Non-Natural'
    WHEN ST.first_comm_class_mod = 'Email' THEN 'Natural'
    WHEN ST.first_comm_class_mod
    = 'Fax' THEN 'Natural'
    WHEN ST.first_comm_class_mod = 'Letter' THEN 'Natural'
    WHEN ST.first_comm_class_mod = 'SMS' THEN 'Natural'
    WHEN ST.first_comm_class_mod = 'Web' THEN 'Natural'
    WHEN ST.first_comm_class_mod = 'Unspecified' THEN 'Natural'
    WHEN ST.first_comm_class_mod IS NULL THEN 'Natural'
    WHEN ST.first_channel_mod = 'Prospect List' AND
    ST.first_mo_source_tag <> 'Unspecified' THEN 'Non-Natural'
    WHEN ST.first_channel_mod = 'Made Offer' AND
    ST.first_mo_source_tag IS NOT NULL THEN NULL
    ELSE 'Natural' /*ST.first_comm_class_mod */
  END AS master_enquiry_type,