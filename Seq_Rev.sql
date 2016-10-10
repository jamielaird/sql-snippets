--Asign row number in descending order by date

ROW_NUMBER() OVER (PARTITION BY [client_id], [crms_number]
ORDER BY [client_id], [crms_number], [date_created] ASC) seq_rev