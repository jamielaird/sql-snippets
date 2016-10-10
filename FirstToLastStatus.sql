--Create a field showing movement from first to last status (requires 'First Status' and 'Last Status' subqueries)

  CASE
    WHEN FS.date_modified != LS.date_modified THEN FS.student_status + ' to ' + LS.student_status
  END AS [Movement]