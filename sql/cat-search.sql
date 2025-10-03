/* Columns
fond, heir, title, descr, sdate, edate */
USE ww2_log;

SET @unit = "266";

-- SELECT CONCAT("'%", @unit, "%'");

SELECT * FROM catgrep
WHERE
	sdate <= '1944-12-31' AND edate >= "1944-04-01"
	-- AND heir LIKE "%WATER%" 
	-- AND ( title LIKE CONCAT("'%", @unit, "%'") OR descr LIKE CONCAT("'%", @unit, "%'")) 
	-- AND (descr LIKE "%Loth%" OR title LIKE "%Loth%")
	AND title LIKE "%Som%" OR descr like "%Som%"
;
