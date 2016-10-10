--Assign to a month block based on date created

  CASE
    WHEN AA.date_created >= '01-Sep-2015' AND
    AA.date_created < '01-Oct-2015' THEN 'M1'
    WHEN AA.date_created >= '01-Oct-2015' AND
    AA.date_created < '01-Nov-2015' THEN 'M2'
    WHEN AA.date_created >= '01-Nov-2015' AND
    AA.date_created < '01-Dec-2015' THEN 'M3'
    WHEN AA.date_created >= '01-Dec-2015' AND
    AA.date_created < '01-Jan-2016' THEN 'M4'
    WHEN AA.date_created >= '01-Jan-2016' AND
    AA.date_created < '01-Feb-2016' THEN 'M5'
    WHEN AA.date_created >= '01-Feb-2016' AND
    AA.date_created < '01-Mar-2016' THEN 'M6'
    WHEN AA.date_created >= '01-Mar-2016' AND
    AA.date_created < '01-Apr-2016' THEN 'M7'
    WHEN AA.date_created >= '01-Apr-2016' AND
    AA.date_created < '01-May-2016' THEN 'M8'
    WHEN AA.date_created >= '01-May-2016' AND
    AA.date_created < '01-Jun-2016' THEN 'M9'
    WHEN AA.date_created >= '01-Jun-2016' AND
    AA.date_created < '01-Jul-2016' THEN 'M10'
    WHEN AA.date_created >= '01-Jul-2016' AND
    AA.date_created < '01-Aug-2016' THEN 'M11'
    WHEN AA.date_created >= '01-Aug-2016' AND
    AA.date_created < '01-Sep-2016' THEN 'M12'
  END AS MonthBlock,