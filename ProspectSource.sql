--Set prospect source from first source tag
 
 CASE
--New Code Based On Tagging SOP
		WHEN ST.first_source_tag LIKE '%[_]ff[_]%' THEN 'Fairs & Exhibitions'
		WHEN ST.first_source_tag LIKE '%[_]nn[_]%' OR ST.first_source_tag LIKE '%netnatives%' THEN 'Netnatives'
		WHEN ST.first_source_tag LIKE '%[_]fb[_]%' OR ST.first_source_tag LIKE '%facebook%' THEN 'Facebook'
		WHEN ST.first_source_tag LIKE '%[_]cx[_]%' OR ST.first_source_tag LIKE '%cappex%' THEN 'Cappex'
		WHEN ST.first_source_tag LIKE '%[_]ms[_]%' OR ST.first_source_tag LIKE '%masterstudies%' THEN 'Masterstudies'
		WHEN ST.first_source_tag LIKE '%[_]hc[_]%' OR ST.first_source_tag LIKE '%hotcourses%' THEN 'Hotcourses'
		WHEN ST.first_source_tag LIKE '%[_]gecko[_]%' OR ST.first_source_tag LIKE '%gecko%' OR ST.first_source_tag LIKE '%gekko%' THEN 'Gecko'	
		WHEN ST.first_source_tag LIKE '%[_]11ten[_]%' OR ST.first_source_tag LIKE '%11ten%' THEN '11Ten'
		WHEN ST.first_source_tag LIKE '%[_]cl[_]%' THEN 'Clearing'
		WHEN ST.first_source_tag LIKE '%[_]adhoc[_]%' THEN 'Adhoc'
 
 --Old Code To Be Improved
    WHEN CONVERT(date, ST.first_ssw_tag_date_created) = CONVERT(date, S.date_created) THEN 'Website referral'
    WHEN CONVERT(date, ST.first_source_tag_date_created) = CONVERT(date, S.date_created) AND
      ST.first_source_tag LIKE '%_bc_%' THEN 'Irregular Lists'
    WHEN CONVERT(date, ST.first_source_tag_date_created) = CONVERT(date, S.date_created) AND
      ST.first_source_tag LIKE '%enq%' THEN 'Irregular Lists'
    WHEN CONVERT(date, ST.first_source_tag_date_created) = CONVERT(date, S.date_created) AND
      ST.first_source_tag LIKE '%OF REG%' THEN 'Webform'
    WHEN CONVERT(date, ST.first_general_tag_date_created) = CONVERT(date, S.date_created) AND
      ST.first_general_tag LIKE '%AY enquir%' THEN 'Irregular Lists'
    WHEN CONVERT(date, ST.first_general_tag_date_created) = CONVERT(date, S.date_created) AND
      ST.first_general_tag LIKE '%AY appli%' THEN 'Irregular Lists'
    WHEN ST.first_channel_mod = 'Made Offer' AND
      ABS(DATEDIFF(DAY, S.date_created, ST.first_mo_tag_date_created))
      < 7 THEN 'Made Offer'
    WHEN ST.first_channel_mod = 'Prospect List' AND
      ST.first_source_tag LIKE '%_emt%' THEN 'Enquiry Forms'
    WHEN CONVERT(date, ST.first_mo_tag_date_created)
      = CONVERT(date, S.date_created) THEN 'Made Offer'
    WHEN ST.first_general_tag LIKE '%AY appli%' THEN 'Irregular Lists'
    WHEN ST.first_channel_mod = 'Prospect List' AND
      ST.first_source_tag LIKE '%_bc_%' THEN 'Irregular Lists'
    WHEN ST.first_channel_mod = 'Prospect List' AND
      FS.student_status = 'Applied' THEN 'AppliedList'
    WHEN ST.first_channel_mod = 'Prospect List' THEN 'Irregular Lists'
    WHEN ST.first_comm_class_mod = 'Email' THEN 'Email'
    WHEN ST.first_comm_class_mod
      = 'Fax' THEN 'Email'
    WHEN ST.first_comm_class_mod = 'Letter' THEN 'Email'
    WHEN ST.first_comm_class_mod = 'SMS' THEN 'Phone'
    WHEN ST.first_comm_class_mod = 'Web' THEN 'Enquiry Forms'
    WHEN ST.first_comm_class_mod = 'Unspecified' THEN 'Email'
    WHEN ST.first_comm_class_mod IS NULL THEN 'Email'
    WHEN ST.first_channel_mod = 'Prospect List' AND
      ST.first_mo_source_tag <> 'Unspecified' THEN 'Irregular Lists'
    WHEN ST.first_channel_mod = 'Made Offer' AND
      ST.first_mo_source_tag IS NOT NULL THEN 'Made Offer'
    ELSE ST.first_comm_class_mod

  END AS [ProspectSource]