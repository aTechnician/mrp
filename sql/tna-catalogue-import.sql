-- SELECT * FROM ww2_log.tna_imp;

START TRANSACTION;
/*
-- DROP SURRIOUS COLUMNS
ALTER TABLE tna_imp DROP COLUMN `start.date..num.`;
ALTER TABLE tna_imp DROP COLUMN `End.Date..num.`;	

*/
-- ALTER TABLE CAT_TNA modify id varchar(9);

ALTER TABLE tna_imp CHANGE `Citable.reference` fond VARCHAR(16);


-- start select
DROP TEMPORARY TABLE IF EXISTS imp;
 
CREATE TEMPORARY TABLE imp AS
SELECT 
CONCAT("WO",RIGHT(fond, LENGTH(fond) - 3))fond,
-- CONCAT("ADM",RIGHT(fond, LENGTH(fond) - 4))fond,
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

SELECT fond FROM imp WHERE sdate = 0 OR edate = 0;
-- Clean data ( must be run from the CLI)
UPDATE imp SET sdate = NULL WHERE sdate = 0;
UPDATE imp SET edate = NULL WHERE edate = 0;

SELECT * FROM imp; -- confirm data before continuing

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

DROP TEMPORARY TABLE imp;
DROP TABLE tna_imp;
SELECT count(fond) FROM cat_tna;
/*
select * from imp where sdate = 0 OR edate = 0;

start transaction;
/*
UPDATE imp 
SET	sdate =	NULL WHERE fond IN("WO171/2166", "WO171/2158", "WO171/2160", "WO171/2159");
    
update tna_imp set `end.date` = null where `end.date` = 0;
select * from tna_imp where `start.date` = 0;
select * from tna_imp;
*/
