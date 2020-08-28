--https://stackoverflow.com/questions/40215093/how-do-i-spool-to-a-csv-file-using-sql-developer

spool 'M:\Change Management\Financial_Crime_Technology_Project\Lookback\00_Deliverables\Scenarios\QA\test.csv'
select /*csv*/ * from jlaird.ds26_mon_alert_recon_sum;
spool off;
