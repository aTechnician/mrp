-- SELECT * FROM ww2_log.tna_imp;
START TRANSACTION;
/*
-- DROP SURRIOUS COLUMNS
ALTER TABLE tna_imp DROP COLUMN `start.date..num.`;
ALTER TABLE tna_imp DROP COLUMN `End.Date..num.`;	


ALTER TABLE tna_imp CHANGE `Citable.reference` fond VARCHAR(16);
*/

-- start select
DROP TEMPORARY TABLE IF EXISTS imp;
 
CREATE TEMPORARY TABLE imp AS
SELECT 
-- CONCAT("WO",RIGHT(fond, LENGTH(fond) - 2))fond,
CONCAT("WO",RIGHT(fond, LENGTH(fond) - 3))fond,
`context.description` heir,
title,
`description` descr,
`start.date` sdate,
`end.date` edate,
`covering.dates` cdate,
`held.by` holder,
`catalogue.level` catlev,
`references` refs,
`opening.date` odate,
`closure.status` cstat,
`closure.type` ctype,
`closure.code` ccode,
subjects,
digitised,
id,
score
FROM tna_imp;

-- insert into catalogue 
INSERT INTO cat_tna 
(fond, heir, descr, sdate, edate, cov_dates, holder, cat_lev, refs,
odate, cstat, ctype, ccode, subjects, digitised, id, score)
SELECT 
i.fond,i.heir,i.title,i.sdate, i.edate, i.cdate, i.holder, i.catlev, i.refs,
i.odate, i.cstat, i.ctype, i.ccode, i.subjects, i.digitised, i.id, i.score
FROM
imp AS i LEFT JOIN cat_tna AS c 
ON i.fond=c.fond
WHERE c.fond IS NULL;


