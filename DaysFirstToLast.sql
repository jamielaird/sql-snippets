--Calculate number of days from first to last status
  CASE
    WHEN FS.date_modified != LS.date_modified THEN DATEDIFF(dd, FS.date_modified, LS.date_modified)
  END AS [DaysFirstToLast]