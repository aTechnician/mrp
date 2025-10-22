/* Columns
fond, heir, title, descr, sdate, edate */
USE ww2_log;

SET @unit = "266";

-- SELECT CONCAT("'%", @unit, "%'");

SELECT * FROM catgrep
WHERE
	sdate <= '1944-12-31' AND edate >= "1944-04-01"
	AND heir LIKE "%A.G.R.A.%" -- Heir is very much the hierarchy
	-- AND ( title LIKE CONCAT("'%", @unit, "%'") OR descr LIKE CONCAT("'%", @unit, "%'")) 
	-- AND (descr LIKE "%Loth%" OR title LIKE "%Loth%")
	-- AND (title LIKE "%7%Royal%Welsh%" OR descr like "%7%Royal%Welsh%")
	-- AND fond LIKE "WO%"
;
