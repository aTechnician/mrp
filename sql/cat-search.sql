/* Columns
fond, heir, title, descr, sdate, edate */
USE ww2_log;
SELECT * FROM catgrep
WHERE
	sdate <= '1944-12-31'
;

